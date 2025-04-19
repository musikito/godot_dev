class_name State_Idle extends PlayerState


@onready var walk : PlayerState = $"../Walk"

# What happens when player enter this state
func EnterState() -> void:
	player.UpdateAnimation("idle")
	pass
	
# What happens when plsyer leaves this state
func ExitState() -> void:
	pass

# What happens during the actual _process
func Process( _delta : float) -> PlayerState:
	if player.direction != Vector2.ZERO:
		return walk 
	player.velocity = Vector2.ZERO
	return null	

func Physics( _delta: float) -> PlayerState:
	return null
	
func HandleInput( _event: InputEvent) -> PlayerState:
	return null
