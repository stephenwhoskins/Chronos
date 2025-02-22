// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_miniroom(obj)
{
	var miniroom_x = script_get_room_col(obj);
	var miniroom_y = script_get_room_row(obj);
	return {x: miniroom_x, y: miniroom_y};
}