with (obj_CharSelect)
{
    var cx = 0
    var cy = 0
    var uPrev = 0
    if (global.charSelected == -1)
    {
        var i = 0
        repeat (11)
        {
            uPrev = selectedCharacter
            cx = (224 + ((i % 5) * 48))
            cy = (94 + (floor((i / 5)) * 55))
            if point_in_rectangle(mouse_x, mouse_y, (cx - 21), (cy - 19), (cx + 21), (cy + 19))
            {
                selectedCharacter = i
                scr_mouseHoverSound(uPrev, selectedCharacter, snd_charSelectWoosh, 0)
                if mouse_check_button_released(mb_left)
                {
                    if (characterInfo[selectedCharacter] != ds_map_find_value(global.characterData, "empty"))
                    {
                        global.charSelected = characterInfo[selectedCharacter]
                        audio_play_sound(snd_charSelected, 0, false)
                        modeOption = global.playingMode
                    }
                }
            }
            i++
        }
    }
    else
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
                if mouse_check_button_pressed(mb_left)
                {
                    uPrev = global.gameMode
                    global.gameMode = i
                    if (global.gameMode > -1)
                    {
                        if global.debug
                            room_goto(Room1_debug)
                        else
                        {
                            global.playingStage = Room1
                            if global.firstTime
                                room_goto(rm_Tutorial)
                            else
                                room_goto(global.playingStage)
                        }
                    }
                    scr_mouseHoverSound(uPrev, global.gameMode, snd_charSelected, 0)
                }
            }
            i++
        }
    }
}
