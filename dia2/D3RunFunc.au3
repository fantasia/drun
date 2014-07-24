#include-once
#include <DebugUtil.au3>
#include <d3setting_home2.au3>


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
   
Func CheckInven()
   Return CheckScreen($inven)
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
   MouseClick("left", $selectGhomBtn2_1[0], $selectGhomBtn2_1[1])
   Sleep($selectGhomBtnClickInterval)
   MouseClick("left", $selectGhomBtn2_1[0], $selectGhomBtn2_1[1])
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
   Sleep(1000)
   MouseClick("left", $moveMap2[0], $moveMap2[1])
   Sleep(2000)
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
;~    Send("{PRINTSCREEN}")
   ToggleItems()
EndFunc

Func ToggleItems()
   ln("toggle item")
   ToggleItem($itemLegend, 3)
   ToggleItem($itemSet, 30)
   ToggleItem($itemYellow, 10, False)
   ToggleItem($itemBlue, 10, False)
   ln("return base")
   Send("t")
   CallbackAdd("CheckEndBase", "GotoDestroy")
EndFunc

Func GotoDestroy()
   CallbackClear()
   Sleep(1000)
   Send("{ESC}")
   Sleep(1000)
   MouseClick("left", $gotoDestroy[0], $gotoDestroy[1])
   CallbackAdd("CheckInven", "DestroyItems")
EndFunc

Func DestroyItems()
   CallbackClear()
   Local $px = $invenStartPos[0]
   Local $py = $invenStartPos[1]
   For $y = 5 To 0 Step -1
	  For $x = 9 To 0 Step -1
		 If $x <= 0 And $y <=2 Then
			ContinueLoop
		 EndIf

		 Local $posX = $px + ($x * $invenSize[0]) + ($invenSize[0] / 3)
		 Local $posY = $py + ($y * $invenSize[1]) + ($invenSize[1] / 3)
		 Local $gap = 5
		 Local $yelloItem[6] = [$posX - $gap, $posY - $gap, $posX + $gap, $posY + $gap, $invenYellowItem, 50]
		 Local $blueItem[6] = [$posX - $gap, $posY - $gap, $posX + $gap, $posY + $gap, $invenBlueItem, 50]
		 If CheckScreen($yelloItem, False) Or CheckScreen($blueItem, False) Then
;~ 			MouseMove($posX, $posY) ; debug
;~ 			ContinueLoop ; debug

			If Not CheckScreen($destroyOn) Then
			   MouseClick("left", $destroyOn[2], $destroyOn[3])
			   Sleep(300)
			EndIf

			MouseClick("left", $posX, $posY)
			Sleep(200)
			If CheckScreen($yelloItem, False) Or CheckScreen($blueItem, False) Then
			   Sleep(200)
			   If checkScreen($destroyCancel) Then
				  MouseClick("left", $destroyCancel[0], $destroyCancel[1])
				  Sleep(200)
				  ExitLoop
			   EndIf
			Else
			   ;ConsoleWrite("Item Destroyed : " & $x & ", " & $y & @CRLF)
			EndIf

			;ConsoleWrite("Item Exist : " & $x & ", " & $y & @CRLF)
		 EndIf
	  Next
   Next

   MouseClick("left", $repairTab[0], $repairTab[1])
   Sleep(500)
   MouseClick("left", $repairBtn[0], $repairBtn[1])
   Sleep(500)
   Send("{ESC}")
   Sleep(3000)
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
