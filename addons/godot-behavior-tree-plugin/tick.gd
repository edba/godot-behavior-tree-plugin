extends Node

#Created by the tree and passed to nodes, this lets nodes know which tree they belong to, and gives them a reference to the blackboard being used for this tick.
#It also holds the list of currently open nodes
#Can be extended to do nodeCount and send debug info

var tree
var openNodes
var lastOpenNodes
#var nodeCount
#var debug
var actor
var blackboard

func _init():
	tree = null
	openNodes = null
	lastOpenNodes = null
	actor = null
	blackboard = null

func openNode(node):
	openNodes[node] = true

func enterNode(node):
	pass

func tickNode(node):
	pass

func closeNode(node):
	openNodes.erase(node)

func exitNode(node):
	pass
