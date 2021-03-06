






@@!Layout_Window_Create
  
  \gvar,img,CursorImage
  \gvar,sbtn,SysButton[13]
  \gvar,sbtn,SysTipsButton
  \gvar,img,TempMessageWindow
  \gvar,img,WindowAnimation
  
  \scp,CursorImage
    \l,"Click.b"
    \m,1
    \p,1200,630,1550
    \tab,1100
    \sp,1,1
  \scp,SysButton[0]
    \l,"Button_long.b"
    \li,0,"001_save_n.png"
    \li,1,"001_save_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,576,701,1550
    \us,"Save","@@!Save"
    \tab,1300
    \sp,1,1
    \vtn,3
  \scp,SysButton[1]
    \l,"Button_long.b"
    \li,0,"002_load_n.png"
    \li,1,"002_load_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,653,701,1550
    \us,"Load","@@!Load"
    \tab,1301
    \sp,1,1
    \vtn,3
  \scp,SysButton[2]
    \l,"Button_long.b"
    \li,0,"003_system_n.png"
    \li,1,"003_system_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,730,701,1550
    \us,"config","@@!Config"
    \tab,1302
    \sp,1,1
    \vtn,3
  \scp,SysButton[3]
    \l,"Button_long.b"
    \li,0,"004_auto_n.png"
    \li,1,"004_auto_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,807,701,1550
    \us,"Auto","@@!AVG_OnSysButton_Auto","self"
    \tab,1400
    \sp,1,1
    \vtn,3
  \scp,SysButton[4]
    \l,"Button_long.b"
    \li,0,"005_skip_n.png"
    \li,1,"005_skip_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,884,701,1550
    \us,"skip","@@!AVG_OnSysButton_Skip","self"
    \tab,1401
    \sp,1,1
    \vtn,3
  \scp,SysButton[5]
    \l,"Button_long.b"
    \li,0,"006_voice_n.png"
    \li,1,"006_voice_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \p,961,701,1550
    \us,"custom","@@!Avg_OnSysButton_Voice","self"
    \ui,1
    \tab,1402
    \sp,1,1
    \vtn,3
  \scp,SysButton[6]
    \l,"Button_long.b"
    \li,0,"007_log_n.png"
    \li,1,"007_log_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,1038,701,1550
    \us,"Log","@@!Log"
    \tab,1403
    \sp,1,1
    \vtn,3
  \scp,SysButton[7]
    \l,"Button_long.b"
    \li,0,"008_close_n.png"
    \li,1,"008_close_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,1115,701,1550
    \us,"View","@@!View"
    \tab,1404
    \sp,1,1
    \vtn,3
  \scp,TempMessageWindow
    \l,"WindowFrame_main.b"
    \p,0,0,1100
    
  \scp,WindowAnimation
    \l,"Animation.b"
    \p,0,720,1000
\ret

@@!Layout_Window_Free
  
  \del,CursorImage
  \del,SysButton
  \del,SysTipsButton
  \del,TempMessageWindow
  \del,WindowAnimation
\ret
