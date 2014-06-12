#include-once
#include <d3util.au3>
;~ #include <d3setting.au3>
#include <d3setting_home.au3>

Func CheckScreen($screen, $bounds = 2)
   Local $pos = PixelSearch($screen[0], $screen[1], $screen[2], $screen[3], $screen[4], $bounds)
   If Not @error Then
	  Return True
   Else
	  Return False
   EndIf
EndFunc

Func WaitScreen($screen, $bounds = 2)
   While True
	  If CheckScreen($screen, $bounds) Then
		 Sleep(700)
		 ExitLoop
	  Else
		 Sleep(700)
	  EndIf
   WEnd
EndFunc

Func KilledGhom()
   Local $screen = $questComplete
   PixelSearch($screen[0], $screen[1], $screen[2], $screen[3], $screen[4], 5)
   If Not @error Then
	  Sleep(500)
	  MouseMove($screen[0], $screen[1])
	  Send("{ESCAPE}")
	  return True
   Else
	  return False
   EndIf
EndFunc

Func BattleWizard()
   l("battle ")
   Send("1")
   Sleep(150)
   Send("2")
   Sleep(150)
   Send("3")
   Sleep(150)
   Send("4")
   Sleep(150)
   MouseMove(278, 518, 10)
   MouseClick("left")
   MouseMove(687, 301, 10)
   Sleep(5000)

   Local $battleLoop = 0
   While True
	  $battleLoop += 1
	  ConsoleWrite($battleLoop & " " )
	  MouseClick("right")
	  Sleep(1000)
	  MouseClick("right")
	  Sleep(1000)

	  Send("{LSHIFT down}")
	  MouseDown("left")

	  For $i = 1 To 15 Step 1
		 Sleep(1000)
		 If killedGhom() Then
			MouseUp("left")
			Send("{LSHIFT up}")
			ConsoleWrite("end " & @CRLF )
			Return
		 EndIf
	  Next

	  MouseUp("left")
	  Send("{LSHIFT up}")
   WEnd
EndFunc

Func BattleBudu()
   l("battle ")
   MouseMove(672, 283, 10)
   Sleep(4000)

   Send("2")
   Sleep(500)
   Send("3")
   Sleep(500)
   Send("4")
   Sleep(500)
   Send("{LSHIFT down}")
   MouseClick("left")
   Send("{LSHIFT up}")
   Sleep(500)

   Local $battleLoop = 0
   While True
	  MouseMove(672, 283, 10)
	  $battleLoop += 1
	  ConsoleWrite($battleLoop & " " )

	  Send("1")
	  Sleep(500)

	  MouseDown("right")
	  For $i = 1 To 7 Step 1
		 Sleep(1000)
		 If killedGhom() Then
			MouseUp("right")
			ConsoleWrite("end " & @CRLF )
			Return
		 EndIf
	  Next
	  MouseUp("right")

   WEnd
EndFunc

Func BattleDevilHunter()
   l("battle ")
   MouseMove(278, 518, 10)
   MouseClick("left")
   Sleep(4500)

   MouseMove(672, 283, 10)
   MouseClick("right")
   Sleep(500)

   Local $battleLoop = 0
   While True
	  MouseMove(672, 283, 10)
	  $battleLoop += 1
	  ConsoleWrite($battleLoop & " " )

	  Send("1")
	  Sleep(500)
	  Send("3")
	  Sleep(500)
	  Send("4")
	  Sleep(500)

	  Send("{LSHIFT down}")
	  MouseDown("left")
   
	  For $i = 1 To 8 Step 1
		 Send("2")
		 Sleep(1000)
		 If killedGhom() Then
			MouseUp("left")
			Send("{LSHIFT up}")
			ConsoleWrite("end " & @CRLF )
			Return
		 EndIf
	  Next
	  MouseUp("left")
	  Send("{LSHIFT up}")

   WEnd
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

Func DestroyItem()
   Local $px = $invenStartPos[0]
   Local $py = $invenStartPos[1]
   For $y = 5 To 0 Step -1
	  For $x = 9 To 0 Step -1
		 If $x <= 0 And $y <=2 Then
			ContinueLoop
		 EndIf

		 Local $posX = $px + ($x * 36)
		 Local $posY = $py + ($y * 35)
		 Local $gap = 8
		 Local $yelloItem[5] = [$posX - $gap, $posY - $gap, $posX + $gap, $posY + $gap, $invenYellowItem]
		 Local $blueItem[5] = [$posX - $gap, $posY - $gap, $posX + $gap, $posY + $gap, $invenBlueItem]
		 If checkScreen($yelloItem, 50) Or checkScreen($blueItem, 50) Then
;~ 			MouseMove($posX, $posY) ; debug
;~ 			ContinueLoop ; debug

			If Not checkScreen($destroyOn) Then
			   MouseClick("left", $destroyOn[2], $destroyOn[3])
			   Sleep(300)
			EndIf

			MouseClick("left", $posX, $posY)
			Sleep(200)
			If checkScreen($yelloItem, 50) Or checkScreen($blueItem, 50) Then
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

   Sleep(1000)
   Send("{ESCAPE}")
   Sleep(1000)
EndFunc


; MISC Functions
Func SendScreenCapture($paintTitle, $fromX, $fromY, $toX, $toY)
   WinActivate($gameTitle)
   Send("{ALT}")
   Send("i")
   Sleep(2500)
   Send("{ALT DOWN}")
   Send("{PRINTSCREEN}")
   Send("{ALT UP}")
   Sleep(500)
   Send("i")
   WinActivate($paintTitle)
   ;Send("^e")
   ;Send("1{TAB}1{ENTER}")
   Send("^v")
   MouseMove(730, 800)
   MouseDown("left")
   MouseMove(60, 800)
   MouseUp("left")
   MouseMove(730, 800)
   MouseDown("left")
   MouseMove(500, 382)
   MouseUp("left")
   Send("^e")
   Sleep(100)
   Send("370")
   Send("{TAB}")
   Send("244")
   Send("{ENTER}")
   Sleep(100)
   Send("^s")
   Sleep(100)
   MouseMove($fromX, $fromY)
   MouseDown("left")
   MouseMOve($toX, $toY)
   MouseUp("left")
   Sleep(200)
   WinActivate($gameTitle)
EndFunc
