/// @description Insert description here
// You can write your code in this editor

if (script_get_room_index(object_avatar) == script_get_room_index(self) && !avatar_present)
{
	alarm[0] = 1;
	avatar_present = true;
}
else if (script_get_room_index(object_avatar) != script_get_room_index(self) && avatar_present)
{
	avatar_present = false;
}