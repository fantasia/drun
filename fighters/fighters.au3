#NoTrayIon
Local $title = "[TITLE:Phone screen]"

HotKeySet("!q", "Quit")
Func Quit()
   Exit(0)
EndFunc


Func getMousePos()
   Local $wp = WinGetPos($title)
   Local $mp = MouseGetPos()
   Local $r[2] = [$mp[0] - $wp[0], $mp[1] - $wp[1]]
   return $r
EndFunc

Func getPixelColor($p)
   Local $wp = WinGetPos($title)
   Local $c = PixelGetColor($p[0] + $wp[0], $p[1] + $wp[1])
   return $c
EndFunc

Func testmove($p)
   Local $wp = WinGetPos($title)
   MouseMove($p[0] + $wp[0], $p[1] + $wp[1])
EndFunc

Func click($p)
   Local $wp = WinGetPos($title)
   MouseMove($p[0] + $wp[0], $p[1] + $wp[1])
   MouseClick("left")
EndFunc
   

Func checkPixel($screen, $bounds = 10)
   Local $wp = WinGetPos($title)
   $pos = PixelSearch($screen[0]+$wp[0], $screen[1]+$wp[1], $screen[2]+$wp[0], $screen[3]+$wp[1], $screen[4], $bounds)
   If Not @error Then 
	  return True
   Else
	  return False
   EndIf
EndFunc

Func waitScreen($screen, $bounds = 10)   
   While True
	  Local $wp = WinGetPos($title)
	  $pos = PixelSearch($screen[0]+$wp[0], $screen[1]+$wp[1], $screen[2]+$wp[0], $screen[3]+$wp[1], $screen[4], $bounds)
	  If Not @error Then 
		 MouseMove($pos[0], $pos[1], 10)
		 ConsoleWrite(@CRLF)
		 ExitLoop
	  Else
		 Local $retryScreen[5] = [397, 267, 399, 269, 0x0CB636]
		 $pos = PixelSearch($retryScreen[0]+$wp[0], $retryScreen[1]+$wp[1], $retryScreen[2]+$wp[0], $retryScreen[3]+$wp[1], $retryScreen[4], $bounds)
		 If Not @error Then 
			Local $retryBtn[2] = [366, 272]
			click($retryBtn)
		 EndIf
		 
		 Local $p = MouseGetPos()
		 MouseMove($p[0] + 1, $p[1])
		 ConsoleWrite(".")
		 Sleep(700)
	  EndIf
   WEnd
EndFunc

Func checkAndClick($s)
   If checkPixel($s) Then
	  Local $p[2] = [$s[0] + 3, $s[1] + 3]
	  click($p)
   EndIf
EndFunc



Local $checkStart1[5] = [172, 227, 174, 229, 0x4B363A]
Local $start1[5] = [600, 360, 602, 362, 0x024DA6]
Local $checkStart2[5] = [50, 241, 52, 243, 0x1D2535]
Local $start2[5] = [556, 345, 558, 347, 0x033F68]

Local $energyCheck1[5] = [34, 247, 36, 249, 0x06060C]
Local $energyCheck2[5] = [299, 252, 301, 254, 0x4D5969]

Local $autoDisable[5] = [31, 348, 41, 358, 0x147BDC]
Local $endGame[5] = [253, 348, 255, 350, 0x168D06]
Local $restart[5] = [600, 360, 602, 362, 0x024DA6]
Local $restartConfirm[5] = [347, 247, 349, 249, 0x014FA9]


Func runFighters()
   ConsoleWrite("wait start1" & @CRLF)
   waitScreen($checkStart1)
   Sleep(1000)
   click($start1)
   Sleep(300)
   click($start1)

   ConsoleWrite("wait start2" & @CRLF)
   waitScreen($checkStart2)
   Sleep(1000)
   click($start2)
   Sleep(300)
   click($start2)
   
   ConsoleWrite("energy check start" & @CRLF)
   While True
	  Sleep(2000)
	  If checkPixel($energyCheck1) And checkPixel($energyCheck2) Then
		 ConsoleWrite("energy check wait" & @CRLF)
		 click($energyCheck2)
		 Sleep(60000)
		 click($start2)
		 Sleep(300)
		 click($start2)
		 Sleep(1000)
	  Else
		 ConsoleWrite("energy check pass" & @CRLF)
		 ExitLoop
	  EndIf
   WEnd

   ConsoleWrite("wait $autoDisable" & @CRLF)
   waitScreen($autoDisable, 20)
   Sleep(300)
   click($autoDisable)

   ConsoleWrite("wait $endGame" & @CRLF)
   While True
	  Sleep(1000)
	  If checkPixel($endGame) Then
		 ExitLoop
	  EndIf
   WEnd
   
   ConsoleWrite("click restart" & @CRLF)
   click($endGame)
   
   ConsoleWrite("wait $restartConfirm" & @CRLF)
   waitScreen($restartConfirm)
   click($restartConfirm)
EndFunc

WinActivate($title)
WinMove($title, "", 0, 0)

While True
   runFighters()
WEnd
   