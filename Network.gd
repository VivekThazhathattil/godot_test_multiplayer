extends Node

var DEFAULT_IP = "127.0.0.1"
const DEFAULT_PORT = 31400
const MAX_CLIENTS = 2

func create_server():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(DEFAULT_PORT, MAX_CLIENTS)
	get_tree().set_network_peer(peer)
	
func join_server(txt):
	var peer = NetworkedMultiplayerENet.new()
	if txt == "":
		peer.create_client(DEFAULT_IP, DEFAULT_PORT)
	else:
		peer.create_client(str(txt), DEFAULT_PORT)
	get_tree().set_network_peer(peer)

#func call_peer(node_path, function, data):
#	rpc("recieve_call", node_path, function, data)

func pass_check_val(val):
	rpc("get_val", val)

#remote func recieve_call(node_path, function, data):
#	get_tree().get_root().get_node(node_path).run_server_func(function, data)
	
remote func get_val(val):
	get_node("/root/Main").set_their_num(val)
