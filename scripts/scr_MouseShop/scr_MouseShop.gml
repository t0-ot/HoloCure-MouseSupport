with (obj_Shop)
{
    var uSX = 0
    var uSY = 0
    var uPrev = 0
    switch shopMode
    {
        case -1:
            var i = 0
            repeat (4)
            {
                uPrev = currentOption
                uSX = 450
                uSY = (155 + (i * 32))
                if point_in_rectangle(mouse_x, mouse_y, (uSX - 75), (uSY - 13), (uSX + 75), (uSY + 13))
                {
                    currentOption = i
                    scr_mouseHoverSound(uPrev, currentOption, snd_menu_select, 30)
                    if (mouse_check_button_released(mb_left) && canControl)
                    {
                        if (currentOption < 3)
                            shopMode = currentOption
                        else
                            room_goto(rm_Title)
                        audio_play_sound(snd_menu_confirm, 30, false)
                    }
                }
                i++
            }
            break
        case 0:
            var gachaItemsArray = array_length(gachaItems)
            if ((!gachaing) && (!itemSelected))
            {
                if (point_in_rectangle(mouse_x, mouse_y, 250, 109, 275, 196) && mouse_check_button_released(mb_left))
                {
                    if (gachaGroupOption == 0)
                    {
                        gachaGroupOption = (gachaItemsArray - 1)
                        audio_play_sound(snd_menu_select, 30, false)
                    }
                    else if (gachaGroupOption > 0)
                    {
                        gachaGroupOption--
                        audio_play_sound(snd_menu_select, 30, false)
                    }
                }
                if (point_in_rectangle(mouse_x, mouse_y, 602, 109, 627, 196) && mouse_check_button_released(mb_left))
                {
                    if (gachaGroupOption < (gachaItemsArray - 1))
                    {
                        gachaGroupOption++
                        audio_play_sound(snd_menu_select, 30, false)
                    }
                    else if (gachaGroupOption == (gachaItemsArray - 1))
                    {
                        gachaGroupOption = 0
                        audio_play_sound(snd_menu_select, 30, false)
                    }
                }
            }
            if ((!itemSelected) && point_in_rectangle(mouse_x, mouse_y, 280, 95, 595, 225) && mouse_check_button_pressed(mb_left) && gachaGroupOption != 2)
            {
                itemSelected = 1
                gachaing = 0
                gachaConfirm = 0
                buyingOption = 0
                audio_play_sound(snd_menu_confirm, 30, false)
            }
            if itemSelected
            {
                uSX = 440
                uSY = 330
                if (point_in_rectangle(mouse_x, mouse_y, (uSX - 44), (uSY - 14), (uSX + 44), (uSY + 14)) && mouse_check_button_released(mb_left) && buyingOption == 0 && (!gachaConfirm) && (!gachaing) && (!readyToDebut) && ds_map_find_value(global.PlayerSave, "holoCoins") >= 1000)
                {
                    whiteFlash = 0
                    flashTime = 0
                    gachaing = 1
                    gachatime = 0
                    gachaCompleted = 0
                    var roll = irandom((array_length(gachaItems[gachaGroupOption].gachaCharacters) - 1))
                    ds_map_set(global.PlayerSave, "holoCoins", (ds_map_find_value(global.PlayerSave, "holoCoins") - 1000))
                    gachaCharacterGot = gachaItems[gachaGroupOption].gachaCharacters[roll]
                    for (i = 0; i < array_length(ds_map_find_value(global.PlayerSave, "characters")); i++)
                    {
                        if (array_get(array_get(ds_map_find_value(global.PlayerSave, "characters"), i), 0) == gachaCharacterGot)
                        {
                            gachaConfirm = 1
                            array_set_post(array_get(ds_map_find_value(global.PlayerSave, "characters"), i), 1, (array_get(array_get(ds_map_find_value(global.PlayerSave, "characters"), i), 1) + 1))
                            if (array_get(array_get(ds_map_find_value(global.PlayerSave, "characters"), i), 1) == 1)
                                gachaResult = 0
                            else
                                gachaResult = 1
                        }
                    }
                    gml_Script_SavePlayerSave()
                }
            }
            if gachaConfirm
            {
                uSX = 320
                uSY = 300
                if (point_in_rectangle(mouse_x, mouse_y, (uSX - 44), (uSY - 14), (uSX + 44), (uSY + 14)) && mouse_check_button_released(mb_left))
                {
                    gachaConfirm = 0
                    readyToDebut = 1
                }
            }
            if (gachaCompleted && mouse_check_button_released(mb_left))
            {
                gachaing = 0
                readyToDebut = 0
                gachaCompleted = 0
                audio_play_sound(snd_menu_confirm, 30, false)
                with (obj_idollights)
                    instance_destroy()
                itemSelected = 0
                gachaResult = -1
            }
            break
        case 1:
            if itemSelected
            {
                for (var a = 0; a < 2; a++)
                {
                    uPrev = buyingOption
                    uSX = (390 + (a * 90))
                    uSY = 330
                    if point_in_rectangle(mouse_x, mouse_y, (uSX - 44), (uSY - 14), (uSX + 44), (uSY + 14))
                    {
                        buyingOption = a
                        scr_mouseHoverSound(uPrev, buyingOption, snd_menu_select, 30)
                        if mouse_check_button_pressed(mb_left)
                        {
                            if (buyingOption == 0 && ds_map_find_value(global.PlayerSave, shopItems[shopOption].optionID) < array_length(shopItems[shopOption].cost))
                            {
                                var theCost = array_get(shopItems[shopOption].cost, ds_map_find_value(global.PlayerSave, shopItems[shopOption].optionID))
                                if (ds_map_find_value(global.PlayerSave, "holoCoins") >= theCost)
                                {
                                    if (shopItems[shopOption].optionID != "refund")
                                    {
                                        ds_map_set_post(global.PlayerSave, shopItems[shopOption].optionID, (ds_map_find_value(global.PlayerSave, shopItems[shopOption].optionID) + 1))
                                        ds_map_set(global.PlayerSave, "holoCoins", (ds_map_find_value(global.PlayerSave, "holoCoins") - theCost))
                                    }
                                    else
                                    {
                                        var total = 0
                                        for (c = 0; c < array_length(shopItems); c++)
                                        {
                                            if (!(is_undefined(ds_map_find_value(global.PlayerSave, shopItems[c].optionID))))
                                            {
                                                for (d = 0; d < array_length(shopItems[c].cost); d++)
                                                {
                                                    if (ds_map_find_value(global.PlayerSave, shopItems[c].optionID) > d)
                                                    {
                                                        var itemLevelCost = shopItems[c].cost[d]
                                                        total += itemLevelCost
                                                    }
                                                }
                                                ds_map_set(global.PlayerSave, shopItems[c].optionID, 0)
                                            }
                                        }
                                        show_debug_message(total)
                                        ds_map_set(global.PlayerSave, "holoCoins", (ds_map_find_value(global.PlayerSave, "holoCoins") + total))
                                    }
                                    gml_Script_SavePlayerSave()
                                    audio_play_sound(snd_shopBuy, 30, false)
                                    itemSelected = 0
                                }
                            }
                            else if (buyingOption == 1 && ds_map_find_value(global.PlayerSave, shopItems[shopOption].optionID) > 0)
                            {
                                var totalRefund = 0
                                for (i = 0; i < ds_map_find_value(global.PlayerSave, shopItems[shopOption].optionID); i++)
                                    totalRefund += shopItems[shopOption].cost[i]
                                ds_map_set(global.PlayerSave, shopItems[shopOption].optionID, 0)
                                ds_map_set(global.PlayerSave, "holoCoins", (ds_map_find_value(global.PlayerSave, "holoCoins") + totalRefund))
                                gml_Script_SavePlayerSave()
                                itemSelected = 0
                            }
                        }
                    }
                }
            }
            for (i = 0; i < 3; i++)
            {
                for (j = 0; j < 7; j++)
                {
                    if (((i * 7) + j) < array_length(shopItems) && shopItems[((i * 7) + j)] != undefined)
                    {
                        uPrev = shopOption
                        uSX = (299 + (j * 47))
                        uSY = (80 + (i * 58))
                        if (point_in_rectangle(mouse_x, mouse_y, (uSX - 20), (uSY - 18), (uSX + 17), (uSY + 31)) && (!itemSelected))
                        {
                            shopOption = ((i * 7) + j)
                            scr_mouseHoverSound(uPrev, shopOption, snd_menu_select, 0)
                            if (mouse_check_button_pressed(mb_left) && canControl && (!itemSelected))
                            {
                                itemSelected = 1
                                buyingOption = 0
                                if (ds_map_find_value(global.PlayerSave, shopItems[shopOption].optionID) == array_length(shopItems[shopOption].cost))
                                    buyingOption = 1
                                audio_play_sound(snd_menu_confirm, 30, false)
                            }
                        }
                    }
                }
            }
            break
        case 2:
            i = 0
            repeat (5)
            {
                j = 0
                repeat (7)
                {
                    uPrev = armorySelect
                    uSX = (309 + (j * 40))
                    uSY = (80 + (i * 37))
                    if point_in_rectangle(mouse_x, mouse_y, (uSX - 14), (uSY - 14), (uSX + 14), (uSY + 14))
                    {
                        armorySelect = ((i * 7) + j)
                        scr_mouseHoverSound(uPrev, armorySelect, snd_menu_select, 0)
                    }
                    j++
                }
                i++
            }
            break
    }

}
