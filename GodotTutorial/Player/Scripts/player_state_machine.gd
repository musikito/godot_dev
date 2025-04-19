class_name PlayerStateMachine extends Node

#var states : Array[ State ]
var prev_state : PlayerState
var current_state : PlayerState

var states : Array[PlayerState]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# TODO remove this
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ChangeState( current_state.Process( delta ))
	pass

func _physics_process(delta):
	ChangeState( current_state.Physics( delta ))
	pass

func _unhandled_input(event):
	ChangeState( current_state.HandleInput( event ))



func Initialize( _player : Player) -> void:
	states = []
	# Get all states within the state machine
	for s in get_children():
		if s is PlayerState:
			states.append( s )
	
	if states.size() > 0:
		states[0].player = _player
		ChangeState( states[0] )
		process_mode = Node.PROCESS_MODE_INHERIT





func ChangeState( new_state : PlayerState) -> void:
	# Check for current state
	if new_state == null || new_state == current_state:
		return
	
	if current_state:
		current_state.ExitState()
	
	# previous state = current state, then we assign the current state to the
	# new state we just passed. After we enter the state.	
	prev_state = current_state
	current_state = new_state
	current_state.EnterState()
		
