/// @description Insert description here
// You can write your code in this editor
if (object_start_avatar.sprite_index != sprite_avatar_sleeping)
{
	return;
}


var controller = read_menu_controller();
if (controller.left)
{
	if (swapped || object_fade_out.room_id != -1)
	{
		return;
	}
	swapped = true;

	selected += num_buttons - 1;
	selected %= num_buttons;
	audio_play_sound(sound_title_select, 10, false);
}
else if (controller.right)
{
	if (swapped || object_fade_out.room_id != -1)
	{
		return;
	}
	swapped = true;

	selected += 1;
	selected %= num_buttons;
	audio_play_sound(sound_title_select, 10, false);
}
else if (controller.select)
{
	if (object_fade_out.room_id != -1)
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
}
else
{
	swapped = false;
}