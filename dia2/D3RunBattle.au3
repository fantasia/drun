#include-once
#include <DebugUtil.au3>

Func BattleDevilHunter()
   CallbackClear()
   
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
	  Sleep(200)
	  Send("3")
	  Sleep(200)
	  Send("4")
	  Sleep(200)
	  MouseClick("right")
	  Sleep(200)

;~ 	  Send("{LSHIFT down}")
;~ 	  MouseDown("left")

	  For $i = 1 To 5 Step 1
		 Sleep(1000)
		 If CheckScreen($questComplete) Then
;~ 			MouseUp("left")
;~ 			Send("{LSHIFT up}")
			ConsoleWrite("end " & @CRLF )
			Return
		 EndIf
	  Next
;~ 	  MouseUp("left")
;~ 	  Send("{LSHIFT up}")

	  MouseClick("right")
	  Sleep(200)
	  Send("2")
	  Sleep(200)
   WEnd
EndFunc

Func BattleBudu()
   CallbackClear()
   
   l("battle ")
   Sleep(4500)

   MouseMove(672, 283, 10)
   Sleep(500)

   Local $battleLoop = 0
   While True
	  MouseMove(672, 283, 10)
	  $battleLoop += 1
	  ConsoleWrite($battleLoop & " " )

	  Send("1")
	  Sleep(400)
	  Send("2")
	  Sleep(400)
	  Send("3")
	  Sleep(700)
	  Send("4")
	  Sleep(400)
	  MouseClick("right")
	  Sleep(400)

	  For $i = 1 To 10 Step 1
		 Sleep(1000)
		 If CheckScreen($questComplete) Then
			ConsoleWrite("end " & @CRLF )
			Return
		 EndIf
	  Next
   WEnd
EndFunc
