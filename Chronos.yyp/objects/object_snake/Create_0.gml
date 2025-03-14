/// @description Insert description here
// You can write your code in this editor
is_boss = abs(image_xscale) > 1.1;
health_level = is_boss ? 25 : 3;
max_hurt_count = 30;
hurt_count = max_hurt_count;
sight_radius = 150;

max_bounce_back_count = 10;
bounce_back_count = max_bounce_back_count;
bounce_direction = 1.0;
fire_frame_max = room_speed * 2;
fire_frame = 0;

timey_death_initiated = false;

max_boss_music_count = 2 * room_speed;
boss_music_count = max_boss_music_count;
door_shut = false;

if (is_boss)
{
	if (global.snake_key_count > 0)
	{
		instance_destroy();
	}
	sight_radius = 70;
}

start_x = x;
start_y = y;
avatar_present = false;
start_room_index = script_get_room_index(self);

being_attacked = false;