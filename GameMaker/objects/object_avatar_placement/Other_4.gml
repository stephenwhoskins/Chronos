/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < instance_number(object_stairs); i++)
{
	var instance_stairs = instance_find(object_stairs, i);
	if (instance_stairs.door_id == global.door_goto_id)
	{
		object_avatar.x = instance_stairs.x - 8;
		object_avatar.y = instance_stairs.y + instance_stairs.sprite_height - 2;
		camera_set_view_pos(view_camera[0], script_get_room_camera_x(object_avatar.x),
				script_get_room_camera_y(object_avatar.y));
		return;
	}
}

camera_set_view_pos(view_camera[0], script_get_room_camera_x(object_avatar.x),
	script_get_room_camera_y(object_avatar.y));