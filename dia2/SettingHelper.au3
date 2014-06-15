#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <Array.au3>
#include <Misc.au3>
#include <d3func.au3>
#include <d3run.au3>
#include <d3util.au3>

Func ShowSettingHelper()
   Local $frameWidth = 220
   Local $frameHeight = 220
   Local $btnPosX = 10
   Local $btnPosY = 6
   Local $btnWidth = $frameWidth - $btnPosX * 2
   Local $btnPosYGap = 30

   ; Create Frame
   GUICreate("SettingHelper", $frameWidth, $frameHeight)
   ; Crate ExitButton
   Local $btnExitRun = GUICtrlCreateButton("Quit", $btnPosX, $btnPosY, $btnWidth)
   GUICtrlSetBkColor($btnExitRun, 0xFF6666)
   $btnPosY += $btnPosYGap

   GUICtrlCreateLabel("alt + w" , 10, 36)
   Global $editWaitScreen = GUICtrlCreateEdit("" , 10, 56, 200, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Global $editMousePos = GUICtrlCreateEdit("" , 10, 86, 100, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Global $editMouseColor = GUICtrlCreateEdit("" , 120, 86, 90, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Global $editActiveWindow = GUICtrlCreateEdit("" , 10, 116, 200, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   GUISetState(@SW_SHOW)
EndFunc

ShowSettingHelper()
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

