global.max_health_level = 5;
global.health_level = global.max_health_level;
global.key_count = 0;
global.time_stopped = false;

global.max_shake_count = 240;
global.shake_count = global.max_shake_count;

audio_stop_all();

window_set_caption("Chronos Time Warp");
window_set_cursor(cr_none);
window_set_size(768, 672);

global.hud_height = 40;