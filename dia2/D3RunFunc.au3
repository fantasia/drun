#include-once
#include <DebugUtil.au3>
#include <d3setting_home.au3>


Func InitPosition()
   WinActivate($gameTitle)
   WinMove($gameTitle,"", 0, 0, $screenSize[0], $screenSize[1])
EndFunc

Func CheckExitMenu()
   return CheckScreen($exitMainScreen)
EndFunc

Func CheckMainScreen()
   return CheckScreen($mainScreen)
EndFunc

Func CheckQuestChangeScreen()
   return CheckScreen($gameSettingScreen)
EndFunc

Func CheckStartBase()
   return CheckScreen($startBase)
EndFunc

Func CheckQuestMap()
   return CheckScreen($questMap)
EndFunc

Func CheckMap1()
   return CheckScreen($map1)
EndFunc

Func CheckMap2()
   return CheckScreen($map2)
EndFunc

Func CheckGhom()
   return CheckScreen($ghom)
EndFunc
   
Func End()
   CallbackClear()
   ln("END!!!!!!!!!")
EndFunc

;============================================================

Func ExitMainScreen()
   CallbackClear()
   Send("{ESCAPE}")
   CallbackAdd("CheckExitMenu", "ExitGameAndWaitMainScreen")
EndFunc

Func ExitGameAndWaitMainScreen()
   CallbackClear()
   MouseClick("left", $exitGameButton[0], $exitGameButton[1])
   CallbackAdd("CheckMainScreen", "QuestChange")
EndFunc

Func QuestChange()
   CallbackClear()
   MouseClick("left", $gameSettingBtn[0], $gameSettingBtn[1])
   CallbackAdd("CheckQuestChangeScreen", "SelectGhomQuest")
EndFunc

Func SelectGhomQuest()
   CallbackClear()
   MouseClick("left", $selectGhomBtn1[0], $selectGhomBtn1[1])
   Sleep($selectGhomBtnClickInterval)
   MouseClick("left", $selectGhomBtn2[0], $selectGhomBtn2[1])
   Sleep($selectGhomBtnClickInterval)
   MouseClick("left", $selectGhomBtn3[0], $selectGhomBtn3[1])
   Sleep($selectGhomBtnClickInterval)
   MouseClick("left", $selectGhomBtn4[0], $selectGhomBtn4[1])
   Sleep($selectGhomBtnClickInterval)
   MouseClick("left", $selectGhomBtn5[0], $selectGhomBtn5[1])
   Sleep($selectGhomBtnClickInterval)
   MouseClick("left", $selectGhomBtn6[0], $selectGhomBtn6[1])
   Sleep($selectGhomBtnClickInterval)
   CallbackAdd("CheckMainScreen", "StartGame")
EndFunc

Func StartGame()
   CallbackClear()
   MouseClick("left", $startGameBtn[0], $startGameBtn[1])
   CallbackAdd("CheckStartBase", "SelectMap")
EndFunc

Func SelectMap()
   CallbackClear()
   Send("m")
   CallbackAdd("CheckQuestMap", "ClickWayPoint")
EndFunc

Func ClickWayPoint()
   CallbackClear()
   MouseClick("left", $wayPointBtn[0], $wayPointBtn[1])
   CallbackAdd("CheckMap1", "MoveMap2")
EndFunc

Func MoveMap2()
   CallbackClear()
   Sleep(2000)
   MouseClick("left", $moveMap2[0], $moveMap2[1])
   Sleep(4000)
   If Not CheckMap2() Then
	  MouseClick("left", $moveMap2Backup[0], $moveMap2Backup[1])
	  Sleep(1000)
	  MouseClick("left", $moveMap2Backup[0], $moveMap2Backup[1])
	  Sleep(4000)
   EndIf
   MouseClick("left", $wayPointBtn[0], $wayPointBtn[1])
   CallbackAdd("CheckMap2", "GotoGhom")
EndFunc

Func GotoGhom()
   CallbackClear()
   For $i = 1 To 4 Step 1
	  MouseClick("left", $moveGhom[0], $moveGhom[1])
	  Sleep(2000)
   Next
   CallbackAdd("CheckGhom", "BattleStart")
EndFunc
