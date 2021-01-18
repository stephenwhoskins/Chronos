/// @description Insert description here
// You can write your code in this editor

if (spark_count < max_spark_count)
{
	spark_count += 1;
}

if (hurt_count == 0 && hit_type == hit_types.sword)
{
	spark_count = 0
	hurt_count = max_hurt_count;
}

if (last_image_index != floor(image_index) && floor(image_index) == 1 && sprite_index != sprite_spike_dying)
{
	x += 2 * image_xscale;
	
	if (abs(x - orig_x) > max_x_offset)
	{
		image_xscale = -image_xscale;
	}
}


if (hurt_count == 0 && sprite_index != sprite_spike_dying)
{
	health_level = max(health_level - 1, 0);
	bounce_back_count = 0;
	
	if (health_level == 0)
	{
		sprite_index = sprite_spike_dying;
		if (random(100) < 40)
		{
			instance_create_depth(x, y, depth - 1, object_health);
		}
	}
}
else if (hurt_count == 0 && sprite_index == sprite_spike_dying)
{
	hurt_count = max_hurt_count;
}

if (hurt_count < max_hurt_count)
	hurt_count += 1;

last_image_index = floor(image_index);