/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sprite_jelly_dying)
{
	if (is_boss)
	{
		var jelly_width = sprite_get_width(sprite_jelly_idle);
		var jelly_height = sprite_get_height(sprite_jelly_idle);
		instance_create_depth(x - jelly_width, y - 0.5 * jelly_height, depth+1, object_jelly);
		instance_create_depth(x + jelly_width, y - 0.5 * jelly_height, depth+1, object_jelly);
		instance_create_depth(x - jelly_width, y + 0.5 * jelly_height, depth+1, object_jelly);
		instance_create_depth(x + jelly_width, y + 0.5 * jelly_height, depth+1, object_jelly);
		instance_create_depth(x - jelly_width, y - 1.5 * jelly_height, depth+1, object_jelly);
		instance_create_depth(x + jelly_width, y - 1.5 * jelly_height, depth+1, object_jelly);
		instance_create_depth(x - jelly_width, y + 1.5 * jelly_height, depth+1, object_jelly);
		instance_create_depth(x + jelly_width, y + 1.5 * jelly_height, depth+1, object_jelly);
		instance_create_depth(x - 2 * jelly_width, y, depth+1, object_jelly);
		instance_create_depth(x - 2 * jelly_width, y + jelly_height, depth+1, object_jelly);
		instance_create_depth(x - 2 * jelly_width, y - jelly_height, depth+1, object_jelly);
		instance_create_depth(x + 2 * jelly_width, y, depth+1, object_jelly);
		instance_create_depth(x + 2 * jelly_width, y + jelly_height, depth+1, object_jelly);
		instance_create_depth(x + 2 * jelly_width, y - jelly_height, depth+1, object_jelly);
	}
	instance_destroy();
}