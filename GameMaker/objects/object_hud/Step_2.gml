/// @description Insert description here
// You can write your code in this editor
if (init_room != room)
	return;
var miniroom = get_miniroom(object_avatar)
ds_grid_set(visited, miniroom.x, miniroom.y, visited_state.visited);