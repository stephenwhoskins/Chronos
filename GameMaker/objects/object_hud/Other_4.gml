/// @description Insert description here
// You can write your code in this editor

if (room != init_room)
	return;

var chamber_height = view_hport[0] - global.hud_height;
for (var rx = 0; rx < 5; rx++)
{
	var cx = view_wport[0] * rx + view_wport[0] / 2;
	for (var ry = 0; ry < 5; ry++)
	{
		var cy = chamber_height * ry + chamber_height / 2;
		
		var northWall = instance_nearest(cx, cy - chamber_height / 2, object_wall_0);
		if (northWall != noone && northWall.y < cy &&
				script_get_room_col_2(northWall.x) == rx && script_get_room_row_2(northWall.y) == ry)
			ds_grid_set(room_up, rx, ry, 1);

		var southWall = instance_nearest(cx, cy + 100, object_wall_0);
		if (southWall != noone && southWall.y > cy &&
				script_get_room_col_2(southWall.x) == rx && script_get_room_row_2(southWall.y - 16) == ry)
			ds_grid_set(room_down, rx, ry, 1);
			
		var westWall = instance_nearest(cx - 1, cy, object_wall_2);
		if (westWall != noone && westWall.x < cx &&
				script_get_room_col_2(westWall.x) == rx && script_get_room_row_2(westWall.y) == ry)
			ds_grid_set(room_left, rx, ry, 1);
			
		var eastWall = instance_nearest(cx + 1, cy, object_wall_2);
		//show_debug_message(" ");
		//show_debug_message("eastWall: (" + string(eastWall.x) + ", " + string(eastWall.y) + ")");
		//show_debug_message("(rx, ry): (" + string(rx) + ", " + string(ry) + ")");
		//show_debug_message("(cx, cy): (" + string(cx) + ", " + string(cy) + ")");
		//show_debug_message("room col: " + string(script_get_room_col_2(eastWall.x)));
		//show_debug_message("room row: " + string(script_get_room_row_2(eastWall.y)));
		if (eastWall != noone && eastWall.x > cx &&
				script_get_room_col_2(eastWall.x - 1) == rx && script_get_room_row_2(eastWall.y) == ry)
			ds_grid_set(room_right, rx, ry, 1);
	}
}