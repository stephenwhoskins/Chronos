/// @description Insert description here
// You can write your code in this editor

// Handle Avatar from above.
if (place_meeting(x, y - 2, object_avatar) &&
object_avatar.vspeed > 0 &&
place_free(x, y + object_avatar.vspeed) &&
!moved)
{
	vspeed = object_avatar.vspeed;
	moved = true;
}

// Handle Avatar from below.
if (place_meeting(x, y + 2, object_avatar) &&
object_avatar.vspeed < 0 &&
place_free(x, y + object_avatar.vspeed) &&
!moved)
{
	vspeed = object_avatar.vspeed;
	moved = true;
}

// Handle Avatar from the left.
if (place_meeting(x - 2, y, object_avatar) &&
object_avatar.hspeed > 0 &&
place_free(x + object_avatar.hspeed, y) &&
!moved)
{
	hspeed = object_avatar.hspeed;
	moved = true;
}

// Handle Avatar from the right.
if (place_meeting(x + 2, y, object_avatar) &&
object_avatar.hspeed < 0 &&
place_free(x + object_avatar.hspeed, y) &&
!moved)
{
	hspeed = object_avatar.hspeed;
	moved = true;
}

if (moved && (abs(y - start_y) >= max_y_offset || abs(x - start_x) >= max_x_offset))
{
	hspeed = 0;
	vspeed = 0;
}