; https://www.autohotkey.com/boards/viewtopic.php?f=83&t=100197
; https://www.autohotkey.com/boards/viewtopic.php?f=83&t=100602
#Include ..\helpers\Native\Native.ahk

; aa := JSON.parse('{"abc":7}')
; bb := JSON.parse(FileRead("test.json"))

; MsgBox JSON.stringify(bb["menuItems"][1], 3)
; MsgBox bb["menuItems"][1]["icon"]

; __ahkJsonDllPath := A_ScriptDir '\lib\JSON\64bit\ahk-json.dll'
; __ahkJsonDllPath := A_ScriptDir '\lib\JSON\' (A_PtrSize * 8) 'bit\ahk-json.dll'

class JSON {
    static __New() {
        Native.LoadModule(A_ScriptDir '\lib\JSON\' (A_PtrSize * 8) 'bit\ahk-json.dll', ['JSON'])
        this.DefineProp('true', {value: 1})
        this.DefineProp('false', {value: 0})
        this.DefineProp('null', {value: ''})
    }
    static parse(str) => Map() | Array()
    static stringify(obj, space := 0) => ''
}
