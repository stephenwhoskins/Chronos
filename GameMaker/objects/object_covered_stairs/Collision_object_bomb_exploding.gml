/// @description Insert description here
// You can write your code in this editor

if (sprite_index != sprite_tile_12)
{
	sprite_index = sprite_tile_12;
	global.covered_stairs_bombed = true;
	audio_stop_sound(object_music_player.sound);
	alarm[0] = room_speed;
}