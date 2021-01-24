/// @description Insert description here
// You can write your code in this editor
visited = ds_grid_create(5, 5);
room_up = ds_grid_create(5, 5);
room_down = ds_grid_create(5, 5);
room_left = ds_grid_create(5, 5);
room_right = ds_grid_create(5, 5);

// Unkown is 0 so that it is the default
// NOTE: You can only transition to a higher number.
enum visited_state {visited = 2, known = 1, unknown = 0}

init_room = room;

for (var rx = 0; rx < 5; rx++)
{
	var cx = script_get_room_camera_x(rx);
	for (var ry = 0; ry < 5; ry++)
	{
		var cy = script_get_room_camera_y(ry);
		
		var northWall = instance_nearest(cx, cy - 1, object_wall_0)
		if (northWall.y > cy && script_get_room_col(northWall) == ry && script_get_room_row(northWall) == rx)
			ds_grid_set(room_up, rx, ry, true);
			
		var southWall = instance_nearest(cx, cy + 1, object_wall_0)
		if (southWall.y < cy && script_get_room_col(southWall) == ry && script_get_room_row(southWall) == rx)
			ds_grid_set(room_down, rx, ry, true);
			
		var westWall = instance_nearest(cx - 1, cy, object_wall_2)
		if (northWall.x < cx && script_get_room_col(westWall) == ry && script_get_room_row(westWall) == rx)
			ds_grid_set(room_left, rx, ry, true);
			
		var eastWall = instance_nearest(cx + 1, cy, object_wall_2)
		if (northWall.x > cx && script_get_room_col(eastWall) == ry && script_get_room_row(eastWall) == rx)
			ds_grid_set(room_right, rx, ry, true);
	}
}		