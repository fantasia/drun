#NoTrayIon
Local $title = "[TITLE:BlueStacks]"

HotKeySet("!w", "MousePos")
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

Func MousePos()
   Local $p = getMousePos()
   Local $g = 1
   Local $c = getPixelColor($p)
   ConsoleWrite($p[0] - $g & ", " & $p[1] - $g & ", " & $p[0] + $g & ", " & $p[1] + $g & ", 0x" & Hex($c, 6))
   ConsoleWrite(", " & $p[0] & ", " & $p[1] & @CRLF)
EndFunc

Func testmove($p)
   Local $wp = WinGetPos($title)
   MouseMove($p[0] + $wp[0], $p[1] + $wp[1])
EndFunc

Func click($p)
   Local $wp = WinGetPos($title)
   MouseMove($p[0] + $wp[0], $p[1] + $wp[1], 5)
   MouseClick("left")
EndFunc


Func checkPixel($screen, $bounds = 20)
   Local $wp = WinGetPos($title)
   $pos = PixelSearch($screen[0]+$wp[0], $screen[1]+$wp[1], $screen[2]+$wp[0], $screen[3]+$wp[1], $screen[4], $bounds)
   If Not @error Then
	  return True
   Else
	  return False
   EndIf
EndFunc

Func waitScreen($screen, $bounds = 20)
   While True
	  Local $wp = WinGetPos($title)
	  $pos = PixelSearch($screen[0]+$wp[0], $screen[1]+$wp[1], $screen[2]+$wp[0], $screen[3]+$wp[1], $screen[4], $bounds)
	  If Not @error Then
		 MouseMove($pos[0], $pos[1], 10)
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
		 Sleep(300)
	  EndIf
   WEnd
EndFunc

Func checkAndClick($s)
   If checkPixel($s) Then
	  Local $p[2] = [$s[0] + 3, $s[1] + 3]
	  click($p)
   EndIf
EndFunc

Local $battleStage[5] = [279, 214, 281, 216, 0xCF0F00]
Local $battleMode = False

If checkPixel($battleStage) Then
   $battleMode = True
   ConsoleWrite("MODE : battle" & @CRLF)
Else
   ConsoleWrite("MODE : normal" & @CRLF)
EndIf

; switch battle/normal mode
If $battleMode Then
   Local $stageBtn[2] = [283, 213] ; battle
   Local $endGame[5] = [152, 231, 154, 233, 0x8E07B3] ; battle
Else
   Local $stageBtn[2] = [200, 143] ; center stage
   Local $endGame[5] = [138, 230, 140, 232, 0xB00400] ; normal
EndIf

Local $feather[5] = [186, 39, 188, 41, 0xF4E28E]
Local $selectItem[5] = [237, 230, 239, 232, 0x0ABCCB]
Local $nextBtn[2] = [238, 231]
Local $selectFriend[5] = [238, 229, 240, 231, 0x05C232]
Local $startBtn[2] = [239, 230]
Local $playGame[5] = [43, 137, 45, 139, 0xFFD93B]
Local $autoBtn[5] = [381, 77, 383, 79, 0xB7BABD]
Local $playGame[5] = [50, 152, 52, 154, 0xFFD93B]
Local $roulette[5] = [178, 219, 180, 221, 0x05C232]
Local $rouletteOk[5] = [221, 219, 223, 221, 0x05C232]

Local $c1[2] = [102, 211]

Func runRangers()
   ConsoleWrite("wait : feather" & @CRLF)
   waitScreen($feather)
   ConsoleWrite("wait : stageBtn" & @CRLF)
   click($stageBtn)
   ConsoleWrite("wait : selectItem" & @CRLF)
   waitScreen($selectItem)
   ConsoleWrite("wait : nextBtn" & @CRLF)
   click($nextBtn)
   ConsoleWrite("wait : selectFriend" & @CRLF)
   waitScreen($selectFriend)
   click($startBtn)
   ConsoleWrite("wait : playGame" & @CRLF)
   waitScreen($playGame)

   For $i = 1 To 20 Step 1
	  Sleep(300)
	  click($c1)
   Next

   While True
	  Sleep(10000)
	  If checkPixel($endGame) Then
		 ExitLoop
	  EndIf
   WEnd

   If Not $battleMode Then
	  Sleep(3000)
	  click($roulette)
	  ConsoleWrite("wait : $roulette" & @CRLF)
	  waitScreen($roulette)
	  Sleep(1000)
	  click($roulette)
	  ConsoleWrite("wait : $rouletteOk" & @CRLF)
	  waitScreen($rouletteOk, 50)
	  Sleep(2000)
	  click($rouletteOk)
   EndIf

   Sleep(2000)
   click($rouletteOk)
   Sleep(2000)
EndFunc

Local $p = WinGetPos($title)
WinActive($title, "")

;~ While 1
;~    Sleep(1000)
;~ WEnd

While True
   runRangers()
WEnd
