#include-once
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <Array.au3>
#include <ScreenUtil.au3>
#include <DebugUtil.au3>

HotKeySet("!w", "WindowPos")
HotKeySet("^3", "InitTarget")

;Global $gameTitle = "SM-G991N"
Global $gameTitle = "SM-T295N"
Global $screenSize[2] = [800, 529]

ShowMainControlPannel()

Local $iMsg = 0
While 1
   $iMsg = GUIGetMsg()
   Switch $iMsg
	  Case $GUI_EVENT_CLOSE
		 ExitLoop
   EndSwitch

   If $iMsg > 0 Then
	  Local $controlText = GUICtrlRead($iMsg)
	  ln($controlText & "() ret=" & Call($controlText))
   EndIf
WEnd


Func InitTarget()
   WinActivate($gameTitle)
   Local $w = WinGetPos($gameTitle)
   WinMove($gameTitle,"", $w[0], $w[1], $screenSize[0], $screenSize[1])
EndFunc

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
   Local $frameWidth = 400
   Local $frameHeight = 400
   Local $btnPosX = 10
   Local $btnPosY = 6
   Local $btnWidth = $frameWidth - $btnPosX * 2

   ; Create Frame
   GUICreate("AutoHelper", $frameWidth, $frameHeight)

   GUICtrlCreateLabel("alt + w" , 10, 10)
   GUICtrlCreateLabel("alt + w" , 10, 10)
   Global $editWaitScreen = GUICtrlCreateEdit("" , 10, 26, 190, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Global $editMousePos = GUICtrlCreateEdit("" , 10, 56, 100, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Global $editMouseColor = GUICtrlCreateEdit("" , 120, 56, 80, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Global $editActiveWindow = GUICtrlCreateEdit("" , 10, 86, 190, 20, $ES_READONLY, $WS_EX_STATICEDGE)

   GUICtrlCreateLabel("Status" , 10, 130)
   Global $editStatusWindow = GUICtrlCreateEdit("" , 10, 146, 190, 20, $ES_READONLY, $WS_EX_STATICEDGE)

   GUICtrlCreateLabel("Help" , 10, 180)
   Global $editHelpWindow = GUICtrlCreateEdit("" , 10, 196, 280, 60, $ES_READONLY, $WS_EX_STATICEDGE)
   GUICtrlSetData($editHelpWindow, "ctrl + 1" & @LF & "mouse move, alt + w" & @LF & "ctrl + 2")

   GUISetState(@SW_SHOW)
EndFunc
