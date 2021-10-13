#include-once
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <Array.au3>

Func InitPosition()
   WinActivate($gameTitle)
   Local $w = WinGetPos($gameTitle)
   WinMove($gameTitle,"", $w[0], $w[1], $screenSize[0], $screenSize[1])
EndFunc

Func StartQuestLoop()
   InitPosition()

   Local $loopCount = 0
   While 1
	  If $loopCount > 0 Then
		 Sleep(2000)
	  EndIf

	  $loopCount += 1
	  ln("QuestLoopCount " & $loopCount)

	  If CheckAndClick("QuestMain", $checkQuestMain, $clickQuestMain) Then
		 ContinueLoop
	  EndIf

	  If CheckAndClick("QuestFail", $checkQuestFail) Then
		 ContinueLoop
	  EndIf

	  If CheckAndClick("QuestFailCollect", $checkQuestFailCollect) Then
		 ContinueLoop
	  EndIf

	  If CheckAndClick("QuestFailCollectYes", $checkQuestFailCollectYes) Then
		 ContinueLoop
	  EndIf

	  If CheckAndClick("QuestResult", $checkQuestResult, $clickQuestResult) Then
		 ContinueLoop
	  EndIf

	  If CheckAndClick("RefillBattery", $checkRefillBattery) Then
		 ContinueLoop
	  EndIf

	  If CheckAndClick("QuestRun", $checkQuestRun, $clickQuestMain) Then
		 UpdateStatus("QuestRun waiting for end. " & $loopCount)
		 ContinueLoop
	  EndIf

	  UpdateStatus("Unknown Screen")
   WEnd
EndFunc
