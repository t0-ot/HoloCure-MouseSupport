var optionType = argument0.optionType
switch optionType
{
    case "StatUp":
        variable_struct_set(commandsOnUnpause, argument0.optionID, AddStat)
        break
    case "Weapon":
        variable_struct_set(commandsOnUnpause, argument0.optionID, AddAttack)
        break
    case "Collab":
        variable_struct_set(commandsOnUnpause, argument0.optionID, AddCollab)
        break
    case "Skill":
        variable_struct_set(commandsOnUnpause, argument0.optionID, AddPerk)
        break
    case "Item":
        variable_struct_set(commandsOnUnpause, argument0.optionID, AddItem)
        break
    case "Consumable":
        variable_struct_set(commandsOnUnpause, argument0.optionID, AddConsumable)
}

