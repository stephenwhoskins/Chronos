/// @description Insert description here
// You can write your code in this editor

other.hurt_count = 0;
								
// Handle enemy left of arrow.
if (other.x < x)
{
	other.bounce_direction = -1.0;
}
else
{
	other.bounce_direction = 1.0;
}
other.hit_type = hit_types.arrow;
								
instance_destroy();