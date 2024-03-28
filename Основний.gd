extends Camera2D

var node: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	node = get_parent()

func check():
	if self.position.x>6555:
		self.position.x=6555
	if self.position.x<1460:
		self.position.x=1460
	if self.position.y>8570:
		self.position.y=8570
	if self.position.y<1560:
		self.position.y=1560

func _input(event):
	if event is InputEventKey:
		var key_event = event as InputEventKey
		if self.visible==true:
			if key_event.pressed and key_event.keycode == KEY_W:
				node.up()
				check()
			if key_event.pressed and key_event.keycode == KEY_S:
				node.down()
				check()
			if key_event.pressed and key_event.keycode == KEY_D:
				node.right()
				check()
			if key_event.pressed and key_event.keycode == KEY_A:
				node.left()
				check()

	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.is_pressed() and mouse_event.button_index == MOUSE_BUTTON_WHEEL_UP:
			node.zoom()
		elif mouse_event.is_pressed() and mouse_event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			node.zom()
		if self.zoom.x<0.25:
			self.zoom=Vector2(0.25, self.zoom.y)
		if self.zoom.y<0.25:
			self.zoom=Vector2(self.zoom.x, 0.25)
		if self.zoom.x>1.0:
			self.zoom=Vector2(1.0, self.zoom.y)
		if self.zoom.y>1.0:
			self.zoom=Vector2(self.zoom.x, 1.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
