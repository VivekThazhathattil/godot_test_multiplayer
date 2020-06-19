extends Control

var they_send = false
var i_send = false
var their_num = 0
var my_num = 0

func _ready():
	$ip.set_text("Your ip address is " + str(IP.get_local_addresses()[0]))
	
func set_text():
	$my_num.set_text(str(my_num))
	$their_num.set_text(str(their_num))
	they_send = not they_send
	i_send = not i_send

func _on_join_pressed():
	var txt = $text_edit.text
	Network.join_server(txt)


func _on_send_pressed():
	my_num = int($text_edit.text)
	Network.pass_check_val($text_edit.text)
	i_send = not i_send
	if i_send and they_send:
		set_text()
#	Network.call_peer("Main","set_text",$text_edit.text)

func _on_create_pressed():
	Network.create_server()

#func run_server_func(function, data):
#	if function == "set_text":
#		set_text(data)

func set_their_num(val):
	they_send = not they_send
	their_num = int(val)
	if i_send and they_send:
		set_text()
		
#func set_text(text):
#	$text_edit.text = text
