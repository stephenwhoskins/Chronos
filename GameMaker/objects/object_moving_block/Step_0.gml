/// @description Insert description here
// You can write your code in this editor

// Reset the block if the avatar has left the room.
if (script_get_room_index(self) == script_get_room_index(object_avatar) && !avatar_present)
{
	x = start_x;
	y = start_y;
	moved = false;
	avatar_present = true;
}
else if (script_get_room_index(self) != script_get_room_index(object_avatar) && avatar_present)
{
	avatar_present = false;
}

// Handle Avatar from above.
if (script_place_meeting_avatar(0, -3) &&
object_avatar.vspeed > 0 &&
place_free(x, y + object_avatar.vspeed) &&
!moved)
{
	vspeed = object_avatar.vspeed;
	moved = true;
}

// Handle Avatar from below.
if (script_place_meeting_avatar(0, 3) &&
object_avatar.vspeed < 0 &&
place_free(x, y + object_avatar.vspeed) &&
!moved)
{
	vspeed = object_avatar.vspeed;
	moved = true;
}

// Handle Avatar from the left.
if (script_place_meeting_avatar(-3, 0) &&
object_avatar.hspeed > 0 &&
place_free(x + object_avatar.hspeed, y) &&
!moved)
{
	hspeed = object_avatar.hspeed;
	moved = true;
}

// Handle Avatar from the right.
if (script_place_meeting_avatar(3, 0) &&
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