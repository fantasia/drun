#include-once
#include <WindowsConstants.au3>
#include <WinAPI.au3>

Func DrawRect($val)
   DrawRectRaw($val[0], $val[1], $val[2], $val[3], $val[4])
EndFunc

Func DrawRectRaw($x, $y, $w, $h, $c)
   Local $iWidth = 2
   Local $iColor = $c
   Local $hDC, $hPen, $o_Orig

   $hDC = _WinAPI_GetWindowDC(0) ; DC of entire screen (desktop)
   $hPen = _WinAPI_CreatePen($PS_SOLID, $iWidth, $iColor)
   $o_Orig = _WinAPI_SelectObject($hDC, $hPen)

   _WinAPI_DrawLine($hDC, $x, $y, $x + $w, $y)
   _WinAPI_DrawLine($hDC, $x, $y, $x, $y + $h)
   _WinAPI_DrawLine($hDC, $x + $w, $y, $x + $w, $y + $h)
   _WinAPI_DrawLine($hDC, $x, $y + $h, $x + $w, $y + $h)

   _WinAPI_SelectObject($hDC, $o_Orig)
   _WinAPI_DeleteObject($hPen)
   _WinAPI_ReleaseDC(0, $hDC)
EndFunc

Func DrawTextOnMouseRight($text)
   Local $mousePos = MouseGetPos()
   DrawText($text, $mousePos[0], $mousePos[1])
EndFunc

Func DrawText($text, $x, $y, $w = 500, $h = 50, $fgColor = 0xFFFFFF, $bgColor = 0x000000)
   Local $hDC = _WinAPI_GetDC(0)
   Local $rect = DllStructCreate($tagRect)
   DllStructSetData($rect, "Left", $x)
   DllStructSetData($rect, "Top", $y)
   DllStructSetData($rect, "Right", $x + $w)
   DllStructSetData($rect, "Bottom", $y + $h)
   Local $hFont = _WinAPI_CreateFont(20, 0, 0, 0, 500)
   Local $hOldFont = _WinAPI_SelectObject($hDC, $hFont)
   _WinAPI_SetTextColor($hDC, $fgColor)
   _WinAPI_SetBkColor($hDC, $bgColor)
   
   _WinAPI_DrawText($hDC, $text, $rect, $DT_LEFT)
  
   _WinAPI_SelectObject($hDC, $hOldFont)
   _WinAPI_DeleteObject($hFont)
   _WinAPI_ReleaseDC(0, $hDC)
EndFunc

