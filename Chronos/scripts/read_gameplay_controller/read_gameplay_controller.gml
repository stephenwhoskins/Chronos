// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function read_gameplay_controller(){
	if (gamepad_is_connected(0))
	{
		var is_left = gamepad_button_check(0, gp_padl);
		var is_right = gamepad_button_check(0, gp_padr);
		var is_up = gamepad_button_check(0, gp_padu);
		var is_down = gamepad_button_check(0, gp_padd);
		var is_attacking = gamepad_button_check(0, gp_face3);
	}
	else
	{
		var is_left = keyboard_check(vk_left);
		var is_right = keyboard_check(vk_right);
		var is_up = keyboard_check(vk_up);
		var is_down = keyboard_check(vk_down);
		var is_attacking = keyboard_check(ord("X"));
	}
	var controller = {
		left: is_left,
		right: is_right,
		up: is_up,
		down: is_down,
		attacking: is_attacking
	};
	return controller;
}