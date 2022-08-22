var text = instance_find(obj_TextController, 0)
switch selectedLanguageOption
{
    case 0:
        text.languages.English.text.languages.English.SetLanguage(text)
        break
    case 1:
        text.languages.Japanese.text.languages.Japanese.SetLanguage(text)
        break
}

