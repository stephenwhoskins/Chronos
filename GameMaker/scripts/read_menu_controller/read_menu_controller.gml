// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function read_menu_controller(){
	var is_left = gamepad_button_check(0, gp_padl);
	var is_right = gamepad_button_check(0, gp_padr);
	var is_up = gamepad_button_check(0, gp_padu);
	var is_down = gamepad_button_check(0, gp_padd);
	var is_menu = gamepad_button_check(0, gp_start);
	var is_select = gamepad_button_check(0, gp_face1);
	is_left |= keyboard_check(vk_left);
	is_right |= keyboard_check(vk_right);
	is_up |= keyboard_check(vk_up);
	is_down |= keyboard_check(vk_down);
	is_menu |= keyboard_check(vk_escape);
	is_select |= keyboard_check(vk_space) || keyboard_check(vk_enter);
	var controller = {
		left: is_left,
		right: is_right,
		up: is_up,
		down: is_down,
		menu: is_menu,
		select: is_select
	};
	return controller;
}