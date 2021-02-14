/// @description Insert description here
// You can write your code in this editor

var fly_speed = 2;
var offset_magnitude = 128;

var y_offset = 2.0 * sin(2.0 * pi * float_count / max_float_count);

float_count = (float_count + 1) % max_float_count;

y = orig_y + y_offset;

if (script_get_room_index(object_avatar) != script_get_room_index(self))
{
	return;
}

switch (chronos_state)
{
	// Chronos talks.
	case chronos_states.introduction:
		if (intro_text_box == noone)
		{
			// The text box cleans up after itself.
			intro_text_box = instance_create_depth(x, y, depth + 1, object_chronos_intro_text_box);
		}
		if (intro_text_box._text_index == intro_text_box._num_text_indexes - 1)
		{
			chronos_state = chronos_states.angels_flying_vertically;
			alarm[1] = 2 * room_speed;
		}
		break;
	// Fly the angels vertically.
	case chronos_states.angels_flying_vertically:
		for (i = max_angels_per_group - 1; i > -1; i--)
		{
			angel_instances_1[i].y += fly_speed;
		}

		for (i = max_angels_per_group - 1; i > -1; i--)
		{
			angel_instances_2[i].y += fly_speed;
		}

		for (i = max_angels_per_group - 1; i > -1; i--)
		{
			angel_instances_3[i].y += fly_speed;
		}

		if (angel_instances_1[max_angels_per_group - 1].y > y + view_hport[0])
		{
			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_1[i].x = center_x - 128 - i * 32;
				angel_instances_1[i].y = center_y - 16;
			}

			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_2[i].x = center_x - 128 - i * 32;
				angel_instances_2[i].y = center_y + 40;
			}

			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_3[i].x = center_x - 128 - i * 32;
				angel_instances_3[i].y = center_y + 96;
			}
			
			chronos_state = chronos_states.angels_flying_horizontally;
		}
		break;
	// Fly the angels horizontally.
	case chronos_states.angels_flying_horizontally:
		for (i = max_angels_per_group - 1; i > -1; i--)
		{
			angel_instances_1[i].x += fly_speed;
		}

		for (i = max_angels_per_group - 1; i > -1; i--)
		{
			angel_instances_2[i].x += fly_speed;
		}

		for (i = max_angels_per_group - 1; i > -1; i--)
		{
			angel_instances_3[i].x += fly_speed;
		}

		if (angel_instances_1[max_angels_per_group - 1].x > x + view_wport[0])
		{
			var cos_90 = cos(degtorad(90.0));
			var sin_90 = sin(degtorad(90.0));
			var x_offset = offset_magnitude * cos_90;
			var y_offset = offset_magnitude * sin_90;
			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_1[i].x = center_x - x_offset - 32 * cos_90 * i;
				angel_instances_1[i].y = center_y - y_offset + 64 - 32 * sin_90 * i;
			}

			var cos_210 = cos(degtorad(210.0));
			var sin_210 = sin(degtorad(210.0));
			x_offset = offset_magnitude * cos_210
			y_offset = offset_magnitude * sin_210
			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_2[i].x = center_x - x_offset - 32 * cos_210 * i;
				angel_instances_2[i].y = center_y - y_offset + 64 - 32 * sin_210 * i;
				angel_instances_2[i].image_xscale = -1.0;
			}

			var cos_330 = cos(degtorad(330.0));
			var sin_330 = sin(degtorad(330.0));
			x_offset = offset_magnitude * cos_330;
			y_offset = offset_magnitude * sin_330;
			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_3[i].x = center_x - x_offset - 32 * cos_330 * i;
				angel_instances_3[i].y = center_y - y_offset + 64 - 32 * sin_330 * i;
			}
			
			chronos_state = chronos_states.angels_flying_to_center;
		}
		break;
	// Fly the angels toward the center of the screen.
	case chronos_states.angels_flying_to_center:
		var x_offset = fly_speed * cos(degtorad(90.0));
		var y_offset = fly_speed * sin(degtorad(90.0));
		for (i = max_angels_per_group - 1; i > -1; i--)
		{
			angel_instances_1[i].x += x_offset;
			angel_instances_1[i].y += y_offset;
		}

		var x_offset = fly_speed * cos(degtorad(210.0));
		var y_offset = fly_speed * sin(degtorad(210.0));
		for (i = max_angels_per_group - 1; i > -1; i--)
		{
			angel_instances_2[i].x += x_offset;
			angel_instances_2[i].y += y_offset;
		}

		var x_offset = fly_speed * cos(degtorad(330.0));
		var y_offset = fly_speed * sin(degtorad(330.0));
		for (i = max_angels_per_group - 1; i > -1; i--)
		{
			angel_instances_3[i].x += x_offset;
			angel_instances_3[i].y += y_offset;
		}
		
		if (angel_instances_1[max_angels_per_group - 1].y > y + view_hport[0])
		{
			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_1[i].x = center_x - 64;
				angel_instances_1[i].y = center_y - 128 - i * 32;
			}

			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_2[i].x = center_x;
				angel_instances_2[i].y = center_y - 128 - i * 32;
				angel_instances_2[i].image_xscale = 1.0;
			}

			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_3[i].x = center_x + 64;
				angel_instances_3[i].y = center_y - 128 - i * 32;
			}
			
			chronos_state = chronos_states.angels_flying_vertically;
		}
		break;
}

if (hurt_count == 0 && sprite_index != sprite_chronos_dying)
{
	health_level = max(health_level - 1, 0);
	
	if (health_level == 0)
	{
		sprite_index = sprite_chronos_dying;
		script_timey_death_sequence();
		instance_destroy();
	}
	else
	{
		spawn_index = (spawn_index + 1) % max_spawn_indices;
		x = spawn_points_x[spawn_index];
		y = spawn_points_y[spawn_index];
		orig_y = y;
	}
}
else if (hurt_count == 0 && sprite_index == sprite_chronos_dying)
{
	hurt_count = max_hurt_count;
}

hurt_count = min(hurt_count + 1, max_hurt_count);