with (obj_PlayerManager)
{
    if (ds_map_find_value(global.PlayerSave, "specUnlock") > 0)
    {
        var meterCheck = obj_sparkle
        if instance_exists(playerCharacter)
            meterCheck = playerCharacter
        else
            meterCheck = playerSnapshot
        draw_sprite(ui_sp_case, 0, (hudcontainer[0] + 11), (hudcontainer[1] + 49))
        draw_sprite_ext(charSpecial, 0, (hudcontainer[0] + 12), (hudcontainer[1] + 48), 1, 1, 0, c_white, (0.5 + (meterCheck.canSpecial * 0.5)))
        if meterCheck.canSpecial
            draw_sprite_ext(charSpecial, 0, (hudcontainer[0] + 12), (hudcontainer[1] + 48), other.scaleX, other.scaleY, 0, c_white, other.fade)
    }
}
