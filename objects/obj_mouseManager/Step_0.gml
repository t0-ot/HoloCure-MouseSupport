if instance_exists(obj_TitleScreen)
    scr_MouseTitle()
if (room == rm_PauseRoom)
    scr_MousePause()
if instance_exists(obj_Shop)
    scr_MouseShop()
if instance_exists(obj_CharSelect)
    scr_MouseCharSelect()
if instance_exists(obj_Options)
    scr_MouseOption()
if (instance_exists(obj_Intro) || instance_exists(obj_Pre_Intro) || room == rm_InitRoom || room == rm_UnlockRoom || room == rm_Tutorial)
    scr_MouseMisc()
if instance_exists(obj_PlayerManager)
{
    if global.hasTakenDamage
        scr_portExecShake(4, 2)
}
