/// @description Insert description here
// You can write your code in this editor
if (init_room != room)
	return;
var miniroom = get_miniroom(object_avatar)
ds_grid_set(visited, miniroom.x, miniroom.y, visited_state.visited);

//show_debug_message(" ");
//show_debug_message(" ");
//for (var i = 0; i < 5; i++)
//{
//	show_debug_message(
//		string(ds_grid_get(room_right, 0, i)) + " " +
//		string(ds_grid_get(room_right, 1, i)) + " " +
//		string(ds_grid_get(room_right, 2, i)) + " " +
//		string(ds_grid_get(room_right, 3, i)) + " " +
//		string(ds_grid_get(room_right, 4, i))
//	);
//}

if (ds_grid_get(room_up, miniroom.x, miniroom.y) == 1)
{
	script_ds_grid_set_if_greater(visited, miniroom.x, miniroom.y - 1, visited_state.known)
}

if (ds_grid_get(room_left, miniroom.x, miniroom.y) == 1)
{
	script_ds_grid_set_if_greater(visited, miniroom.x - 1, miniroom.y, visited_state.known)
}

if (ds_grid_get(room_right, miniroom.x, miniroom.y) == 1)
{
	script_ds_grid_set_if_greater(visited, miniroom.x + 1, miniroom.y, visited_state.known)
}

if (ds_grid_get(room_down, miniroom.x, miniroom.y) == 1)
{
	script_ds_grid_set_if_greater(visited, miniroom.x, miniroom.y + 1, visited_state.known)
}