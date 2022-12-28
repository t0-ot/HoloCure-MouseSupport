//draws amount of HP
draw_text_outline((hudcontainer[0] + 200), (hudcontainer[1] - 5), ((string(global.currentHP) + " / ") + string(global.maxHP)), 1, c_black, 14, 4, 100, c_white, 1)

//Draws Health bar
draw_healthbar((hudcontainer[0] + 68), hudcontainer[1], (hudcontainer[0] + 194), hudcontainer[1], ((global.currentHP / global.maxHP) * 100), 0x0200A2, 0x069617, 0x069617, 0, 1, 0)
draw_healthbar((hudcontainer[0] + 68), (hudcontainer[1] - 4), (hudcontainer[0] + 194), (hudcontainer[1] - 1), ((global.currentHP / global.maxHP) * 100), 0x2429FF, 0x14FF62, 0x14FF62, 0, 1, 0)
draw_healthbar((hudcontainer[0] + 68), (hudcontainer[1] - 7), (hudcontainer[0] + 194), (hudcontainer[1] - 4), ((global.currentShieldHP / global.shieldMaximumHP) * 100), c_black, 0xFFAD4E, 0xFFAD4E, 0, 0, 0)

//Draws Item Boundary
draw_sprite(spr_itemBoxBoundary, 0, (hudcontainer[0] + 50), (hudcontainer[1] + 4))

//Draws Characters base weapon
draw_sprite(charWeapon, 0, (hudcontainer[0] + 62), (hudcontainer[1] + 16))
draw_sprite(ui_level_header_pink, 0, (hudcontainer[0] + 52), (hudcontainer[1] + 24))
draw_sprite(ui_digit_pink, ds_map_find_value(playerSnapshot.attacks, global.charSelected.attackID).config.level, (hudcontainer[0] + 65), (hudcontainer[1] + 26))