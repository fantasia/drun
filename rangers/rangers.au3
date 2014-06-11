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

Local $feather[5] = [186, 39, 188, 41, 0xF4E28E]
;Local $stageBtn[2] = [200, 143]
Local $stageBtn[2] = [106, 143] ; stage 104
Local $selectItem[5] = [237, 230, 239, 232, 0x0ABCCB]
Local $nextBtn[2] = [238, 231]
Local $selectFriend[5] = [238, 229, 240, 231, 0x05C232]
Local $startBtn[2] = [239, 230]
Local $playGame[5] = [43, 137, 45, 139, 0xFFD93B]

Local $stageMap[5] = [91, 57, 93, 59, 0xF8E03E] ; back button
Local $mainScreen[5] = [92, 319, 94, 321, 0x8E4630]
Local $myTeam[5] = [72, 240, 74, 242, 0xC8A270]
Local $latestBtn[2] = [624, 251]
Local $lastRanger[5] = [110, 286, 112, 288, 0xA45E38]
Local $sellBtn[5] = [423, 290, 425, 292, 0x0EBA2A]
Local $sellOk[5] = [329, 273, 331, 275, 0x0CB636]
Local $mainStartBtn[2] = [603, 322]

Local $mineralActive[5] = [335, 217, 337, 219, 0x65EDF9]
Local $missleActive[5] = [73, 206, 75, 208, 0xB1B1B1]

;yellow 0xFAF036
;brown 0x672E14
Local $c1[5] = [101, 210, 103, 212, 0xFAF036]
Local $c2[5] = [144, 210, 146, 212, 0xDECF01]
Local $c3[5] = [185, 210, 187, 212, 0xFAF036]
Local $c4[5] = [228, 210, 230, 212, 0xFAF036]
Local $c5[5] = [270, 210, 272, 212, 0xFAF036]

Local $endGame[5] = [138, 230, 140, 232, 0xB00400]
Local $roulette[5] = [178, 219, 180, 221, 0x05C232]
Local $rouletteOk[5] = [221, 219, 223, 221, 0x05C232]

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

   ConsoleWrite("click MineralActive" & @CRLF)
   For $i = 1 To 27 Step 1
	  click($mineralActive)
	  Sleep(400)
   Next

   While True
	  checkAndClick($c1)
	  Sleep(20)
	  checkAndClick($c2)
	  Sleep(20)
	  checkAndClick($c3)
	  Sleep(20)
	  checkAndClick($c4)
	  Sleep(20)
;	  checkAndClick($c5)
;	  Sleep(20)
	  checkAndClick($missleActive)
	  Sleep(20)
	  If checkPixel($endGame) Then
		 ExitLoop
	  EndIf
   WEnd

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
   Sleep(2000)
   click($rouletteOk)


;~    ConsoleWrite("wait : $stageMap" & @CRLF)
;~    waitScreen($stageMap)
;~    click($stageMap)
;~    ConsoleWrite("wait : $mainScreen" & @CRLF)
;~    waitScreen($mainScreen)
;~    click($mainScreen)
;~    ConsoleWrite("wait : $myTeam" & @CRLF)
;~    waitScreen($myTeam)
;~    click($latestBtn)
;~    Sleep(1000)

;~    If checkPixel($lastRanger) Then
;~ 	  ConsoleWrite("sell ranger" & @CRLF)
;~ 	  click($lastRanger)
;~ 	  ConsoleWrite("wait : $sellBtn" & @CRLF)
;~ 	  waitScreen($sellBtn)
;~ 	  click($sellBtn)
;~ 	  ConsoleWrite("wait : $sellBtn" & @CRLF)
;~ 	  waitScreen($sellBtn)
;~ 	  click($sellBtn)
;~ 	  ConsoleWrite("wait : $sellOk" & @CRLF)
;~ 	  waitScreen($sellOk)
;~ 	  click($sellOk)
;~    EndIf

;~    ConsoleWrite("wait : $stageMap" & @CRLF)
;~    waitScreen($stageMap)
;~    click($stageMap)
;~    ConsoleWrite("wait : $mainScreen" & @CRLF)
;~    waitScreen($mainScreen)
;~    click($mainStartBtn)
;~    Sleep(5000)

EndFunc

Local $p = WinGetPos($title)
WinActive($title, "")

;~ While 1
;~    Sleep(1000)
;~ WEnd

While True
   runRangers()
WEnd
