@tool # Needed to run in editor.
extends EditorScenePostImport

# Import script for floors, gives them collision meshes
func _post_import(scene):
	iterate(scene)
	return scene

# Recursive function, called on every node
func iterate(node):
	if node != null:
		if node is MeshInstance3D:
			node.create_trimesh_collision()
		for child in node.get_children():
			iterate(child)
