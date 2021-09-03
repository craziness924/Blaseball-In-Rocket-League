#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
 #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^j::
AvailableFiles := []
Textdir = %A_ScriptDir%\Game_Texts
Loop Files, %Textdir%\*.txt
{
	currentindex := A_Index - 1
	currentfile = %A_LoopFileName%
	AvailableFiles[currentindex] := currentfile
}
Gamecount := AvailableFiles.Count() - 1
Random, randomnum, 1, Gamecount
Pickedfile := AvailableFiles[randomnum]
Filetoread = %A_ScriptDir%\Game_Texts\%Pickedfile%
FileRead, text, %Filetoread%
currentplayline = 1
return

^p::
retry:
FileReadLine, play, %Filetoread%, %currentplayline%
Sleep, 500
if play = ""
{
	currentplayline++
	Goto, retry
}
else
{
	currentplayline++
}
BlockInput On
SendInput, t
Sleep, 50
Loop, Parse, play
{
	SendInput, %A_Loopfield%
	Sleep, 55
}
Sleep 250
SendInput, `n
BlockInput Off
; BlockInput On
; SendInput, t
; Sleep, 50
; SendInput, %play%
; Sleep, 300
; SendInput, `n
; BlockInput Off


