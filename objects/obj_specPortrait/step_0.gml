with (obj_PlayerManager)
{
    var meterCheck = obj_sparkle
    if instance_exists(playerCharacter)
        meterCheck = playerCharacter
    else
        meterCheck = playerSnapshot
    if (meterCheck.canSpecial && room != rm_PauseRoom)
    {
        if (other.alarm[1] < 0)
            other.alarm[1] = 100
    }
}
