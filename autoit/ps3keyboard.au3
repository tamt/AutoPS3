#include <CommMG.au3>
#include <Array.au3>

#include <cronus.au3>

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=d:\work\autops3\autoit\keyboard.kxf
$Form1_1 = GUICreate("PS3键盘", 971, 532, 218, 155)
$Label1 = GUICtrlCreateLabel("端口 COM", 16, 16, 55, 17)
$ctrl_portNum = GUICtrlCreateCombo("3", 72, 16, 41, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20")
$Label2 = GUICtrlCreateLabel("波特率", 128, 16, 40, 17)
$ctrl_boBaud = GUICtrlCreateCombo("38400", 168, 16, 65, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "9600|14400|19200|38400|56000|57600|115200")
$ctrl_comm = GUICtrlCreateButton("OK", 256, 16, 75, 25)
$Label3 = GUICtrlCreateLabel("向PS3输入：", 16, 48, 72, 17)
$ctrl_esc = GUICtrlCreateButton("Esc", 256, 72, 75, 25)
$ctrl_enter = GUICtrlCreateButton("Enter", 352, 72, 75, 25)
$ctrl_back = GUICtrlCreateButton("Backspace", 256, 120, 75, 25)
$ctrl_tab = GUICtrlCreateButton("tab", 352, 120, 75, 25)
$ctrl_up = GUICtrlCreateButton("↑", 328, 168, 35, 33)
$ctrl_left = GUICtrlCreateButton("←", 288, 208, 35, 33)
$ctrl_right = GUICtrlCreateButton("→", 368, 208, 35, 33)
$ctrl_down = GUICtrlCreateButton("↓", 328, 208, 35, 33)
$ctrl_okInput = GUICtrlCreateButton("确定", 168, 176, 75, 25)
$ctrl_text = GUICtrlCreateEdit("", 16, 72, 217, 89)
GUICtrlSetData(-1, "")
$ctrl_commStats = GUICtrlCreateLabel(".........................................", 344, 16, 127, 17)
$ctrl_ascii = GUICtrlCreateInput("13", 104, 216, 49, 21)
$Label4 = GUICtrlCreateLabel("直接输入键值:", 16, 216, 79, 17)
$ctrl_okAscii = GUICtrlCreateButton("确定", 168, 216, 75, 25)
$Label5 = GUICtrlCreateLabel("CommSendString", 16, 264, 85, 17)
$ctrl_close = GUICtrlCreateButton("关闭串口", 480, 16, 75, 25)
$ctrl_str = GUICtrlCreateInput("\r\n", 104, 264, 73, 21)
$ctrl_okStr = GUICtrlCreateButton("确定", 192, 264, 75, 25)
$ctrl_delAll = GUICtrlCreateButton("Shift+Backspace", 448, 72, 107, 25)
$ctrl_windows = GUICtrlCreateButton("Windows", 448, 120, 75, 25)
$ctrl_tri = GUICtrlCreateButton("▲", 480, 160, 35, 25)
$ctrl_squa = GUICtrlCreateButton("■", 440, 192, 35, 25)
$ctrl_circle = GUICtrlCreateButton("○", 520, 192, 35, 25)
$ctrl_cross = GUICtrlCreateButton("X", 480, 224, 35, 25)
$Label6 = GUICtrlCreateLabel("通过Cronus控制", 16, 328, 85, 17)
$ctrl_cronusTriangle = GUICtrlCreateButton("▲", 405, 401, 35, 33)
$ctrl_cronusSquare = GUICtrlCreateButton("■", 365, 433, 35, 33)
$ctrl_cronusCircle = GUICtrlCreateButton("○", 445, 433, 35, 33)
$ctrl_cronusCross = GUICtrlCreateButton("X", 405, 465, 35, 33)
$ctrl_cronusUp = GUICtrlCreateButton("↑", 146, 400, 35, 33)
$ctrl_cronusLeft = GUICtrlCreateButton("←", 106, 432, 35, 33)
$ctrl_cronusRight = GUICtrlCreateButton("→", 186, 432, 35, 33)
$ctrl_cronusDown = GUICtrlCreateButton("↓", 146, 464, 35, 33)
$ctrl_cronusStart = GUICtrlCreateButton("start", 303, 427, 51, 33)
$ctrl_cronusPS = GUICtrlCreateButton("PS", 268, 470, 51, 33)
$ctrl_cronusSelect = GUICtrlCreateButton("select", 233, 429, 51, 33)
$ctrl_cronusL2 = GUICtrlCreateButton("L2", 128, 336, 75, 25)
$ctrl_cronusL1 = GUICtrlCreateButton("L1", 128, 368, 75, 25)
$ctrl_cronusR2 = GUICtrlCreateButton("R2", 388, 334, 75, 25)
$ctrl_cronusR1 = GUICtrlCreateButton("R1", 388, 366, 75, 25)
$Label7 = GUICtrlCreateLabel("执行按键顺序", 616, 32, 76, 17)
$ctrl_clearAct = GUICtrlCreateButton("清空", 856, 216, 107, 41)
$ctrl_exeAct = GUICtrlCreateButton("执行", 856, 272, 105, 41)
$ctrl_actList = GUICtrlCreateList("", 616, 56, 225, 344)
$ctrl_selectAct = GUICtrlCreateButton("开始选择按键", 856, 56, 105, 41)
$ctrl_delAct = GUICtrlCreateButton("删除", 856, 163, 105, 41)
$ctrl_copyActList = GUICtrlCreateButton("复制", 856, 360, 107, 41)
$Label8 = GUICtrlCreateLabel("要执行的按键顺序", 616, 416, 100, 17)
$ctrl_actStr = GUICtrlCreateEdit("", 616, 440, 345, 57)
$ctrl_wait1 = GUICtrlCreateButton("等待1秒", 375, 280, 59, 25)
$ctrl_wait5 = GUICtrlCreateButton("等待5秒", 456, 280, 59, 25)
$ctrl_wait20 = GUICtrlCreateButton("等待20秒", 536, 280, 59, 25)
$Label9 = GUICtrlCreateLabel("时间等待", 312, 288, 52, 17)
$ctrl_autoContinue = GUICtrlCreateCheckbox("自动连续", 856, 320, 97, 17)
$Label10 = GUICtrlCreateLabel("按键次数", 856, 104, 52, 17)
$ctrl_actTimes = GUICtrlCreateInput("1", 912, 104, 49, 21)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


Global $setport = 3
Global $sportSetError
Global $CmBoBaud = 38400
Global $CmboDataBits = 8
Global $SetParity = 0
Global $setStop = 1
Global $setflow = 0
Global $resOpen = 0
Global $ACT_SELECT_MODE = False
Global $ACT_EXEING = False
Global $act_sequence = ""

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $ctrl_close
			if $resOpen=1 Then
				_CommClosePort()
				GUICtrlSetData($ctrl_commStats, "............")
			EndIf
		Case $ctrl_comm
			$setport = GUICtrlRead($ctrl_portNum)
			$CmBoBaud = Int(GUICtrlRead($ctrl_boBaud))
			$resOpen = _CommSetPort($setport, $sportSetError, $CmBoBaud, $CmboDataBits, $SetParity, $setStop, $setflow)
			If $resOpen<>1 Then
				MsgBox(0,"设置端口失败",$sportSetError)
				GUICtrlSetData($ctrl_commStats, "端口"&$setport&"设置失败")
			Else
				GUICtrlSetData($ctrl_commStats, "端口"&$setport&"设置成功")
			EndIf
		Case $ctrl_okInput
			Action("kb_text_" & GUICtrlRead($ctrl_text))
		Case $ctrl_esc
			Action("kb_esc")
		Case $ctrl_enter
			Action("kb_enter")
		Case $ctrl_back
			Action("kb_backspace")
		Case $ctrl_tab
			Action("kb_tab")
		Case $ctrl_left
			Action("kb_left")
		Case $ctrl_up
			Action("kb_up")
		Case $ctrl_right
			Action("kb_right")
		Case $ctrl_down
			Action("kb_down")
		Case $ctrl_okAscii
			Action("kb_code_"&GUICtrlRead($ctrl_ascii))
		Case $ctrl_okStr
			Action("kb_text_"&GUICtrlRead($ctrl_str))
		Case $ctrl_delAll
			Action("kb_delall")
		Case $ctrl_windows
			Action("kb_ps")
		Case $ctrl_tri
			Action("kb_triangle")
		Case $ctrl_squa
			Action("kb_square")
		Case $ctrl_circle
			Action("kb_circle")
		Case $ctrl_cross
			Action("kb_cross")
		Case $ctrl_cronusL2
			Action("cr_l2")
		Case $ctrl_cronusR2
			Action("cr_r2")
		Case $ctrl_cronusL1
			Action("cr_l1")
		Case $ctrl_cronusR1
			Action("cr_r1")
		Case $ctrl_cronusUp
			Action("cr_up")
		Case $ctrl_cronusDown
			Action("cr_down")
		Case $ctrl_cronusLeft
			Action("cr_left")
		Case $ctrl_cronusRight
			Action("cr_right")
		Case $ctrl_cronusSelect
			Action("cr_select")
		Case $ctrl_cronusStart
			Action("cr_start")
		Case $ctrl_cronusPS
			Action("cr_ps")
		Case $ctrl_cronusTriangle
			Action("cr_triangle")
		Case $ctrl_cronusCircle
			Action("cr_circle")
		Case $ctrl_cronusCross
			Action("cr_cross")
		Case $ctrl_cronusSquare
			Action("cr_square")
		Case $ctrl_wait1
			Action("pc_wait_1000")
		Case $ctrl_wait5
			Action("pc_wait_5000")
		Case $ctrl_wait20
			Action("pc_wait_20000")
		Case $ctrl_selectAct
			If $ACT_EXEING Then
				MsgBox(1,"错误","正在执行")
			Else
				If $ACT_SELECT_MODE Then
					$ACT_SELECT_MODE = False
					GUICtrlSetData($ctrl_selectAct, "开始选择按键")
					GUICtrlSetState($ctrl_exeAct, $GUI_ENABLE)
				Else
					$ACT_SELECT_MODE = True
					GUICtrlSetData($ctrl_selectAct, "结束选择按键")
					GUICtrlSetState($ctrl_exeAct, $GUI_DISABLE)
				EndIf
			EndIf
		Case $ctrl_delAct
			If $ACT_EXEING Then
				MsgBox(1,"错误","正在执行")
			Else
				Local $curr = _GUICtrlListBox_GetCurSel($ctrl_actList)
				_GUICtrlListBox_DeleteString($ctrl_actList, _GUICtrlListBox_GetCurSel($ctrl_actList))
				If $curr>=0 And $curr<_GUICtrlListBox_GetCount($ctrl_actList) Then
					_GUICtrlListBox_SetCurSel($ctrl_actList, $curr)
				EndIf
				actListToStr()
			EndIf
		Case $ctrl_clearAct
			If $ACT_EXEING Then
				MsgBox(1,"错误","正在执行")
			Else
				While _GUICtrlListBox_GetCount($ctrl_actList)>0
					_GUICtrlListBox_DeleteString($ctrl_actList,0)
				WEnd
				actListToStr()
			EndIf
		Case $ctrl_exeAct
			If $ACT_SELECT_MODE Then
				MsgBox(1,"错误","正在选择按键")
			ElseIf $ACT_EXEING Then
				SetExeing(False)
			Else
				SetExeing(True)
			EndIf
	EndSwitch
WEnd

Func CommSendByte($byte)

	_CommSendByte($byte)
EndFunc

Func CommSendString($str)

	_CommSendString($str)
EndFunc

;把action list数据同步到文本框中
Func actListToStr()
	Local $str = ""
	For $i=0 to _GUICtrlListBox_GetCount($ctrl_actList)-1
		If $i>0 Then
			$str = $str&"|"&_GUICtrlListBox_GetText($ctrl_actList, $i)
		Else
			$str = _GUICtrlListBox_GetText($ctrl_actList, $i)
		EndIf
	Next
	GUICtrlSetData($ctrl_actStr, $str)
EndFunc

Func ExeActionList()
	If $ACT_EXEING And _GUICtrlListBox_GetCount($ctrl_actList)>0 Then
		If _GUICtrlListBox_GetCurSel($ctrl_actList)<0 Then
			_GUICtrlListBox_SetCurSel($ctrl_actList,0)
		EndIf
		Local $index = _GUICtrlListBox_GetCurSel($ctrl_actList)
		DoAction(_GUICtrlListBox_GetText($ctrl_actList, $index))

		;执行下一个按键
		If $index<(_GUICtrlListBox_GetCount($ctrl_actList)-1) Then
			_GUICtrlListBox_SetCurSel($ctrl_actList,$index + 1)

			If GUICtrlRead($ctrl_autoContinue)=$GUI_CHECKED Then
				ExeActionList()
			Else
				SetExeing(False)
			EndIf
		Else
			SetExeing(False)
			If GUICtrlRead($ctrl_autoContinue)=$GUI_CHECKED Then
				;_GUICtrlListBox_SetCurSel($ctrl_actList,0)
				MsgBox(1,"执行完成", "执行完成")
			EndIf
		EndIf
	ElseIf _GUICtrlListBox_GetCount($ctrl_actList)<=0
		SetExeing(False)
	EndIf
EndFunc

Func Action($action)
	If $ACT_SELECT_MODE Then
		If $action<>"" Then
			;记录到序列中
			if _GUICtrlListBox_GetCurSel($ctrl_actList)>=0 Then
				_GUICtrlListBox_InsertString($ctrl_actList,$action & "_" & GUICtrlRead($ctrl_actTimes),_GUICtrlListBox_GetCurSel($ctrl_actList)+1)
			Else
				_GUICtrlListBox_InsertString($ctrl_actList,$action & "_" & GUICtrlRead($ctrl_actTimes),-1)
			EndIf

			actListToStr()
			;自动把次数重置为1
			GUICtrlSetData($ctrl_actTimes,"1")
		EndIf
	Else
		;执行动作
		DoAction($action&"_1")
	EndIf
EndFunc

Func SetExeing($bool)
	If $bool Then
		$ACT_EXEING = True
		GUICtrlSetData($ctrl_exeAct,"停止")
		GUICtrlSetState($ctrl_selectAct, $GUI_DISABLE)
		GUICtrlSetState($ctrl_delAct, $GUI_DISABLE)
		GUICtrlSetState($ctrl_clearAct, $GUI_DISABLE)
		ExeActionList()
	Else
		$ACT_EXEING = False
		GUICtrlSetData($ctrl_exeAct,"执行")
		GUICtrlSetState($ctrl_selectAct, $GUI_ENABLE)
		GUICtrlSetState($ctrl_delAct, $GUI_ENABLE)
		GUICtrlSetState($ctrl_clearAct, $GUI_ENABLE)
	EndIf
EndFunc

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
		If StringInStr($act,"wait_")=1 Then
			Sleep(Int(StringMid($act, 6)))
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