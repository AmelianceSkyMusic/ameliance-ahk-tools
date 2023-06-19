#HotIf WinActive("ahk_exe code.exe")
#hotstring EndChars `t ;tab - expand snippet
#hotstring o ?

::host::npm run host{ENTER}
::dev::npm run dev{ENTER}
