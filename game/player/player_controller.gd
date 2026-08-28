extends CharacterBody3D

## Minimal first-person controller for MONOLITH Vertical Slice v0.1.
##
## Implements exactly the baseline approved in docs/PLAYER_MOVEMENT.md:
## grounded walking, camera-yaw-relative movement, and direct mouse look.
## There is no sprint, jump, crouch, lean, mantle, vault, climb, head bob,
## camera smoothing, or movement state machine, and none may be added here
## without Orchestrator approval (PLAYER_MOVEMENT.md §13).

## Target ground speed in m/s. Authored scale constant (PLAYER_MOVEMENT.md §6.1).
@export var walk_speed: float = 2.0

## Horizontal acceleration in m/s² (PLAYER_MOVEMENT.md §7.1).
@export var acceleration: float = 8.0

## Horizontal deceleration in m/s² when there is no movement input (§7.2).
@export var deceleration: float = 10.0

## Camera rotation in radians per pixel of raw mouse movement.
## Freely tunable: sensitivity is not an architectural scale constant (§10.3).
@export var mouse_sensitivity: float = 0.002

## Camera height in metres above the body origin, which sits on the floor.
## Authored scale constant (PLAYER_MOVEMENT.md §5.2).
@export var eye_height: float = 1.65

## Vertical field of view in degrees. Authored scale constant (§10.1).
@export var camera_fov: float = 70.0

## Pitch clamp in degrees, applied symmetrically (§10.2).
const PITCH_LIMIT_DEGREES: float = 89.0

@onready var _camera_pivot: Node3D = $CameraPivot
@onready var _camera: Camera3D = $CameraPivot/Camera3D

var _pitch: float = 0.0


func _ready() -> void:
	_camera_pivot.position = Vector3(0.0, eye_height, 0.0)
	_camera.fov = camera_fov
	_capture_mouse()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		_apply_mouse_look(event as InputEventMouseMotion)
	elif event.is_action_pressed(&"ui_cancel"):
		_release_mouse()
	elif (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and event.is_pressed()
		and Input.mouse_mode != Input.MOUSE_MODE_CAPTURED
	):
		# Development usability: left click recaptures the mouse after
		# releasing it with Escape. No gameplay behaviour is attached.
		_capture_mouse()


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input_vector: Vector2 = Input.get_vector(
		&"move_left", &"move_right", &"move_forward", &"move_backward"
	)
	# Yaw-relative only: the body carries yaw, the pivot carries pitch,
	# so the body basis never tilts the movement direction (§7.3).
	var wish_direction: Vector3 = global_basis * Vector3(input_vector.x, 0.0, input_vector.y)

	# Accelerate the horizontal velocity as a single vector so diagonal input
	# does not accelerate faster than forward input (§7.3).
	var horizontal_velocity: Vector3 = Vector3(velocity.x, 0.0, velocity.z)
	var target_velocity: Vector3 = wish_direction * walk_speed
	var rate: float = deceleration if wish_direction.is_zero_approx() else acceleration
	horizontal_velocity = horizontal_velocity.move_toward(target_velocity, rate * delta)

	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.z

	move_and_slide()


func _apply_mouse_look(event: InputEventMouseMotion) -> void:
	rotate_y(-event.relative.x * mouse_sensitivity)

	_pitch = clampf(
		_pitch - event.relative.y * mouse_sensitivity,
		-deg_to_rad(PITCH_LIMIT_DEGREES),
		deg_to_rad(PITCH_LIMIT_DEGREES)
	)
	_camera_pivot.rotation.x = _pitch


func _capture_mouse() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _release_mouse() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
