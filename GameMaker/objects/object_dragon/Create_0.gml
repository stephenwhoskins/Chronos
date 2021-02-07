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
	flying_eight_pattern,
	fire_attack,
	jump_attack
}

dragon_state = dragon_states.idle;

orig_y = y;

self_room_index = script_get_room_index(self);

y -= 256;