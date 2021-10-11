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
	  If $loopCount > 0 Then
		 Sleep(2000)
	  EndIf

	  $loopCount += 1
	  ln("CookLoopCount " & $loopCount)

	  if CheckCookLongStone() Then
		 ContinueLoop
	  EndIf

	  If CheckCookMain() Then
		 ContinueLoop
	  EndIf

	  If CheckCooking() Then
		 ContinueLoop
	  EndIf

	  If CheckStartCookConfirm() Then
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

Func CheckCookMain()
   If CheckScreen($checkCookMain) Then
	  ln("Screen Find ==> CookMain")
	  UpdateStatus("CookMain.")
	  LClick($checkCookMain)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckStartCookConfirm()
   If CheckScreen($checkStartCookConfirm) Then
	  ln("Screen Find ==> Start Cook confirm")
	  UpdateStatus("Start Cook confirm")
	  LClick($checkStartCookConfirm)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckCooking()
   If CheckScreen($checkCooking) Then
	  ln("Screen Find ==> Cooking")
	  UpdateStatus("Cooking.")
	  LClick($checkCooking)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckCookConfirm()
   If CheckScreen($checkCookConfirm) Then
	  ln("Screen Find ==> Cook confirm")
	  UpdateStatus("Cook confirm.")
	  LClick($checkCookConfirm)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckCookEnd()
   If CheckScreen($checkCookEnd) Then
	  ln("Screen Find ==> Cook end")
	  UpdateStatus("Cook end")
	  LClick($checkCookEnd)
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
	  LClick($checkPockemon)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckCookLongStone()
   If CheckScreen($checkStonePot) Then
	  ln("Screen Find ==> StonePot")
	  UpdateStatus("Cook ready")
	  Sleep(2000)
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
	  LClick($btnStartCook)
	  Return True
   EndIf
   Return False
EndFunc

