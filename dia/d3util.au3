#include-once

Func Quit()
   Exit(0)
EndFunc

Func l($msg)
   ConsoleWrite(@HOUR & ":" & @MIN & ":" & @SEC & " " & $msg)
EndFunc

Func ln($msg)
   ConsoleWrite(@HOUR & ":" & @MIN & ":" & @SEC & " " & $msg & @CRLF)
EndFunc

HotKeySet("!q", "Quit")
