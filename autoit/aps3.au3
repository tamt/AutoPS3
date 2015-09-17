;主要负责保存、读取aps3文件
;aps3是我们自定义的文件格式，存储PS3按键序列

#include <Array.au3>
#include <File.au3>

#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Func aps3_saveToFile($act_list_str)
	; Create a constant variable in Local scope of the message to display in FileSaveDialog.
    Local Const $sMessage = "文件名"

    ; Display a save dialog to select a file.
    Local $sFileSaveDialog = FileSaveDialog($sMessage, @ScriptDir&"\aps3\", "aps3 (*.aps3)", $FD_PATHMUSTEXIST)
    If @error Then
        ; Display the error message.
        MsgBox($MB_SYSTEMMODAL, "", "保存失败")
    Else
        ; Retrieve the filename from the filepath e.g. Example.au3.
        Local $sFileName = StringTrimLeft($sFileSaveDialog, StringInStr($sFileSaveDialog, "\", $STR_NOCASESENSE, -1))

        ; Check if the extension .au3 is appended to the end of the filename.
        Local $iExtension = StringInStr($sFileName, ".", $STR_NOCASESENSE)

        ; If a period (dot) is found then check whether or not the extension is equal to .au3.
        If $iExtension Then
            ; If the extension isn't equal to .au3 then append to the end of the filepath.
            If Not (StringTrimLeft($sFileName, $iExtension - 1) = ".aps3") Then $sFileSaveDialog &= ".aps3"
        Else
            ; If no period (dot) was found then append to the end of the file.
            $sFileSaveDialog &= ".aps3"
        EndIf

        ; Display the saved file.
        MsgBox($MB_SYSTEMMODAL, "", "文件保存到:" & @CRLF & $sFileSaveDialog)

    EndIf

EndFunc