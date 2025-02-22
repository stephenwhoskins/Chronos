/// @description Insert description here
// You can write your code in this editor

max_float_count = 240;
float_count = 0;
orig_x = x;
orig_y = y;

image_alpha = 0;

animation_count = 0;

fade_start_time = 17 * room_speed;
fade_end_time = fade_start_time + 1 * room_speed; // one second later

flash_start_time = fade_start_time;
flash_end_time = flash_start_time + 8; // 8 / 60ths of a second later

focus_start_time = 22 * room_speed;

fade_out_start_time = focus_start_time + 4 * room_speed;
fade_out_end_time = fade_out_start_time + 1 * room_speed;

flash_2_start_time = fade_out_end_time - 8;
flash_2_end_time = fade_out_end_time;