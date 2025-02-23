// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_draw_intro_credits(a_sprite, animation_time, start_time, end_time)
{
	if (animation_time >= start_time && animation_time < end_time)
	{
		var alpha = 1;
		var _intro_credits_x = view_wport[0] * script_get_room_col(object_avatar) + 128;
		var _intro_credits_y = view_hport[0] * script_get_room_row(object_avatar);
	
		if (animation_time < start_time + 1 * room_speed)
		{
			var numerator = animation_time - start_time;
			var denominator = 1 * room_speed;
			alpha = numerator / denominator;
		}
		if (animation_time >= end_time - 1 * room_speed)
		{
			var numerator = animation_time - (end_time - 1 * room_speed);
			var denominator = 1 * room_speed;
			alpha = numerator / denominator;
			alpha = 1 - alpha;
		}
	
		draw_sprite_ext(a_sprite
		, 0
		, _intro_credits_x
		, _intro_credits_y
		, 1
		, 1
		, 0
		, c_white
		, alpha);
	}
}