#include-once

Func Quit()
   Exit(0)
EndFunc

Func l($msg)
   ConsoleWrite(@HOUR & ":" & @MIN & ":" & @SEC & " " & $msg)
EndFunc

Func ln($msg)
   ConsoleWrite(@HOUR & ":" & @MIN & ":" & @SEC & "." & @MSEC & " " & $msg & @CRLF)
EndFunc

HotKeySet("!q", "Quit")
HotKeySet("^1", "StartMakeParam")
HotKeySet("^2", "EndMakeParam")

