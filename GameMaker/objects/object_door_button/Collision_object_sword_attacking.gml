/// @description Insert description here
// You can write your code in this editor

if (!global.water_drained)
{
	audio_play_sound(sound_door_unlocked, 10, false);
	image_index = 1;
	global.water_drained = true;
	alarm[0] = room_speed;
}