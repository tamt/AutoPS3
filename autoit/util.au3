#include <GUIListBox.au3>

Func _GUICtrlListBox_Clear($list)
	While _GUICtrlListBox_GetCount($list)>0
		_GUICtrlListBox_DeleteString($list,0)
	WEnd
EndFunc

;从形如'item1|item2|item3|item4|item5'字符串导入
Func _GUICtrlListBox_Import($list, $str)
	$act_arr = StringSplit($str, "|")
	For $a=1 To $act_arr[0]
		_GUICtrlListBox_InsertString($list, $act_arr[$a])
	Next
EndFunc