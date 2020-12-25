/// @description Insert description here
// You can write your code in this editor

var y_offset = 2.0 * sin(2.0 * pi * float_count / max_float_count);
var x_offset = 0;

float_count = (float_count + 1) % max_float_count;

if (sprite_index != sprite_chronos_teleporting)
{
	if ((animation_count / 2) % 2 == 1)
	{
		x_offset = 1;
	}
	else
	{
		x_offset = -1;
	}
	
	y_offset = 0;
}

x = orig_x + x_offset;
y = orig_y + y_offset;

// Fade in Chronos here.
if (animation_count >= fade_start_time && animation_count < fade_end_time)
{
	if (animation_count == fade_start_time)
	{
		audio_play_sound(sound_key, 10, false);
	}
	var t = (animation_count - fade_start_time) / (fade_end_time - fade_start_time);
	image_index = image_number * t; // <-- Must always be less than image_number!
	image_alpha = 1;
}

// Chronos starts focusing here.
if (animation_count == focus_start_time)
{
	sprite_index = sprite_chronos_dying;
}

// Chronos and the tower fade away here.
if (animation_count >= fade_out_start_time && animation_count < fade_out_end_time)
{
	var t = (animation_count - fade_start_time) / (fade_end_time - fade_start_time);
	var subimg = floor(object_tower_intro.image_number * t); // <-- Must always be less than image_number!
	object_tower_intro.image_index = subimg;
	sprite_index = sprite_chronos_teleporting;
	image_index = image_number - subimg - 1;
	
	if (animation_count == fade_out_end_time - 1)
	{
		image_alpha = 0;
		object_tower_intro.image_alpha = 0;
	}
}

animation_count++;