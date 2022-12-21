if (room == rm_Intro || 3)
{
    if (instance_exists(obj_Intro) || instance_exists(obj_Pre_Intro))
    {
        if mouse_check_button_released(mb_left)
            room_goto_next()
    }
}
if (room == rm_InitRoom)
{
    with (obj_GameManager)
    {
        if (initStep == 0)
        {
            var i = 0
            repeat (2)
            {
                var uPrev = currentOption
                var ipx = 320
                var ipy = (156 + (i * 34))
                if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (ipx - 90), ipy, (ipx + 90), (ipy + 30))
                {
                    currentOption = i
                    scr_mouseHoverSound(uPrev, currentOption, snd_menu_select, 30)
                    scr_mouseToggle()
                }
                i++
            }
        }
        else if (initStep == 2)
        {
            i = 0
            repeat (2)
            {
                uPrev = currentOption
                ipx = 320
                ipy = (156 + (i * 34))
                if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (ipx - 90), ipy, (ipx + 90), (ipy + 30))
                {
                    currentOption = i
                    if (uPrev != currentOption)
                        audio_play_sound(snd_menu_select, 30, false)
                    scr_mouseToggle()
                }
                i++
            }
        }
        else if (initStep == 3)
        {
            i = 0
            repeat (2)
            {
                uPrev = currentOption
                ipx = 320
                ipy = (226 + (i * 34))
                if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (ipx - 90), ipy, (ipx + 90), (ipy + 30))
                {
                    currentOption = i
                    if (uPrev != currentOption)
                        audio_play_sound(snd_menu_select, 30, false)
                    scr_mouseToggle()
                }
                i++
            }
        }
    }
}
if (room == rm_Tutorial)
{
    with (obj_Tutorial)
    {
        ipx = 320
        ipy = 300
        if point_in_rectangle(mouse_x, mouse_y, (ipx - 44), (ipy - 14), (ipx + 44), (ipy + 14))
            scr_mouseToggle()
    }
}
if (room == rm_UnlockRoom && instance_exists(obj_UnlockMenu))
{
    with (obj_UnlockMenu)
    {
        ipx = 320
        ipy = 256
        if (array_length(global.unlockedThings) > 0 && currentThing < array_length(global.unlockedThings))
        {
            if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (ipx - 44), (ipy - 14), (ipx + 44), (ipy + 14)) && canControl)
                scr_mouseToggle()
        }
    }
}
