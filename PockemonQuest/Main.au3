#include-once
#include <CookLoop.au3>
#include <QuestLoop.au3>
#include <ScreenUtil.au3>
#include <DebugUtil.au3>
;#include <Setting_SM-G991N.au3>
#include <Setting_SM-T295N.au3>

HotKeySet("!w", "WindowPos")

Func Test1()
   InitPosition()
   LDClick($source3)
   Sleep(500)
   LDClick($source3)
   Sleep(500)
   LDClick($source3)
   Sleep(500)
   LDClick($source4)
   Sleep(500)
   LDClick($source7)
   Sleep(500)
EndFunc

ShowMainControlPannel()

Local $iMsg = 0
While 1
   $iMsg = GUIGetMsg()
   Switch $iMsg
	  Case $GUI_EVENT_CLOSE
		 ExitLoop
   EndSwitch

   If $iMsg > 0 Then
	  InitPosition()
	  Local $controlText = GUICtrlRead($iMsg)
	  ln($controlText & "() ret=" & Call($controlText))
   EndIf
WEnd


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

Func ShowMainControlPannel()
   Local $frameWidth = 200
   Local $frameHeight = 6
   Local $btnPosX = 10
   Local $btnPosY = 6
   Local $btnWidth = $frameWidth - $btnPosX * 2
   Local $btnPosYGap = 30
   Local $buttons[1] = ["Dummy"]
   _ArrayAdd($buttons, "InitPosition")
   _ArrayAdd($buttons, "CookStart")
   _ArrayAdd($buttons, "CheckCook")
   _ArrayAdd($buttons, "Test3")
   _ArrayAdd($buttons, "Test4")
   _ArrayDelete($buttons, 0)

   $frameHeight += (UBound($buttons) + 2) * $btnPosYGap
   $frameWidth += 200

   ; Create Frame
   GUICreate("PokemonQuest Run", $frameWidth, $frameHeight)
   ; Crate ExitButton
   Local $btnExitRun = GUICtrlCreateButton("Quit", $btnPosX, $btnPosY, $btnWidth)
   GUICtrlSetBkColor($btnExitRun, 0xFF6666)
   $btnPosY += $btnPosYGap
   Local $btnStartRun = GUICtrlCreateButton("StartQuestLoop", $btnPosX, $btnPosY, $btnWidth)
   GUICtrlSetBkColor($btnStartRun, 0xCCCCFF)
   $btnPosY += $btnPosYGap
   Local $btnStartCook = GUICtrlCreateButton("StartCookLoop", $btnPosX, $btnPosY, $btnWidth)
   GUICtrlSetBkColor($btnStartCook, 0xCCCCFF)
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
