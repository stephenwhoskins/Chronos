/// @description Insert description here
// You can write your code in this editor

health_level = 5;
max_hurt_count = 30;
hurt_count = max_hurt_count;

avatar_present = false;

enum dragon_states
{
	idle,
	introduction,
	flying_elliptical_pattern,
	fire_attack,
	fly_away,
	fall_attack
}

dragon_state = dragon_states.idle;

orig_x = x;
orig_y = y;

self_room_index = script_get_room_index(self);

dragon_x = x;
y -= 352;
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