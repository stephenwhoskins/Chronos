// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_get_room_camera_y(y)
{
	return (view_hport[0] - global.hud_height) * script_get_room_row_2(y) - global.hud_height;
}