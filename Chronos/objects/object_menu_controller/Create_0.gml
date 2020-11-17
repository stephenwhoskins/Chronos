/// @description Insert description here
// You can write your code in this editor

var title_text = "Chronos Time Warp";
title_struct = {
text: title_text,
x: 42,
y: 50
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
x: view_wport[0] / 2 + 30,
y: button_height
};

buttons = [start_button, exit_button];
num_buttons = array_length(buttons);
selected = 0;