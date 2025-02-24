/// @description Insert description here
// You can write your code in this editor

if (health_level > 0)
{
	// Reset the warrior if the avatar has left the room.
	if (script_get_room_index(self) == script_get_room_index(object_avatar) && !avatar_present)
	{
		x = start_x;
		y = start_y;
		avatar_present = true;
		being_attacked = false;
	}
	else if (script_get_room_index(self) != script_get_room_index(object_avatar) && avatar_present)
	{
		avatar_present = false;
	}
	
	// Handle bounce from being attacked.
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
	else if (distance_to_object(object_avatar) < sight_radius || being_attacked)
	{
		being_attacked = true;
		sprite_index = sprite_walking;
		var velocity = 1.5 * max(0.0, 1.0 - distance_to_object(object_avatar) / sight_radius);
		if (hurt_count < max_hurt_count) velocity *= 0.5;
		var angle = arctan2(object_avatar.y - y, object_avatar.x - x);
		var dx = velocity * cos(angle);
		var dy = velocity * sin(angle);
		if (dx != 0)
			image_xscale *= sign(dx) * sign(image_xscale);
		if (place_meeting(x + dx, y + dy, object_avatar))
		{
			if (object_avatar.hurt_count == object_avatar.max_hurt_count)
			{
				global.health_level = max(global.health_level - 1, 0);
				object_avatar.hurt_count = 0;
			
				// If avatar is to the left.
				if (object_avatar.x < x)
				{
					object_avatar.bounce_direction = -1;
				}
				else
				{
					object_avatar.bounce_direction = 1;
				}
			}
		}
		else
		{
			if (!place_meeting(x + dx, y, object_barrier) &&
			script_get_room_index_2(bbox_left + dx - 16, y) == start_room_index &&
			script_get_room_index_2(bbox_right + dx + 16, y) == start_room_index)
			{
				x += dx;
			}
			if (!place_meeting(x, y + dy, object_barrier) &&
			script_get_room_index_2(x, bbox_top + dy - 16) == start_room_index &&
			script_get_room_index_2(x, bbox_bottom + dy + 16) == start_room_index)
			{
				y += dy;
			}
		}
	}
	else
	{
		sprite_index = sprite_idle;
	}
}

if (hurt_count == 0 && sprite_index != sprite_dead)
{
	health_level = max(health_level - 1, 0);
	bounce_back_count = 0;
	being_attacked = true;
	
	if (health_level == 0)
	{
		sprite_index = sprite_dead;
		if (random(100) < 33)
		{
			instance_create_depth(x, y, depth - 1, object_health);
		}
	}
}
else if (hurt_count == 0 && sprite_index == sprite_dead)
{
	hurt_count = max_hurt_count;
}

hurt_count = min(hurt_count + 1, max_hurt_count);
bounce_back_count = min(bounce_back_count + 1, max_bounce_back_count);