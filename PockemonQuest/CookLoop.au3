#include-once
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <Array.au3>

Func StartCookLoop()
   InitPosition()

   Local $loopCount = 0
   While 1
	  $loopCount += 1
	  Sleep(2000)
	  ln("CookLoopCount " & $loopCount)

	  If CheckCookMain() Then
		 ContinueLoop
	  EndIf

	  If CheckCook() Then
		 ContinueLoop
	  EndIf

	  If CheckCookStart() Then
		 ContinueLoop
	  EndIf

	  If CheckCookConfirm() Then
		 ContinueLoop
	  EndIf

	  If CheckCookEnd() Then
		 ContinueLoop
	  EndIf

	  If CheckCookEndConfirm() Then
		 ContinueLoop
	  EndIf

	  If CheckPockemon() Then
		 ContinueLoop
	  EndIf

	  UpdateStatus("Unknown Screen")
   WEnd
EndFunc

Global $checkCookMain[3] = [4.22, 94.9, 0xF7C01A]
Global $clickCookMain[3] = [51.56, 50.16, 0x60704A]
Global $source1[3] = [51.17, 58.22, 0xEDCAA8]
Global $source2[3] = [58.2, 58.72, 0x286CE1]
Global $source3[3] = [65.08, 57.57, 0xF8BC3A]
Global $source4[3] = [72.58, 57.57, 0x636363]
Global $source5[3] = [78.67, 57.4, 0xD7DDFF]
Global $source6[3] = [51.56, 74.01, 0xE42F31]
Global $source7[3] = [57.81, 73.03, 0x38A5F8]
Global $source8[3] = [64.22, 73.19, 0xFCE53A]
Global $source9[3] = [71.95, 73.19, 0x4C4C4C]
Global $clickCookStart[3] = [30.13, 89.13, 0xF8C11C]
Global $clickCookStartConfirm[3] = [33.59, 61.51, 0xFFFFFF]

Global $checkCookStart[9] = [30.55, 62.66, 0x88FF51, 13.28, 11.84, 0x393930, 27.19, 92.6, 0x53410A]
Global $checkCook[6] = [52.42, 19.9, 0x696969, 53.36, 21.38, 0x696969]
Global $clickCook[3] = [51.95, 45.07, 0x7A8579]
Global $checkCookConfirm[6] = [34.92, 63.32, 0x53C5FA, 65.08, 62.5, 0xF25E6D]
Global $clickCookConfirm[3] = [34.3, 62.83, 0x53C5FA]
Global $checkCookEnd[6] = [52.11, 18.09, 0xFFFFFF, 52.11, 20.89, 0xEE508C]
Global $clickCookEnd[3] = [51.8, 42.43, 0x707B71]
Global $checkCookEndConfirm[6] = [53.36, 48.03, 0x676054, 55.7, 87.83, 0xF8C11C]
Global $clickCookEndConfirm[3] = [50.7, 87.83, 0xF8C11C]
Global $checkPockemon[12] = [11.41, 33.88, 0xFACF4C, 17.5, 53.45, 0x717166, 49.92, 90.79, 0xF3EBD7, 85.86, 90.46, 0xF25E6D]
Global $clickPockemon[3] = [85.86, 90.46, 0xF25E6D]

Func CheckCookMain()
   If CheckScreen($checkCookMain) Then
	  ln("Screen Find ==> CookMain")
	  UpdateStatus("CookMain.")
	  LClick($clickQuestMain)
	  Return True
   EndIf
   Return False
EndFunc

Func CookStart()
   LClick($clickCookStart)
   Sleep(500)
   LClick($clickCookStartConfirm)
   Sleep(500)
EndFunc

Func CheckCookStart()
   If CheckScreen($checkCookStart) Then
	  ln("Screen Find ==> Cooking start")
	  UpdateStatus("Cooking start")
	  LClick($checkCookStart)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckCook()
   If CheckScreen($checkCook) Then
	  ln("Screen Find ==> Cooking")
	  UpdateStatus("Cooking.")
	  LClick($clickCook)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckCookConfirm()
   If CheckScreen($checkCookConfirm) Then
	  ln("Screen Find ==> Cook confirm")
	  UpdateStatus("Cook confirm.")
	  LClick($clickCookConfirm)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckCookEnd()
   If CheckScreen($checkCookEnd) Then
	  ln("Screen Find ==> Cook end")
	  UpdateStatus("Cook end")
	  LClick($clickCookEnd)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckCookEndConfirm()
   If CheckScreen($checkCookEndConfirm) Then
	  ln("Screen Find ==> Cook end confirm")
	  UpdateStatus("Cook end confirm")
	  LClick($clickCookEndConfirm)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckPockemon()
   If CheckScreen($checkPockemon) Then
	  ln("Screen Find ==> Pockemon")
	  UpdateStatus("Pockemon")
	  LClick($clickPockemon)
	  Return True
   EndIf
   Return False
EndFunc

Func Cook()
   InitPosition()
   LDClick($source6)
   Sleep(500)
   LDClick($source6)
   Sleep(500)
   LDClick($source7)
   Sleep(500)
   LDClick($source7)
   Sleep(500)
   LDClick($source7)
   Sleep(500)
EndFunc

