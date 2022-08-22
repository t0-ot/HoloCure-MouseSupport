with (obj_TitleScreen)
{
    var i = 0
    repeat (7)
    {
        var uPrev = currentOption
        var bx = 520
        var by = (110 + (i * 32))
        if point_in_rectangle(mouse_x, mouse_y, (bx - 75), (by - 13), (bx + 74), (by + 13))
        {
            currentOption = i
            scr_mouseHoverSound(uPrev, currentOption, snd_menu_select, 0)
            if (mouse_check_button_released(mb_left) && canControl)
            {
                switch currentOption
                {
                    case 0:
                        room_goto(rm_CharSelect)
                        break
                    case 1:
                        room_goto(rm_Shop)
                        break
                    case 2:
                        room_goto(rm_HiScores)
                        break
                    case 4:
                        instance_create_depth(x, y, (depth - 100), obj_Options)
                        canControl = 0
                        break
                    case 5:
                        instance_create_depth(x, y, (depth - 100), obj_Credits)
                        canControl = 0
                        break
                    case 6:
                        game_end()
                        break
                }

                global.lastTitleOption = currentOption
                audio_play_sound(snd_menu_confirm, 30, false)
            }
        }
        i++
    }
}
