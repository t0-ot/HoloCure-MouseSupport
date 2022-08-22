//Only contains moddified code, everything else is ommited

...

if (!isStrafing)
    direction = point_direction(x, y, mouse_x, mouse_y)
else
    obj_InputManager.direction = direction
isMoving = 1

...