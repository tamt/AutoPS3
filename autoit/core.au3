#include <CommMG.au3>
#include <cronus.au3>
#include <aps3.au3>

Func DoAction($act)
	Local $times = Int(StringMid($act, StringInStr($act, "_",0,-1) + 1))
	$act = StringMid($act, 1, StringInStr($act, "_",0,-1)-1)
	ConsoleWrite($act &",次数:"&$times&@CRLF)
	If StringLeft($act, 3)="kb_" Then
		;teensy键盘要执行
		$act = StringMid($act, 4)
		PS3KeySequence($act, $times)
	ElseIf StringLeft($act, 3)="cr_" Then
		;cronusmax要执行
		$act = StringMid($act, 4)
		CronusPressButton($act,$times)
	ElseIf StringLeft($act, 3)="pc_" Then
		;pc要执行的
		$act = StringMid($act, 4)
		;等待指定时间
		If StringInStr($act,"wait_")=1 Then
			Sleep(Int(StringMid($act, 6)))
		;载入aps3文件，并且执行
		ElseIf StringInStr($act,"aps3_")=1 Then
			Local $aps3 = StringMid($act, 6)
			Local $aps3_actStr = aps3_readFromFile(@ScriptDir&"\aps3\"&$aps3)
			Local $act_arr = StringSplit($aps3_actStr, "|")
			Local $a = 1
			For $a=1 To $act_arr[0]
				DoAction($act_arr[$a])
			Next
		EndIf
	EndIf
EndFunc

;顺序执行按键
Func PS3KeySequence($keystrokes, $times = 1)
	Local $keyarray = StringSplit($keystrokes,",")
	For $i=1 To $keyarray[0]
		If StringInStr($keyarray[$i],"text_")=1 Then
			PS3InputText(StringMid($keyarray[$i], 6), $times)
		ElseIf $keyarray[$i]<>"" Then
			PS3Press($keyarray[$i], $times)
		EndIf
	Next
EndFunc

;向teensy发出按键,支持的按键有:up,down,left,right,esc,enter,backspace,delall,del,ps,tab
Func PS3Press($btn, $times)
	For $i=1 To $times
		If StringInStr($btn,"code_")=1 Then
			_CommSendByte(Int(StringMid($btn, 6)))
		EndIf
		Switch $btn
			Case "esc"
				_CommSendByte(177)
			Case "enter"
				_CommSendString(@CRLF)
			Case "backspace"
				_CommSendByte(178)
			Case "tab"
				_CommSendByte(179)
			Case "left"
				_CommSendByte(216)
			Case "up"
				_CommSendByte(218)
			Case "right"
				_CommSendByte(215)
			Case "down"
				_CommSendByte(217)
			Case "delall"
				_CommSendByte(206)
			Case "ps"
				_CommSendByte(207)
			Case "triangle"
				_CommSendByte(194)
			Case "square"
				_CommSendByte(195)
			Case "circle"
				;enter
				_CommSendString(@CRLF)
			Case "cross"
				;esc
				_CommSendByte(177)
			Case "del"
				_CommSendByte(212)
		EndSwitch

		Sleep(50)
	Next
EndFunc

;输入字母
Func PS3InputText($text, $times)
	For $i=1 To $times
		_CommSendString($text)
		Sleep(50)
	Next
EndFunc