// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_camera()
{
	var c = view_camera[0];
	var miniroom_width = 256;
	var miniroom_height = 184;

	var maxSpeed = 4;

	var cy_offset = -40;
	var miniroom_x = floor(x / miniroom_width);
	var miniroom_y = floor((y - (bbox_bottom - bbox_top) / 2) / miniroom_height);
	var old_cx = camera_get_view_x(c);
	var old_cy = camera_get_view_y(c);
	var target_cx = miniroom_x * miniroom_width;
	var target_cy = miniroom_y * miniroom_height + cy_offset;
	var dx = target_cx - old_cx;
	var dy = target_cy - old_cy;
	var cx = old_cx + sign(dx) * min(maxSpeed, abs(dx));
	var cy = old_cy + sign(dy) * min(maxSpeed, abs(dy));

	var shake_x = 0;

	if (global.shake_count < global.max_shake_count)
	{
		if ((global.shake_count / 2) % 2 == 0)
		{
			shake_x = -4;
		}
		else
		{
			shake_x = 4;
		}
	
		global.shake_count = min(global.shake_count + 1, global.max_shake_count);
	}
	
	camera_set_view_pos(c, cx + shake_x, cy);
}