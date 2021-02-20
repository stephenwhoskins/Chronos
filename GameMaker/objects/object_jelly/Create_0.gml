/// @description Insert description here
// You can write your code in this editor

is_boss = image_xscale > 1.5;
state_count = 0;

enum jelly_state
{
	jelly_idle,
	jelly_shocking
}

state = jelly_state.jelly_idle;
max_idle_count = 2.0 * room_speed;
max_shocking_count = 1.0 * room_speed;

dir = random_range(0, 2 * pi);
init_speed = .5;
spd = init_speed;

start_x = x;
start_y = y;

health_level = is_boss ? 16 : 2;
max_hurt_count = 30;
hurt_count = max_hurt_count;

max_bounce_back_count = 10;
bounce_back_count = max_bounce_back_count;
bounce_direction = 1.0;

avatar_present = false;

start_room_index = script_get_room_index(self);