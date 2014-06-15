#include-once
#include <WindowsConstants.au3>
#include <WinAPI.au3>

$hWinDC = _WinAPI_GetWindowDC(0) ; DC of entire screen (desktop)
$hTextDC = _WinAPI_GetDC(0)

Func DrawRect($val)
   DrawRectRaw($val[0], $val[1], $val[2], $val[3], $val[4])
EndFunc

Func DrawRectRaw($x, $y, $w, $h, $c)
   Local $iWidth = 3
   Local $iColor = $c
   Local $hDC, $hPen, $o_Orig

;~    $hDC = _WinAPI_GetWindowDC(0) ; DC of entire screen (desktop)
   $hDC = $hWinDC
   $hPen = _WinAPI_CreatePen($PS_SOLID, $iWidth, $iColor)
   $o_Orig = _WinAPI_SelectObject($hDC, $hPen)

;~    _WinAPI_DrawLine($hDC, $x, $y, $x + $w, $y)
;~    _WinAPI_DrawLine($hDC, $x, $y, $x, $y + $h)
;~    _WinAPI_DrawLine($hDC, $x + $w, $y, $x + $w, $y + $h)
;~    _WinAPI_DrawLine($hDC, $x, $y + $h, $x + $w, $y + $h)
   _WinAPI_DrawLine($hDC, $x - 1, $y - 1, $x + $w + 1, $y - 1)
   _WinAPI_DrawLine($hDC, $x - 1, $y - 1, $x - 1, $y + $h + 1)
   _WinAPI_DrawLine($hDC, $x + $w + 1, $y - 1, $x + $w + 1, $y + $h - 1)
   _WinAPI_DrawLine($hDC, $x - 1, $y + $h + 1, $x + $w + 1, $y + $h + 1)
;~    _WinAPI_DrawLine($hDC, $x - 1, $y - 1, $x + $w + 1, $y - 1)
;~    _WinAPI_DrawLine($hDC, $x - 1, $y - 1, $x - 1, $y + $h + 1)
;~    _WinAPI_DrawLine($hDC, $x + $w + 1, $y - 1, $x + $w + 1, $y + $h + 1)
;~    _WinAPI_DrawLine($hDC, $x - 1, $y + $h + 1, $x + $w + 1, $y + $h + 1)

   _WinAPI_SelectObject($hDC, $o_Orig)
   _WinAPI_DeleteObject($hPen)
;~    _WinAPI_ReleaseDC(0, $hDC)
EndFunc

Func DrawTextOnMouseRight($text)
   Local $mousePos = MouseGetPos()
   DrawText($text, $mousePos[0], $mousePos[1])
EndFunc

Func DrawText($text, $x, $y, $w = 500, $h = 20, $fgColor = 0xFFFFFF, $bgColor = 0x000000)
   Local $rect = DllStructCreate($tagRect)
   DllStructSetData($rect, "Left", $x)
   DllStructSetData($rect, "Top", $y)
   DllStructSetData($rect, "Right", $x + $w)
   DllStructSetData($rect, "Bottom", $y + $h)
   Local $hFont = _WinAPI_CreateFont($h, 0, 0, 0, 500)
   Local $hOldFont = _WinAPI_SelectObject($hTextDC, $hFont)
   _WinAPI_SetTextColor($hTextDC, $fgColor)
   _WinAPI_SetBkColor($hTextDC, $bgColor)
   _WinAPI_DrawText($hTextDC, $text, $rect, $DT_LEFT)
   _WinAPI_SelectObject($hTextDC, $hOldFont)
   _WinAPI_DeleteObject($hFont)
EndFunc

Func InvalidateDesktop()
   _WinAPI_InvalidateRect(0, 0)
EndFunc

