#include-once
#include <d3util.au3>
#include <d3func.au3>

Func InitPosition()
   WinActivate($gameTitle)
   WinMove($gameTitle,"", 0, 0, $screenSize[0], $screenSize[1])
EndFunc

Func ExitMainScreen()
   Send("{ESCAPE}")
   ln("wait $exitMainScreen")
   waitScreen($exitMainScreen,10)
   MouseClick("left", 173, 360)
   ln("wait $mainScreen")
   waitScreen($mainScreen,10)
EndFunc

Func QuestChange()
   MouseClick("left", 164, 416)
   ln("wait $gameSettingScreen")
   waitScreen($gameSettingScreen, 10)
   ln("quest change")
   MouseClick("left", 633, 477)
   Sleep(300)
   MouseClick("left", 548, 435)
   Sleep(300)
   MouseClick("left", 544, 511)
   Sleep(300)
   MouseClick("left", 563, 548)
   Sleep(300)
   MouseClick("left", 571, 465)
   Sleep(300)
   MouseClick("left", 518, 609)
   Sleep(300)
   ln("wait $mainScreen")
   waitScreen($mainScreen,10)
EndFunc

Func StartGame()
   Sleep(700)
   MouseClick("left", 118, 374)
   l("wait $startBase")
   waitScreen($startBase)
   Sleep(1400)
EndFunc

Func SelectMap()
   Sleep(700)
   Send("m")
   ln("wait $questMap")
   waitScreen($questMap, 50)
   MouseClick("left", 461, 551)

   ln("wait $map1")
   waitScreen($map1, 50)
   Sleep(3000)
EndFunc

Func GotoMap2()
   MouseMove(1060, 232)
   MouseClick("left")
   Sleep(2400)
   MouseMove(644, 338)
   MouseClick("left")
   Sleep(1000)
   MouseMove(644, 338)
   MouseClick("left")
   Sleep(4000)
;~    ln("wait $map2")
;~    waitScreen($map2, 10)
EndFunc

Func GotoGhom()
   ln("goto $ghom")
   ; goto ghom
   MouseClick("left", 1144, 94)
   Sleep(2000)
   MouseClick("left", 1144, 94)
   Sleep(2000)
   MouseClick("left", 1144, 94)
   Sleep(2000)
   MouseClick("left", 1144, 94)
   Sleep(2000)
   l("wait $ghom")
   waitScreen($ghom, 20)
   Sleep(2000)
EndFunc

Func ReturnBase()
   ; return base
   Send("t")
   l("wait $endBase")
   WaitScreen($endBase, 50)
   Sleep(Random(4000, 5000, 1))
   Send("{ESCAPE}")
EndFunc

Func GotoDestroy()
   MouseMove(1124, 104)
   MouseClick("left")
   Sleep(3000)
   waitScreen($inven)
EndFunc

Func ToggleItems()
   ln("toggle item")
   ToggleItem($itemLegend, 3)
   ToggleItem($itemSet, 30)
;~    ToggleItem($itemYellow, 10, False)
;~    ToggleItem($itemBlue, 10, False)
EndFunc

Func FullCycle()
   ExitMainScreen()
   QuestChange()
   StartGame()
   SelectMap()
   GotoMap2()
   GotoGhom()

;~    BattleWizard()
   Sleep(4000)
   BattleDevilHunter()
;~    BattleBudu()
   Sleep(3000)

;~    Send("{PRINTSCREEN}")
   ToggleItems()
;~    Send("{PRINTSCREEN}")

;~    MouseClick("left")
;~    Sleep(200)

   Sleep(2000)
   ReturnBase()

;~    GotoDestroy()
;~    DestroyItem()

   Sleep(2400)
EndFunc

Func StartGhomRun()
   Local $runCount = 0
   While True
	  $runCount += 1
	  ln("----------------------------------------")
	  ln("RunCount : " & $runCount)
	  FullCycle()
   WEnd
EndFunc


