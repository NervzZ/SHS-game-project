extends CharacterBody2D

@export var movement_speed: float = 4.0
#@onready var navigation_agent: NavigationAgent2D = get_node("NavigationAgent2D")

func _ready():
	#navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))
	nextMovementLogic()

func set_movement_target(movement_target: Vector2):
	pass
	#navigation_agent.set_target_position(movement_target)

#func _physics_process(delta):
	#pass
	#if navigation_agent.is_navigation_finished():
	#	pass

	#var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	#var current_agent_position: Vector2 = global_position
	#var new_velocity: Vector2 = (next_path_position - current_agent_position).normalized() * movement_speed
	#if navigation_agent.avoidance_enabled:
	#	navigation_agent.set_velocity(new_velocity)
	#else:
	#	_on_velocity_computed(new_velocity)

#func _on_velocity_computed(safe_velocity: Vector2):
#	velocity = safe_velocity
#	move_and_slide()

#override this to add the logic after the agent is done moving
func nextMovementLogic():
	set_movement_target(global_position + Vector2(0., 150.))
