/// @description Insert description here
// You can write your code in this editor
is_boss = abs(image_xscale) > 1.1;
health_level = is_boss ? 12 : 3;
max_hurt_count = 45;
hurt_count = max_hurt_count;

max_bounce_back_count = 10;
bounce_back_count = max_bounce_back_count;
bounce_direction = 1.0;
fire_frame_max = room_speed * 2;
fire_frame = 0;

timey_death_initiated = false;

max_boss_music_count = 120;
boss_music_count = max_boss_music_count;
door_shut = false;
wall_closed_instance = noone;

if (is_boss)
{
	wall_closed_instance = instance_create_depth(0, 0, depth-1, object_left_wall_closed);
	wall_closed_instance.image_alpha = 0;
	wall_closed_instance.solid = false;
}