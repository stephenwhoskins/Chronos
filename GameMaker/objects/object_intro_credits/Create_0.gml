/// @description Insert description here
// You can write your code in this editor

animation_count = 0;

a_game_by_start_time = 3 * room_speed
a_game_by_end_time = a_game_by_start_time + 4 * room_speed;

programming_start_time = a_game_by_end_time;
programming_end_time = programming_start_time + 4 * room_speed;

art_start_time = programming_end_time;
art_end_time = art_start_time + 4 * room_speed;

music_and_sound_start_time = art_end_time;
music_and_sound_end_time = music_and_sound_start_time + 4 * room_speed;

max_animation_count = music_and_sound_end_time + 1;