#include-once
#include <DrawUtil.au3>

Func CheckScreen($screen, $drawRect = True)
   Local $defaultBounds = 3
   Local $s_x, $s_y, $e_x, $e_y, $color, $bounds
   $s_x = $screen[0]
   $s_y = $screen[1]
   $e_x = $screen[2]
   $e_y = $screen[3]
   $color = $screen[4]
   If UBound($screen) = 6 Then
	  $bounds = $screen[5]
   EndIf

   return CheckScreenRaw($s_x, $s_y, $e_x, $e_y, $color, $bounds, $drawRect)
EndFunc

Func CheckScreenRaw($s_x, $s_y, $e_x, $e_y, $color, $bounds, $drawRect = True)
   If $drawRect Then
	  DrawRectRaw($s_x, $s_y, $e_x - $s_x, $e_y - $s_y, $color)
;~    DrawText("¡¡", $e_x + 3, $s_y - 3, 500, 20, 0xFFFFFF, $color)
   EndIf

   Local $pos = PixelSearch($s_x, $s_y, $e_x, $e_y, $color, $bounds)
   
   If Not @error Then
	  Return True
   Else
	  Return False
   EndIf
EndFunc
