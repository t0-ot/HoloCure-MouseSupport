with (obj_PlayerManager)
{
    var uPrev = 0
    var bmx = 0
    var bmy = 0
    if ((!leveled) && (!gotBox) && (!perksMenu) && (!collabsMenu) && (!gotAnvil) && (!gotGoldenAnvil) && (!gameOvered) && (!gameWon) && canControl)
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
                if (mouse_check_button_released(mb_left) && pauseCurrentMenu == 0)
                {
                    switch pauseOption
                    {
                        case 0:
                            perksMenu = 1
                            break
                        case 1:
                            if (array_length(global.seenCollabs) > 0)
                            {
                                collabsMenu = 1
                                collabsStartingIndex = 0
                            }
                            break
                        case 2:
                            paused = 0
                            room_goto(global.playingStage)
                            alarm[9] = 1
                            audio_group_set_gain(1, global.musicVolume, 500)
                            break
                        case 3:
                            pauseCurrentMenu = -1
                            var optionsMan = instance_create_depth(x, y, depth, obj_Options)
                            optionsMan.playerMan = id
                            break
                        case 4:
                            global.resetLevel = 1
                            room_goto(rm_Title)
                            instance_destroy()
                            audio_group_set_gain(1, global.musicVolume, 500)
                            audio_stop_sound(global.bgmPlay)
                            break
                    }

                    audio_play_sound(snd_menu_confirm, 30, false)
                    canControl = 0
                    alarm[1] = 5
                }
            }
            i++
        }
    }
    if (paused && leveled && (!gameOvered) && (!gameWon) && canControl)
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
                if (mouse_check_button_released(mb_left) && levelOptionSelect < 4)
                {
                    leveled = 0
                    paused = 0
                    textPage = 0
                    sprite_delete(paused_screen_sprite)
                    room_goto(global.playingStage)
                    alarm[9] = 1
                    scr_MouseParseAndPush(options[levelOptionSelect])
                    alarm[9] = 1
                    audio_play_sound(snd_menu_confirm, 30, false)
                    audio_group_set_gain(1, global.musicVolume, 500)
                }
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
                if (mouse_check_button_released(mb_left) && global.rerollTimes > 0)
                {
                    textPage = 0
                    sprite_delete(paused_screen_sprite)
                    room_goto(global.playingStage)
                    alarm[9] = 1
                    rightcontainer[0] = 740
                    audio_play_sound(snd_reroll, 10, false)
                    alarm[11] = 2
                    controlsFree = 0
                    alarm[10] = 20
                    global.rerollTimes--
                }
            }
        }
    }
    if (paused && gotBox && canControl && (!gameOvered) && (!gameWon) && canControl)
    {
        if (boxAnimState == 0)
        {
            bmx = (itemBoxContainer[0] + 100)
            bmy = (itemBoxContainer[1] + 262)
            if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 44), (bmy - 14), (bmx + 44), (bmy + 14)) && mouse_check_button_released(mb_left))
            {
                audio_group_set_gain(1, global.musicVolume, 10)
                switch boxItemAmount
                {
                    case 1:
                        audio_play_sound(bgm_chestopen1, 50, false)
                        break
                    case 3:
                        audio_play_sound(bgm_chestopen2, 50, false)
                        break
                }

                image_index = 0
                boxAnimState = 1
                boxBounceTime = 0
            }
        }
        else if (boxAnimState == 1 && mouse_check_button_released(mb_left))
        {
            if (boxItemAmount == 1)
            {
                audio_stop_sound(bgm_chestopen1)
                audio_play_sound(bgm_chestopen1_short, 50, false)
                var skippedTime = (301 - boxBounceTime)
                var skippedCoins = (skippedTime div boxCoinRate)
                boxCoinGain += skippedCoins
            }
            else if (boxItemAmount == 3)
            {
                audio_stop_sound(bgm_chestopen2)
                audio_play_sound(bgm_chestopen2_short, 50, false)
                skippedTime = (399 - boxBounceTime)
                skippedCoins = (skippedTime div boxCoinRate)
                boxCoinGain += skippedCoins
            }
            boxAnimState = 2
            image_index = 0
            boxBounceTime = 0
            boxOpenTime = 0
        }
        if boxOpenned
        {
            i = 0
            repeat (2)
            {
                bmx = (itemBoxContainer[0] + 300)
                bmy = (itemBoxContainer[1] + (100 + (i * 35)))
                uPrev = itemBoxTakeOption
                if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 44), (bmy - 14), (bmx + 44), (bmy + 14))
                {
                    itemBoxTakeOption = i
                    scr_mouseHoverSound(uPrev, itemBoxTakeOption, snd_menu_select, 30)
                    if mouse_check_button_released(mb_left)
                    {
                        audio_play_sound(snd_menu_confirm, 30, false)
                        if (itemBoxTakeOption == 0)
                            array_push(listOfWeaponsToPush, randomWeapon[currentBoxItem])
                        if (currentBoxItem < boxItemAmount)
                            currentBoxItem++
                        if (boxItemAmount == 1 || currentBoxItem == boxItemAmount)
                        {
                            paused = 0
                            room_goto(global.playingStage)
                            alarm[9] = 1
                            gotBox = 0
                            global.currentRunMoneyGained += floor(boxCoinGain)
                            for (var j = 0; j < array_length(listOfWeaponsToPush); j++)
                            {
                                scr_MouseParseAndPush(listOfWeaponsToPush[j])
                                alarm[9] = 1
                            }
                            if (global.bgmPlay > snd_summonShark2)
                            {
                                audio_resume_sound(global.bgmPlay)
                                audio_group_set_gain(1, global.musicVolume, 500)
                            }
                        }
                    }
                }
                i++
            }
        }
    }
    if (paused && gotAnvil && canControl)
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
                if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 16), (bmy - 16), (bmx + 16), (bmy + 16)) && (!anvilOptionSelected))
                {
                    anvilOption = ((i * 6) + j)
                    scr_mouseHoverSound(uPrev, anvilOption, snd_menu_select, 30)
                    if (mouse_check_button_released(mb_left) && loadOutList[anvilOption] != self && validLevelOptions[anvilOption])
                    {
                        anvilOptionSelected = 1
                        audio_play_sound(snd_menu_confirm, 30, false)
                    }
                }
                j++
            }
            i++
        }
        if anvilOptionSelected
        {
            bmx = (anvilContainer[0] + 192)
            bmy = (anvilContainer[1] + 210)
            if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 90), bmy, (bmx + 90), (bmy + 30)) && mouse_check_button_released(mb_left))
            {
                if ((!enhancing) && loadOutList[anvilOption].level == loadOutList[anvilOption].maxLevel)
                {
                    if (global.currentRunMoneyGained >= floor((((global.enhanceCostMultiplier * loadOutList[anvilOption].enhancements) * 50) * loadOutList[anvilOption].level) == loadOutList[anvilOption].maxLevel))
                    {
                        enhancing = 1
                        enhancingTime = 0
                        audio_play_sound(snd_charging, 30, false)
                        global.currentRunMoneyGained -= floor((((global.enhanceCostMultiplier * loadOutList[anvilOption].enhancements) * 50) * loadOutList[anvilOption].level) == loadOutList[anvilOption].maxLevel)
                    }
                }
                else if (!enhancing)
                {
                    paused = 0
                    gotAnvil = 0
                    usedAnvil = 1
                    room_goto(global.playingStage)
                    alarm[9] = 1
                    if (!enhancing)
                        audio_play_sound(snd_anvil, 30, false)
                    if (!enhancing)
                    {
                        audio_play_sound(snd_menu_confirm, 30, false)
                        scr_MouseParseAndPush(loadOutList[anvilOption])
                        alarm[9] = 1
                    }
                    if (global.bgmPlay > 0)
                        audio_group_set_gain(1, global.musicVolume, 500)
                }
            }
            if (enhancing && enhanceDone)
            {
                bmx = 320
                bmy = 240
                if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 44), (bmy - 14), (bmx + 44), (bmy + 14)) && mouse_check_button_released(mb_left))
                {
                    paused = 0
                    gotAnvil = 0
                    usedAnvil = 1
                    room_goto(global.playingStage)
                    alarm[9] = 1
                    if (!enhancing)
                        audio_play_sound(snd_anvil, 30, false)
                    if (enhancing && enhanceDone && enhanceResult)
                    {
                        audio_play_sound(snd_menu_confirm, 30, false)
                        scr_MouseParseAndPush(loadOutList[anvilOption])
                        alarm[9] = 1
                    }
                    if (global.bgmPlay > 0)
                        audio_group_set_gain(1, global.musicVolume, 500)
                }
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
                if mouse_check_button_released(mb_left)
                {
                    switch pauseOption
                    {
                        case 0:
                            if (global.unlockedNew && array_length(global.unlockedThings) > 0)
                            {
                                global.returningRoom = global.playingStage
                                global.resetLevel = 1
                                room_goto(rm_UnlockRoom)
                            }
                            else
                            {
                                room_goto(global.playingStage)
                                global.resetLevel = 1
                            }
                            instance_destroy()
                            break
                        case 1:
                            if (global.unlockedNew && array_length(global.unlockedThings) > 0)
                            {
                                global.returningRoom = 6
                                global.resetLevel = 1
                                room_goto(rm_UnlockRoom)
                            }
                            else
                            {
                                global.resetLevel = 1
                                room_goto(rm_CharSelect)
                            }
                            instance_destroy()
                            break
                        case 2:
                            if (global.unlockedNew && array_length(global.unlockedThings) > 0)
                            {
                                global.returningRoom = 11
                                global.resetLevel = 1
                                room_goto(rm_UnlockRoom)
                            }
                            else
                            {
                                global.resetLevel = 1
                                room_goto(rm_Title)
                            }
                            instance_destroy()
                            break
                        case 3:
                            if (!submitScoreError)
                            {
                                global.resetLevel = 1
                                var hiscore = instance_create_depth(x, y, depth, obj_HiScores)
                                canControl = 0
                                with (obj_HiScores)
                                {
                                    if is_undefined(ds_map_find_value(request_ids_, (0 << 0)))
                                        event_user((0 << 0))
                                }
                                alarm[4] = 300
                            }
                            break
                    }

                    audio_play_sound(snd_menu_confirm, 30, false)
                }
            }
            i++
        }
    }
    if (paused && gotGoldenAnvil && canControl)
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
                    if (mouse_check_button_released(mb_left) && validLevelOptions[anvilOption] && (!goldenOptionSelected))
                    {
                        if (goldenAnvilOptionSelected1 < 0)
                        {
                            goldenAnvilOptionSelected1 = loadOutList[anvilOption]
                            audio_play_sound(snd_menu_confirm, 30, false)
                        }
                        else if (goldenAnvilOptionSelected2 < 0 && validLevelOptions[anvilOption] != goldenAnvilOptionSelected1)
                        {
                            goldenAnvilOptionSelected2 = loadOutList[anvilOption]
                            audio_play_sound(snd_menu_confirm, 30, false)
                        }
                    }
                }
                i++
            }
        }
        if (goldenAnvilOptionSelected1 != -1 && goldenAnvilOptionSelected2 != -1 && goldenOptionSelected)
        {
            bmx = (anvilContainer[0] + 192)
            bmy = (anvilContainer[1] + 160)
            if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 90), bmy, (bmx + 90), (bmy + 30)) && mouse_check_button_released(mb_left) && (!collabing))
            {
                collabing = 1
                collabingTime = 0
                audio_play_sound(snd_charging, 30, false)
            }
            bmx = 320
            bmy = 240
            if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (bmx - 44), (bmy - 14), (bmx + 44), (bmy + 14)) && collabDone && mouse_check_button_released(mb_left))
            {
                paused = 0
                gotGoldenAnvil = 0
                global.goldAnvilCanDrop = 0
                usedAnvil = 1
                room_goto(global.playingStage)
                alarm[9] = 1
                audio_play_sound(snd_menu_confirm, 30, false)
                scr_MouseParseAndPush(collabingWeapon)
                alarm[9] = 1
                var alreadySeen = 0
                i = 0
                scr_mousePauseUneditable(alreadySeen, i)
                if (!alreadySeen)
                {
                    array_push(global.seenCollabs, collabingWeapon)
                    array_push(ds_map_find_value(global.PlayerSave, "seenCollabs"), collabingWeapon.attackId)
                    gml_Script_SavePlayerSave()
                }
                if (global.bgmPlay > 0)
                    audio_group_set_gain(1, global.musicVolume, 500)
            }
        }
    }
}
