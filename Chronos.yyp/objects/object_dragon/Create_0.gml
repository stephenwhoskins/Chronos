/// @description Insert description here
// You can write your code in this editor

health_level = 25;
max_hurt_count = 30;
hurt_count = max_hurt_count;

avatar_present = false;

enum dragon_states
{
	waiting,
	introduction,
	flying_elliptical_pattern,
	fire_attack,
	idle,
	flying_away,
	targeting,
	fall_attack,
	flying_up,
	flying_back,
	dead
}

dragon_state = dragon_states.waiting;

orig_x = x;
orig_y = y;

self_room_index = script_get_room_index(self);

dragon_x = x;
if (!global.dragon_dead)
{
	y -= 352;
}
dragon_y = y;

max_taunt_count = 3 * room_speed;
taunt_count = 0;

flying_time = 6; // in seconds
max_flying_count = flying_time * room_speed;
flying_count = 0;

max_radius_x = 64;
radius_x = 0;
max_radius_y = 32;
radius_y = 0;

max_idle_count = room_speed;
idle_count = 0;

max_fire_count = room_speed;
fire_count = 0;
fire_interval = room_speed / 2;

max_targeting_count = 2 * room_speed;
targeting_count = 0;
target_y = 0;

max_death_count = 2 * room_speed;
death_count = max_death_count;

shadow_offset = 0;