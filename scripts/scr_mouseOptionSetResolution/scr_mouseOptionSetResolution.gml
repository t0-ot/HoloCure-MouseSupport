global.screen_resolution_x = argument0
global.screen_resolution_y = argument1
window_set_size(global.screen_resolution_x, global.screen_resolution_y)
surface_resize(application_surface, global.screen_resolution_x, global.screen_resolution_y)
audio_play_sound(snd_menu_confirm, 30, false)
