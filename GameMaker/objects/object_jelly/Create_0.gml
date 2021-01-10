/// @description Insert description here
// You can write your code in this editor
state_count = 0;

enum jelly_state
{
	jelly_idle,
	jelly_shocking
}

state = jelly_state.jelly_idle;
max_idle_count = 2.0 * room_speed;
max_shocking_count = 1.0 * room_speed;

dir = irandom_range(0, 2 * pi);
init_speed = .5;
spd = init_speed;

max_hurt_count = 1;
hurt_count = max_hurt_count;