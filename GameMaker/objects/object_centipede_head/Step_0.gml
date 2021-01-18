/// @description Insert description here
// You can write your code in this editor

if (image_xscale > 1.5)
{
	max_x = 48;
	max_y = 32;
}

if (sprite_index = sprite_centipede_head_dying)
	return;

if (update_count == 0)
{
	// Update the body segments.
	for (i = 0; i < num_body_segments - 1; i++)
	{
		instance_body_segments[i].x = instance_body_segments[i + 1].x;
		instance_body_segments[i].y = instance_body_segments[i + 1].y;
		instance_body_segments[i].image_xscale = instance_body_segments[i + 1].image_xscale;
		instance_body_segments[i].image_yscale = instance_body_segments[i + 1].image_yscale;
		instance_body_segments[i].image_angle = instance_body_segments[i + 1].image_angle;
	}

	instance_body_segments[num_body_segments - 1].x = x;
	instance_body_segments[num_body_segments - 1].y = y;
	instance_body_segments[i].image_xscale = image_xscale;
	instance_body_segments[i].image_yscale = image_yscale;
	instance_body_segments[num_body_segments - 1].image_angle = image_angle;

	// Update the head.
	if (pattern_1)
	{
		if (image_angle == 270)
		{
			if (abs(orig_y - y) > max_y)
			{
				image_angle = 180;
			}
		}
		else if (image_angle == 180)
		{
			if (abs(orig_x - x) > max_x)
			{
				if (orig_y - y > 0)
				{
					image_angle = 270;
				}
				else
				{
					image_angle = 90;
				}
			
				orig_x = x;
			}
		}
		else if (image_angle == 90)
		{
			if (abs(orig_y - y) > max_y)
			{
				image_angle = 180;
			}
		}
	}
	else
	{
		if (image_angle == 270)
		{
			if (abs(orig_y - y) > max_y)
			{
				image_angle = 0;
			}
		}
		else if (image_angle == 0)
		{
			if (abs(orig_x - x) > max_x)
			{
				if (orig_y - y > 0)
				{
					image_angle = 270;
				}
				else
				{
					image_angle = 90;
				}
			
				orig_x = x;
			}
		}
		else if (image_angle == 90)
		{
			if (abs(orig_y - y) > max_y)
			{
				image_angle = 0;
			}
		}
	}
	
	var movement_speed = 8;
	x_velocity = movement_speed * cos(degtorad(image_angle));
	y_velocity = -movement_speed * sin(degtorad(image_angle));
	
	if (!place_meeting(x + x_velocity, y, object_barrier))
	{
		x += x_velocity;
	}
	else
	{
		if (x_velocity < 0)
		{
			image_angle = 0;
		}
		else
		{
			image_angle = 180;
		}
		pattern_1 = !pattern_1;
	}
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