/// @description Insert description here
// You can write your code in this editor

var controller = read_gameplay_controller();

if (controller.attacking || controller.attacking_2)
{
	object_fade_out.room_id = title;
}