#HotIf

; calculator keyboard key
^Launch_App2:: Send("{Blind}^{BackSpace}")
Launch_App2:: Send("{Blind}{BackSpace}")

CapsLock & j:: Send("{Blind}{Left}")
CapsLock & i:: Send("{Blind}{Up}")
CapsLock & l:: Send("{Blind}{Right}")
CapsLock & k:: Send("{Blind}{Down}")
CapsLock & u:: Send("{Blind}{Home}")
CapsLock & o:: Send("{Blind}{End}")
CapsLock & n:: Send("{Blind}{End}{Enter}")

CapsLock & a:: Send("{Blind}{Left}")
CapsLock & w:: Send("{Blind}{Up}")
CapsLock & d:: Send("{Blind}{Right}")
CapsLock & s:: Send("{Blind}{Down}")
CapsLock & q:: Send("{Blind}{Home}")
CapsLock & e:: Send("{Blind}{End}")
CapsLock & z:: Send("{Blind}{BackSpace}")
CapsLock & c:: Send("{Blind}{Del}")
CapsLock & f:: Send("{Blind}{Enter}")

CapsLock & -:: Send("{Blind}{BackSpace}")
CapsLock & +:: Send("{Blind}{Del}")

CapsLock & 2:: Send('{Blind}#{TAB}')
CapsLock & 3:: Send('{Blind}^#{LEFT}')
CapsLock & 4:: Send('{Blind}^#{RIGHT}')

CapsLock & 8:: Send('{Blind}#{TAB}')
CapsLock & 9:: Send('{Blind}^#{LEFT}')
CapsLock & 0:: Send('{Blind}^#{RIGHT}')

CapsLock & ,:: Send('{Blind}^z')
CapsLock & .:: Send('{Blind}^+z')
