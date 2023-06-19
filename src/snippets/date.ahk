#HotIf
#hotstring EndChars `t ;tab - expand snippet
#hotstring o ?

:cx:ddddddd::Sleep(50), SendText(FormatTime(, "yyyy MM dd "))
:cx:ввввввв::Sleep(50), SendText(FormatTime(, "yyyy MM dd "))

:cx:dddddd::Sleep(50), SendText(FormatTime(, " _ yyyy MM dd _ HH-mm"))
:cx:вввввв::Sleep(50), SendText(FormatTime(, " _ yyyy MM dd _ HH-mm"))

:cx:ddddd::Sleep(50), SendText(FormatTime(, "yyyy MM dd _ HH-mm _ "))
:cx:ввввв::Sleep(50), SendText(FormatTime(, "yyyy MM dd _ HH-mm _ "))
; :cx:dddd::Sleep(50), SendText(FormatTime(, "yyyy MM dd _ HH-mm _ "))
; :cx:вввв::Sleep(50), SendText(FormatTime(, "yyyy MM dd _ HH-mm _ "))

:cx:dddd::Sleep(50), SendText(FormatTime(, "_yyyy-MM-dd_HH-mm"))
:cx:вввв::Sleep(50), SendText(FormatTime(, "_yyyy-MM-dd_HH-mm"))

;   ;YYYY MM DD
; :cx:DDD::Sleep(50), SendText(FormatTime(, "yyyy MM dd "))
; :cx:ВВВ::Sleep(50), SendText(FormatTime(, "yyyy MM dd "))

:cx:ddd::Sleep(50), SendText(FormatTime(, "yyyy_MM_dd_"))
:cx:ввв::Sleep(50), SendText(FormatTime(, "yyyy_MM_dd_"))

:cx:cccc::Sleep(50), SendText('(' FormatTime(, "yyyy-MM-dd HH:mm:ss ddd") ')') ;
