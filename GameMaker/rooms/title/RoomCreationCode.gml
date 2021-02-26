global.max_health_level = 5;
global.health_level = global.max_health_level;
global.time_stopped = false;

global.key_count = 0;
global.locked_door_opened = false;

global.snake_key_count = 0;
global.locked_snake_door_opened = false;

global.centipede_key_count = 0;
global.locked_centipede_door_opened = false;

global.bombs_enabled = false;
global.bow_and_arrow_enabled = false;

global.max_shake_count = 240;
global.shake_count = global.max_shake_count;

audio_stop_all();

global.hud_height = 40;

global.displayed_credits = false;

global.door_goto_id = -1;

global.covered_stairs_bombed = false;

global.water_drained = false;

enum hit_types {
sword,
bomb,
arrow
}

global.paused = false;