/// @description Insert description here
// You can write your code in this editor

if (!firing)
{
	x = rotation_radius * cos(2 * pi * orb_rotation_count / max_orb_rotation_count) + orig_x;
	y = -rotation_radius * sin(2 * pi * orb_rotation_count / max_orb_rotation_count) + orig_y;

	orb_rotation_count = (orb_rotation_count + 1) % max_orb_rotation_count;
}
else if (speed != 2)
{
	direction = 360.0 * orb_rotation_count / max_orb_rotation_count;
	speed = 2;
	alarm[0] = 4 * room_speed;
}