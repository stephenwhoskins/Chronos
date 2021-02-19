/// @description Insert description here
// You can write your code in this editor

var title_text = "Chronos";
title_struct = {
text: title_text,
x: 91,
y: 56
};

var start_button_text = "Start";
var button_height = 100;
start_button = {
text: start_button_text,
x: view_wport[0] / 2 - 30 - string_width(start_button_text),
y: button_height
};
exit_button = {
text: "Exit",
x: view_wport[0] / 2 + 39,
y: button_height
};

buttons = [start_button, exit_button];
num_buttons = array_length(buttons);
selected = 0;
swapped = false;

idle_count = 0;
max_idle_count = room_speed * 15; // 15 seconds