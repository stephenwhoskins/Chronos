/// @description Insert description here
// You can write your code in this editor

var y_offset = 2.0 * sin(2.0 * pi * float_count / max_float_count);

float_count = (float_count + 1) % max_float_count;

y = orig_y + y_offset;

if (animation_count >= fade_start_time && animation_count < fade_end_time)
{
	var t = (animation_count - fade_start_time) / (fade_end_time - fade_start_time);
	image_index = image_number * t; // <-- Must always be less than image_number!
	image_alpha = 1;
}

animation_count++;