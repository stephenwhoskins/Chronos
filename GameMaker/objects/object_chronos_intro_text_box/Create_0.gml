/// @description Insert description here
// You can write your code in this editor
_text[0] = "No matter where in the \nmultiverse I am, you are";
_text[1] = "always going to be there, \naren't you?";
_text[2] = "And in every instance \nyou were always meant";
_text[3] = "to be a constant thorn in \nmy side...";
_text[4] = "Why won't you just...";
_text[5] = "DIE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!";

x = script_get_room_camera_x(x);
y = script_get_room_camera_y(y) + global.hud_height;

max_dialog_height = 56;
dialog_height = max_dialog_height;

max_fade_count = 30;
fade_count = 0;
fade_out_count = max_fade_count;

event_inherited();