#include <MsgBoxConstants.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>


Func StartCronusApp()
	$cronus_title_str = "Cronus Pro"
	If WinExists($cronus_title_str) Then
	Else
		Run("C:\Program Files (x86)\CronusPRO\Cronus.exe")
		Sleep(3000)
	EndIf
EndFunc

Func CronusStartXAIM()
	$xaim_title_str = "X-AIM Plugin"
	If WinExists($xaim_title_str) Then
		WinActivate($xaim_title_str)
	Else
		$cronus_title_str = "Cronus Pro"
		If WinExists($cronus_title_str) Then
			WinActivate($cronus_title_str)
			Send("!{F2}")
			Sleep(500)
			If WinExists($xaim_title_str) Then
				WinActivate($xaim_title_str)
			EndIf
		Else
			StartCronusApp()
			CronusStartXAIM()
		EndIf
	EndIf
EndFunc

Func CronusPressButton($btn,$times)
	CronusStartXAIM()

	Local $ox = 12
	Local $oy = 12 + 45

	Switch $btn
		Case "l2"
			CronusMouseClick(116+$ox, 60+$oy,$times)
		Case "r2"
			CronusMouseClick(359+$ox, 60+$oy,$times)
		Case "l1"
			CronusMouseClick(116+$ox, 111+$oy,$times)
		Case "r1"
			CronusMouseClick(359+$ox, 111+$oy,$times)
		Case "up"
			CronusMouseClick(114+$ox, 171+$oy,$times)
		Case "down"
			CronusMouseClick(114+$ox, 223+$oy,$times)
		Case "left"
			CronusMouseClick(88+$ox, 197+$oy,$times)
		Case "right"
			CronusMouseClick(140+$ox, 197+$oy,$times)
		Case "select"
			CronusMouseClick(200+$ox, 197+$oy,$times)
		Case "start"
			CronusMouseClick(275+$ox, 197+$oy,$times)
		Case "ps"
			CronusMouseClick(237+$ox, 222+$oy,$times)
		Case "triangle"
			CronusMouseClick(360+$ox, 166+$oy,$times)
		Case "circle"
			CronusMouseClick(395+$ox, 197+$oy,$times)
		Case "cross"
			CronusMouseClick(361+$ox, 229+$oy,$times)
		Case "square"
			CronusMouseClick(326+$ox, 197+$oy,$times)
	EndSwitch
EndFunc

Func CronusMouseClick($px,$py,$times)
	AutoItSetOption("MouseCoordMode", 0)
	MouseMove($px,$py, 1)
	MouseDown("left")
	Sleep(100)
	MouseUp("left")
EndFunc