// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_ds_grid_set_if_greater(grid, gx, gy, val)
{
	ds_grid_set(grid, gx, gy, ds_grid_get(grid, gx, gy) == visited_state.visited ? visited_state.visited : visited_state.known);
}