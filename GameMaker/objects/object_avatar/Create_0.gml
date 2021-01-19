/// @description Insert description here
// You can write your code in this editor
max_hurt_count = 120;
hurt_count = max_hurt_count;

max_bounce_back_count = 10;
bounce_back_count = max_bounce_back_count;
bounce_direction = 1.0;

max_death_count = 180;
death_count = max_death_count;

attack_pressed = false;
attack_2_pressed = false;
attack_3_pressed = false;

timey_time_warp_initiated = false;
walk_sound = -1;
last_sprite_index = sprite_index;

escaping = false;

moving_up = false;
moving_down = false;
moving_left = false;
moving_right = false;

shock_count = 0;
max_shock_count = 1 * room_speed;

walk_speed = 1;

sword_attacking_instance = instance_create_depth(x, y, depth - 1, object_sword_attacking);
sword_attacking_instance.image_alpha = 0;