tool
extends AnimatedSprite


export(NodePath) var YarnRunner

enum YoshState{
	NORMAL
	SHIFTING
	BADTIME
}
var yosh_state = YoshState.NORMAL

onready var Runner = get_node(YarnRunner)


func _ready():
	var command_names = ["toggleyosh", "show_yosh", "hide_yosh"]
	for command_name in command_names:
		Runner.add_command_handler(command_name, funcref(self, command_name))

func toggleyosh(arg_array):
	print("in toggleyosh. arg_array:")
	print(arg_array)
	var state = arg_array[0]
	match state:
		"NORMAL":
			playing = false
			frame = 0
			yosh_state = YoshState.NORMAL
		"BADTIME":
			playing = true
			yosh_state = YoshState.SHIFTING
			yield(self, "animation_finished")
			yosh_state = YoshState.BADTIME


func show_yosh(arg_array):
	print("in show_yosh. arg_array:")
	print(arg_array)
	show()


func hide_yosh(arg_array):
	print("in hide_yosh. arg_array:")
	print(arg_array)
	hide()
