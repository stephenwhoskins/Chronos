/// @description Insert description here
// You can write your code in this editor
if (head.hurt_count < head.max_hurt_count &&
	floor(head.hurt_count / 2) % 2 == 0)
{
	draw_self();
}
else if (head.hurt_count == head.max_hurt_count || head.health_level == 0)
{
	draw_self();
}