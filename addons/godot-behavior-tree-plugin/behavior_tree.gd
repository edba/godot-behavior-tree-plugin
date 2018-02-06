extends Node

const BehvError = preload("res://addons/godot-behavior-tree-plugin/error.gd")
const Tick = preload("res://addons/godot-behavior-tree-plugin/tick.gd")

func _ready():
	if get_child_count() > 1:
		var msg = str("ERROR BehaviorTree node at ", get_name(), " has more than 1 child. Should only have one. Returning.")
		return BehvError.new(self, msg)

var tick = Tick.new()
var lastOpenNodes = []
var currentOpenNodes = []
func tick(actor, blackboard):
	tick.tree = self
	tick.actor = actor
	tick.blackboard = blackboard
	tick.openNodes = currentOpenNodes

	var retVal = FAILED
	for c in get_children():
		retVal =  c._execute(tick)

	#if node isn't in current, but is in last, close it
	for node in lastOpenNodes:
		if(!currentOpenNodes.has(node)):
			node.closeAndCleanup(tick)

	#update last nodes and set current to empty array
	currentOpenNodes = lastOpenNodes
	currentOpenNodes.clear()
	lastOpenNodes = tick.openNodes
	return retVal
