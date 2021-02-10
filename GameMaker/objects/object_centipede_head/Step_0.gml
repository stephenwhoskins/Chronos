/// @description Insert description here
// You can write your code in this editor

// extra boss logic here

if (is_boss)
{
	// handle changing of the music
	if ((object_bottom_wall_closing_tropics.closed ||
	!object_bottom_wall_closing_tropics.locked) &&
	silence_count < max_silence_count)
	{
		if (silence_count == 0)
		{
			audio_stop_sound(object_music_player.sound);
		}
		
		silence_count++;
		
		if (silence_count == max_silence_count)
		{
			object_music_player.played = false;
			object_music_player.loop_begin_time = 0.0;
			object_music_player.alarm[0] = object_music_player.loop_begin_time * room_speed;
			if (health_level <= 0)
			{
				object_music_player.sound = audio_play_sound(sound_bgm_2, 10, true);
			}
			else
			{
				object_music_player.sound = audio_play_sound(sound_boss_music, 10, true);
			}
		}
	}
}

if (sprite_index == sprite_centipede_head_dying)
	return;

if (update_count == 0)
{
	// Boss doesn't move until the door is closed.
	if (is_boss &&
	!object_bottom_wall_closing_tropics.closed)
	{
		return;
	}
	
	// Update the body segments.
	for (i = 0; i < num_body_segments - 1; i++)
	{
		instance_body_segments[i].x = instance_body_segments[i + 1].x;
		instance_body_segments[i].y = instance_body_segments[i + 1].y;
		instance_body_segments[i].image_xscale = instance_body_segments[i + 1].image_xscale;
		instance_body_segments[i].image_yscale = instance_body_segments[i + 1].image_yscale;
		instance_body_segments[i].image_angle = instance_body_segments[i + 1].image_angle;
	}

	instance_body_segments[i].x = x;
	instance_body_segments[i].y = y;
	instance_body_segments[i].image_xscale = image_xscale;
	instance_body_segments[i].image_yscale = image_yscale;
	instance_body_segments[i].image_angle = image_angle;

	// Update the head.
	// First pattern
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
	// Second pattern
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
	
	// Handle y-offsets while centipede is moving horizontally.
	if (is_boss && y_velocity == 0)
	{
		y = unmod_y + sway_pixels * cos((frame_count % max_frame_count) / max_frame_count * pi);
	}
	else if (!place_meeting(x, y + y_velocity, object_barrier))
	{
		unmod_y += y_velocity;
		y = unmod_y
	}
	else
	{
		if (pattern_1)
		{
			image_angle = 180;
		}
		else
		{
			image_angle = 0;
		}
		unmod_x = x;
		unmod_y = y;
	}
	
	// Handle x-offsets while centipede is moving vertically.
	if (is_boss && x_velocity == 0)
	{
		x = unmod_x + sway_pixels * cos((frame_count % max_frame_count) / max_frame_count * 2 * pi);
	}
	else if (!place_meeting(x + x_velocity, unmod_y, object_barrier))
	{
		unmod_x += x_velocity;
		x = unmod_x
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
		unmod_y = y;
		unmod_x = x;
		pattern_1 = !pattern_1;
	}
	
	// Handle collisions with avatar.
	if (place_meeting(x, y, object_avatar))
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
frame_count += 1;
frame_count %= max_frame_count;