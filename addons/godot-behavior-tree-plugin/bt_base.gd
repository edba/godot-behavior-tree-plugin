extends Node

func _execute(tick):
	_enter(tick)
	
	var isAlreadyOpen = tick.lastOpenNodes.has(self)

	if !isAlreadyOpen:
		_open(tick)

	var status = _tick(tick)

	if status != ERR_BUSY:
		_close(tick)
	else:
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
	tick.closeNode(self)
	close(tick)

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
