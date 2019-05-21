extends Node2D

export var tree_id : int	# Tile ID used for tree cells
export var dummy_id : int	#Tile ID uses for dummy cells
# Tree Object to Spawn
var tree_object : PackedScene = preload("res://objects/resource/tree/Tree.tscn")
# Dummy Object to Spawn
var dummy_object : PackedScene = preload("res://characters/actor/npc/moving/dummy/Dummy.tscn")

var dummy_paths : Array

signal spawn_entity

# Called when the node enters the scene tree for the first time.
func _ready():
	pathfinder.create_map(($Map as TileMap),[2])
	spawn_spawnables()
	pass # Replace with function body.

# Instantiates and places all spawnable objects.  
# Objects should have a scene and should be placed in the Spawnables Tilemap
func spawn_spawnables():
	var spawnables : TileMap = $Spawnables
	var dummie_cells = spawnables.get_used_cells_by_id(dummy_id)
	for tile in dummie_cells:
		if pathfinder.is_outside_map_bounds(tile):
			continue
		var spawn : Vector2 = spawnables.map_to_world(tile)
		spawnables.set_cell(tile.x, tile.y, -1)
		var object = dummy_object.instance()
		object.add_to_group("dummies")
		object.name = "Dummy " + str(get_tree().get_nodes_in_group("dummies").size())
		emit_signal("spawn_entity",object,spawn)
	
	var tree_cells = spawnables.get_used_cells_by_id(tree_id)
	for tile in tree_cells:
		spawnables.set_cell(tile.x, tile.y, -1)
		var spawn : Vector2 = spawnables.map_to_world(tile)
		var object = tree_object.instance()
		object.add_to_group("Trees")
		object.name = "Tree " + str(get_tree().get_nodes_in_group("Trees").size())
		emit_signal("spawn_entity",object,spawn)