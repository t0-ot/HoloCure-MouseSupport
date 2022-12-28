portraitShakeTime = 0
portraitShakeDuration = 0
portraitShakeMagnitude = 0
portraitShakeX = 0
portraitShakeY = 0
if instance_exists(obj_PlayerManager)
{
    portraitX = obj_PlayerManager.hudcontainer[0]
    portraitY = obj_PlayerManager.hudcontainer[1]
    portraitSprite = obj_PlayerManager.charPortrait
}
