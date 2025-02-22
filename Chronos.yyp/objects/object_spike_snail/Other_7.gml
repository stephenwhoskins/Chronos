/// @description Insert description here
// You can write your code in this editor
if (sprite_index == sprite_spike_snail_dying)
{
	if (is_boss)
	{
		instance_create_depth(x, y - view_hport[0], depth - 2, object_bow_item);
	}
	instance_destroy();
}
else if (sprite_index == sprite_spike_snail_attacking && shots_fired == max_shots_fired)
{
	shoot_count = 0;
	shots_fired = 0;
	sprite_index = sprite_spike_snail_walking;
}