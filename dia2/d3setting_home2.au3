#include-once
; 1280 x 720 Window Mode
Global $gameTitle = "[TITLE:디아블로]"
Global $screenSize[2] = [1280 + 8 + 8, 720 + 30 + 8]

Global $exitMainScreen[6] = [1148, 70, 1175, 79, 0xFFFFFF, 1]
Global $exitGameButton[2] = [168, 356]

Global $mainScreen[6] = [111, 370, 121, 380, 0x440C00, 10]

Global $gameSettingBtn[2] = [168, 413]
Global $gameSettingScreen[6] = [889, 230, 941, 277, 0xFFFFFF, 1]
Global $selectGhomBtn1[2] = [633, 477]
Global $selectGhomBtn2[2] = [548, 435]
Global $selectGhomBtn2_1[2] = [794, 506]
Global $selectGhomBtn3[2] = [544, 511]
Global $selectGhomBtn4[2] = [563, 548]
Global $selectGhomBtn5[2] = [571, 465]
Global $selectGhomBtn6[2] = [518, 609]
Global $selectGhomBtnClickInterval = 100

Global $startGameBtn[2] = [157, 376]

Global $startBase[6] = [1232, 163, 1242, 173, 0xEB1210, 10]
Global $questMap[6] = [643, 111, 653, 121, 0xFF7D00, 1]
Global $wayPointBtn[2] = [453, 553]
Global $map1[6] = [860, 231, 870, 241, 0xE3754A, 20]
Global $moveMap2[2] = [1060, 232]
Global $moveMap2Backup[2] = [644, 338]
Global $map2[6] = [19, 93, 29, 103, 0xC1230A, 10]
Global $moveGhom[2] = [1144, 94]
Global $ghom[6] = [637, 52, 647, 62, 0x792EA0, 30]
Global $questComplete[6] = [614, 643, 624, 653, 0x451008, 10]
Global $endBase[6] = [1107, 129, 1117, 139, 0x53AEDE, 10]

Global $inven[6] = [1105, 78, 1115, 88, 0xCAC85F, 10]
Global $invenStartPos[2] = [943, 405]
Global $invenSize[2] = [34, 33]

Global $itemLegend[4] = [0xFF8000, 5, 0, "LEGEND"]
Global $itemSet[4] = [0x00FF00, 5, 0, "SET"]
Global $itemYellow[4] = [0xFFFF00, 5, 0, "Yellow"]
Global $itemBlue[4] = [0x6363EF, 5, 0, "Blue"]
Global $itemWhite[4] = [0x00FF00, 5, 0, "White"]

Global $invenEmpty = 0x0C0C08
Global $invenYellowItem = 0x5F550E
Global $invenBlueItem = 0x182A52

Global $gotoDestroy[2] = [1026, 104]
Global $destroyBtn[2] = [192, 234]
Global $destroyOn[6] = [155, 194, 165, 204, 0xFFCC00, 10]
Global $destroyOff[6] = [155, 194, 161, 200, 0x5A5346, 10]
Global $destroyCancel[6] = [699, 273, 709, 283, 0x470B00, 10]
Global $repairTab[2] = [344, 437]
Global $repairBtn[2] = [177, 423]
