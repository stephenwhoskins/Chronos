// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_get_room_camera_x(x)
{
	return view_wport[0] * script_get_room_col_2(x);
}