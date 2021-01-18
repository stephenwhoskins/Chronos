/// @description Insert description here
// You can write your code in this editor

if (y - start_y < max_y)
{
	y += 2;
}

if (place_meeting(x, y, object_avatar))
{
	audio_play_sound(sound_key, 10, false);
	global.centipede_key_count++;
	instance_destroy(self);
}