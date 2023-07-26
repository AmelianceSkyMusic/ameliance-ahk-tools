#HotIf

CapsLock & 9::
#9::
#1::{
	PostMessage 0x0050, 0, 0x4090409,, "A"  ; US 0x0050 is WM_INPUTLANGCHANGEREQUEST
	Msg("English")
}

CapsLock & 0::
#0::
#2::{
	PostMessage 0x0050, 0, 0x4220422,, "A"  ; UA 0x0050 is WM_INPUTLANGCHANGEREQUEST
	Msg("Ukrainian")
}


; #3::{
; 	PostMessage 0x0050, 0, 0x4190419,, "A"  ; RU 0x0050 is WM_INPUTLANGCHANGEREQUEST
; 	Msg("Russian")
; }
