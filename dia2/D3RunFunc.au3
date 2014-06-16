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

Func CheckEndBase()
   Return CheckScreen($endBase)
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
   CallbackAdd("CheckMap2", "GotoGhom")
EndFunc

Func GotoGhom()
   CallbackClear()
   For $i = 1 To 4 Step 1
	  MouseClick("left", $moveGhom[0], $moveGhom[1])
	  Sleep(2000)
   Next
   CallbackAdd("CheckGhom", "Battle")
EndFunc

Func Battle()
   CallbackClear()
   Call($battleFunc)
   MouseMove(638, 614)
   Send("{ESC}")
   Send("{PRINTSCREEN}")
   ToggleItems()
EndFunc

Func ToggleItems()
   ln("toggle item")
   ToggleItem($itemLegend, 3)
   ToggleItem($itemSet, 30)
;~    ToggleItem($itemYellow, 10, False)
;~    ToggleItem($itemBlue, 10, False)
   ln("return base")
   Send("t")
   CallbackAdd("CheckEndBase", "DestroyItems")
EndFunc

Func DestroyItems()
   CallbackClear()
   Sleep(3000)
   Send("{ESC}")
   Sleep(1000)
   ExitMainScreen()
EndFunc


Func ToggleItem($item, $bound = 1, $sendScreenCapture = True)
   Send("{ALT}")
   Sleep(500)
   Local $itemCount = 0
   For $i = 1 To $item[1] Step 1
	  Local $pos = PixelSearch(400, 200, 900, 500, $item[0], $bound)
	  If Not @error Then
		 $itemCount += 1
		 MouseMove($pos[0], $pos[1])
		 MouseClick("left")
		 If $sendScreenCapture Then
			Sleep(1800)
		 Else
			Sleep(1000)
		 EndIf
		 Send("{ALT}")
		 If $sendScreenCapture Then
			;SendScreenCapture("[TITLE:item]", 260, 810, 330, 810)
		 EndIf
	  Else
		 ExitLoop
	  EndIf
   Next
   return $itemCount
EndFunc
