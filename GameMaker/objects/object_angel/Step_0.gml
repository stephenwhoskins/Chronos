/// @description Insert description here
// You can write your code in this editor

if (script_get_room_index(object_avatar) == script_get_room_index(self) && !avatar_present)
{
	alarm[0] = 1;
	avatar_present = true;
}
else if (script_get_room_index(object_avatar) != script_get_room_index(self) && avatar_present)
{
	avatar_present = false;
}

if (health_level > 0)
{
	if (bounce_back_count < max_bounce_back_count)
	{
		var x_velocity = 3.0 * bounce_direction;
		if (!place_meeting(x + x_velocity, y, object_barrier) &&
		script_get_room_index_2(bbox_left + x_velocity - 16, y) == start_room_index &&
		script_get_room_index_2(bbox_right + x_velocity + 16, y) == start_room_index)
		{
			x += x_velocity;
		}
	}
	else
	{
		if (sprite_index == sprite_angel_firing)
		{
			if (object_avatar.y > y + 12)
			{
				y++;
			}
			else if (object_avatar.y < y + 12)
			{
				y--;
			}
		}
	}
	
	if (object_avatar.x > x)
	{
		image_xscale = abs(image_xscale);
	}
	else
	{
		image_xscale = -abs(image_xscale);
	}
}

if (hurt_count == 0 && sprite_index != sprite_angel_dying)
{
	health_level = max(health_level - 1, 0);
	bounce_back_count = 0;
	
	if (health_level == 0)
	{
		sprite_index = sprite_angel_dying;
		if (random(100) < 40)
		{
			instance_create_depth(x, y, depth - 1, object_health);
		}
	}
}
else if (hurt_count == 0 && sprite_index == sprite_angel_dying)
{
	hurt_count = max_hurt_count;
}

hurt_count = min(hurt_count + 1, max_hurt_count);
bounce_back_count = min(bounce_back_count + 1, max_bounce_back_count);