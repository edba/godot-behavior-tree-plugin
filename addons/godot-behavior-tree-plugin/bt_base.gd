extends Node

func _execute(tick):
	_enter(tick)
	
	var isAlreadyOpen = tick.blackboard.get('isOpen', tick.tree, self) == true 

	if !isAlreadyOpen:
		_open(tick)

	var status = _tick(tick)

	if status != ERR_BUSY:
		if isAlreadyOpen:
			cleanup(tick)
		_close(tick)
	else:
		if !isAlreadyOpen:
			#presist state only if it wasn't closed on same tick
			tick.blackboard.set('isOpen', true, tick.tree, self)
		tick.openNode(self)

	_exit(tick)

	return status

func _enter(tick):
	tick.enterNode(self) #debug call to be filled out in Tick object
	enter(tick)

func _open(tick):
	open(tick)

func _tick(tick):
	tick.tickNode(self)
	return tick(tick)

func _close(tick):
	close(tick)

func cleanup(tick):
	tick.closeNode(self)
	tick.blackboard.set('isOpen', false, tick.tree, self)

func closeAndCleanup(tick):
	cleanup(tick)
	_close(tick)

func _exit(tick):
	tick.exitNode(self)
	exit(tick)

#the following functions are to be overridden in extending nodes
func enter(tick):
	pass

func open(tick):
	pass

func tick(tick):
	return OK

func close(tick):
	pass

func exit(tick):
	pass
