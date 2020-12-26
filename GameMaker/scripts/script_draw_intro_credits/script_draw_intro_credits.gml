// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_draw_intro_credits(a_sprite, animation_time, start_time, end_time)
{
	if (animation_time >= start_time && animation_time < end_time)
	{
		var alpha = 1;
	
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
	
		draw_sprite_ext(a_sprite, 0, 128, 176, 1, 1, 0, c_white, alpha);
	}
}