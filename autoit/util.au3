#include <GUIListBox.au3>

Func _GUICtrlListBox_Clear($list)
	While _GUICtrlListBox_GetCount($list)>0
		_GUICtrlListBox_DeleteString($list,0)
	WEnd
EndFunc