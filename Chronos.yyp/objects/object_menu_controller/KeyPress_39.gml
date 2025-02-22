/// @description Insert description here
// You can write your code in this editor
if (object_start_avatar.sprite_index != sprite_avatar_sleeping)
{
	return;
}

selected += 1;
selected %= num_buttons;
audio_play_sound(sound_title_select, 10, false);