// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_ds_grid_set_if_greater(grid, gx, gy, val){
	ds_grid_set(grid, gx, gy, max(ds_grid_get(grid, gx, gy), val))

}