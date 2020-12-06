// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_get_room_index(obj)
{
	with (obj)
	{
		var col_index = script_get_room_col(obj);
		var row_index = script_get_room_row(obj);
		var num_cols = floor(room_width / view_wport[0]);
		
		return num_cols * row_index + col_index;
	}
}