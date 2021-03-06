/// @description Insert description here
// You can write your code in this editor
if (init_room != room)
	return;
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
var hud_width = view_wport[0];
var health_x = view_x + sprite_get_width(sprite_controls) + 14;

draw_set_color($303030);
draw_rectangle(view_x, view_y, view_x + hud_width, view_y + global.hud_height, false);
draw_set_color(c_white);

// draw bomb controls
var controls_x = view_x + 8;
if (global.bombs_enabled)
{
	draw_sprite(sprite_bomb_controls, 1, controls_x, view_y + 2);
}
else
{
	draw_sprite(sprite_bomb_controls, 0, controls_x, view_y + 2);
}

// draw sword controls
controls_x = controls_x + sprite_get_width(sprite_bomb_controls) + 4;
draw_sprite(sprite_sword_controls, 0, controls_x, view_y + 2);

// draw bow and arrow controls
controls_x = controls_x + sprite_get_width(sprite_sword_controls) + 4;
if (global.bow_and_arrow_enabled)
{
	draw_sprite(sprite_bow_controls, 1, controls_x, view_y + 2);
}
else
{
	draw_sprite(sprite_bow_controls, 0, controls_x, view_y + 2);
}

// draw health
var max_heart_columns = 5;
for (var i = 0; i < global.health_level && i < max_heart_columns; i++)
{
	draw_sprite(sprite_health, 0, health_x + 16 * i, view_y + 13);
}
for (var i = max_heart_columns; i < global.health_level; i++)
{
	draw_sprite(sprite_health, 0, health_x + 16 * (i - 5), view_y + 27);
}

// draw key indicator
if (global.key_count > 0)
{
	var key_x = health_x + 16 * max_heart_columns - 3;
	draw_sprite(sprite_key_indicator, 0, key_x, view_y + 5);
}
// draw centipede key indicator
if (global.centipede_key_count > 0)
{
	var key_x = health_x + 16 * max_heart_columns - 3;
	draw_sprite(sprite_centipede_indicator, 0, key_x, view_y + 14);
}
// draw snake key indicator
if (global.snake_key_count > 0)
{
	var key_x = health_x + 16 * max_heart_columns - 3;
	draw_sprite(sprite_snake_indicator, 0, key_x, view_y + 25);
}


var map_left = view_x + hud_width - sprite_get_width(sprite_map) - 8;
draw_sprite(sprite_map, 0,
	map_left, view_y);
var map_tile_offset = 1;
var miniroom = get_miniroom(object_avatar);
for (x = 0; x < 5; x++)
	for (y = 0; y < 5; y++)
	{
		var sprite = noone;
		var room_state = ds_grid_get(visited, x, y)
		if (miniroom.x == x && miniroom.y == y)
			sprite = sprite_room_current;
		else if (room_state == visited_state.visited)
			sprite = sprite_room_visited;
		else if (room_state == visited_state.known)
			sprite = sprite_room_known;
		else
			continue;
		// note that all selectable sprites are the same size, leaving fixed in hopes of optimization.
		draw_sprite(sprite, 
			0, 
			map_left + 14 + x * (map_tile_offset + sprite_get_width(sprite_room_current)), 
			view_y + 12 + y * (sprite_get_height(sprite_room_current) + map_tile_offset));
	}