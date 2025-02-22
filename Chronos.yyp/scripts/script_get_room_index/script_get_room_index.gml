// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_get_room_index(obj)
{
	with (obj)
	{
		return script_get_room_index_2(x, y - (bbox_bottom - bbox_top) / 2);
	}
}