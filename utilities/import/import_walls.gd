@tool # Needed to run in editor.
extends EditorScenePostImport

# Import script for floors, gives them collision meshes, and sets them to collision layer 2
func _post_import(scene):
	iterate(scene)
	return scene

# Recursive function, called on every node
func iterate(node):
	if node != null:
		if node is MeshInstance3D:
			node.create_trimesh_collision()
		if node is StaticBody3D:
			node.set_collision_layer_value(1, false)
			node.set_collision_layer_value(2, true) # Walls are on collision layer 2
			node.set_collision_mask_value(1, false) # walls don't need to detect anything
		for child in node.get_children():
			iterate(child)
