extends Node

var camera_set: Camera2D
var camera: Camera2D
var button_id : int
var save_path = "save"
var NAME_BUTTON_CLICK: String

func _ready():
	camera = $Camera2D
	camera_set = $Camera2D2
	camera_set.visible=false
	var folder = DirAccess.new.get_object()
	if not folder.get_directories_at(save_path):
		folder.make_dir_absolute(save_path)

func up():
	camera.position = camera.get_target_position()+Vector2(0, -((camera.zoom.x-1)*-150+10))

func down():
	camera.position+=Vector2(0, ((camera.zoom.x-1)*-150+10))

func right():
	camera.position+=Vector2(((camera.zoom.x-1)*-150+10), 0)

func left():
	camera.position+=Vector2(-((camera.zoom.x-1)*-150+10), 0)



func zoom():
	camera.zoom.x+=0.05
	camera.zoom.y+=0.05

func zom():
	camera.zoom.x-=0.05
	camera.zoom.y-=0.05



func _process(delta):
	pass

func _on_button_pressed():
	camera.visible = false
	camera_set.visible = true
	camera.position=camera_set.position


func _on_misto_pressed(arg):
	print("Натиснута кнопка з іменем:", arg)
	camera.visible = false
	camera_set.visible = true
	camera.position=camera_set.position
	NAME_BUTTON_CLICK=arg
	var open_text : String
	var file = FileAccess.new.get_object()
	var file_path = save_path+"/"+arg+".txt"
	if not file.get_file_as_string(file_path):
		file.open(file_path, file.WRITE)
	else:
		file=FileAccess.open(file_path, file.READ)
		var color = file.get_line()
		while not file.eof_reached():
			var line = file.get_line()
			open_text+=line+"\n"
		$Camera2D2/TextEdit.text=open_text
		$Camera2D2/OptionButton.selected=int(color)




func _on_save_pressed():
	var file = FileAccess.open("save/"+NAME_BUTTON_CLICK+".txt", FileAccess.WRITE)
	camera.visible=true
	var color = $Camera2D2/OptionButton.selected
	$Camera2D2/OptionButton.selected=0
	var texted = get_node("Camera2D2/TextEdit")
	var texts = texted.text
	texted.text=""
	file.store_string(str(color)+"\n"+texts)
	file.close()
	var pos = get_node("Control/"+NAME_BUTTON_CLICK)
	camera.position=pos.position+Vector2(1186, 1113)
	print(camera.position)
