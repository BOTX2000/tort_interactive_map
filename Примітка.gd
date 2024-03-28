extends Camera2D

var opb : OptionButton
# Called when the node enters the scene tree for the first time.
func _ready():
	opb=$OptionButton
	var name=["res://blue.png", "res://blue1.png", "res://blue2.png", "res://blue3.png", "res://blue4.png",
	"res://blue5.png", "res://brown.png", "res://green.png", "res://green1.png", "res://purple.png", 
	"res://purple1.png", "res://purple2.png", "res://red.png", "res://wite.png", "res://yellow.png", 
	"res://yellow1.png"]
	for i in name:
		opb.add_icon_item(load(i), "")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
