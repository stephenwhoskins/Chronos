/// @description Insert description here
// You can write your code in this editor

hspeed = 0;
vspeed = 0;
moving_up = false;
moving_down = false;
moving_left = false;
moving_right = false;

var controller = read_gameplay_controller();

if (shock_count < max_shock_count)
{
	shock_count++;
	
	if (global.health_level <= 0 && shock_count == max_shock_count)
	{
		sprite_index = sprite_avatar_dead;
		death_count = 0;
	}
	
	return;
}
	
if (global.health_level > 0 && !global.time_stopped && !script_transitioning_rooms())
{
	if (bounce_back_count < max_bounce_back_count)
	{
		var x_velocity = 2.0 * bounce_direction;
		if (!script_place_meeting(x + x_velocity, y))
		{
			x += x_velocity;
		}
	}
	else
	{
		// Handle moving left, right, up, and down here.
		if (sprite_index != sprite_avatar_attacking)
		{
			sprite_index = sprite_avatar_idle;
			
			if (controller.up)
			{
				sprite_index = sprite_avatar_walking;
				if (!script_place_meeting(x, y - 1))
				{
					vspeed = -walk_speed;
				}
				moving_up = true;
			}
			else if (controller.down)
			{
				sprite_index = sprite_avatar_walking;
				if (!script_place_meeting(x, y + 1))
				{
					vspeed = walk_speed;
				}
				moving_down = true;
			}

			if (controller.left)
			{
				sprite_index = sprite_avatar_walking;
				image_xscale = -1.0;
				if (!script_place_meeting(x - 1, y))
				{
					hspeed = -walk_speed;
				}
				moving_left = true;
			}
			else if (controller.right)
			{
				sprite_index = sprite_avatar_walking;
				image_xscale = 1.0;
				if (!script_place_meeting(x + 1, y))
				{
					hspeed = walk_speed;
				}
				moving_right = true;
			}
		}
		else // Handle avatar attacking / enemy damage here
		{
			sword_attacking_instance.x = x;
			sword_attacking_instance.y = y;
			sword_attacking_instance.image_xscale = image_xscale;
			with (sword_attacking_instance)
			{
				var _list = ds_list_create();
				var _num = instance_place_list(x, y, object_enemy, _list, false);
				if _num > 0
				{
					for (var i = 0; i < _num; ++i;)
					{
					    var instance_enemy = _list[| i];
						instance_enemy.hit_type = hit_types.sword;
						if (instance_enemy.hurt_count == instance_enemy.max_hurt_count)
						{
							if (instance_enemy.object_index != object_electricity_0 &&
							instance_enemy.object_index != object_electricity_1 &&
							(instance_enemy.object_index != object_jelly || instance_enemy.state != jelly_state.jelly_shocking))
							{
								instance_enemy.hurt_count = 0;
								
								// Handle enemy left of avatar.
								if (instance_enemy.x < x)
								{
									instance_enemy.bounce_direction = -1.0;
								}
								else
								{
									instance_enemy.bounce_direction = 1.0;
								}
							}
							else
							{
								object_avatar.sprite_index = sprite_avatar_shocked;
								object_avatar.shock_count = 0;
								global.health_level--;
								break;
							}
						}
					}
				}
				ds_list_destroy(_list);
			}
		}
		
		if (controller.attacking && !attack_pressed)
		{
			if (sprite_index != sprite_avatar_attacking)
			{
				image_index = 0;
				audio_play_sound(sound_slice, 10, false);
			}
			sprite_index = sprite_avatar_attacking;
			attack_pressed = true;
		}
		else if (!controller.attacking)
		{
			attack_pressed = false;
		}
		
		if (controller.attacking_2 && !attack_2_pressed && global.bombs_enabled)
		{
			attack_2_pressed = true;
			if (instance_number(object_bomb) < 3)
			{
				instance_create_depth(x, y, depth + 1, object_bomb);
			}
		}
		else if (!controller.attacking_2)
		{
			attack_2_pressed = false;
		}
		
		if (controller.attacking_3 && !attack_3_pressed && global.bow_and_arrow_enabled &&
			arrow_pause_count == max_arrow_pause_count)
		{
			attack_3_pressed = true;
			instance_arrow = instance_create_depth(bbox_right + 10, y - 8, depth - 1, object_arrow);
			instance_arrow.hspeed = image_xscale * 2;
			instance_arrow.image_xscale = image_xscale;
			instance_arrow.image_angle = image_xscale * 90;
			if (image_xscale < 0)
			{
				instance_arrow.x = bbox_left - 10;
			}
			arrow_pause_count = 0;
		}
		else if (!controller.attacking_3)
		{
			attack_3_pressed = false;
		}
	}
}

if (escaping)
{
	set_camera(escape_x, escape_y);
}
else
{
	set_camera(x, y);
}

// Automatically make the Avatar head for the nearest exit.
if (escaping)
{
	sprite_index = sprite_avatar_walking;
	var dest_x = camera_get_view_x(view_camera[0]) + view_wport[0] / 2;
	var dest_y = camera_get_view_y(view_camera[0]) + view_hport[0] + global.hud_height;
	
	if (x != dest_x)
	{
		image_xscale = sign(dest_x - x);
		x += image_xscale;
	}
	else if (y != dest_y)
	{
		y += sign(dest_y - y);
	}
}
else if (instance_number(object_chronos_boss) > 0 && object_chronos_boss.chronos_state == chronos_states.introduction)
{
	sprite_index = sprite_avatar_walking;
	var dest_x = camera_get_view_x(view_camera[0]) + view_wport[0] / 2;
	var dest_y = camera_get_view_y(view_camera[0]) + 3 * view_hport[0] / 4;
	
	if (x != dest_x)
	{
		image_xscale = sign(dest_x - x);
		x += image_xscale;
	}
	else if (y != dest_y)
	{
		y += sign(dest_y - y);
	}
	else
	{
		sprite_index = sprite_avatar_idle;
	}
}
// Handle walk SFX here
else
{
	if (sprite_index == sprite_avatar_walking && last_sprite_index != sprite_avatar_walking)
	{
		walk_sound = audio_play_sound(sound_walk, 10, true);
	}

	if (sprite_index != sprite_avatar_walking && last_sprite_index == sprite_avatar_walking)
	{
		audio_stop_sound(walk_sound);
	}
	
	last_sprite_index = sprite_index;
}

if (hurt_count == 0 && sprite_index != sprite_avatar_dead)
{
	audio_play_sound(sound_hit, 10, false);
	bounce_back_count = 0;
	
	if (global.health_level <= 0)
	{
		sprite_index = sprite_avatar_dead;
		death_count = 0;
	}
}

if (sprite_index == sprite_avatar_dead && death_count == max_death_count &&
    !timey_time_warp_initiated)
{
	script_timey_time_warp();
	timey_time_warp_initiated = true;
}

hurt_count = min(hurt_count + 1, max_hurt_count);
bounce_back_count = min(bounce_back_count + 1, max_bounce_back_count);
death_count = min(death_count + 1, max_death_count);

arrow_pause_count = min(arrow_pause_count + 1, max_arrow_pause_count);