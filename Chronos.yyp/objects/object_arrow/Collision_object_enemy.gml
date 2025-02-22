/// @description Insert description here
// You can write your code in this editor

other.hurt_count = 0;
								
// If arrow is going to the left, bounce enemy to the left.
if (hspeed < 0)
{
	other.bounce_direction = -1.0;
}
// If arrow is going to the right, bounce enemy to the right.
else
{
	other.bounce_direction = 1.0;
}
other.hit_type = hit_types.arrow;
								
instance_destroy();