#include <CommMG.au3>
#include <Array.au3>

#include <cronus.au3>

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=d:\work\autops3\keyboard.kxf
$Form1_1 = GUICreate("PS3键盘", 619, 526, 217, 235)
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
$ctrl_str = GUICtrlCreateInput("\r\n", 104, 264, 121, 21)
$ctrl_okStr = GUICtrlCreateButton("确定", 240, 264, 75, 25)
$ctrl_delAll = GUICtrlCreateButton("Shift+Backspace", 448, 72, 107, 25)
$ctrl_windows = GUICtrlCreateButton("Windows", 448, 120, 75, 25)
$ctrl_tri = GUICtrlCreateButton("▲", 480, 160, 35, 25)
$ctrl_squa = GUICtrlCreateButton("■", 440, 192, 35, 25)
$ctrl_circle = GUICtrlCreateButton("○", 520, 192, 35, 25)
$ctrl_cross = GUICtrlCreateButton("X", 480, 224, 35, 25)
$Label6 = GUICtrlCreateLabel("通过Cronus控制", 16, 328, 85, 17)
$ctrl_cronusTriangle = GUICtrlCreateButton("▲", 405, 393, 35, 33)
$ctrl_cronusSquare = GUICtrlCreateButton("■", 365, 433, 35, 33)
$ctrl_cronusCircle = GUICtrlCreateButton("○", 445, 433, 35, 33)
$ctrl_cronusCross = GUICtrlCreateButton("X", 405, 465, 35, 33)
$ctrl_cronusUp = GUICtrlCreateButton("↑", 146, 392, 35, 33)
$ctrl_cronusLeft = GUICtrlCreateButton("←", 106, 432, 35, 33)
$ctrl_cronusRight = GUICtrlCreateButton("→", 186, 432, 35, 33)
$ctrl_cronusDown = GUICtrlCreateButton("↓", 146, 464, 35, 33)
$ctrl_cronusStart = GUICtrlCreateButton("start", 303, 435, 51, 33)
$ctrl_cronusPS = GUICtrlCreateButton("PS", 268, 478, 51, 33)
$ctrl_cronusSelect = GUICtrlCreateButton("select", 233, 437, 51, 33)
$ctrl_cronusL2 = GUICtrlCreateButton("L2", 128, 328, 75, 25)
$ctrl_cronusL1 = GUICtrlCreateButton("L1", 128, 360, 75, 25)
$ctrl_cronusR2 = GUICtrlCreateButton("R2", 388, 326, 75, 25)
$ctrl_cronusR1 = GUICtrlCreateButton("R1", 388, 358, 75, 25)
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
			Local $str_text = GUICtrlRead($ctrl_text)
			CommSendString($str_text)
		Case $ctrl_esc
			;esc
			CommSendByte(177)
		Case $ctrl_enter
			;enter
			CommSendString(@CRLF)
		Case $ctrl_back
			;backspace
			CommSendByte(178)
		Case $ctrl_tab
			;tab
			CommSendByte(179)
		Case $ctrl_left
			CommSendByte(216)
		Case $ctrl_up
			CommSendByte(218)
		Case $ctrl_right
			CommSendByte(215)
		Case $ctrl_down
			CommSendByte(217)
		Case $ctrl_okAscii
			CommSendByte(Int(GUICtrlRead($ctrl_ascii)))
		Case $ctrl_okStr
			CommSendString(GUICtrlRead($ctrl_str))
		Case $ctrl_delAll
			;删除所有
			CommSendByte(206)
		Case $ctrl_windows
			;windows键 (PS键？)
			CommSendByte(207)
		Case $ctrl_tri
			CommSendByte(194)
		Case $ctrl_squa
			CommSendByte(195)
		Case $ctrl_circle
			;enter
			CommSendString(@CRLF)
		Case $ctrl_cross
			;esc
			CommSendByte(177)
		Case $ctrl_cronusL2
			CronusPressButton("l2",1)
		Case $ctrl_cronusR2
			CronusPressButton("r2",1)
		Case $ctrl_cronusL1
			CronusPressButton("l1",1)
		Case $ctrl_cronusR1
			CronusPressButton("r1",1)
		Case $ctrl_cronusUp
			CronusPressButton("up",1)
		Case $ctrl_cronusDown
			CronusPressButton("down",1)
		Case $ctrl_cronusLeft
			CronusPressButton("left",1)
		Case $ctrl_cronusRight
			CronusPressButton("right",1)
		Case $ctrl_cronusSelect
			CronusPressButton("select",1)
		Case $ctrl_cronusStart
			CronusPressButton("start",1)
		Case $ctrl_cronusPS
			CronusPressButton("ps",1)
		Case $ctrl_cronusTriangle
			CronusPressButton("triangle",1)
		Case $ctrl_cronusCircle
			CronusPressButton("circle",1)
		Case $ctrl_cronusCross
			CronusPressButton("cross",1)
		Case $ctrl_cronusSquare
			CronusPressButton("square",1)
	EndSwitch
WEnd

Func CommSendByte($byte)
	ConsoleWrite($byte & @CRLF)
	_CommSendByte($byte)
EndFunc

Func CommSendString($str)
	ConsoleWrite($str & @CRLF)
	_CommSendString($str)
EndFunc