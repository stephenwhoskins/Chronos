/// @description Insert description here
// You can write your code in this editor

if (script_get_room_index(object_avatar) != script_get_room_index(self))
{
    return;
}

// if image_angle is 0, it is pointing straight down. Adjust accordingly
var pointing = degtorad(-image_angle + 270);

var arrow_speed = 1.5;

var triggered = false;

if (image_angle == 0 || image_angle == 180)
{
	if (object_avatar.x > (x - 16) && object_avatar.x < (x + 16))
	{
		triggered = true;
	}
}

if (image_angle == 90 || image_angle == -90)
{
	if (object_avatar.y > (y - 16) && object_avatar.y < (y + 16))
	{
		triggered = true;
	}
}

if (triggered && reload_time == max_reload_time)
{
	instance_arrow = instance_create_depth(x, y, -100, object_arrow);
	instance_arrow.x = x + 20 * cos(pointing);
	instance_arrow.y = y - 18 * sin(pointing);
	instance_arrow.hspeed = cos(pointing) * arrow_speed;
	instance_arrow.vspeed = -sin(pointing) * arrow_speed;
	reload_time = 0;
	instance_arrow.image_angle = -image_angle;
}


reload_time = min(reload_time + 1, max_reload_time);