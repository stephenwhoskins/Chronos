/// @description Insert description here
// You can write your code in this editor

if (script_get_room_index(object_avatar) == self_room_index && !avatar_present)
{
	audio_stop_all();
	object_music_player.sound = audio_play_sound(sound_dragon, 10, true);
	object_music_player.played = false;
	object_music_player.loop_begin_time = 14.925;
	object_music_player.alarm[0] = object_music_player.loop_begin_time * room_speed;
	
	dragon_state = dragon_states.introduction;
	
	avatar_present = true;
}
else if (script_get_room_index(object_avatar) != self_room_index && avatar_present)
{
	avatar_present = false;
}

switch (dragon_state)
{
	case dragon_states.idle:
		break;
	case dragon_states.introduction:
		dragon_y = min(dragon_y + 0.5, orig_y);
		y = floor(dragon_y);
		if (y == orig_y)
		{
			if (taunt_count % floor(room_speed / 4) == 0)
			{
				if (sprite_index == sprite_dragon_flying)
				{
					sprite_index = sprite_dragon_attacking_1;
					image_index = 1;
				}
				else
				{
					sprite_index = sprite_dragon_flying;
					image_index = 0;
				}
			}
			taunt_count = min(taunt_count + 1.0, max_taunt_count);
			if (taunt_count == max_taunt_count)
			{
				dragon_state = dragon_states.flying_elliptical_pattern;
			}
		}
		break;
	case dragon_states.flying_elliptical_pattern:
		if (flying_count > max_flying_count - room_speed)
		{
			radius_x = max(max_flying_count - flying_count, 0);
			radius_y = max((max_flying_count - flying_count) / 2, 0);
		}
		else
		{
			radius_x = min(radius_x + 1, max_radius_x);
			radius_y = min(radius_y + 1, max_radius_y);
		}
		// One ellipse per second:
		dragon_x = radius_x * cos(flying_time * 2 * pi * flying_count / max_flying_count) + orig_x;
		dragon_y = radius_y * sin(flying_time * 2 * pi * flying_count / max_flying_count) + orig_y;
		x = floor(dragon_x);
		y = floor(dragon_y);
		flying_count = min(flying_count + 1, max_flying_count);
		if (flying_count == max_flying_count)
		{
			dragon_state = dragon_states.fall_attack;
		}
		break;
}

if (hurt_count == 0 && sprite_index != sprite_dragon_attacking_2)
{
	health_level = max(health_level - 1, 0);
	
	if (health_level == 0)
	{
		sprite_index = sprite_dragon_attacking_2;
		if (random(100) < 40)
		{
			instance_create_depth(x, y, depth - 1, object_health);
		}
	}
}
else if (hurt_count == 0 && sprite_index == sprite_dragon_attacking_2)
{
	hurt_count = max_hurt_count;
}

hurt_count = min(hurt_count + 1, max_hurt_count);