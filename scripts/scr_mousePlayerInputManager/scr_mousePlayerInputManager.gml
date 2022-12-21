with (obj_Player)
{
    if mouse_check_button_released(mb_left)
        mouseAimOn = (!mouseAimOn)
    if (!isStrafing)
    {
        if mouseAimOn
            direction = point_direction(x, y, mouse_x, mouse_y)
        else if is_undefined(input_direction("aim_left", "aim_right", "aim_up", "aim_down"))
            direction = obj_InputManager.direction
    }
    else
        obj_InputManager.direction = direction
    isMoving = 1
}
