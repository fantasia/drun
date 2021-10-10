#include-once
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <Array.au3>

Global $gameTitle = "SM-G991N"
Global $screenSize[2] = [1280, 608]
Global $checkQuestMain[3] = [4.22, 94.9, 0xF7C01A]
Global $clickQuestMain[3] = [51.56, 50.16, 0x60704A]
Global $checkQuestLevel[6] = [85.78, 87.66, 0xF25E6D, 85.7, 91.78, 0xF25E6D]
Global $checkQuestResult[9] = [21.8, 23.36, 0xFCE55B, 48.36, 24.01, 0xFCE55B, 73.75, 24.51, 0xFCE55B]
Global $clickQuestResult[3] = [96.48, 94.9, 0xFFFFFF]
Global $checkQuestRun[6] = [5.55, 11.84, 0xF35D6C, 7.42, 11.68, 0xF15C6D]
Global $checkQuestFail[6] = [47.66, 61.51, 0xF25E6D, 55.16, 61.51, 0xF25E6D]
Global $clickQuestFail[3] = [51.33, 62.34, 0xF25E6D]
Global $checkQuestFailCollect[6] = [27.5, 88.82, 0x53C5FA, 41.64, 89.14, 0x53C5FA]
Global $clickQuestFailCollect[3] = [34.53, 88.16, 0x53C5FA]
Global $checkQuestFailCollectYes[6] = [31.25, 62.01, 0x88FF51, 37.73, 62.01, 0x88FF51]
Global $clickQuestFailCollectYes[3] = [34.77, 61.35, 0xB3F794]

Func StartLoop()
   InitPosition()

   Local $loopCount = 0
   While 1
	  $loopCount += 1
	  Sleep(2000)
	  ln("LoopCount " & $loopCount)

	  If CheckQuestMain() Then
		 ContinueLoop
	  EndIf

	  If CheckQuestLevel() Then
		 ContinueLoop
	  EndIf

	  If CheckQuestFail() Then
		 ContinueLoop
	  EndIf

	  If CheckQuestFailCollect() Then
		 ContinueLoop
	  EndIf

	  If CheckQuestFailCollectYes() Then
		 ContinueLoop
	  EndIf

	  If CheckQuestRun() Then
		 UpdateStatus("QuestRun waiting for end. " & $loopCount)
		 ContinueLoop
	  EndIf

	  If CheckQuestResult() Then
		 ln("QuestComplete. ContinueGame")
		 ;ExitLoop
	  EndIf

	  UpdateStatus("Unknown Screen")
   WEnd
EndFunc

HotKeySet("!w", "WindowPos")

Func WindowPos()
   Local $p = MouseGetPos()
   Local $c = PixelGetColor($p[0], $p[1])
   Local $g = 5
   ;Local $w = WinGetPos("[ACTIVE]")
   Local $w = WinGetPos($gameTitle)
   Local $rmp[2] = [ Round(($p[0] - $w[0]) * 100 / $w[2], 2), Round(($p[1] - $w[1]) * 100 / $w[3], 2) ] ; relative mouse position

   Local $msg = "[" & $rmp[0] & ", " & $rmp[1] & ", 0x" & Hex($c, 6) & "]"
   GUICtrlSetData($editWaitScreen, $msg)
   ln($msg)

   $msg = $rmp[0] & "%, " & $rmp[1] & "%"
   GUICtrlSetData($editMousePos, $msg)

   $msg = "Active : " & $w[0] & ", " & $w[1] & ", " & $w[2] & ", " & $w[3]
   GUICtrlSetData($editActiveWindow, $msg)

   GUICtrlSetData($editMouseColor, "0x" & Hex($c, 6))
   GUICtrlSetBkColor($editMouseColor, $c)
EndFunc

Func UpdateStatus($msg)
   GUICtrlSetData($editStatusWindow, $msg)
   ln("UpdateStatus() " & $msg)
EndFunc

Func InitPosition()
   WinActivate($gameTitle)
   Local $w = WinGetPos($gameTitle)
   WinMove($gameTitle,"", $w[0], $w[1], $screenSize[0], $screenSize[1])
EndFunc

Func CheckQuestMain()
   If CheckScreen($checkQuestMain) Then
	  ln("Screen Find ==> QuestMain")
	  UpdateStatus("QuestMain. click stage")
	  LClick($clickQuestMain)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestLevel()
   If CheckScreen($checkQuestLevel) Then
	  ln("Screen Find ==> QuestLevel")
	  UpdateStatus("QuestLevel. click stage")
	  LClick($clickQuestMain)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestRun()
   If CheckScreens($checkQuestRun) Then
	  ln("Screen Find ==> QuestRun")
	  LClick($clickQuestMain)
	  UpdateStatus("QuestRun waiting for end.")
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestFail()
   If CheckScreens($checkQuestFail) Then
	  ln("Screen Find ==> QuestFail")
	  LClick($clickQuestFail)
	  UpdateStatus("QuestFail")
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestFailCollect()
   If CheckScreens($checkQuestFailCollect) Then
	  ln("Screen Find ==> QuestFailCollect")
	  LClick($clickQuestFailCollect)
	  UpdateStatus("QuestFail - Collect")
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestFailCollectYes()
   If CheckScreens($checkQuestFailCollectYes) Then
	  ln("Screen Find ==> QuestFailCollectYes")
	  LClick($clickQuestFailCollectYes)
	  UpdateStatus("QuestFail - CollectYes")
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestResult()
   If CheckScreens($checkQuestResult) Then
	  ln("Screen Find ==> QuestResult")
	  UpdateStatus("QuestResult 1/2. wait 2sec")
	  Sleep(2000)
	  LClick($clickQuestResult)
	  UpdateStatus("QuestResult 2/2. wait 4sec")
	  Sleep(4000)
	  LClick($clickQuestResult)
	  UpdateStatus("QuestResult done")
	  Return True
   EndIf
   Return False
EndFunc

Func ShowMainControlPannel()
   Local $frameWidth = 200
   Local $frameHeight = 6
   Local $btnPosX = 10
   Local $btnPosY = 6
   Local $btnWidth = $frameWidth - $btnPosX * 2
   Local $btnPosYGap = 30
   Local $buttons[1] = ["Dummy"]
   _ArrayAdd($buttons, "InitPosition")
   _ArrayAdd($buttons, "CheckQuestMain")
   _ArrayAdd($buttons, "CheckQuestRun")
   _ArrayAdd($buttons, "CheckQuestResult")
   _ArrayAdd($buttons, "CheckQuestFail")
   _ArrayDelete($buttons, 0)

   $frameHeight += (UBound($buttons) + 2) * $btnPosYGap
   $frameWidth += 200

   ; Create Frame
   GUICreate("PokemonQuest Run", $frameWidth, $frameHeight)
   ; Crate ExitButton
   Local $btnExitRun = GUICtrlCreateButton("Quit", $btnPosX, $btnPosY, $btnWidth)
   GUICtrlSetBkColor($btnExitRun, 0xFF6666)
   $btnPosY += $btnPosYGap
   Local $btnStartRun = GUICtrlCreateButton("StartLoop", $btnPosX, $btnPosY, $btnWidth)
   GUICtrlSetBkColor($btnStartRun, 0xCCCCFF)
   $btnPosY += $btnPosYGap

   For $btnName In $buttons
	  GUICtrlCreateButton($btnName, $btnPosX, $btnPosY, $btnWidth)
	  $btnPosY += $btnPosYGap
   Next

   GUICtrlCreateLabel("alt + w" , 200, 10)
   Global $editWaitScreen = GUICtrlCreateEdit("" , 200, 26, 190, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Global $editMousePos = GUICtrlCreateEdit("" , 200, 56, 100, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Global $editMouseColor = GUICtrlCreateEdit("" , 310, 56, 80, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Global $editActiveWindow = GUICtrlCreateEdit("" , 200, 86, 190, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   GUICtrlCreateLabel("Status" , 200, 130)
   Global $editStatusWindow = GUICtrlCreateEdit("" , 200, 146, 190, 20, $ES_READONLY, $WS_EX_STATICEDGE)

   GUISetState(@SW_SHOW)
EndFunc
