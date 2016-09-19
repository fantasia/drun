#include <ImageSearch.au3> 
HotKeySet("!q", "Quit")
HotKeySet("!w", "HotImageSearch")

Func HotImageSearch()
   ImageSearch("image/main.bmp")
EndFunc

global $y = 0, $x = 0
Func ImageSearch($bitmap) 
   ConsoleWrite( "ImageSearch " & $bitmap & @CRLF);
   Local $search = _ImageSearch($bitmap, 0, $x, $y, 0) ;¿ÃπÃ¡ˆ
   If $search = 1 Then
	  ConsoleWrite( "found!!" & @CRLF);
	  MouseMove($x, $y, 10)
   Else
	  ConsoleWrite( "not found!!" & @CRLF);
   EndIf
EndFunc

Func Quit()
   Exit(0)
EndFunc

;~ While 1
;~    Sleep(1000)
;~ WEnd

HotImageSearch()