






@@!Layout_Create
  
  \gvar,img,Back

  \gvar,img,MaskImage
  \gvar,bar,ScrollBar
  \gvar,btn,ScrollButton[2]
  \gvar,btn,SysButton
  \gvar,btn,TempJumpButton
  \gvar,msg,TempMessage
  \gvar,btn,TempVoiceButton
  
  \scp,Back
    \l,"Back.b"
    \p,0,0,10
    \e







  \scp,MaskImage
    \l,"Mask.b"
    \p,0,0,130
    \e
    \mi,1 
  \scp,ScrollBar
    \l2,"VScroll_Btn.b","VScroll_Bar.b","",1
    \mv,100
    \v,100
    \vt,200
    \p,1180,90,200
    \us,"@@!ScrollBar"
    \vtn,3
    \e
  \scp,SysButton[0]
    \l,"Button_System.b"
    \li,0,"026_return_n.png"
    \li,1,"026_return_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,1059,674,200
    \mi,1
    \sp,1,1
    \tab,2000
    \us,"@@!Cancel"
    \vtn,3
    \e
  \scp,TempJumpButton
    \l,"Button_Jump.b"
    \p,156,440,100
  \scp,TempMessage
    \l,""
    \ts,900,200
    \o,"[s,26,26]【名前】[n]「ああああああああああああああああああああああ」"
    \p,250,410,110
  \scp,TempVoiceButton
    \l,"Button_Play.b"
    \p,156,579,100
    \sp,1,1
    \tab,100
    \us,"@@!Voice"
    \vtn,3
\ret

@@!Layout_Free
  
  \del,Back

  \del,MaskImage
  \del,ScrollBar
  \del,ScrollButton
  \del,SysButton
  \del,TempJumpButton
  \del,TempMessage
  \del,TempVoiceButton
\ret
