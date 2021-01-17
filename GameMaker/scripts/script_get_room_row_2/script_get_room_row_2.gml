// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_get_room_row_2(y)
{
	return floor(y / (view_hport[0] - global.hud_height));
}