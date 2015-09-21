#include <Array.au3>
#include <File.au3>

#include <core.au3>
#include <util.au3>

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=d:\work\autops3\autoit\keyboard.kxf
$Form1_1 = GUICreate("PS3键盘", 1148, 561, 143, 154)
$Label1 = GUICtrlCreateLabel("端口 COM", 16, 16, 55, 17)
$ctrl_portNum = GUICtrlCreateCombo("3", 72, 16, 41, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20")
$Label2 = GUICtrlCreateLabel("波特率", 128, 16, 40, 17)
$ctrl_boBaud = GUICtrlCreateCombo("38400", 168, 16, 65, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "9600|14400|19200|38400|56000|57600|115200")
$ctrl_comm = GUICtrlCreateButton("连接PS3", 256, 16, 75, 25)
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
$ctrl_text = GUICtrlCreateEdit("", 16, 72, 217, 89, BitOR($ES_AUTOVSCROLL,$WS_VSCROLL))
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
$Label6 = GUICtrlCreateLabel("通过Cronus控制", 16, 360, 85, 17)
$ctrl_cronusTriangle = GUICtrlCreateButton("▲", 405, 433, 35, 33)
$ctrl_cronusSquare = GUICtrlCreateButton("■", 365, 465, 35, 33)
$ctrl_cronusCircle = GUICtrlCreateButton("○", 445, 465, 35, 33)
$ctrl_cronusCross = GUICtrlCreateButton("X", 405, 497, 35, 33)
$ctrl_cronusUp = GUICtrlCreateButton("↑", 146, 432, 35, 33)
$ctrl_cronusLeft = GUICtrlCreateButton("←", 106, 464, 35, 33)
$ctrl_cronusRight = GUICtrlCreateButton("→", 186, 464, 35, 33)
$ctrl_cronusDown = GUICtrlCreateButton("↓", 146, 496, 35, 33)
$ctrl_cronusStart = GUICtrlCreateButton("start", 303, 459, 51, 33)
$ctrl_cronusPS = GUICtrlCreateButton("PS", 268, 502, 51, 33)
$ctrl_cronusSelect = GUICtrlCreateButton("select", 233, 461, 51, 33)
$ctrl_cronusL2 = GUICtrlCreateButton("L2", 128, 368, 75, 25)
$ctrl_cronusL1 = GUICtrlCreateButton("L1", 128, 400, 75, 25)
$ctrl_cronusR2 = GUICtrlCreateButton("R2", 388, 366, 75, 25)
$ctrl_cronusR1 = GUICtrlCreateButton("R1", 388, 398, 75, 25)
$Label7 = GUICtrlCreateLabel("动作序列:", 616, 8, 55, 17)
$ctrl_clearAct = GUICtrlCreateButton("清空", 784, 192, 107, 41)
$ctrl_exeAct = GUICtrlCreateButton("执行", 784, 248, 105, 41)
$ctrl_actList = GUICtrlCreateList("", 616, 32, 161, 461, BitOR($LBS_NOTIFY,$WS_VSCROLL,$WS_BORDER))
$ctrl_selectAct = GUICtrlCreateButton("开始录制", 784, 32, 105, 41)
$ctrl_delAct = GUICtrlCreateButton("删除", 784, 139, 105, 41)
$ctrl_saveActList = GUICtrlCreateButton("保存为aps3文件", 784, 448, 107, 41)
$ctrl_waith = GUICtrlCreateButton("0.5", 431, 304, 27, 25)
$ctrl_wait5 = GUICtrlCreateButton("5", 496, 304, 27, 25)
$ctrl_wait20 = GUICtrlCreateButton("20", 560, 304, 27, 25)
$Label9 = GUICtrlCreateLabel("时间等待(秒)", 304, 312, 70, 17)
$ctrl_autoContinue = GUICtrlCreateCheckbox("自动连续", 784, 296, 97, 17)
$Label10 = GUICtrlCreateLabel("按键次数", 784, 104, 52, 17)
$ctrl_actTimes = GUICtrlCreateInput("1", 840, 104, 49, 21)
$ctrl_syncOp = GUICtrlCreateCheckbox("同时操作PS3", 784, 80, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$ctrl_waitc = GUICtrlCreateButton("0.1", 400, 304, 27, 25)
$ctrl_wait1 = GUICtrlCreateButton("1", 464, 304, 27, 25)
$ctrl_wait10 = GUICtrlCreateButton("10", 528, 304, 27, 25)
$ctrl_autoInsWait = GUICtrlCreateCheckbox("录制时自动加入等待时间(毫秒)", 8, 312, 209, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$ctrl_autoWaitDelay = GUICtrlCreateInput("500", 224, 312, 49, 21)
$ctrl_fileList = GUICtrlCreateList("", 904, 32, 145, 240, BitOR($LBS_NOTIFY,$WS_VSCROLL,$WS_BORDER))
$Label11 = GUICtrlCreateLabel("aps3文件", 904, 8, 51, 17)
$ctrl_fileDel = GUICtrlCreateButton("删除", 1056, 32, 75, 25)
$ctrl_fileOpen = GUICtrlCreateButton("打开", 1056, 72, 75, 25)
$ctrl_fileInsertTo = GUICtrlCreateButton("插入", 1056, 112, 75, 25)
$ctrl_fileRefresh = GUICtrlCreateButton("刷新", 1056, 248, 75, 25)
$ctrl_deSelAct = GUICtrlCreateButton("取消选择", 784, 416, 107, 25)
$ctrl_keyValue = GUICtrlCreateEdit("", 904, 304, 217, 161, BitOR($ES_AUTOVSCROLL,$ES_WANTRETURN,$WS_VSCROLL))
$Label8 = GUICtrlCreateLabel("参数设置（形如key:value,一行一对）", 904, 280, 197, 17)
$ctrl_actStr = GUICtrlCreateEdit("", 904, 512, 225, 41, BitOR($ES_AUTOVSCROLL,$ES_WANTRETURN,$WS_VSCROLL))
$ctrl_currActListName = GUICtrlCreateLabel("....................................................................", 672, 8, 208, 17)
$ctrl_saveCfg = GUICtrlCreateButton("保存", 1048, 472, 75, 25)
$ctrl_addComment = GUICtrlCreateButton("增加注释", 808, 520, 75, 25)
$ctrl_comment = GUICtrlCreateInput("", 616, 520, 177, 21)
$ctrl_runToCurr = GUICtrlCreateButton("执行到当前动作", 784, 328, 107, 41)
$ctrl_runAps3 = GUICtrlCreateButton("运行", 1056, 152, 75, 25)
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
Global $pauseProcess = ""
Global $runToIndex = -1

Opt("GUIOnEventMode", 1)

GUISetOnEvent($GUI_EVENT_CLOSE, "on_exit")
Func on_exit()
	Exit
EndFunc

GUICtrlSetOnEvent($ctrl_close, "on_close")
Func on_close()
	if $resOpen=1 Then
		_CommClosePort()
		GUICtrlSetData($ctrl_commStats, "............")
	EndIf
EndFunc

GUICtrlSetOnEvent($ctrl_comm, "on_comm")
Func on_comm()
	$setport = GUICtrlRead($ctrl_portNum)
	$CmBoBaud = Int(GUICtrlRead($ctrl_boBaud))
	$resOpen = _CommSetPort($setport, $sportSetError, $CmBoBaud, $CmboDataBits, $SetParity, $setStop, $setflow)
	If $resOpen<>1 Then
		MsgBox(0,"设置端口失败",$sportSetError)
		GUICtrlSetData($ctrl_commStats, "端口"&$setport&"设置失败")
	Else
		GUICtrlSetData($ctrl_commStats, "端口"&$setport&"设置成功")
	EndIf
EndFunc

GUICtrlSetOnEvent($ctrl_okInput, "on_okInput")
Func on_okInput()
	Action("kb_text_" & GUICtrlRead($ctrl_text))
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_esc, "on_esc")
Func on_esc()
	Action("kb_esc")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_enter, "on_enter")
Func on_enter()
	Action("kb_enter")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_back, "on_back")
Func on_back()
	Action("kb_backspace")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_tab, "on_tab")
Func on_tab()
	Action("kb_tab")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_left, "on_left")
Func on_left()
	Action("kb_left")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_up, "on_up")
Func on_up()
	Action("kb_up")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_right, "on_right")
Func on_right()
	Action("kb_right")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_down, "on_down")
Func on_down()
	Action("kb_down")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_okAscii, "on_okAscii")
Func on_okAscii()
	Action("kb_code_"&GUICtrlRead($ctrl_ascii))
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_okStr, "on_okStr")
Func on_okStr()
	Action("kb_text_"&GUICtrlRead($ctrl_str))
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_delAll, "on_delAll")
Func on_delAll()
	Action("kb_delall")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_windows, "on_windows")
Func on_windows()
	Action("kb_ps")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_tri, "on_tri")
Func on_tri()
	Action("kb_triangle")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_squa, "on_squa")
Func on_squa()
	Action("kb_square")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_circle, "on_circle")
Func on_circle()
	Action("kb_circle")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cross, "on_cross")
Func on_cross()
	Action("kb_cross")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusL2, "on_cronusL2")
Func on_cronusL2()
	Action("cr_l2")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusR2, "on_cronusR2")
Func on_cronusR2()
	Action("cr_r2")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusL1, "on_cronusL1")
Func on_cronusL1()
	Action("cr_l1")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusR1, "on_cronusR1")
Func on_cronusR1()
	Action("cr_r1")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusUp, "on_cronusUp")
Func on_cronusUp()
	Action("cr_up")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusDown, "on_cronusDown")
Func on_cronusDown()
	Action("cr_down")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusLeft, "on_cronusLeft")
Func on_cronusLeft()
	Action("cr_left")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusRight, "on_cronusRight")
Func on_cronusRight()
	Action("cr_right")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusSelect, "on_cronusSelect")
Func on_cronusSelect()
	Action("cr_select")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusStart, "on_cronusStart")
Func on_cronusStart()
	Action("cr_start")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusPS, "on_cronusPS")
Func on_cronusPS()
	Action("cr_ps")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusTriangle, "on_cronusTriangle")
Func on_cronusTriangle()
	Action("cr_triangle")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusCircle, "on_cronusCircle")
Func on_cronusCircle()
	Action("cr_circle")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusCross, "on_cronusCross")
Func on_cronusCross()
	Action("cr_cross")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_cronusSquare, "on_cronusSquare")
Func on_cronusSquare()
	Action("cr_square")
	AutoInsWaitTime()
EndFunc

GUICtrlSetOnEvent($ctrl_waitc, "on_waitc")
Func on_waitc()
	Action("pc_wait_100")
EndFunc

GUICtrlSetOnEvent($ctrl_waith, "on_waith")
Func on_waith()
	Action("pc_wait_500")
EndFunc

GUICtrlSetOnEvent($ctrl_wait1, "on_wait1")
Func on_wait1()
	Action("pc_wait_1000")
EndFunc

GUICtrlSetOnEvent($ctrl_wait5, "on_wait5")
Func on_wait5()
	Action("pc_wait_5000")
EndFunc

GUICtrlSetOnEvent($ctrl_wait10, "on_wait10")
Func on_wait10()
	Action("pc_wait_10000")
EndFunc

GUICtrlSetOnEvent($ctrl_wait20, "on_wait20")
Func on_wait20()
	Action("pc_wait_20000")
EndFunc

GUICtrlSetOnEvent($ctrl_selectAct, "on_selectAct")
Func on_selectAct()
	If $ACT_EXEING Then
		MsgBox(1,"错误","正在执行")
	Else
		If $ACT_SELECT_MODE Then
			SetActSelectMode(False)
		Else
			SetActSelectMode(True)
		EndIf
	EndIf
EndFunc

Func SetActSelectMode($bool)
	If $bool Then
		$ACT_SELECT_MODE = True
		GUICtrlSetData($ctrl_selectAct, "结束录制")
		GUICtrlSetState($ctrl_exeAct, $GUI_DISABLE)
		GUICtrlSetState($ctrl_fileInsertTo, $GUI_ENABLE)
		GUICtrlSetState($ctrl_fileOpen, $GUI_DISABLE)
	Else
		$ACT_SELECT_MODE = False
		GUICtrlSetData($ctrl_selectAct, "开始录制")
		GUICtrlSetState($ctrl_exeAct, $GUI_ENABLE)
		GUICtrlSetState($ctrl_fileInsertTo, $GUI_DISABLE)
		GUICtrlSetState($ctrl_fileOpen, $GUI_ENABLE)
	EndIf
EndFunc

GUICtrlSetOnEvent($ctrl_delAct, "on_delAct")
Func on_delAct()
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
EndFunc

GUICtrlSetOnEvent($ctrl_clearAct, "on_clearAct")
Func on_clearAct()
	If $ACT_EXEING Then
		MsgBox(1,"错误","正在执行")
	Else
		While _GUICtrlListBox_GetCount($ctrl_actList)>0
			_GUICtrlListBox_DeleteString($ctrl_actList,0)
		WEnd
		actListToStr()

		;显示动作列表名称
		GUICtrlSetData($ctrl_currActListName, "")
	EndIf
EndFunc

GUICtrlSetOnEvent($ctrl_exeAct, "on_exeAct")
Func on_exeAct()
	If $ACT_SELECT_MODE Then
		MsgBox(1,"错误","正在选择按键")
	ElseIf $ACT_EXEING Then
		SetExeing(False)
	Else
		SetExeing(True)
	EndIf
EndFunc

GUICtrlSetOnEvent($ctrl_deSelAct, "on_deSelAct")
Func on_deSelAct()
	_GUICtrlListBox_SetCurSel($ctrl_actList, -1)
EndFunc

GUICtrlSetOnEvent($ctrl_saveCfg, "on_saveCfg")
Func on_saveCfg()
	SaveConfig()
EndFunc

GUICtrlSetOnEvent($ctrl_addComment, "on_addComment")
Func on_addComment()
	If GUICtrlRead($ctrl_comment)<>"" then
		;记录到序列中
		if _GUICtrlListBox_GetCurSel($ctrl_actList)>=0 Then
			InsAction("pc_expl_" & GUICtrlRead($ctrl_comment), _GUICtrlListBox_GetCurSel($ctrl_actList)+1)
		Else
			InsAction("pc_expl_" & GUICtrlRead($ctrl_comment), -1)
		EndIf
	endif
EndFunc

GUICtrlSetOnEvent($ctrl_runToCurr, "on_runToCurr")
Func on_runToCurr()
	If $ACT_SELECT_MODE Then
		MsgBox(1,"错误","正在选择按键")
	ElseIf $ACT_EXEING Then
		MsgBox(1,"错误","正在运行")
	Else
		$runToIndex = -1
		$runToIndex = _GUICtrlListBox_GetCurSel($ctrl_actList)
		_GUICtrlListBox_SetCurSel($ctrl_actList, 0)
		SetExeing(True)
	EndIf
EndFunc

GUICtrlSetOnEvent($ctrl_runAps3, "on_runAps3")
Func on_runAps3()
	Local $aps3 = _GUICtrlListBox_GetText($ctrl_fileList, _GUICtrlListBox_GetCurSel($ctrl_fileList))
	Local $params = StringSplit(GUICtrlRead($ctrl_keyValue), @CRLF)
	DoAction("pc_aps3_" & $aps3 & "_1", $params)
EndFunc

;每个act自动添加一个等待
Func AutoInsWaitTime()
	If $ACT_SELECT_MODE And (GUICtrlRead($ctrl_autoInsWait)=$GUI_CHECKED) Then
		if _GUICtrlListBox_GetCurSel($ctrl_actList)>=0 Then
			InsAction("pc_wait_"&GUICtrlRead($ctrl_autoWaitDelay), _GUICtrlListBox_GetCurSel($ctrl_actList)+2)
		Else
			InsAction("pc_wait_"&GUICtrlRead($ctrl_autoWaitDelay), -1)
		EndIf
	EndIf
EndFunc

;====================================================
;====================================================
;===================文件管理=========================
;====================================================
;====================================================
;刷新文件列表
Func refreshFileList()
	_GUICtrlListBox_Clear($ctrl_fileList)
	_GUICtrlListBox_Dir($ctrl_fileList, @ScriptDir&"\aps3\*.aps3")
EndFunc

;保存为aps3文件
GUICtrlSetOnEvent($ctrl_saveActList, "on_saveActList")
Func on_saveActList()
	Local $fname = aps3_saveToFile(GUICtrlRead($ctrl_actStr))
	refreshFileList()
	;显示动作列表名称
	GUICtrlSetData($ctrl_currActListName, $fname)
EndFunc

;删除aps3文件
GUICtrlSetOnEvent($ctrl_fileDel, "on_fileDel")
Func on_fileDel()
	Local $fname = _GUICtrlListBox_GetText($ctrl_fileList, _GUICtrlListBox_GetCurSel($ctrl_fileList))
	Local $result = MsgBox($MB_OKCANCEL, "删除", "确定要删除" & $fname & "(回收站)?")
	If $result = $IDOK Then
		FileRecycle(@ScriptDir & "\aps3\" & $fname)
		refreshFileList()
	EndIf
EndFunc

;刷新
GUICtrlSetOnEvent($ctrl_fileRefresh, "on_fileRefresh")
Func on_fileRefresh()
	refreshFileList()
EndFunc

;打开aps3文件
GUICtrlSetOnEvent($ctrl_fileOpen, "on_fileOpen")
Func on_fileOpen()
	If _GUICtrlListBox_GetCurSel($ctrl_fileList) >= 0 Then

		Local $result = $IDOK
		If GUICtrlRead($ctrl_actStr)<>"" Then
			$result = MsgBox($MB_OKCANCEL, "警告", "直接打开会覆盖当前的录制，确定要打开吗？")
		EndIf

		If $result = $IDOK Then
			;清除动作列表
			_GUICtrlListBox_Clear($ctrl_actList)
			;从aps3中读取
			Local $fname = _GUICtrlListBox_GetText($ctrl_fileList, _GUICtrlListBox_GetCurSel($ctrl_fileList))
			Local $act_str = aps3_readFromFile(@ScriptDir & "\aps3\" & $fname)
			importActStr($act_str)

			;显示动作列表名称
			GUICtrlSetData($ctrl_currActListName, $fname)
		EndIf
	Else
		MsgBox(1, "错误", "先选择一个文件")
	EndIf
EndFunc

;把aps3文件插入到动作序列中
GUICtrlSetOnEvent($ctrl_fileInsertTo, "on_fileInsertTo")
Func on_fileInsertTo()
	Local $fname = _GUICtrlListBox_GetText($ctrl_fileList, _GUICtrlListBox_GetCurSel($ctrl_fileList))
	Action("pc_aps3_"&$fname)
EndFunc
;====================================================
;====================================================

;====================================================
;====================初始化==========================
;====================================================
Global $inited = False
_GUICtrlListBox_Dir($ctrl_fileList, @ScriptDir&"\aps3\*.aps3")
AutoItSetOption("MouseCoordMode", 0)
ReadConfig()
SetActSelectMode(False)
SetExeing(False)
$inited = True
While 1
	Sleep(100) ; Sleep to reduce CPU usage
WEnd
;====================================================
;====================================================

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

	SaveConfig()
EndFunc

Func SaveConfig()
	;保存配置
	Local $cfg_arr[1] = ["#version 1.0.0"]
	_ArrayAdd($cfg_arr, "actList="&GUICtrlRead($ctrl_actStr),0,"!@#$%^&*")
	_ArrayAdd($cfg_arr, "KeyValue="&StringReplace(GUICtrlRead($ctrl_keyValue), @CRLF, "[@CRLF]"),0,"!@#$%^&*")
	_ArrayAdd($cfg_arr, "ActListName="&GUICtrlRead($ctrl_currActListName))
	_FileWriteFromArray(@ScriptDir&"\last.cfg", $cfg_arr)
EndFunc

Func ReadConfig()
	If FileExists(@ScriptDir&"\last.cfg") Then
		Local $cfg_arr
		_FileReadToArray(@ScriptDir&"\last.cfg", $cfg_arr)

		For $i=1 To $cfg_arr[0]
			If StringInStr($cfg_arr[$i], "actList=")=1 Then
				importActStr(StringMid($cfg_arr[$i], 9))
			ElseIf StringInStr($cfg_arr[$i], "KeyValue=")=1 Then
				GUICtrlSetData($ctrl_keyValue, StringReplace(StringMid($cfg_arr[$i], 10), "[@CRLF]", @CRLF))
			ElseIf StringInStr($cfg_arr[$i], "ActListName=")=1 Then
				GUICtrlSetData($ctrl_currActListName, StringMid($cfg_arr[$i], 13))
			EndIf
		Next
	Else
		ConsoleWrite("last.cfg doesn't exists!" & @CRLF)
	EndIf
EndFunc

Func importActStr($act_str)
	_GUICtrlListBox_Import($ctrl_actList, $act_str)
	GUICtrlSetData($ctrl_actStr, $act_str)
EndFunc

;执行一个动作
Func ExecAction($action)
	Local $px = MouseGetPos(0)
	Local $py = MouseGetPos(1)

	Local $params = StringSplit(GUICtrlRead($ctrl_keyValue), @CRLF)
	If StringInStr($action, "pc_expl_")<>1 then
		If StringInStr($action,"pc_aps3_")=1 Then
			Local $aps3 = StringMid($action, 9, StringInStr($action, "_",0,-1)-9)
			Local $aps3_actStr = aps3_readFromFile( @ScriptDir & "\aps3\" & $aps3)
			Local $act_arr = StringSplit($aps3_actStr, "|")
			Local $a = 1
			For $a=1 To $act_arr[0]
				ReadExeing()
				If $ACT_EXEING Then
					DoAction($act_arr[$a], $params)
				EndIf
			Next
		Else
			DoAction($action, $params)
			ConsoleWrite($action&@CRLF)
		EndIf
	Else
		ConsoleWrite("======================"&@CRLF)
		ConsoleWrite(StringMid($action, 9)&@CRLF)
		ConsoleWrite("======================"&@CRLF)
	EndIf

	If StringInStr($action, "cr_")=1 And ($ACT_SELECT_MODE=False OR (GUICtrlRead($ctrl_syncOp)=$GUI_CHECKED) OR (GUICtrlRead($ctrl_autoContinue)<>$GUI_CHECKED)) Then
		WinActivate("PS3键盘")
		MouseMove($px,$py, 1)
	EndIf
EndFunc

Func ExecActionList()
	ReadExeing()

	If $ACT_EXEING And _GUICtrlListBox_GetCount($ctrl_actList)>0 Then
		If _GUICtrlListBox_GetCurSel($ctrl_actList)<0 Then
			_GUICtrlListBox_SetCurSel($ctrl_actList,0)
		EndIf
		Local $index = _GUICtrlListBox_GetCurSel($ctrl_actList)
		ExecAction(_GUICtrlListBox_GetText($ctrl_actList, $index))

		;执行下一个按键
		If $index<(_GUICtrlListBox_GetCount($ctrl_actList)-1) Then
			_GUICtrlListBox_SetCurSel($ctrl_actList,$index + 1)

			If GUICtrlRead($ctrl_autoContinue)=$GUI_CHECKED OR ($runToIndex>-1 And $index<$runToIndex) Then
				ExecActionList()
			Else
				$runToIndex = -1;
				SetExeing(False)
			EndIf
		Else
			SetExeing(False)
			If GUICtrlRead($ctrl_autoContinue)=$GUI_CHECKED Then
				;_GUICtrlListBox_SetCurSel($ctrl_actList,0)
				$runToIndex = -1;
				MsgBox(1,"执行完成", "执行完成")
			EndIf
		EndIf
	ElseIf _GUICtrlListBox_GetCount($ctrl_actList)<=0 Then
		SetExeing(False)
	EndIf
EndFunc

Func Action($action)
	If $ACT_SELECT_MODE Then
		If $action<>"" Then
			;记录到序列中
			if _GUICtrlListBox_GetCurSel($ctrl_actList)>=0 Then
				InsAction($action, _GUICtrlListBox_GetCurSel($ctrl_actList)+1)
			Else
				InsAction($action, -1)
			EndIf
		EndIf
	Else
		;执行动作
		ExecAction($action&"_1")
	EndIf
EndFunc

;把action数据插入到序列中
Func InsAction($action, $index)
	_GUICtrlListBox_InsertString($ctrl_actList,$action & "_" & GUICtrlRead($ctrl_actTimes),$index)

	actListToStr()
	;如果“同时操作PS3”是勾选的，那么就执行动作
	If (GUICtrlRead($ctrl_syncOp)=$GUI_CHECKED) And (StringInStr($action, "pc_wait_")<>1) And (StringInStr($action, "pc_aps3_")<>1) Then
		ExecAction($action & "_" & GUICtrlRead($ctrl_actTimes))
	EndIf
	;自动把次数重置为1
	GUICtrlSetData($ctrl_actTimes,"1")
EndFunc

Func SetExeing($bool)
	If $ACT_EXEING<>$bool OR $inited=False Then
		If $bool Then
			$ACT_EXEING = True
			GUICtrlSetData($ctrl_exeAct,"停止")
			GUICtrlSetState($ctrl_selectAct, $GUI_DISABLE)
			GUICtrlSetState($ctrl_delAct, $GUI_DISABLE)
			GUICtrlSetState($ctrl_clearAct, $GUI_DISABLE)
			GUICtrlSetState($ctrl_runToCurr, $GUI_DISABLE)
			;写入到文件
			Local $executing = FileOpen(@ScriptDir&"\"&"executing", 2)
			FileWrite($executing, "1")
			FileClose($executing)
			;执行侦听暂停的程序
			If $pauseProcess="" Then
				$pauseProcess = Run(@ScriptDir&"\pause.exe")
				Sleep(100)
			EndIf
			;开始执行动作序列
			ExecActionList()
		Else
			$ACT_EXEING = False
			GUICtrlSetData($ctrl_exeAct,"执行")
			GUICtrlSetState($ctrl_selectAct, $GUI_ENABLE)
			GUICtrlSetState($ctrl_delAct, $GUI_ENABLE)
			GUICtrlSetState($ctrl_clearAct, $GUI_ENABLE)
			GUICtrlSetState($ctrl_runToCurr, $GUI_ENABLE)
			;写入到文件
			Local $executing = FileOpen(@ScriptDir&"\"&"executing", 2)
			FileWrite($executing, "0")
			FileClose($executing)
			;执行侦听暂停的程序
			If $pauseProcess<>"" then
				ProcessClose($pauseProcess)
				$pauseProcess=""
			EndIf
		EndIf
	EndIf
EndFunc

Func ReadExeing()
	If $ACT_EXEING=True then
		If (Int(FileRead(@ScriptDir&"\"&"executing"))=0) Then
			$runToIndex = -1
			SetExeing(False)
		EndIf
	EndIf
EndFunc