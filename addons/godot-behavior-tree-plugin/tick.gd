extends Node

#Created by the tree and passed to nodes, this lets nodes know which tree they belong to, and gives them a reference to the blackboard being used for this tick.
#It also holds the list of currently open nodes
#Can be extended to do nodeCount and send debug info

var tree
var openNodes
#var nodeCount
#var debug
var actor
var blackboard

func _init():
	tree = null
	openNodes = null
	actor = null
	blackboard = null

func openNode(node):
	openNodes.push_back(node)
	pass

func enterNode(node):
	pass

func tickNode(node):
	pass

func closeNode(node):
	var nodeIndex = openNodes.find(node)
	if(nodeIndex >= 0):
		openNodes.remove(nodeIndex)

func exitNode(node):
	pass
