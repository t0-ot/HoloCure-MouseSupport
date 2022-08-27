with (obj_Options)
{
    var opx = 0
    var opy = 0
    var uPrev = 0
    var i = 0
    opx = container[0]
    opy = container[1]
    if (!keybindMenu)
    {
        if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (opx - 120), opy, (opx + 120), (opy + 285))
        {
            if (mouse_wheel_down() && canControl && (!keybindMenu))
            {
                if (showOptionRange < 3 && currentOption < 7 && (currentOption + showOptionRange) < (maxOptions - 1))
                {
                    showOptionRange++
                    audio_play_sound(snd_menu_select, 30, false)
                }
            }
            else if mouse_wheel_up()
            {
                if (showOptionRange > 0 && currentOption < 7 && (currentOption + showOptionRange) < maxOptions)
                {
                    showOptionRange--
                    audio_play_sound(snd_menu_select, 30, false)
                }
            }
            repeat (7)
            {
                uPrev = currentOption
                opx = (container[0] + 12)
                opy = ((container[1] + 43) + (i * 34))
                if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (opx - 90), opy, (opx + 90), (opy + 30))
                {
                    currentOption = i
                    if (uPrev != currentOption)
                        audio_play_sound(snd_menu_select, 30, false)
                    opx = (container[0] + 81)
                    opy = ((container[1] + 56) + (i * 34))
                    if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (opx - 11), (opy - 11), (opx + 11), (opy + 11)) && mouse_check_button_released(mb_left))
                    {
                        switch (i + showOptionRange)
                        {
                            case (1 << 0):
                                global.fullscreen = (!global.fullscreen)
                                window_set_fullscreen(global.fullscreen)
                                break
                            case (4 << 0):
                                global.showDamageText = (!global.showDamageText)
                                break
                            case (5 << 0):
                                global.lightFX = (!global.lightFX)
                                break
                            case (6 << 0):
                                global.screenshake = (!global.screenshake)
                                break
                            case (9 << 0):
                                global.hiscorenames = (!global.hiscorenames)
                                break
                        }

                        audio_play_sound(snd_menu_confirm, 30, false)
                    }
                    switch (i + showOptionRange)
                    {
                        case (0 << 0):
                            var j = 0
                            repeat (2)
                            {
                                opx = ((container[0] + 90) - (j * 76))
                                opy = ((container[1] + 56) + (i * 34))
                                if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (opx - 3), (opy - 5), (opx + 3), (opy + 5)) && mouse_check_button_released(mb_left))
                                {
                                    if (j == 0 && selectedResolution < 3)
                                        selectedResolution++
                                    else if (j == 1 && selectedResolution > 0)
                                        selectedResolution--
                                    switch selectedResolution
                                    {
                                        case 0:
                                            scr_mouseOptionSetResolution(640, 360)
                                            break
                                        case 1:
                                            scr_mouseOptionSetResolution(1280, 720)
                                            break
                                        case 2:
                                            scr_mouseOptionSetResolution(1920, 1080)
                                            break
                                        case 3:
                                            scr_mouseOptionSetResolution(2560, 1440)
                                            break
                                    }

                                }
                                j++
                            }
                            global.Resolution = selectedResolution
                            break
                        case (8 << 0):
                            j = 0
                            repeat (2)
                            {
                                opx = ((container[0] + 90) - (j * 76))
                                opy = ((container[1] + 56) + (i * 34))
                                if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (opx - 3), (opy - 5), (opx + 3), (opy + 5)) && mouse_check_button_released(mb_left))
                                {
                                    if (j == 0)
                                    {
                                        if (selectedLanguageOption < 1)
                                            selectedLanguageOption++
                                        else
                                            selectedLanguageOption = 0
                                    }
                                    if (j == 1)
                                    {
                                        if (selectedLanguageOption > 0)
                                            selectedLanguageOption--
                                        else
                                            selectedLanguageOption = 1
                                    }
                                    scr_MouseOptionUneditable()
                                    audio_play_sound(snd_menu_confirm, 30, false)
                                }
                                j++
                            }
                            break
                        case (2 << 0):
                        case (3 << 0):
                            opx = (container[0] + 18)
                            opxalt = ((container[0] + 18) + 70)
                            opy = ((container[1] + 56) + (i * 34))
                            var mouseSelectedSlider = 0
                            if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (opx - 3), (opy - 6), (opxalt + 3), (opy + 6))
                            {
                                if mouse_check_button(mb_left)
                                    mouseSelectedSlider = (!mouseSelectedSlider)
                                j = 0
                                repeat (11)
                                {
                                    opx = ((container[0] + 18) + (j * 7))
                                    opy = ((container[1] + 56) + (i * 34))
                                    if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (opx - 3), (opy - 6), (opx + 3), (opy + 6))
                                    {
                                        if (!mouseSelectedSlider)
                                            return;
                                        if (i == 2)
                                        {
                                            if (j <= 11)
                                                global.musicVolume = (j * 0.1)
                                            audio_group_set_gain(1, global.musicVolume, 0)
                                        }
                                        if (i == 3)
                                        {
                                            if (j <= 11)
                                                global.soundVolume = (j * 0.1)
                                            audio_group_set_gain(2, global.soundVolume, 0)
                                        }
                                    }
                                    j++
                                }
                            }
                            break
                        case (7 << 0):
                            if mouse_check_button_released(mb_left)
                            {
                                keybindMenu = 1
                                prevMenu = [currentOption, showOptionRange]
                                currentOption = 0
                                showOptionRange = 0
                                audio_play_sound(snd_menu_confirm, 30, false)
                            }
                            break
                    }

                }
                i++
            }
            SaveSettings()
        }
    }
    else
    {
        repeat (7)
        {
            uPrev = currentOption
            opx = (container[0] + 12)
            opy = ((container[1] + 43) + (i * 34))
            if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (opx - 90), opy, (opx + 90), (opy + 30)) && (!remapping))
            {
                currentOption = i
                if (uPrev != currentOption)
                        audio_play_sound(snd_menu_select, 30, false)
                if (mouse_check_button_released(mb_left) && (!remapping))
                {
                    show_debug_message("set remapping")
                    remapping = 1
                    keyboard_string = ""
                    if (currentOption == 6)
                    {
                        setAll = 6
                        currentOption = 0
                        for (i = 0; i < 6; i++)
                            global.theButtons[i] = 0
                    }
                }
            }
            i++
        }
    }
}
