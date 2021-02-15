/// @description Insert description here
// You can write your code in this editor

orig_x = x;

max_x_offset = 32;
last_image_index = image_index;

health_level = 2;
max_hurt_count = 30;
hurt_count = max_hurt_count;

max_bounce_back_count = 10;
bounce_back_count = max_bounce_back_count;
bounce_direction = 1.0;

max_tink_count = floor(room_speed / 4);
tink_count = max_tink_count;

max_shoot_count = room_speed * 8;
shoot_count = max_shoot_count;


is_boss = image_xscale > 1.5;