/// @description Insert description here
// You can write your code in this editor

// good enough GUI-wise
draw_set_font(font_dialogue);
draw_button_custom(title_struct, true);
draw_button_custom(start_button, buttons[selected] == start_button);
draw_button_custom(exit_button, buttons[selected] == exit_button);