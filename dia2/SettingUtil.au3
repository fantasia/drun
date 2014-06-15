#include-once
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <Array.au3>
#include <d3util.au3>

Local $SETTING_FILE_NAME = "settings.au3"
Local $SETTING_WRITE_FILE_NAME = "settings_new.au3"

Global $controlArrays

HotKeySet("!s", "SaveSettings")

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

Func SaveSettings()
   Local $writeFileName = @ScriptDir & "\" & $SETTING_WRITE_FILE_NAME
   FileDelete($writeFileName)
   FileWriteLine($writeFileName, "#include-once")
   For $i = 0 To UBound($controlArrays) - 1 Step 1
	  Local $ctrlLabel = $controlArrays[$i][0]
	  Local $ctrlEdit = $controlArrays[$i][1]
	  
	  Local $key = GUICtrlRead($ctrlLabel)
	  Local $value = GUICtrlRead($ctrlEdit)
	  Local $splits = StringSplit($value, ",")
	  Local $writeLine = "Global $" & GUICtrlRead($ctrlLabel)
	  If $splits[0] > 1 Then
		 $writeLine &= "[" & $splits[0] & "] = [" & $value & "]"
	  Else
		 $writeLine &= " = " & $value
	  EndIf
	  ln($writeLine)
 	  FileWriteLine($writeFileName, $writeLine)
   Next
EndFunc

Func ShowSettings()
   Local $frameWidth = 480
   Local $frameHeight = 6
   
   Local $ctrlPosX = 10
   Local $ctrlPosY = 6
   Local $ctrlPosYGap = 30
   Local $labelWidth = 140
   Local $editWidth = 220
   Local $ctrlWidth = $frameWidth - $ctrlPosX * 2
   Local $ctrlHeight = 22

   Local $settings = ReadSettings()
   
   $frameHeight += $ctrlPosYGap * UBound($settings)
   Local $controls[UBound($settings)][2]
   $controlArrays = $controls
   
   ; Create Frame
   GUICreate("Settings", $frameWidth, $frameHeight)
   
   ; Crate ExitButton
   Local $btnSave = GUICtrlCreateButton("Save", $ctrlPosX, $ctrlPosY, $ctrlWidth)
   GUICtrlSetBkColor($btnSave, 0xFF6666)
   $ctrlPosY += $ctrlPosYGap

   Local $i = 0
   For $el In $settings
	  Local $ctrlX = $ctrlPosX
	  $controlArrays[$i][0] = GUICtrlCreateLabel($el[1], $ctrlX, $ctrlPosY, $labelWidth, $ctrlHeight)
	  $ctrlX += $labelWidth
 	  $controlArrays[$i][1] = GUICtrlCreateEdit($el[2], $ctrlX, $ctrlPosY, $editWidth, $ctrlHeight, 0, $WS_EX_STATICEDGE)
;~ 	  GUICtrlCreateButton($el[1], $ctrlPosX, $ctrlPosY, $ctrlWidth)
	  $ctrlPosY += $ctrlPosYGap
	  $i += 1
   Next

   GUISetState(@SW_SHOW)
   
   GUICreate("Settings2", $frameWidth, $frameHeight)
   GUISetState(@SW_SHOW)
EndFunc

While 1 
   Sleep(1000)
WEnd
   