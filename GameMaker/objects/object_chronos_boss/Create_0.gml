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

for (i = max_angels_per_group - 1; i > -1; i--)
{
	angel_instances_1[i] = instance_create_depth(x - 64, y - 128 - i * 32, depth - 1, object_angel_minion);
}

for (i = max_angels_per_group - 1; i > -1; i--)
{
	angel_instances_2[i] = instance_create_depth(x, y - 128 - i * 32, depth - 1, object_angel_minion);
}

for (i = max_angels_per_group - 1; i > -1; i--)
{
	angel_instances_3[i] = instance_create_depth(x + 64, y - 128 - i * 32, depth - 1, object_angel_minion);
}

intro_text_box = noone;