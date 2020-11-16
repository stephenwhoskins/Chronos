// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_button_custom(button, is_selected){
	var color = is_selected ? $ffffff : $888888;
	draw_text_color(button.x, button.y, button.text, color, color, color, color, 1.0);
}