/// @description Insert description here
// You can write your code in this editor
visited = ds_grid_create(5, 5);
ds_grid_clear(visited, 0);
room_up = ds_grid_create(5, 5);
ds_grid_clear(room_up, 0);
room_down = ds_grid_create(5, 5);
ds_grid_clear(room_down, 0);
room_left = ds_grid_create(5, 5);
ds_grid_clear(room_left, 0);
room_right = ds_grid_create(5, 5);
ds_grid_clear(room_right, 0);

// Unkown is 0 so that it is the default
// NOTE: You can only transition to a higher number.
enum visited_state {visited = 2, known = 1, unknown = 0}

init_room = room;