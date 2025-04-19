class_name State_Walk extends PlayerState

@export var move_speed : float = 100.0

@onready var idle : PlayerState = $"../Idle"


# What happens when player enter this state
func EnterState() -> void:
	player.UpdateAnimation("walk")
	pass
	
# What happens when plsyer leaves this state
func ExitState() -> void:
	pass

# What happens during the actual _process
func Process( _delta : float) -> PlayerState:
	if player.direction == Vector2.ZERO:
		return idle
		
	player.velocity = player.direction * move_speed
	
# If we walking and change direction, change it
	if player.SetDirection():
		player.UpdateAnimation("walk")
	return null	

func Physics( _delta: float) -> PlayerState:
	return null
	
func HandleInput( _event: InputEvent) -> PlayerState:
	return null
