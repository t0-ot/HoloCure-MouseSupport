if (room == rm_CharSelect)
{
    if instance_exists(obj_CharSelect)
    {
        if mouse_check_button_released(mb_left)
            instance_find(obj_CharSelect, 0).instance_find(obj_CharSelect, 0).Select()
    }
}
if (room == rm_PauseRoom)
{
    if instance_exists(obj_PlayerManager)
    {
        var playerMan = instance_find(obj_PlayerManager, 0)
        if mouse_check_button_released(mb_left)
            playerMan.playerMan.Confirmed()
    }
}
if (room == rm_Shop)
{
    if instance_exists(obj_Shop)
    {
        var shopMan = instance_find(obj_Shop, 0)
        if mouse_check_button_released(mb_left)
            shopMan.shopMan.Confirmed()
    }
}
if (room == rm_InitRoom)
{
    if instance_exists(obj_GameManager)
    {
        var gameMan = instance_find(obj_GameManager, 0)
        if mouse_check_button_released(mb_left)
            gameMan.gameMan.Confirmed()
    }
}
if (room == rm_Tutorial)
{
    if instance_exists(obj_Tutorial)
    {
        gameMan = instance_find(obj_Tutorial, 0)
        if mouse_check_button_released(mb_left)
            gameMan.gameMan.Confirm()
    }
}
if instance_exists(obj_UnlockMenu)
{
    var unlockMan = instance_find(obj_UnlockMenu, 0)
    if mouse_check_button_released(mb_left)
        unlockMan.unlockMan.Confirm()
}
