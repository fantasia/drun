#include-once
; 1280 x 760 Window Mode
Global $gameTitle = "[TITLE:디아블로]"
Global $screenSize[2] = [1280, 760]

Global $exitMainScreen[6] = [1148, 70, 1175, 79, 0xFFFFFF, 1]
Global $exitGameButton[2] = [168, 356]

Global $mainScreen[6] = [111, 370, 121, 380, 0x440C00, 10]

Global $gameSettingBtn[2] = [168, 413]
Global $gameSettingScreen[6] = [889, 230, 941, 277, 0xFFFFFF, 1]
Global $selectGhomBtn1[2] = [633, 477]
Global $selectGhomBtn2[2] = [548, 435]
Global $selectGhomBtn3[2] = [544, 511]
Global $selectGhomBtn4[2] = [563, 548]
Global $selectGhomBtn5[2] = [571, 465]
Global $selectGhomBtn6[2] = [518, 609]
Global $selectGhomBtnClickInterval = 100

Global $startGameBtn[2] = [157, 376]

Global $startBase[6] = [1215, 164, 1225, 174, 0xFF0E0D, 10]
Global $questMap[6] = [634, 110, 644, 120, 0xFF7D00, 1]
Global $wayPointBtn[2] = [453, 553]
Global $map1[6] = [860, 231, 870, 241, 0xE3754A, 20]
Global $moveMap2[2] = [1060, 232]
Global $moveMap2Backup[2] = [644, 338]
Global $map2[6] = [23, 95, 28, 100, 0xCB3111, 5]
Global $moveGhom[2] = [1144, 94]
Global $ghom[6] = [634, 72, 644, 82, 0xD04345, 10]
Global $questComplete[6] = [614, 643, 624, 653, 0x451008, 10]
Global $endBase[6] = [1205, 182, 1215, 192, 0x6EDFFF, 10]

Global $inven[5] = [1055, 85, 1057, 87, 0xDCD963]
Global $invenStartPos[2] = [870, 441];[923, 441]
Global $invenSize = 35 ; 10 x 6

Global $itemLegend[4] = [0xFF8000, 5, 0, "LEGEND"]
Global $itemSet[4] = [0x00FF00, 5, 0, "SET"]
Global $itemYellow[4] = [0xFFFF00, 5, 0, "Yellow"]
Global $itemBlue[4] = [0x6363EF, 5, 0, "Blue"]
Global $itemWhite[4] = [0x00FF00, 5, 0, "White"]

Global $invenEmpty = 0x0C0C08
Global $invenYellowItem = 0x524814
Global $invenBlueItem = 0x182A52

Global $destroyBtn[2] = [192, 234]
Global $destroyOn[5] = [195, 208, 197, 210, 0xFEB400]
Global $destroyOff[5] = [196, 208, 198, 210, 0x080400]
Global $destroyCancel[5] = [709, 292, 711, 294, 0xB47539]