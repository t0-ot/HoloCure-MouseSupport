if (room == rm_Title)
{
    if (argument0 != argument1 && (!instance_exists(obj_Options)) && (!instance_exists(obj_Credits)))
        audio_play_sound(argument2, argument3, false)
}
else if (argument0 != argument1)
    audio_play_sound(argument2, argument3, false)
