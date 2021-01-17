/// @description Insert description here
// You can write your code in this editor

if (sprite_index = sprite_centipede_head_dying)
	return;

if (update_count == 0)
{
	// Update the body segments.
	for (i = 0; i < num_body_segments - 1; i++)
	{
		instance_body_segments[i].x = instance_body_segments[i + 1].x;
		instance_body_segments[i].y = instance_body_segments[i + 1].y;
		instance_body_segments[i].image_angle = instance_body_segments[i + 1].image_angle;
	}

	instance_body_segments[num_body_segments - 1].x = x;
	instance_body_segments[num_body_segments - 1].y = y;
	instance_body_segments[num_body_segments - 1].image_angle = image_angle;

	// Update the head.
	if (image_angle == 270)
	{
		if (abs(orig_y - y) > max_y)
		{
			x_velocity = -8
			y_velocity = 0;
			image_angle = 180;
		}
	}
	else if (image_angle == 180)
	{
		if (abs(orig_x - x) > max_x)
		{
			x_velocity = 0
			y_velocity = -8;
			image_angle = 90;
		}
	}
	else if (image_angle == 90)
	{
		if (abs(orig_y - y) > max_y)
		{
			x_velocity = 8
			y_velocity = 0;
			image_angle = 0;
		}
	}
	else if (image_angle == 0)
	{
		if (abs(orig_x - x) > max_x)
		{
			x_velocity = 0
			y_velocity = 8;
			image_angle = 270;
		}
	}
	x += x_velocity;
	y += y_velocity;
}

if (hurt_count == 0 && sprite_index != sprite_centipede_head_dying)
{
	health_level = max(health_level - 1, 0);
	bounce_back_count = 0;
	
	if (health_level == 0)
	{
		sprite_index = sprite_centipede_head_dying;
		for (i = 0; i < num_body_segments; i++)
		{
			instance_body_segments[i].sprite_index = sprite_centipede_segment_dying;
		}
		if (random(100) < 40)
		{
			instance_create_depth(x, y, depth - 1, object_health);
		}
	}
}
else if (hurt_count == 0 && sprite_index == sprite_centipede_head_dying)
{
	hurt_count = max_hurt_count;
}

if (hurt_count < max_hurt_count)
	hurt_count++;
	
update_count = (update_count + 1) % max_update_count;