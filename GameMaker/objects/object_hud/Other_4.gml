/// @description Insert description here
// You can write your code in this editor

if (room != init_room)
	return;

var i = 0;
var wall_0_number = instance_number(object_wall_0);
for (i = 0; i < wall_0_number; i++)
{
	var wall_0_instance = instance_find(object_wall_0, i);
	var rx = script_get_room_col_2(wall_0_instance.x + wall_0_instance.sprite_width / 2);
	var ry = script_get_room_row_2(wall_0_instance.y + wall_0_instance.sprite_height / 2);
	if (wall_0_instance.image_yscale > 0)
		ds_grid_set(room_up, rx, ry, 1);
	else
		ds_grid_set(room_down, rx, ry, 1);
}

var wall_2_number = instance_number(object_wall_2);
for (i = 0; i < wall_2_number; i++)
{
	var wall_2_instance = instance_find(object_wall_2, i);
	var rx = script_get_room_col_2(wall_2_instance.x + wall_2_instance.sprite_width / 2);
	var ry = script_get_room_row_2(wall_2_instance.y + wall_2_instance.sprite_height / 2);
	if (wall_2_instance.image_xscale > 0)
		ds_grid_set(room_left, rx, ry, 1);
	else
		ds_grid_set(room_right, rx, ry, 1);
}