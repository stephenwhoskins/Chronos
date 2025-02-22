/// @description Insert description here
// You can write your code in this editor

x = script_get_room_camera_x(x);
y = script_get_room_camera_y(y) + global.hud_height;

max_dialog_height = 56;
dialog_height = max_dialog_height;

max_fade_count = 30;
fade_count = 0;
fade_out_count = max_fade_count;

event_inherited();