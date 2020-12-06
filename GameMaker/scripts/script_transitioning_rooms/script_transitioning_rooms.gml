// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_transitioning_rooms()
{
	var c = view_camera[0];
	var cy_offset = -40;
	var miniroom_width = view_wport[0];
	var miniroom_height = view_hport[0] + cy_offset;
	
	var miniroom_x = floor(x / miniroom_width);
	var miniroom_y = floor(y / miniroom_height);
	var old_cx = camera_get_view_x(c);
	var old_cy = camera_get_view_y(c);
	var target_cx = miniroom_x * miniroom_width;
	var target_cy = miniroom_y * miniroom_height + cy_offset;
	var dx = target_cx - old_cx;
	var dy = target_cy - old_cy;
	
	if (dx != 0 || dy != 0)
	{
		return true;
	}
	
	return false;
}