#include-once
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <Array.au3>

HotKeySet("!w", "WindowPos")

Func WindowPos()
   Local $p = MouseGetPos()
   Local $c = PixelGetColor($p[0], $p[1])
   Local $g = 5
   Local $w = WinGetPos("[ACTIVE]")
   Local $msg = $p[0] - $g & ", " & $p[1] - $g & ", " & $p[0] + $g & ", " & $p[1] + $g & ", 0x" & Hex($c, 6)
   GUICtrlSetData($editWaitScreen, $msg)
   $msg = $p[0] & ", " & $p[1]
   GUICtrlSetData($editMousePos, $msg)
   $msg = "Active : " & $w[0] & ", " & $w[1] & ", " & $w[2] & ", " & $w[3]
   GUICtrlSetData($editActiveWindow, $msg)

   GUICtrlSetData($editMouseColor, "0x" & Hex($c, 6))
   GUICtrlSetBkColor($editMouseColor, $c)
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
   _ArrayAdd($buttons, "ExitMainScreen")
   _ArrayAdd($buttons, "ExitGameAndWaitMainScreen")
   _ArrayAdd($buttons, "QuestChange")
   _ArrayAdd($buttons, "SelectGhomQuest")
   _ArrayAdd($buttons, "StartGame")
   _ArrayAdd($buttons, "SelectMap")
   _ArrayAdd($buttons, "ClickWayPoint")
   _ArrayAdd($buttons, "MoveMap2")
   _ArrayAdd($buttons, "GotoGhom")
   _ArrayAdd($buttons, "Battle")
   _ArrayAdd($buttons, "ToggleItems")
   _ArrayAdd($buttons, "DestroyItem")
   _ArrayAdd($buttons, "Test")
   _ArrayDelete($buttons, 0)

   $frameHeight += (UBound($buttons) + 2) * $btnPosYGap
   $frameWidth += 200

   ; Create Frame
   GUICreate("D3Run", $frameWidth, $frameHeight)
   ; Crate ExitButton
   Local $btnExitRun = GUICtrlCreateButton("Quit", $btnPosX, $btnPosY, $btnWidth)
   GUICtrlSetBkColor($btnExitRun, 0xFF6666)
   $btnPosY += $btnPosYGap
   Local $btnStartRun = GUICtrlCreateButton("StartGhomRun", $btnPosX, $btnPosY, $btnWidth)
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

   GUISetState(@SW_SHOW)
EndFunc
