/// @description Insert description here
// You can write your code in this editor

if (script_get_room_index(object_avatar) == self_room_index && !avatar_present &&
object_avatar.y < orig_y + 80)
{
	audio_stop_all();
	if (!global.dragon_dead)
	{
		object_music_player.sound = audio_play_sound(sound_dragon, 10, true);
		object_music_player.played = false;
		object_music_player.loop_begin_time = 14.925;
		object_music_player.alarm[0] = object_music_player.loop_begin_time * room_speed;
	}
	
	if (global.dragon_dead)
	{
		death_count = 0;
		dragon_state = dragon_states.dead;
		sprite_index = sprite_dragon_dead;
	}
	else
	{
		dragon_state = dragon_states.introduction;
	}
	
	avatar_present = true;
	
	// Create a barrier
	instance_create_depth(616, 176, depth + 1, object_electric_rod);
	instance_create_depth(624, 176, depth + 1, object_electricity_0);
	instance_create_depth(632, 176, depth + 1, object_electricity_0);
	instance_create_depth(640, 176, depth + 1, object_electricity_0);
	instance_create_depth(648, 176, depth + 1, object_electricity_0);
	instance_create_depth(656, 176, depth + 1, object_electricity_0);
	instance_create_depth(664, 176, depth + 1, object_electric_rod);
}
else if (script_get_room_index(object_avatar) != self_room_index && avatar_present)
{
	avatar_present = false;
}

switch (dragon_state)
{
	case dragon_states.waiting:
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
			dragon_state = dragon_states.fire_attack;
			sprite_index = sprite_dragon_attacking_1;
			flying_count = 0;
		}
		break;
	case dragon_states.fire_attack:
		if (fire_count % fire_interval == 0)
		{
			var num_fireballs = 5;
			for (var i = 0; i < num_fireballs; i++)
			{
				var fire = instance_create_depth(floor(x), floor(y - 32), depth - 1, object_fireball);
				var angle = pi / (num_fireballs + 1) * (i - (num_fireballs / 2 - .5)) + pi / 2;
				fire.dx = cos(angle);
				fire.dy = sin(angle);
			}
		}
		if (fire_count == max_fire_count)
		{
			dragon_state = dragon_states.idle;
			fire_count = 0;
		}
		else
		{
			fire_count = min(fire_count + 1, max_fire_count);
		}
		break;
	case dragon_states.idle:
		idle_count = min(idle_count + 1, max_idle_count);
		if (idle_count == max_idle_count)
		{
			idle_count = 0;
			dragon_state = dragon_states.flying_away;
			sprite_index = sprite_dragon_flying;
		}
		break;
	case dragon_states.flying_away:
		y = max(y - 1, orig_y - 224);
		shadow_offset = min(shadow_offset + 1, 224 - 20);
		if (y == orig_y - 224)
		{
			target_y = orig_y;
			dragon_state = dragon_states.targeting;
		}
		break;
	case dragon_states.targeting:
		var dx = floor(object_avatar.x) - x;
		if (dx != 0)
		{
			x += sign(dx);
		}
		var dy = floor(object_avatar.y) + 10 - target_y;
		if (dy != 0)
		{
			target_y += sign(dy);
		}
		y = target_y - 224;
		targeting_count = min(targeting_count + 1, max_targeting_count);
		if (targeting_count == max_targeting_count)
		{
			targeting_count = 0;
			dragon_state = dragon_states.fall_attack;
			sprite_index = sprite_dragon_attacking_2;
		}
		break;
	case dragon_states.fall_attack:
		y += 2;
		shadow_offset -= 2;
		if (y >= target_y)
		{
			global.shake_count = 3 * global.max_shake_count / 4;
			dragon_state = dragon_states.flying_up;
			sprite_index = sprite_dragon_flying;
		}
		break;
	case dragon_states.flying_up:
		y--;
		shadow_offset++;
		if (shadow_offset == 0)
		{
			dragon_state = dragon_states.flying_back;
		}
		break;
	case dragon_states.flying_back:
		var x_diff = x - orig_x;
		var y_diff = y - orig_y;
		if (x_diff != 0)
		{
			x -= sign(x_diff);
		}
		if (y_diff != 0)
		{
			y -= sign(y_diff);
		}
		if (x == orig_x && y == orig_y)
		{
			dragon_state = dragon_states.flying_elliptical_pattern;
		}
		break;
	case dragon_states.dead:
		break;
		
}

if (hurt_count == 0 && death_count == max_death_count)
{
	health_level = max(health_level - 1, 0);
	
	if (health_level == 0)
	{
		death_count = 0;
		dragon_state = dragon_states.dead;
		sprite_index = sprite_dragon_dead;
		global.dragon_dead = true;
	}
}
else if (hurt_count == 0 && death_count < max_death_count)
{
	hurt_count = max_hurt_count;
}

hurt_count = min(hurt_count + 1, max_hurt_count);

if (death_count < max_death_count)
{
	death_count = min(death_count + 1, max_death_count);
	if (death_count == max_death_count)
	{
		var chronos_x = script_get_room_camera_x(x) + view_wport[0] / 2;
		var chronos_y = script_get_room_camera_y(y) + view_hport[0] / 2;
		instance_create_depth(chronos_x, chronos_y, depth - 1, object_chronos_boss);
		instance_destroy();
	}
}