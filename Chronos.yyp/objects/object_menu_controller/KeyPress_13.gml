/// @description Insert description here
// You can write your code in this editor
if (object_start_avatar.sprite_index != sprite_avatar_sleeping)
{
	return;
}

if (buttons[selected] == start_button)
{
	audio_play_sound(sound_key, 11, false);
	object_start_avatar.sprite_index = sprite_avatar_walking;
	object_start_avatar.hspeed = 1;
}
else if (buttons[selected] == exit_button)
{
	game_end();
}
else
{
	show_debug_message("Unexpected select state: " + string(selected));
	game_end();
}