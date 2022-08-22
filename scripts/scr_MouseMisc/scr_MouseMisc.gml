if (room == rm_Intro || 3)
{
    if ((instance_exists(obj_Intro) && mouse_check_button_released(mb_left)) || (instance_exists(obj_Pre_Intro) && mouse_check_button_released(mb_left)))
        room_goto_next()
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
                    if mouse_check_button_released(mb_left)
                    {
                        switch currentOption
                        {
                            case 0:
                                global.CurrentLanguage = "eng"
                                langOption = 0
                                break
                            case 1:
                                global.CurrentLanguage = "jp"
                                langOption = 1
                                break
                        }

                        if instance_exists(getTextManager)
                        {
                            scr_MouseMiscUneditable()
                            initStep++
                            audio_play_sound(snd_menu_confirm, 30, false)
                            keyboard_string = ""
                            alarm[0] = 10
                        }
                    }
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
                    if mouse_check_button_released(mb_left)
                    {
                        switch currentOption
                        {
                            case 0:
                                global.hiscorenames = 1
                                hnShow = 0
                                break
                            case 1:
                                global.hiscorenames = 0
                                hnShow = 1
                                break
                        }

                        initStep++
                        currentOption = 0
                        audio_play_sound(snd_menu_confirm, 30, false)
                    }
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
                    if mouse_check_button_released(mb_left)
                    {
                        switch currentOption
                        {
                            case 0:
                                global.readyToStart = 1
                                SaveSettings()
                                break
                            case 1:
                                initStep = 0
                                nameOkay = 0
                                break
                        }

                        currentOption = 0
                        audio_play_sound(snd_menu_confirm, 30, false)
                    }
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
        if (point_in_rectangle(mouse_x, mouse_y, (ipx - 44), (ipy - 14), (ipx + 44), (ipy + 14)) && mouse_check_button_released(mb_left))
        {
            room_goto(global.playingStage)
            audio_play_sound(snd_menu_confirm, 30, false)
        }
    }
}
if (room == rm_UnlockRoom && instance_exists(obj_UnlockMenu))
{
    with (obj_UnlockMenu)
    {
        ipx = 320
        ipy = 250
        if (array_length(global.unlockedThings) > 0 && currentThing < array_length(global.unlockedThings))
        {
            if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (ipx - 44), (ipy - 14), (ipx + 44), (ipy + 14)) && mouse_check_button_released(mb_left) && canControl)
            {
                if (currentThing < array_length(global.unlockedThings))
                {
                    canControl = 0
                    alarm[0] = 20
                    itemContainer[0] = 800
                    audio_play_sound(snd_menu_confirm, 30, false)
                    switch global.unlockedThings[currentThing].optionType
                    {
                        case "Weapon":
                            array_push(ds_map_find_value(global.PlayerSave, "unlockedWeapons"), global.unlockedThings[currentThing].optionID)
                            gml_Script_SavePlayerSave()
                            break
                        case "Item":
                            array_push(ds_map_find_value(global.PlayerSave, "unlockedItems"), global.unlockedThings[currentThing].optionID)
                            gml_Script_SavePlayerSave()
                            break
                    }

                    if (currentThing < (array_length(global.unlockedThings) - 1))
                        audio_play_sound(snd_gacha_get, 50, false)
                    currentThing++
                }
                if (currentThing >= array_length(global.unlockedThings))
                {
                    global.unlockedNew = 0
                    global.unlockedThings = []
                    if (global.returningRoom > rm_HiScores)
                        room_goto(global.returningRoom)
                    else
                        room_goto(rm_Title)
                }
            }
        }
    }
}
