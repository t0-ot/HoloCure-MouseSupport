//This function exists because the file becomes uneditable due to a recompiling issue with UMT. So it's separated so that editability can be retained

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
