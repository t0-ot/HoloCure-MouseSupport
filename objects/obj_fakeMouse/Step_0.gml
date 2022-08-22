//used to manage the size of the mouse cursor when going from room to room
if (room != rm_CharSelect)
{
    x = device_mouse_x_to_gui(0)
    y = device_mouse_y_to_gui(0)
}
else if (room == rm_CharSelect)
{
    x = mouse_x
    y = mouse_y
}
if (instance_exists(obj_Options) && room == rm_Title)
{
    image_xscale = 1
    image_yscale = 1
}
else if (room == rm_Title && (!instance_exists(obj_Options)))
{
    image_xscale = 2
    image_yscale = 2
}
