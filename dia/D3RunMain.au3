#include-once
#include <D3RunCtrl.au3>

ShowMainControlPannel()

Global $callback[1] = ["Dummy"]

Func CallbackClear()
   While UBound($callback) > 1
	  _ArrayDelete($callback, 1)
   WEnd
EndFunc

Func CallbackAdd($condition, $action)
   Local $cb[2] = [$condition, $action]
   _ArrayAdd($callback, $cb)
EndFunc

Local $iMsg = 0
While 1
   $iMsg = GUIGetMsg()
   Switch $iMsg
	  Case $GUI_EVENT_CLOSE
		 ExitLoop
   EndSwitch

    For $i = 1 To UBound($callback) - 1 Step 1
	  Local $func = $callback[$i]
	  If Call($func[0]) Then
		 Call($func[1])
	  EndIf
    Next

   If $iMsg > 0 Then
	  InitPosition()
	  Local $controlText = GUICtrlRead($iMsg)
	  ln($controlText & "() ret=" & Call($controlText))
   EndIf
WEnd

