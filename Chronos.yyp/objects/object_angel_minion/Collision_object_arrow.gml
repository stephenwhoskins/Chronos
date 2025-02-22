/// @description Insert description here
// You can write your code in this editor

if (other.object_index != object_angel_arrow && hurt_count == max_hurt_count)
{
	instance_destroy(other.id);
	hurt_count = 0;
}