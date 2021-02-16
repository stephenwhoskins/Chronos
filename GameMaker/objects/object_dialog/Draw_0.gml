/// @description Insert description here
// You can write your code in this editor

dialog_height = max_dialog_height * fade_count / max_fade_count;

if (fade_out_count < max_fade_count)
{
	dialog_height = max_dialog_height * (max_fade_count - fade_out_count) / max_fade_count;
	
	fade_out_count = min(fade_out_count + 1, max_fade_count);
	
	if (fade_out_count == max_fade_count)
	{
		instance_destroy();
	}
}

// Draw black fill.
draw_set_color(c_black);
draw_rectangle(x, y + 1 + max_dialog_height / 2 - dialog_height / 2,
			   x + view_wport[0] - 1, y + max_dialog_height / 2 + dialog_height / 2,
			   false);
draw_set_color(c_white);

// Draw white border.
draw_rectangle(x + 1, y + 2 + max_dialog_height / 2 - dialog_height / 2,
			   x + view_wport[0] - 2, y - 1 + max_dialog_height / 2 + dialog_height / 2,
			   true);
draw_rectangle(x + 2, y + 3 + max_dialog_height / 2 - dialog_height / 2,
			   x + view_wport[0] - 3, y - 2 + max_dialog_height / 2 + dialog_height / 2,
			   true);

if (fade_count == max_fade_count && fade_out_count == max_fade_count)
{
	event_inherited();
}

fade_count = min(fade_count + 1, max_fade_count);