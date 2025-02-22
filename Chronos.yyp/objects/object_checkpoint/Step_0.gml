/// @description Insert description here
// You can write your code in this editor
if (script_get_room_index(object_avatar) == script_get_room_index(self))
{
	global.door_goto_id = -1;
	for (var i = instance_number(object_electricity_0) - 1; i > -1; i--)
	{
		var electricity_instance = instance_find(object_electricity_0, i);
		instance_destroy(electricity_instance.id);
	}
	for (var i = instance_number(object_electric_rod) - 1; i > -1; i--)
	{
		var electric_rod_instance = instance_find(object_electric_rod, i);
		instance_destroy(electric_rod_instance.id);
	}
}