/// @description Insert description here
// You can write your code in this editor

sprite_index = sprite_angel_idle;

if (script_get_room_index(object_avatar) == script_get_room_index(self))
{
	alarm[0] = room_speed;
}