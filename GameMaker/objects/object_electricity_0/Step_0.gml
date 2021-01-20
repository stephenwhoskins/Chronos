/// @description Insert description here
// You can write your code in this editor

var num_enemies = 0;
var i;

for (i = 0; i < instance_number(object_enemy); i++)
{
	var enemy_instance = instance_find(object_enemy, i);
	
	if (script_get_room_index(enemy_instance) == script_get_room_index(self) &&
	enemy_instance.object_index != object_electricity_0 &&
	enemy_instance.object_index != object_electricity_1)
	{
		num_enemies++;
	}
}

if (num_enemies == 0)
{
	instance_destroy();
}

// Handle avatar collision here.
if (place_meeting(x, y, object_avatar))
{
	if (object_avatar.hurt_count == object_avatar.max_hurt_count &&
	object_avatar.shock_count == object_avatar.max_shock_count &&
	global.health_level > 0)
	{
		object_avatar.sprite_index = sprite_avatar_shocked_2;
		object_avatar.shock_count = 0;
		global.health_level = max(global.health_level - 1, 0);
		
		if (object_index == object_electricity_0)
		{
			if (object_avatar.y < y)
			{
				object_avatar.y -= 4;
			}
			else
			{
				object_avatar.y += 4;
			}
		}
		else if (object_index == object_electricity_1)
		{
			if (object_avatar.x < x)
			{
				object_avatar.x -= 4;
			}
			else
			{
				object_avatar.x += 4;
			}
		}
	}
}