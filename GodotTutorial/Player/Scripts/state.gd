class_name PlayerState extends Node

static var player : Player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# What happens when player enter this state
func EnterState() -> void:
	pass
	
# What happens when plsyer leaves this state
func ExitState() -> void:
	pass

# What happens during the actual _process
func Process( _delta : float) -> PlayerState:
	return null	

func Physics( _delta: float) -> PlayerState:
	return null
	
func HandleInput( _event: InputEvent) -> PlayerState:
	return null
