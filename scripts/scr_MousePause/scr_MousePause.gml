with (obj_PlayerManager)
{
    var uPrev = 0
    var bmx = 0
    var bmy = 0
    var playerMan = 0
    if canControl
    {
        if (paused && (!leveled) && (!gotBox) && (!perksMenu) && (!collabsMenu) && (!gotAnvil) && (!gotGoldenAnvil) && (!gameOvered) && (!gameWon) && (!reviving) && (!quitConfirm) && canControl)
        {
            var i = 0
            repeat (5)
            {
                uPrev = pauseOption
                bmy = ((pauseContainer[1] + 62) + (i * 30))
                if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (pauseContainer[0] - 44), (bmy - 14), (pauseContainer[0] + 44), (bmy + 14))
                {
                    pauseOption = i
                    if (uPrev != pauseOption && (!instance_exists(obj_Options)))
                        audio_play_sound(snd_menu_select, 30, false)
                    scr_mouseToggle()
                }
                i++
            }
        }
        if (paused && quitConfirm)
        {
            i = 0
            repeat (2)
            {
                uPrev = quitOption
                bmx = pauseContainer[0]
                bmy = (((pauseContainer[1] + 30) + 62) + (i * 30))
                if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 44), (bmy - 14), (bmx + 44), (bmy + 14))
                {
                    quitOption = i
                    if (uPrev != quitOption)
                        audio_play_sound(snd_menu_select, 30, false)
                    scr_mouseToggle()
                }
                i++
            }
        }
        if (paused && leveled && controlsFree)
        {
            i = 0
            repeat (4)
            {
                uPrev = levelOptionSelect
                bmy = (rightcontainer[1] + (i * 69))
                if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), rightcontainer[0], bmy, (rightcontainer[0] + 386), (bmy + 68))
                {
                    textPage = 0
                    levelOptionSelect = i
                    scr_mouseHoverSound(uPrev, levelOptionSelect, snd_menu_select, 30)
                    scr_mouseToggle()
                }
                i++
            }
            if (ds_map_find_value(global.PlayerSave, "reroll") > 0)
            {
                uPrev = levelOptionSelect
                bmx = (rightcontainer[0] + 130)
                bmy = (rightcontainer[1] + 279)
                if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 55), bmy, (bmx + 55), (bmy + 26))
                {
                    levelOptionSelect = 4
                    scr_mouseHoverSound(uPrev, levelOptionSelect, snd_menu_select, 30)
                    scr_mouseToggle()
                }
            }
        }
        if (paused && gotBox)
        {
            if (boxAnimState == 0 || boxAnimState == 1)
            {
                if (boxAnimState == 0)
                {
                    bmx = (itemBoxContainer[0] + 100)
                    bmy = (itemBoxContainer[1] + 262)
                    if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 44), (bmy - 14), (bmx + 44), (bmy + 14))
                        scr_mouseToggle()
                }
                else
                    scr_mouseToggle()
            }
            else if boxOpenned
            {
                var j = 0
                repeat (2)
                {
                    bmx = (itemBoxContainer[0] + 300)
                    bmy = (itemBoxContainer[1] + (100 + (j * 35)))
                    uPrev = itemBoxTakeOption
                    if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 44), (bmy - 14), (bmx + 44), (bmy + 14))
                    {
                        itemBoxTakeOption = j
                        scr_mouseHoverSound(uPrev, itemBoxTakeOption, snd_menu_select, 30)
                        scr_mouseToggle()
                    }
                    j++
                }
            }
        }
        if ((gameOvered && gameOverTime >= 330 && canControl) || (gameWon && gameOverTime >= 120 && canControl))
        {
            var currentGameMode = (global.gameMode + 3)
            i = 0
            repeat currentGameMode
            {
                bmx = 320
                if gameOvered
                    bmy = (186 + (i * 34))
                else
                    bmy = (176 + (i * 34))
                uPrev = pauseOption
                if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 90), bmy, (bmx + 90), (bmy + 30))
                {
                    pauseOption = i
                    scr_mouseHoverSound(uPrev, pauseOption, snd_menu_select, 30)
                    scr_mouseToggle()
                }
                i++
            }
        }
        if (paused && gotAnvil)
        {
            if (!anvilOptionSelected)
            {
                i = 0
                repeat (2)
                {
                    j = 0
                    repeat (6)
                    {
                        uPrev = anvilOption
                        bmx = ((anvilContainer[0] + 81) + (j * 45))
                        bmy = (anvilContainer[1] + ((i * 50) + 30))
                        if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 16), (bmy - 16), (bmx + 16), (bmy + 16))
                        {
                            anvilOption = ((i * 6) + j)
                            scr_mouseHoverSound(uPrev, anvilOption, snd_menu_select, 30)
                            scr_mouseToggle()
                        }
                        j++
                    }
                    i++
                }
            }
            else if anvilOptionSelected
            {
                bmx = (anvilContainer[0] + 192)
                bmy = (anvilContainer[1] + 210)
                if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 90), bmy, (bmx + 90), (bmy + 30))
                    scr_mouseToggle()
                if (enhancing && enhanceDone)
                {
                    bmx = 320
                    bmy = 240
                    if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 44), (bmy - 14), (bmx + 44), (bmy + 14))
                        scr_mouseToggle()
                }
            }
        }
        if (paused && gotGoldenAnvil)
        {
            if (loadOutList[anvilOption] != -1)
            {
                i = 0
                repeat (5)
                {
                    uPrev = anvilOption
                    bmx = ((anvilContainer[0] + 101) + (i * 45))
                    bmy = (anvilContainer[1] + 30)
                    if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 16), (bmy - 16), (bmx + 16), (bmy + 16)) && (!goldenOptionSelected))
                    {
                        anvilOption = i
                        scr_mouseHoverSound(uPrev, anvilOption, snd_menu_select, 30)
                        scr_mouseToggle()
                    }
                    i++
                }
            }
            if (goldenAnvilOptionSelected1 != -1 && goldenAnvilOptionSelected2 != -1 && goldenOptionSelected)
            {
                bmx = (anvilContainer[0] + 192)
                bmy = (anvilContainer[1] + 160)
                if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 90), bmy, (bmx + 90), (bmy + 30)) && (!collabing))
                    scr_mouseToggle()
                bmx = 320
                bmy = 240
                if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 44), (bmy - 14), (bmx + 44), (bmy + 14)) && collabDone)
                    scr_mouseToggle()
            }
        }
        if (paused && reviving)
        {
            bmx = 320
            bmy = 240
            if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 44), (bmy - 14), (bmx + 44), (bmy + 14))
                scr_mouseToggle()
        }
    }
}
