/// @description Insert description here
// You can write your code in this editor
if (last_sprite_index != sprite_index)
{
	object_music_player.sound = audio_play_sound(sound_walk, 10, true);
	last_sprite_index = sprite_index;
}