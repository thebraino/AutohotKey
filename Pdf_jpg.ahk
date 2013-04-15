DefinedAddress = 
clipboard = 
Pause::Pause

; ^^Establishes future variables and makes the "pause" button on Keyboard Pause the script (Incase of an error)
; User opens the first PDF, then program saves each set of jpgs into the pre-existing 01_jpg folder

#Home::
Beginning:
SetTitleMatchMode, 2
WinWait, Adobe Acrobat Pro, 
IfWinNotActive, Adobe Acrobat Pro, , WinActivate, Adobe Acrobat Pro, 
WinWaitActive, Adobe Acrobat Pro, 
Sleep, 200
; ======= Determines if this is the first pdf conversion of the program
; ======= Grabs the file location ("P:\Project\Month_Year\etc" for easy repeatition
If (DefinedAddress = "")
{
Send, {ALTDOWN}fo{ALTUP}
WinWait, Open, 
IfWinNotActive, Open, , WinActivate, Open, 
WinWaitActive, Open,
Sleep, 1500
SendInput, {ShiftDOWN}{Tab}{ShiftUP}
Sleep, 500
Send, {Backspace}{Enter}
Sleep, 200
SendInput, {F4}{CTRLDOWN}a{CTRLUP}
sleep, 200
Send ^c
ClipWait
Sleep, 100
DefinedAddress = %clipboard%
SendInput, {Tab}{Esc}
Sleep, 1000
SetTitleMatchMode, 2

WinWait, Adobe Acrobat Pro, 
IfWinNotActive, Adobe Acrobat Pro, , WinActivate, Adobe Acrobat Pro, 
WinWaitActive, Adobe Acrobat Pro, 
Send, {ALTDOWN}faij{ALTUP}
WinWait, Save As, 
IfWinNotActive, Save As, , WinActivate, Save As, 
WinWaitActive, Save As, 
sleep, 1000

Send, {ALTDOWN}er{ALTUP}
Sleep, 200
Send,  600 pixels/inch
Sleep, 200
Send, {Tab}
Sleep, 200
Send, {Enter}
sleep, 200

Send, {SHIFTDOWN}{TAB}{TAB}{SHIFTUP}
Sleep, 500
Send, {DOWN}{UP}{ENTER}
Sleep, 300
Send, {ALTDOWN}s{ALTUP}
}
Else
{
; ======= All pdf conversions after the first is established
Send, ^w
Sleep, 1000
Send, {ALTDOWN}fo{ALTUP}
WinWait, Open, 
IfWinNotActive, Open, , WinActivate, Open, 
WinWaitActive, Open,
Sleep, 1500
Send, {f4}
Send, ^a
Sleep, 200
Send, %DefinedAddress%{Enter}
Sleep, 1000
SendInput, {Tab}{Tab}{Tab}{Tab}
Sleep, 1000
SendInput, {Down}{Enter}
Sleep, 1000
SendInput, {End}{Enter}
Sleep, 1000
SetTitleMatchMode, 2

WinWait, Adobe Acrobat Pro, 
IfWinNotActive, Adobe Acrobat Pro, , WinActivate, Adobe Acrobat Pro, 
WinWaitActive, Adobe Acrobat Pro, 
Send, {ALTDOWN}faij{ALTUP}
WinWait, Save As, 
IfWinNotActive, Save As, , WinActivate, Save As, 
WinWaitActive, Save As, 
sleep, 1000
Send, {SHIFTDOWN}{TAB}{TAB}{SHIFTUP}
Sleep, 500
Send, {DOWN}{UP}{ENTER}
Sleep, 300
Send, {ALTDOWN}s{ALTUP}
}


Pause
; ======= Waits for user to press the "Pause" button to unpause (established at beginning of code)
Goto, Beginning
; ======= Goes back to the beginning label "Beginning:"
