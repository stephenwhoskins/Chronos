/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, object_avatar) && global.snake_key_count > 0)
{
	audio_play_sound(sound_door_unlocked, 10, false);
	instance_destroy();
	global.locked_snake_door_opened = true;
}