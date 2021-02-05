/// @description Insert description here
// You can write your code in this editor

for (i = max_angels_per_group - 1; i > -1; i--)
{
	instance_destroy(angel_instances_1[i].id);
}

for (i = max_angels_per_group - 1; i > -1; i--)
{
	instance_destroy(angel_instances_2[i].id);
}

for (i = max_angels_per_group - 1; i > -1; i--)
{
	instance_destroy(angel_instances_3[i].id);
}

if (intro_text_box != noone)
{
	instance_destroy(intro_text_box.id);
}