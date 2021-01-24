/// @description Insert description here
// You can write your code in this editor

_text_index = 0;
_num_text_indexes = array_length_1d(_text);
_char_count = -1;
_max_char_count = string_length(_text[0]);
_new_char_frame_count = 0;
_max_new_char_frame_count = room_speed / 30;
_read_pause_count = 0;
_max_read_pause_count = room_speed;
_left_padding = 8;
_top_padding = 8;