/// @description Insert description here
// You can write your code in this editor

var fly_speed = 2;
var offset_magnitude = 128;

if (script_get_room_index(object_avatar) != script_get_room_index(self))
{
	return;
}

switch (chronos_state)
{
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
				angel_instances_1[i].x = orig_x - 128 - i * 32;
				angel_instances_1[i].y = orig_y - 16;
			}

			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_2[i].x = orig_x - 128 - i * 32;
				angel_instances_2[i].y = orig_y + 40;
			}

			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_3[i].x = orig_x - 128 - i * 32;
				angel_instances_3[i].y = orig_y + 96;
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
				angel_instances_1[i].x = orig_x - x_offset - 32 * cos_90 * i;
				angel_instances_1[i].y = orig_y - y_offset + 64 - 32 * sin_90 * i;
			}

			var cos_210 = cos(degtorad(210.0));
			var sin_210 = sin(degtorad(210.0));
			x_offset = offset_magnitude * cos_210
			y_offset = offset_magnitude * sin_210
			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_2[i].x = orig_x - x_offset - 32 * cos_210 * i;
				angel_instances_2[i].y = orig_y - y_offset + 64 - 32 * sin_210 * i;
				angel_instances_2[i].image_xscale = -1.0;
			}

			var cos_330 = cos(degtorad(330.0));
			var sin_330 = sin(degtorad(330.0));
			x_offset = offset_magnitude * cos_330;
			y_offset = offset_magnitude * sin_330;
			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_3[i].x = orig_x - x_offset - 32 * cos_330 * i;
				angel_instances_3[i].y = orig_y - y_offset + 64 - 32 * sin_330 * i;
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
				angel_instances_1[i].x = orig_x - 64;
				angel_instances_1[i].y = orig_y - 128 - i * 32;
			}

			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_2[i].x = orig_x;
				angel_instances_2[i].y = orig_y - 128 - i * 32;
				angel_instances_2[i].image_xscale = 1.0;
			}

			for (i = max_angels_per_group - 1; i > -1; i--)
			{
				angel_instances_3[i].x = orig_x + 64;
				angel_instances_3[i].y = orig_y - 128 - i * 32;
			}
			
			chronos_state = chronos_states.angels_flying_vertically;
		}
		break;
}