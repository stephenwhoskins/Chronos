/// @description Insert description here
// You can write your code in this editor
if (object_fade_out.room_id != -1)
{
	return;
}

if (buttons[selected] == start_button)
{
	audio_play_sound(sound_title_select, 11, false);
	object_fade_out.room_id = Room1;
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