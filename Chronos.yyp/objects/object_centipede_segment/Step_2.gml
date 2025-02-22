/// @description Insert description here
// You can write your code in this editor
if (hurt_count == 0)
{
	if (head.hurt_count == head.max_hurt_count)
	{
		head.hurt_count = 0;
		head.hit_type = hit_type;
	}
	
	hurt_count = max_hurt_count;
}