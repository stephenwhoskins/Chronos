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