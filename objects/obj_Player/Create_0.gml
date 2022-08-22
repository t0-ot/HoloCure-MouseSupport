//Only contains moddified code, everything else is omitted

...

if (!isStrafing)
    direction = point_direction(x, y, mouse_x, mouse_y)
else
    obj_InputManager.direction = direction
isMoving = 1

...