#include-once
#include <D3RunCtrl.au3>
#include <ScreenUtil.au3>
#include <DebugUtil.au3>
#include <D3RunFunc.au3>
#include <D3RunBattle.au3>

ShowMainControlPannel()

Global $callback[1] = ["Dummy"]
Global $battleFunc = "BattleDevilHunter"

Func CallbackClear()
   While UBound($callback) > 1
	  _ArrayDelete($callback, 1)
   WEnd
;~    ln("CallbackClear() " & UBound($callback))
EndFunc

Func CallbackAdd($condition, $action)
   Local $cb[2] = [$condition, $action]
   _ArrayAdd($callback, $cb)
EndFunc

Func Test()
   CallbackAdd("CheckMainScreen", "QuestChange")
EndFunc

Func Test1()
   return CheckScreenRaw(100, 100, 105, 105, 0x00FF00, 5)
EndFunc

Func Test2()
   CallbackClear()
   ln("Test2() CallbackClear()")
EndFunc

Local $iMsg = 0
Local $lastCheckedSec = 0
While 1
   $iMsg = GUIGetMsg()
   Switch $iMsg
	  Case $GUI_EVENT_CLOSE
		 ExitLoop
   EndSwitch

   If $lastCheckedSec <> @SEC Then
	  $lastCheckedSec = @SEC
	  For $i = 1 To UBound($callback) - 1 Step 1
		 Local $func = $callback[$i]
;~ 		 ln("Main Call : " & $func[0])
		 If Call($func[0]) Then
;~ 			ln("Main Call : " & $func[0] & " => " & $func[1])
			Call($func[1])
		 EndIf
	  Next
   EndIf

   If $iMsg > 0 Then
	  InitPosition()
	  Local $controlText = GUICtrlRead($iMsg)
	  ln($controlText & "() ret=" & Call($controlText))
   EndIf
WEnd

