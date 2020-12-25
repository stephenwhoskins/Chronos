/// @description Insert description here
// You can write your code in this editor

draw_self();

if (animation_count >= flash_start_time && animation_count < flash_end_time)
{
	if (floor(animation_count / 2) % 2 == 1)
	{
		draw_rectangle(0, 0, room_width, room_height, false);
		draw_set_color(c_black);
		draw_self();
		draw_set_color(c_white);
	}
}

if (animation_count >= flash_2_start_time && animation_count < flash_2_end_time)
{
	if (floor(animation_count / 2) % 2 == 1)
	{
		draw_rectangle(0, 0, room_width, room_height, false);
		draw_set_color(c_black);
		draw_self();
		draw_set_color(c_white);
	}
}