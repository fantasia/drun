#include-once

Func LClick($param)
   Local $w = WinGetPos("[ACTIVE]")
   local $x = $w[0] + Round($w[2] * $param[0] / 100)
   Local $y = $w[1] + Round($w[3] * $param[1] / 100)
   MouseClick("left", $x, $y)
EndFunc

Func LDClick($param)
   Local $w = WinGetPos("[ACTIVE]")
   local $x = $w[0] + Round($w[2] * $param[0] / 100)
   Local $y = $w[1] + Round($w[3] * $param[1] / 100)
   MouseClick("left", $x, $y)
   MouseClick("left", $x, $y)
EndFunc

Func CheckScreens($checkScreenParams)
   Local $length = UBound($checkScreenParams)
   Local $paramCount = Floor($length / 3)

   For $i = 0 To $paramCount - 1 Step 1
	  Local $param[3] = [$checkScreenParams[$i*3+0], $checkScreenParams[$i*3+1], $checkScreenParams[$i*3 + 2]]
	  If CheckScreen($param) Then
		 ContinueLoop
	  Else
		 Return False
	  EndIf
   Next

   Return True

EndFunc

Func CheckScreen($checkScreenParam)
   Local $w = WinGetPos("[ACTIVE]")
   Local $pixelArea = 3
   Local $colorBounds = 3

   Local $s_x, $s_y, $e_x, $e_y, $color
   $s_x = $w[0] + Round($w[2] * $checkScreenParam[0] / 100) - $pixelArea
   $s_y = $w[1] + Round($w[3] * $checkScreenParam[1] / 100) - $pixelArea
   $e_x = $w[0] + Round($w[2] * $checkScreenParam[0] / 100) + $pixelArea
   $e_y = $w[1] + Round($w[3] * $checkScreenParam[1] / 100) + $pixelArea
   $color = $checkScreenParam[2]

   return CheckScreenRaw($s_x, $s_y, $e_x, $e_y, $color, $colorBounds)
EndFunc

Func CheckScreenRaw($s_x, $s_y, $e_x, $e_y, $color, $colorBounds)
   ;ln("CheckScreenRaw() " & $s_x & ", " & $s_y & ", " &  $e_x & ", " &  $e_y & ", " &  Hex($color, 6) & ", " &  $colorBounds)
   Local $pos = PixelSearch($s_x, $s_y, $e_x, $e_y, $color, $colorBounds)

   If Not @error Then
	  Return True
   Else
	  Return False
   EndIf
EndFunc
