extends Node

var astar = AStar.new()	

var map : TileMap	# TileMap we're creating the paths for

var walkable_nodes : Array = [] # Array of walkable nodes

var map_width : int		#Width of map; used to calculate map node ids

var connected_points : Array = []

signal path_calculated

# Create an AStar Pathfinder Map using a TileMap and array of id's that are
# walkable sprites on the TileMap
func create_map(map : TileMap, walkable_ids : Array) -> void:
	self.map = map
	map_width = get_map_width()
	if !map:
		printerr("Supplied map is not a TileMap")
		return
	# Step through all walkable id's
	for id in walkable_ids:
		# Get all nodes in the current walkable id
		for node in map.get_used_cells_by_id(id):
			walkable_nodes.append(node)
			var node_id = get_cell_id(node)		# Calculate unique id for this node
			astar.add_point(node_id,Vector3(node.x,node.y,0))		# Add node to the astar graph
	
	# Connect the nodes
	for point in walkable_nodes:
		var point_index = get_cell_id(point)
		# For every cell in the map, we check the one to the top, right.
		# left and bottom of it. If it's in the map and not an obstalce,
		# We connect the current point with it
		var points_relative = PoolVector2Array([
			Vector2(point.x + 1, point.y),
			Vector2(point.x - 1, point.y),
			Vector2(point.x, point.y + 1),
			Vector2(point.x, point.y - 1)])
		for point_relative in points_relative:
			var point_relative_index = get_cell_id(point_relative)
	
			if is_outside_map_bounds(point_relative):
				continue
			if not astar.has_point(point_relative_index):
				continue
			# Note the 3rd argument. It tells the astar_node that we want the
			# connection to be bilateral: from point A to B and B to A
			# If you set this value to false, it becomes a one-way path
			# As we loop through all points we can set it to false
			astar.connect_points(point_index, point_relative_index, false)
			connected_points.append(PoolVector2Array([point,point_relative]))
	emit_signal("path_calculated")

# Get a PoolVector2Array of the world positions from world_start_point to world_end_point
func get_world_path(world_start_point : Vector2, world_end_point : Vector2) -> PoolVector2Array:
	var map_start = map.world_to_map(world_start_point)
	var map_end = map.world_to_map(world_end_point)
	var world_path_result : PoolVector2Array
	var start_id = get_cell_id(map_start)
	var end_id = get_cell_id(map_end)
	var map_path = astar.get_point_path(start_id,end_id)
	for node in map_path:
		world_path_result.append(map.map_to_world(Vector2(node.x,node.y)))
	return world_path_result

# Check whether the cell is outside of the TileMap bounds
func is_outside_map_bounds(cell : Vector2) -> bool:
	return cell.x < 0 or cell.y < 0 or (not walkable_nodes.has(cell))

# Calculates and returns the TileMap width in cells
func get_map_width() -> float:
	# Determine the rect of used cells in the tilemap
	return map.get_used_rect().size[0]

# Calculated unique id for the TileMap Cell provided
func get_cell_id(cell : Vector2) -> float:
		return cell.x + cell.y * map_width