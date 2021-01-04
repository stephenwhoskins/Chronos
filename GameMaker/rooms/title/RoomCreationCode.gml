global.max_health_level = 5;
global.health_level = global.max_health_level;
global.time_stopped = false;

global.key_count = 0;
global.locked_door_opened = false;

global.max_shake_count = 240;
global.shake_count = global.max_shake_count;

audio_stop_all();

global.hud_height = 40;

global.displayed_credits = false;


enum hit_types {
sword,
bomb,
arrow
}