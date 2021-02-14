/// @description Insert description here
// You can write your code in this editor

enum chronos_states
{
	introduction,
	angels_flying_vertically,
	angels_flying_horizontally,
	angels_flying_to_center
}

orig_x = x;
orig_y = y;

max_angels_per_group = 8;

chronos_state = chronos_states.introduction;

center_x = script_get_room_camera_x(x) + view_wport[0] / 2;
center_y = script_get_room_camera_y(y) + view_hport[0] / 2 - global.hud_height / 2;

for (i = max_angels_per_group - 1; i > -1; i--)
{
	angel_instances_1[i] = instance_create_depth(center_x - 64, center_y - 128 - i * 32, depth - 1, object_angel_minion);
}

for (i = max_angels_per_group - 1; i > -1; i--)
{
	angel_instances_2[i] = instance_create_depth(center_x, center_y - 128 - i * 32, depth - 1, object_angel_minion);
}

for (i = max_angels_per_group - 1; i > -1; i--)
{
	angel_instances_3[i] = instance_create_depth(center_x + 64, center_y - 128 - i * 32, depth - 1, object_angel_minion);
}

intro_text_box = noone;

audio_stop_all();

alarm[0] = 10 * room_speed;

health_level = 5;
max_hurt_count = 30;
hurt_count = max_hurt_count;

max_float_count = 240;
float_count = 0;
orig_y = y;