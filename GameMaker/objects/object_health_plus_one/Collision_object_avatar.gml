/// @description Insert description here
// You can write your code in this editor
if (!consumed)
{
	global.max_health_level++;
	global.health_level = global.max_health_level;
	consumed = true;
	audio_play_sound(sound_health, 10, false);
	instance_destroy(self);
}