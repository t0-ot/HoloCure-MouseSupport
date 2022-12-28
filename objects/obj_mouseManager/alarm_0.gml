if (portraitShakeTime > 0 && (!obj_PlayerManager.paused))
{
    portraitShakeTime--
    portraitShakeX = ((-portraitShakeMagnitude) + (2 * random(portraitShakeMagnitude)))
    portraitShakeY = ((-portraitShakeMagnitude) + (2 * random(portraitShakeMagnitude)))
    if (portraitShakeTime < (portraitShakeDuration / 2))
    {
        portraitShakeX *= (portraitShakeTime / (portraitShakeDuration / 2))
        portraitShakeY *= (portraitShakeTime / (portraitShakeDuration / 2))
    }
    alarm[0] = 1
}
else
{
    portraitShakeX = 0
    portraitShakeY = 0
}
