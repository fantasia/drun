#include-once
#include <ImageSearch.au3> 
#include <DebugUtil.au3> 

Func CheckMain()
   ln("check Main " & ImageSearch("image/main.bmp", True))
EndFunc

Func CheckStage()
   ln("check Stage " & ImageSearch("image/stage.bmp", True))
EndFunc

Func CheckEpisode()   
   If ImageSearch("image/episode.bmp", False) Then
	  ln("check Episode True")
	  MouseClick("left", 1200, 680)
   EndIf
EndFunc

Func CheckSelectFriend()   
   If ImageSearch("image/select_friend.bmp", False) Then
	  ln("check Select Friend True")
	  MouseClick("left", 1200, 680)
   EndIf
EndFunc

Func CheckLevelUp()   
   If ImageSearch("image/level_up.bmp", False) Then
	  ln("check Level Up True")
	  MouseClick("left", 800, 680)
   EndIf
EndFunc

Func CheckAutoDisable()
   ln("check AutoDisable " & ImageSearch("image/auto_disable.bmp", True))
EndFunc

Func CheckEnergy()
   If ImageSearch("image/energy.bmp", False) Then
	  ln("check energy wait")
	  MouseClick("left", 600, 480)
	  Sleep(5000)
   EndIf
EndFunc

Func CheckRetry()
   ln("check Retry " & ImageSearch("image/retry.bmp", True))
EndFunc

Func CheckRetryConfirm()
   ln("check Retry Confirm " & ImageSearch("image/retry_confirm.bmp", True))
EndFunc


Func ImageSearch($bitmap, $click) 
   Local $y = 0
   Local $x = 0
   ln( "@ImageSearch " & $bitmap);
   Local $search = _ImageSearch($bitmap, 0, $x, $y, 0) ;¿ÃπÃ¡ˆ
   If $search = 1 Then
	  MouseMove($x, $y, 10)
	  If $click Then
		 MouseClick("left")
	  EndIf
	  Return True
   Else
	  Return False
   EndIf
EndFunc

While True
CheckMain()
CheckStage()

CheckEpisode()
CheckSelectFriend()
CheckEnergy()
CheckAutoDisable()
CheckLevelUp()
CheckRetry()
CheckRetryConfirm()

Sleep(2000)
WEnd