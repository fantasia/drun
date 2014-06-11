#include-once
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <Array.au3>

Local $SETTING_FILE_NAME = "settings.au3"

Func ReadSettings()
   Local $array[1] = ["#include-once"]
   
   Local $i = 2 ; 1 is #include-once
   While True
	  Local $line = FileReadLine(@ScriptDir & "\" & $SETTING_FILE_NAME, $i)
	  
	  If @error Then
		 ExitLoop
	  EndIf
	  
	  $line = StringRight($line, StringLen($line) - 8)
	  $line = StringSplit($line, "=")
	  
	  ; Setting Name
	  If StringInStr($line[1], "[") > 0 Then
		 $line[1] = StringLeft($line[1], StringInStr($line[1], "[") - 1)
	  EndIf
	  
	  ; Setting Value
	  If StringInStr($line[2], "[") > 0 Then
		 $line[2] = StringTrimLeft($line[2], StringInStr($line[2], "["))
	  EndIf
	  If StringInStr($line[2], "]") > 0 Then
		 $line[2] = StringTrimRight($line[2], StringLen($line[2]) - StringInStr($line[2], "]") + 1)
	  EndIf
	  
	  _ArrayAdd($array, $line)
	  $i += 1
   WEnd
   
   _ArrayDelete($array, 0)
   
   return $array
EndFunc


Func Debug($array)
   For $el In $array
	  If IsArray($el) Then
		 ConsoleWrite($el[1] & " " & $el[2] & @CRLF)
	  Else
		 ConsoleWrite($el & @CRLF)
	  EndIf
   Next
EndFunc


;Debug(ReadSettings())
ShowSettings()

Func ShowSettings()
   Local $frameWidth = 200
   Local $frameHeight = 6
   
   Local $ctrlPosX = 10
   Local $ctrlPosY = 6
   Local $ctrlPosYGap = 30
   Local $ctrlWidth = $frameWidth - $ctrlPosX * 2

   Local $settings = ReadSettings()
   
   $frameHeight += $ctrlPosYGap * UBound($settings)
   
   ; Create Frame
   GUICreate("Settings", $frameWidth, $frameHeight)
   
   ; Crate ExitButton
   Local $btnSave = GUICtrlCreateButton("Save", $ctrlPosX, $ctrlPosY, $ctrlWidth)
   GUICtrlSetBkColor($btnSave, 0xFF6666)
   $ctrlPosY += $ctrlPosYGap

   For $el In $settings
	  GUICtrlCreateButton($el[1], $ctrlPosX, $ctrlPosY, $ctrlWidth)
	  $ctrlPosY += $ctrlPosYGap
   Next

   GUICtrlCreateLabel("alt + w" , 200, 10)
   Local $editWaitScreen = GUICtrlCreateEdit("" , 200, 26, 190, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Local $editMousePos = GUICtrlCreateEdit("" , 200, 56, 100, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Local $editMouseColor = GUICtrlCreateEdit("" , 310, 56, 80, 20, $ES_READONLY, $WS_EX_STATICEDGE)
   Local $editActiveWindow = GUICtrlCreateEdit("" , 200, 86, 190, 20, $ES_READONLY, $WS_EX_STATICEDGE)

   GUISetState(@SW_SHOW)
EndFunc

While 1 
   Sleep(1000)
WEnd
   