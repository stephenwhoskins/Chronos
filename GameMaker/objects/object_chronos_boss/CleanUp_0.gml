/// @description Insert description here
// You can write your code in this editor

for (i = max_angels_per_group - 1; i > -1; i--)
{
	instance_destroy(angel_instances_1[i]);
}

for (i = max_angels_per_group - 1; i > -1; i--)
{
	instance_destroy(angel_instances_2[i]);
}

for (i = max_angels_per_group - 1; i > -1; i--)
{
	instance_destroy(angel_instances_3[i]);
}