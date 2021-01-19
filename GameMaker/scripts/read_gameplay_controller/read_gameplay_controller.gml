// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function read_gameplay_controller(){
	gamepad_set_axis_deadzone(0, .3)
	var xVal = gamepad_axis_value(0,gp_axislh);
	var is_left = xVal < 0;
	var is_right = xVal > 0;
	var yVal = gamepad_axis_value(0, gp_axislv);
	var is_up = yVal < 0;
	var is_down = yVal > 0;
	is_left |= gamepad_button_check(0, gp_padl);
	is_right |= gamepad_button_check(0, gp_padr);
	is_up |= gamepad_button_check(0, gp_padu);
	is_down |= gamepad_button_check(0, gp_padd);
	var is_attacking = gamepad_button_check(0, gp_face3);
	var is_attacking_2 = gamepad_button_check(0, gp_face1);
	var is_attacking_3 = gamepad_button_check(0, gp_face2);
	is_left |= keyboard_check(vk_left);
	is_right |= keyboard_check(vk_right);
	is_up |= keyboard_check(vk_up);
	is_down |= keyboard_check(vk_down);
	is_attacking |= keyboard_check(ord("X"));
	is_attacking_2 |= keyboard_check(ord("Z"));
	is_attacking_3 |= keyboard_check(ord("C"));
	var controller = {
		left: is_left,
		right: is_right,
		up: is_up,
		down: is_down,
		attacking: is_attacking,
		attacking_2: is_attacking_2,
		attacking_3: is_attacking_3
	};
	return controller;
}