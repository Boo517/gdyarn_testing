extends Object

var command : String
# my additions
# command name is first string
# args is an array of strings of the rest of the space-separated
# arguments, which will be passed to the function
var blocking := false
var command_name : String
var args : Array

func _init(command : String):
	self.command = command
	blocking = command.begins_with(":")
	if blocking:
		# erase the first character (:)
		command.erase(0, 1)
	var split_command = command.split(" ")
	command_name = split_command[0]
	split_command.remove(0)
	args = split_command
