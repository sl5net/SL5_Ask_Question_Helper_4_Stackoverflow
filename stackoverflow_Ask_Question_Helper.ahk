#Include init_global.init.inc.ahk
; {home}{Home}

CoordMode,Pixel
CoordMode,Screen
CoordMode,Mouse
askWintitleHowTo = How to Ask - Stack Overflow - Google Chrome ahk_class Chrome_WidgetWin_1
askWintitle = Ask a Question - Stack Overflow - Google Chrome ahk_class Chrome_WidgetWin_1 
askWintitle = Ask a Question - Stack Overflow - Google Chrome
; Ask a Question - Stack !Overflow - Google Chrome

IfWinExist,% askWintitle
   ToolTip1sec(":) askWintitle exist ") ; 

;~ doIt("ToolTip")

~^k::
   ToolTip3sec("insert Code Modus") 
   WinGetActiveTitle,activeTitle
   ;~ Clipboard:= % activeTitle
   ;~ if(activeTitle != "Ask a Question - Stack Overflow - Google Chrome") 
      ;~ return
   doIt("send")
return


return  ; probably redundant. its more secure if we do that.
#Include functions_global.inc.ahk
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;~ subroutinen beispielsweise m¸sen ans Dateiende
#Include functions_global_dateiende.inc.ahk
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Include UPDATEDSCRIPT_global.inc.ahk

doIt(mode){
   Suspend,on
   c=%Clipboard% 
   ;~ c=test`ntesten`ntstint
   ;~ c:="{Home}{Home}IfWinNotEaxist,%run_Win%`n{`n   MsgBox,:( Oops `n   Reloadﬂ`n }`nWinGet, winID,id,A`nSetTitleMatchMode,1"
   ;~ c:="~^k::" ; works with sendRaw

   sp4 := " " . " " . " " . " " ;  ; 
   ;~ sp4 := "." . "." . "." . "|" ;  ; 
   
   cSp4 := c
   cSp4 := RegExReplace(cSp4,"m)(`n+)([^`n]*?)" , "$1" .  sp4 . "$2")
   ;~ cSp4 := RegExReplace(cSp4,"m)`{" , "{{}" )
   ;~ cSp4 := RegExReplace(cSp4,"m)([^`{])`}" , "$1{}}" )
   ;~ cSp4 := RegExReplace(cSp4,"m)`^" , "`^" )
   cSp4 := RegExReplace(cSp4,"(`n+)" , "$1" .  sp4 . "")
   cSp4 := "`n" . sp4 . RegExReplace(cSp4,"[`r`n]\s*[`r`n]" , "`n")
   if(mode != "ToolTip"){
      ;~ Send,{Enter}
      ;~ send,% convert123To_NumPad123(cSp4) 
      ;~ cSp4:= convert123To_NumPad123(cSp4) 
      ;~ SendRaw cSp4 ; is triggering htstrings shortcuts ans more
      ClipboardBackup := Clipboard
      Clipboard := cSp4
      Send,^v ; is triggering htstrings shortcuts ans more
      Clipboard:=ClipboardBackup
      Send,{Enter}
   }else
      ToolTip,% cSp4
   Suspend,off
   return Suspend
}