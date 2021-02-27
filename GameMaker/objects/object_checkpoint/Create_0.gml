/// @description Insert description here
// You can write your code in this editor

if (global.door_goto_id == -1)
{
	for (var i = instance_number(object_enemy) - 1; i > -1; i--)
	{
		var enemy_instance = instance_find(object_enemy, i);
		if (script_get_room_index(enemy_instance) == script_get_room_index(self))
		{
			instance_destroy(enemy_instance.id);
		}
	}
}