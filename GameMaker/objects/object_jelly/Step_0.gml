/// @description Insert description here
// You can write your code in this editor

// Reset the jelly if the avatar has left the room.
if (script_get_room_index(self) == script_get_room_index(object_avatar) && !avatar_present)
{
	x = start_x;
	y = start_y;
	avatar_present = true;
}
else if (script_get_room_index(self) != script_get_room_index(object_avatar) && avatar_present)
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
		if (state == jelly_state.jelly_shocking)
		{
			if (sprite_index != sprite_jelly_shocking)
			{
				sprite_index = sprite_jelly_shocking;
				image_index = 0;
			}

			if (state_count == max_shocking_count)
			{
				spd = init_speed;
				dir = random_range(0, 2 * pi);
				state = jelly_state.jelly_idle;
				state_count = 0;
			}
		}
		else
		{
			if (sprite_index != sprite_jelly_idle)
			{
				sprite_index = sprite_jelly_idle;
				image_index = 0;
			}
	
			if (state_count == max_idle_count)
			{
				spd = 0;
				state = jelly_state.jelly_shocking;
				state_count = 0;
			}
		}

		dx = spd * cos(dir);
		dy = spd * sin(dir);

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
		
		// Handle avatar collision here.
		if (place_meeting(x, y, object_avatar))
		{
			if (object_avatar.hurt_count == object_avatar.max_hurt_count &&
			object_avatar.shock_count == object_avatar.max_shock_count &&
			global.health_level > 0)
			{
				if (sprite_index == sprite_jelly_shocking)
				{
					object_avatar.sprite_index = sprite_avatar_shocked_2;
					object_avatar.shock_count = 0;
					global.health_level = max(global.health_level - 1, 0);
				}
				else
				{
					global.health_level = max(global.health_level - 1, 0);
					object_avatar.hurt_count = 0;
				
					// If avatar is to the left
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
		}
	}
}

if (hurt_count == 0 && sprite_index != sprite_jelly_dying)
{
	health_level = max(health_level - 1, 0);
	bounce_back_count = 0;
	
	if (health_level == 0)
	{
		sprite_index = sprite_jelly_dying;
		if (random(100) < 33)
		{
			instance_create_depth(x, y, depth - 1, object_health);
		}
	}
}
else if (hurt_count == 0 && sprite_index == sprite_jelly_dying)
{
	hurt_count = max_hurt_count;
}

hurt_count = min(hurt_count + 1, max_hurt_count);
bounce_back_count = min(bounce_back_count + 1, max_bounce_back_count);

state_count++;