#include <ImageSearch.au3> 
HotKeySet("!q", "Quit")
;~ HotKeySet("!w", "MousePos")
HotKeySet("!w", "ImageSearch")
HotKeySet("^r", "Test")

Func Test()
   WinActivate("[TITLE:Phone screen]")
;~    Send("^a")
;~    MouseMove(888, 869)
;~    MouseDown("left")
;~    MOuseMove(600, 869)
;~    MouseUp("left")
;~    Send("^e")
;~    Send("600")
;~    Send("{ENTER}")
EndFunc

global $y = 0, $x = 0
Func ImageSearch() 
   Local $search = _ImageSearch("next.bmp", 0, $x, $y, 0) ;¿ÃπÃ¡ˆ
   If $search = 1 Then
	  ConsoleWrite( "found!!" & @CRLF);
	  MouseMove($x, $y, 10)
   ElseIf
	  ConsoleWrite( "not found!!" & @CRLF);
   EndIf
EndFunc

Func MousePos() 
   Local $p = MouseGetPos()
   ConsoleWrite( $p[0] & ", " & $p[1] & @CRLF);
EndFunc


Func Quit()
   Exit(0)
EndFunc


While 1
   Sleep(1000)
WEnd
   