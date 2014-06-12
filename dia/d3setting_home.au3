#include-once
; 1280 x 760 Window Mode
Global $gameTitle = "[TITLE:디아블로]"
Global $screenSize[2] = [1280, 760]

Global $mainScreen[5] = [113, 372, 115, 374, 0x420C00]
Global $exitMainScreen[5] = [1157, 58, 1159, 60, 0xFFFFFF]
Global $gameSettingScreen[5] = [600, 210, 670, 290, 0xAC2AAC]
Global $startBase[5] = [638, 678, 640, 680, 0x9B9EA2]
Global $questMap[5] = [639, 115, 641, 117, 0xFF7D00]
Global $map1[5] = [1171, 401, 1173, 403, 0xBB5D32]
Global $map2[5] = [27, 100, 29, 102, 0xC6240A]
Global $ghom[5] = [5637, 81, 639, 83, 0x8E0000]
Global $questComplete[5] = [621, 646, 623, 648, 0x391008]
Global $endBase[5] = [1083, 132, 1085, 134, 0x52AEDE]
Global $exitMenuScreen[5] = [798, 46, 800, 48, 0xB00639]

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