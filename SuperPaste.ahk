Pause::Pause

!v::
Send, {CTRLDOWN}v{CTRLUP}
sleep, 400
Loop {
  Send, {Backspace}
  Sleep, 1400
  Send, {Down}
  Sleep, 400
  Send, {Enter}
  Sleep, 800
  Send, {CTRLDOWN}v{CTRLUP}
  Sleep, 400 
IfWinActive, Confirm Folder Replace
{
    Send, {Right}{Right}{Enter}
    Break
    }
else IfWinActive, Copy File
{
    Send, {Enter}
    Break
    }
Sleep, 400
}
Return
