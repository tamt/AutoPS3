#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

If WinExists("停止执行动作序列") Then
    Exit
EndIf

#Region ### START Koda GUI section ### Form=D:\work\AutoPS3\autoit\pause.kxf
$Form1 = GUICreate("停止执行动作序列", 170, 346, 352, 127)
$ctrl_pause = GUICtrlCreateButton("停止", 24, 104, 123, 89)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

WinMove($Form1, "", 0, 0)

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit
        Case $ctrl_pause
            ;写入到文件
            Local $executing = FileOpen(@ScriptDir&"\"&"executing", 2)
            FileWrite($executing, "0")
            FileClose($executing)
            Exit
    EndSwitch
WEnd