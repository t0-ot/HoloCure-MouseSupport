if instance_exists(obj_PlayerManager)
{
    draw_sprite(portraitSprite, 0, (portraitX + portraitShakeX), ((portraitY - 6) + portraitShakeY))
    draw_sprite(ui_portrait_frame, 0, ((portraitX + 2) + portraitShakeX), ((portraitY - 6) + portraitShakeY))
}
