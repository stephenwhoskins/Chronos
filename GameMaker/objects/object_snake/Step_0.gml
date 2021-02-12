/// @description Insert description here
// You can write your code in this editor

if (health_level > 0)
{
	// Reset the snake if the avatar has left the room.
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
	else if (distance_to_object(object_avatar) < 50 ||
			(distance_to_object(object_avatar) < 70 && is_boss) || being_attacked)
	{
		being_attacked = true;
		
		// Handle spitting fire if a boss here.
		if (is_boss && fire_frame == fire_frame_max)
		{
			if (sprite_index != sprite_snake_spitting)
			{
				sprite_index = sprite_snake_spitting;
				alarm[0] = .75 * room_speed;
			}
		}
		else if (is_boss && fire_frame == 0)
		{
				var xs = sign(image_xscale);
				var ys = sign(image_yscale);
				var num_fireballs = 3;
				for (var i = 0; i < num_fireballs; i++)
				{
					var fire = instance_create_depth(floor(x + 8 * xs), floor(y - 32 * ys), depth - 1, object_fireball);
					var angle = pi / 4 * (i - (num_fireballs / 2 - .5));
					fire.dx = cos(angle) * xs;
					fire.dy = sin(angle);
				}
		}
		else // Handle movement logic here
		{
			sprite_index = sprite_snake_walking;
			var velocity = min(.8, distance_to_object(object_avatar));
			var angle = arctan2(object_avatar.y - y, object_avatar.x - x);
			var dx = velocity * cos(angle);
			var dy = velocity * sin(angle);
			if (dx != 0)
				image_xscale *= sign(dx) * sign(image_xscale);
				
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
		
		// Handle avatar collision here.
		if (place_meeting(x, y, object_avatar))
		{
			if (object_avatar.hurt_count == object_avatar.max_hurt_count)
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
		
		if (is_boss && !door_shut)
		{
			door_shut = true;
			audio_stop_all();
			audio_play_sound(sound_door_closed, 10, false);
			object_magic_left_wall_closed.x = camera_get_view_x(view_camera[0]);
			object_magic_left_wall_closed.y = camera_get_view_y(view_camera[0]) + 40;
			object_magic_left_wall_closed.image_alpha = 1;
			object_magic_left_wall_closed.solid = true;
			boss_music_count = 0;
		}
	}
	else
	{
		sprite_index = sprite_snake_idle;
	}
}

if (boss_music_count < max_boss_music_count)
{
	boss_music_count++;
	
	if (boss_music_count == max_boss_music_count)
	{
		audio_play_sound(sound_boss_music, 10, true);
	}
}

// Snake is invincible when he's spitting fire.
if (hurt_count == 0 && sprite_index == sprite_snake_spitting)
{
	hurt_count = max_hurt_count;
}

// Handle snake getting hurt.
if (hurt_count == 0 && sprite_index != sprite_snake_dead)
{
	health_level = max(health_level - 1, 0);
	bounce_back_count = 0;
	being_attacked = true;
	
	if (health_level == 0)
	{
		sprite_index = sprite_snake_dead;
		if (random(100) < 40)
		{
			instance_create_depth(x, y, depth - 1, object_health);
		}
		if (is_boss)
		{
			snake_1 = instance_create_depth(x - 16, y, depth + 1, object_snake);
			snake_2 = instance_create_depth(x - 8, y, depth + 1, object_snake);
			snake_3 = instance_create_depth(x + 8, y, depth + 1, object_snake);
			snake_4 = instance_create_depth(x + 16, y, depth + 1, object_snake);
		}
	}
}
else if (hurt_count == 0 && sprite_index == sprite_snake_dead)
{
	hurt_count = max_hurt_count;
}

if (variable_instance_exists(id, "snake_1") && variable_instance_exists(id, "snake_2") &&
	variable_instance_exists(id, "snake_3") && variable_instance_exists(id, "snake_4"))
{
	if (snake_1.sprite_index == sprite_snake_dead &&
		snake_2.sprite_index == sprite_snake_dead &&
		snake_3.sprite_index == sprite_snake_dead &&
		snake_4.sprite_index == sprite_snake_dead)
	{
		if (!timey_death_initiated)
		{
			//script_timey_death_sequence();
			audio_stop_all();
			timey_death_initiated = true;
			// snake key destroys itself
			instance_create_depth(x, y - view_hport[0], depth - 2, object_snake_key);
		}
	}
}

hurt_count = min(hurt_count + 1, max_hurt_count);
bounce_back_count = min(bounce_back_count + 1, max_bounce_back_count);

fire_frame = min(fire_frame + 1, fire_frame_max);