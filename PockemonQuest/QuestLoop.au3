#include-once
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <Array.au3>

Func StartQuestLoop()
   InitPosition()

   Local $loopCount = 0
   While 1
	  $loopCount += 1
	  Sleep(2000)
	  ln("QuestLoopCount " & $loopCount)

	  If CheckQuestMain() Then
		 ContinueLoop
	  EndIf

	  If CheckQuestLevel() Then
		 ContinueLoop
	  EndIf

	  If CheckQuestFail() Then
		 ContinueLoop
	  EndIf

	  If CheckQuestFailCollect() Then
		 ContinueLoop
	  EndIf

	  If CheckQuestFailCollectYes() Then
		 ContinueLoop
	  EndIf

	  If CheckQuestRun() Then
		 UpdateStatus("QuestRun waiting for end. " & $loopCount)
		 ContinueLoop
	  EndIf

	  If CheckQuestResult() Then
		 ln("QuestComplete. ContinueGame")
		 ;ExitLoop
	  EndIf

	  UpdateStatus("Unknown Screen")
   WEnd
EndFunc

Func InitPosition()
   WinActivate($gameTitle)
   Local $w = WinGetPos($gameTitle)
   WinMove($gameTitle,"", $w[0], $w[1], $screenSize[0], $screenSize[1])
EndFunc

Func CheckQuestMain()
   If CheckScreen($checkQuestMain) Then
	  ln("Screen Find ==> QuestMain")
	  UpdateStatus("QuestMain. click stage")
	  LClick($clickQuestMain)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestLevel()
   If CheckScreen($checkQuestLevel) Then
	  ln("Screen Find ==> QuestLevel")
	  UpdateStatus("QuestLevel. click stage")
	  LClick($clickQuestMain)
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestRun()
   If CheckScreens($checkQuestRun) Then
	  ln("Screen Find ==> QuestRun")
	  LClick($clickQuestMain)
	  UpdateStatus("QuestRun waiting for end.")
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestFail()
   If CheckScreens($checkQuestFail) Then
	  ln("Screen Find ==> QuestFail")
	  LClick($clickQuestFail)
	  UpdateStatus("QuestFail")
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestFailCollect()
   If CheckScreens($checkQuestFailCollect) Then
	  ln("Screen Find ==> QuestFailCollect")
	  LClick($clickQuestFailCollect)
	  UpdateStatus("QuestFail - Collect")
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestFailCollectYes()
   If CheckScreens($checkQuestFailCollectYes) Then
	  ln("Screen Find ==> QuestFailCollectYes")
	  LClick($clickQuestFailCollectYes)
	  UpdateStatus("QuestFail - CollectYes")
	  Return True
   EndIf
   Return False
EndFunc

Func CheckQuestResult()
   If CheckScreens($checkQuestResult) Then
	  ln("Screen Find ==> QuestResult")
	  UpdateStatus("QuestResult 1/2. wait 2sec")
	  Sleep(2000)
	  LClick($clickQuestResult)
	  UpdateStatus("QuestResult 2/2. wait 4sec")
	  Sleep(4000)
	  LClick($clickQuestResult)
	  UpdateStatus("QuestResult done")
	  Return True
   EndIf
   Return False
EndFunc