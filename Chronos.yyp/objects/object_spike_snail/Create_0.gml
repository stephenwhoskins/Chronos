/// @description Insert description here
// You can write your code in this editor

orig_x = x;
is_boss = image_xscale > 1.5;

max_x_offset = is_boss ? 64 : 32;
last_image_index = image_index;

max_health_level = is_boss ? 10 : 1;
health_level = max_health_level;
max_hurt_count = 60;
hurt_count = max_hurt_count;

max_bounce_back_count = 10;
bounce_back_count = max_bounce_back_count;
bounce_direction = 1.0;

max_tink_count = floor(room_speed / 4);
tink_count = max_tink_count;

max_shoot_count = room_speed * 6;
shoot_count = 0;

max_shots_fired = 6;
shots_fired = 0;

if (is_boss)
{
	if (global.bow_and_arrow_enabled)
	{
		instance_destroy();
	}
}