/// @description Insert description here
// You can write your code in this editor
if (hurt_count < max_hurt_count &&
	floor(hurt_count / 2) % 2 == 0)
{
	draw_self();
}
else if (hurt_count == max_hurt_count)
{
	draw_self();
	if (spark_count < max_spark_count)
	{
		draw_sprite(sprite_sword_sparks, 0, x, bbox_top);
	}
}