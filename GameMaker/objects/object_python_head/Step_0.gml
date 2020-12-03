/// @description Insert description here
// You can write your code in this editor

if (update_count == 0)
{
	// Update the body segments.
	for (i = 0; i < num_body_segments - 1; i++)
	{
		instance_body_segments[i].x = instance_body_segments[i + 1].x;
		instance_body_segments[i].y = instance_body_segments[i + 1].y;
		instance_body_segments[i].image_yscale = instance_body_segments[i + 1].image_yscale;
	}

	instance_body_segments[num_body_segments - 1].x = x;
	instance_body_segments[num_body_segments - 1].y = y;
	instance_body_segments[num_body_segments - 1].image_yscale = image_yscale;

	if (abs(orig_y - y) > max_y)
	{
		y_velocity = -y_velocity;
		image_yscale = -image_yscale;
	}

	// Update the head.
	y += y_velocity;
}

update_count = (update_count + 1) % max_update_count;