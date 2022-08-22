while (argument1 < array_length(global.seenCollabs))
{
    if (collabingWeapon.attackId == global.seenCollabs[argument1].attackId)
    {
        argument0 = 1
        break
    }
    else
    {
        argument1++
        continue
    }
}
