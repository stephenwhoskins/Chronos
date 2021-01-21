/// @description Insert description here
// You can write your code in this editor

health_level = 5;
max_hurt_count = 30;
hurt_count = max_hurt_count;

max_bounce_back_count = 10;
bounce_back_count = max_bounce_back_count;
bounce_direction = 1.0;

avatar_present = false;

start_room_index = script_get_room_index(self);

is_boss = image_xscale > 1.5 ? true : false;