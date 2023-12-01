






@@!Layout_Create
  
  \gvar,img,BackImage
  \gvar,btn,Button[6]
  
  \scp,BackImage
    \l,"TitleBack.b"
	\li,0,"【UI】_タイトル画面 のコピー2.png"
	\li,1,"【UI】_タイトル画面 のコピー.png"
    \p,0,0,0
    \e
  \scp,Button[0]
    \l,"Button.b"
    \li,0,"001_start_n.png"
    \li,1,"001_start_o.png"
    \li,2,"001_start_x.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,256,507,100
    \us,"@@!Start"
    \vtn,3
    \tab,0
    \sp,50,0
    \d
  \scp,Button[1]
    \l,"Button.b"
    \li,0,"002_continue_n.png"
    \li,1,"002_continue_o.png"
    \li,2,"002_continue_x.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,410,507,100
    \us,"@@!Load"
    \vtn,3
    \tab,1
    \sp,50,0
    \d
  \scp,Button[2]
    \l,"Button.b"
    \li,0,"003_load_n.png"
    \li,1,"003_load_o.png"
    \li,2,"003_load_x.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,564,507,100
    \us,"@@!Continue"
    \vtn,3
    \tab,2
    \sp,50,0
    \d
  \scp,Button[3]
    \l,"Button.b"
    \li,0,"004_system_n.png"
    \li,1,"004_system_o.png"
    \li,2,"004_system_x.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,718,507,100
    \us,"@@!Config"
    \vtn,3
    \tab,100
    \sp,50,0
    \d
  \scp,Button[4]
    \l,"Button.b"
    \li,0,"005_extra_n.png"
    \li,1,"005_extra_o.png"
    \li,2,"005_extra_x.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,872,507,100
    \us,"@@!Extra"
    \vtn,3
    \tab,101
    \sp,50,0
    \d
  \scp,Button[5]
    \l,"Button.b"
    \li,0,"006_exit_n.png"
    \li,1,"006_exit_o.png"
    \li,2,"006_exit_x.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,1026,507,100
    \us,"@@!Quit"
    \vtn,3
    \tab,102
    \sp,50,0
    \d
\ret

@@!Layout_Free
  
  \del,BackImage
  \del,Button
\ret
