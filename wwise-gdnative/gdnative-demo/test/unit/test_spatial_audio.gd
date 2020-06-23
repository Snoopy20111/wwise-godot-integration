extends "res://addons/gut/test.gd"

class TestSpatialAudio:
	extends "res://addons/gut/test.gd"
	
	var mesh_instance: MeshInstance
	
	func before_all():
		mesh_instance = MeshInstance.new()
		mesh_instance.name = "Mesh Instance"
		get_tree().get_root().add_child(mesh_instance)
		var mesh = load("res://meshes/default_cube.obj")
		mesh_instance.set_mesh(mesh)

	func test_assert_set_geometry():
		var ak_geometry:AkGeometry
		ak_geometry = AkGeometry.new()
		ak_geometry.name = "AkGeometry"
		mesh_instance.add_child(ak_geometry)
		#warning-ignore:return_value_discarded
		ak_geometry.set_owner(mesh_instance)
		assert_true(ak_geometry.set_geometry(mesh_instance), "Set Geometry should by true")
		Wwise.remove_geometry(ak_geometry)
	
	func test_assert_remove_geometry():
		var ak_geometry:AkGeometry
		ak_geometry = AkGeometry.new()
		ak_geometry.name = "AkGeometry"
		mesh_instance.add_child(ak_geometry)
		ak_geometry.set_owner(mesh_instance)
		#warning-ignore:return_value_discarded
		ak_geometry.set_geometry(mesh_instance)
		assert_true(Wwise.remove_geometry(ak_geometry), "Remove Geometry should be true")
		
	func test_assert_set_room():
		var node: Node = Node.new()
		node.name = "Test"
		assert_true(Wwise.set_room(node, AK.AUX_BUSSES.LARGEVERB, node.get_name()), 
					"Set Room should be true")
		Wwise.remove_room(node)
	
	func test_assert_remove_room():
		var node: Node = Node.new()
		node.name = "Test"
		Wwise.set_room(node, AK.AUX_BUSSES.LARGEVERB, node.get_name())		
		assert_true(Wwise.remove_room(node), "Remove Room should be true")
		
	func test_assert_set_portal():
			var spatial:Spatial = Spatial.new()
			spatial.transform.origin = Vector3(5, 23, -53)
			var extent:Vector3 = Vector3(4, 2, 2)
			var enabled:bool = true
			var portal_name = "Portal Test"
			var front_room:Node = Node.new()
			var back_room:Node = Node.new()
			assert_true(Wwise.set_portal(spatial, spatial.transform, extent, front_room, back_room,
										 enabled, portal_name), "Set Portal should be true")
			Wwise.remove_portal(spatial)
			
	func test_assert_remove_portal():
			var spatial:Spatial = Spatial.new()
			spatial.transform.origin = Vector3(5, 23, -53)
			var extent:Vector3 = Vector3(4, 2, 2)
			var enabled:bool = true
			var portal_name = "Portal Test"
			var front_room:Node = Node.new()
			var back_room:Node = Node.new()
			Wwise.set_portal(spatial, spatial.transform, extent, front_room, back_room,
										 enabled, portal_name)
			assert_true(Wwise.remove_portal(spatial), "Remove Portal should be true")	
			
	func test_assert_set_portal_only_back_room():
			var spatial:Spatial = Spatial.new()
			spatial.transform.origin = Vector3(5, 23, -53)
			var extent:Vector3 = Vector3(4, 2, 2)
			var enabled:bool = true
			var portal_name = "Portal Test"
			var back_room:Node = Node.new()
			assert_true(Wwise.set_portal(spatial, spatial.transform, extent, null, back_room,
										 enabled, portal_name), "Set Portal should be true")
			Wwise.remove_portal(spatial)
			
	func test_assert_set_game_obj_in_room():
		var game_obj:Node = Node.new()
		game_obj.name = "Game Object Test"
		Wwise.register_game_obj(game_obj, game_obj.get_name())
		var room:Node = Node.new()
		room.name = "Test Room"
		Wwise.set_room(room, AK.AUX_BUSSES.LARGEVERB, room.get_name())
		assert_true(Wwise.set_game_obj_in_room(game_obj, room), 
					"Set Game Obj in Room should be true")
		Wwise.remove_game_obj_from_room(game_obj)
		Wwise.remove_room(room)
		Wwise.unregister_game_obj(game_obj)
		
	func test_assert_remove_game_obj_from_room():
		var game_obj:Node = Node.new()
		game_obj.name = "Game Object Test"
		Wwise.register_game_obj(game_obj, game_obj.get_name())
		var room:Node = Node.new()
		room.name = "Test Room"
		Wwise.set_room(room, AK.AUX_BUSSES.LARGEVERB, room.get_name())
		Wwise.set_game_obj_in_room(game_obj, room)
		assert_true(Wwise.remove_game_obj_from_room(game_obj), 
					"Remove Game Obj from Room should be true")
		Wwise.remove_room(room)
		Wwise.unregister_game_obj(game_obj)	
	
	func test_assert_set_early_reflections_aux_send():
		var game_obj:Node = Node.new()
		game_obj.name = "Game Object Test"
		Wwise.register_game_obj(game_obj, game_obj.get_name())
		assert_true(Wwise.set_early_reflections_aux_send(game_obj, 
		AK.AUX_BUSSES.LARGEVERB), "Set Early Reflections Aux Send should be true")
		Wwise.unregister_game_obj(game_obj)
		
	func test_assert_set_early_reflections_volume():
		var game_obj:Node = Node.new()
		game_obj.name = "Game Object Test"
		Wwise.register_game_obj(game_obj, game_obj.get_name())
		var volume:float = 0.4
		assert_true(Wwise.set_early_reflections_volume(game_obj, volume), 
					"Set Early Reflections Volume should be true") 
		Wwise.unregister_game_obj(game_obj)
		
