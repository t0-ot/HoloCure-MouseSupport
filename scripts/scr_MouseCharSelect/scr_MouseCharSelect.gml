with (obj_CharSelect)
{
    var cx = 0
    var cy = 0
    var uPrev = 0
    if (global.charSelected == self)
    {
        var i = 0
        repeat (25)
        {
            uPrev = selectedCharacter
            cx = (224 + ((i % 5) * 48))
            cy = (94 + (floor((i / 5)) * 55))
            if (point_in_rectangle(mouse_x, mouse_y, (cx - 21), (cy - 19), (cx + 21), (cy + 19)) && characterInfo[i] != ds_map_find_value(global.characterData, "none"))
            {
                selectedCharacter = i
                scr_mouseHoverSound(uPrev, selectedCharacter, snd_charSelectWoosh, 0)
                if mouse_check_button_released(mb_left)
                {
                    if (selectedCharacter == 22)
                        selectedCharacter = randomSelect
                    if (characterInfo[selectedCharacter] != ds_map_find_value(global.characterData, "empty"))
                    {
                        global.charSelected = characterInfo[selectedCharacter]
                        audio_play_sound(snd_charSelected, 0, false)
                        modeOption = global.playingMode
                        availableOutfits = ["default"]
                        outfitSelect = 0
                        if variable_struct_exists(global.charSelected, "outfits")
                        {
                            var outfitsCheck = variable_struct_get_names(global.charSelected.outfits)
                            availableOutfits = ["default"]
                            for (a = 0; a < array_length(outfitsCheck); a++)
                            {
                                if array_exists(ds_map_find_value(global.PlayerSave, "unlockedOutfits"), outfitsCheck[a])
                                    array_push(availableOutfits, variable_struct_get(global.charSelected.outfits, outfitsCheck[a]).outfitID)
                            }
                            if (array_length(availableOutfits) > 1)
                                choseOutfit = 0
                        }
                    }
                }
            }
            i++
        }
    }
    else if (global.charSelected != self && (!choseOutfit))
    {
        cx = 320
        cy = (modecontainer[1] + 60)
        if (point_in_rectangle(mouse_x, mouse_y, (cx - 102), (cy - 27), (cx - 86), (cy + 27)) && mouse_check_button_released(mb_left))
        {
            if (outfitSelect == 0)
                outfitSelect = (array_length(availableOutfits) - 1)
            else
                outfitSelect--
            audio_play_sound(snd_charSelectWoosh, 0, false)
        }
        if (point_in_rectangle(mouse_x, mouse_y, (cx + 85), (cy - 27), (cx + 101), (cy + 27)) && mouse_check_button_released(mb_left))
        {
            if (outfitSelect == (array_length(availableOutfits) - 1))
                outfitSelect = 0
            else
                outfitSelect++
            audio_play_sound(snd_charSelectWoosh, 0, false)
        }
        if (point_in_rectangle(mouse_x, mouse_y, (cx - 40), (cy - 34), (cx + 30), (cy + 27)) && mouse_check_button_released(mb_left))
        {
            global.outfitSelected = availableOutfits[outfitSelect]
            choseOutfit = 1
            audio_play_sound(snd_charSelected, 0, false)
        }
    }
    else if (choseOutfit && global.gameMode == -1)
    {
        uPrev = modeOption
        i = 0
        repeat (2)
        {
            cx = modecontainer[0]
            cy = (modecontainer[1] + (i * 80))
            if point_in_rectangle(mouse_x, mouse_y, cx, cy, (cx + 243), (cy + 68))
            {
                modeOption = i
                global.playingMode = 0
                scr_mouseHoverSound(uPrev, modeOption, snd_menu_select, 0)
                if mouse_check_button_released(mb_left)
                {
                    uPrev = global.gameMode
                    global.gameMode = i
                    scr_mouseHoverSound(uPrev, global.gameMode, snd_charSelected, 0)
                }
            }
            i++
        }
    }
    else if (global.playingStage == -1)
    {
        cx = 320
        cy = (modecontainer[1] + 45)
        if (point_in_rectangle(mouse_x, mouse_y, (cx - 102), (cy - 27), (cx - 86), (cy + 27)) && mouse_check_button_released(mb_left))
        {
            if (array_length(availableStages) > 1)
            {
                if (selectedStage == 0)
                {
                    selectedStage = (array_length(availableStages) - 1)
                    audio_play_sound(snd_charSelectWoosh, 0, false)
                }
                else
                {
                    selectedStage--
                    audio_play_sound(snd_charSelectWoosh, 0, false)
                }
            }
        }
        if (point_in_rectangle(mouse_x, mouse_y, (cx + 85), (cy - 27), (cx + 101), (cy + 27)) && mouse_check_button_released(mb_left))
        {
            if (array_length(availableStages) > 1)
            {
                if (selectedStage == (array_length(availableStages) - 1))
                {
                    selectedStage = 0
                    audio_play_sound(snd_charSelectWoosh, 0, false)
                }
                else
                {
                    selectedStage++
                    audio_play_sound(snd_charSelectWoosh, 0, false)
                }
            }
        }
        if (point_in_rectangle(mouse_x, mouse_y, 245, 120, 394, 209) && mouse_check_button_released(mb_left))
        {
            if (array_exists(ds_map_find_value(global.PlayerSave, "unlockedStages"), availableStages[selectedStage][2]) || global.debug)
            {
                global.playingStage = availableStages[selectedStage][0]
                audio_play_sound(snd_charSelected, 0, false)
                readyToGo = 1
            }
        }
    }
    else if readyToGo
    {
        cx = 320
        cy = 280
        if (point_in_rectangle(mouse_x, mouse_y, (cx - 44), (cy - 14), (cx + 44), (cy + 14)) && mouse_check_button_released(mb_left))
        {
            audio_play_sound(snd_charSelected, 0, false)
            if global.firstTime
                room_goto(rm_Tutorial)
            else
                room_goto(global.playingStage)
        }
    }
}
