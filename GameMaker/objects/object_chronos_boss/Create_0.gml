/// @description Insert description here
// You can write your code in this editor

max_angel_group_count = 16;

for (i = max_angel_group_count - 1; i > -1; i--)
{
	angel_instances_1[i] = instance_create_depth(x - 64, y - 128, depth - 1, object_angel_minion);
}

for (i = max_angel_group_count - 1; i > -1; i--)
{
	angel_instances_2[i] = instance_create_depth(x, y - 128, depth - 1, object_angel_minion);
}

for (i = max_angel_group_count - 1; i > -1; i--)
{
	angel_instances_3[i] = instance_create_depth(x + 64, y - 128, depth - 1, object_angel_minion);
}