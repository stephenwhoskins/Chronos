/// @description Insert description here
// You can write your code in this editor
if (init_room != room)
	return;
var miniroom = get_miniroom(object_avatar)
ds_grid_set(visited, miniroom.x, miniroom.y, visited_state.visited);

if (ds_grid_get(room_up, miniroom.x, miniroom.y) == true)
{
	script_ds_grid_set_if_greater(room_up, miniroom.x, miniroom.y - 1, visited_state.known)
}

if (ds_grid_get(room_left, miniroom.x, miniroom.y) == true)
{
	script_ds_grid_set_if_greater(room_left, miniroom.x - 1, miniroom.y, visited_state.known)
}

if (ds_grid_get(room_right, miniroom.x, miniroom.y) == true)
{
	script_ds_grid_set_if_greater(room_right, miniroom.x + 1, miniroom.y, visited_state.known)
}

if (ds_grid_get(room_down, miniroom.x, miniroom.y) == true)
{
	script_ds_grid_set_if_greater(room_down, miniroom.x, miniroom.y + 1, visited_state.known)
}