


@@!MGExecute
	\case,ResultSubStr[0]
		\of,"config"		\go,@@!Top,"Script\Config\Main.s"
		\of,"screen"		\go,@@!Top,"Script\ScreenChange\Main.s"
		\of,"save"			\go,@@!Top,"Script\SaveLoad\Main_Save.s"
		\of,"load"			\go,@@!Top,"Script\SaveLoad\Main_Load.s"
		\of,"qsave"			\go,@@!Top,"Script\SaveLoad\Main_QuickSave.s"
		\of,"qload"			\go,@@!Top,"Script\SaveLoad\Main_QuickLoadShortcut.s"
		\of,"sload"			\go,@@!Top,"Script\SaveLoad\Main_SelectLoad.s"
		\of,"scenetop"		\go,@@!Top,"Script\SaveLoad\Main_SceneTop.s"
		\of,"sceneskip"		\go,@@!Top,"Script\SceneSkip\Main.s"
		\of,"skip"			\tsub,@@!AVG_OnSysButton_Skip
		\of,"auto"			\tsub,@@!AVG_OnSysButton_Auto
		\of,"voice"			\tsub,@@!Avg_OnSysButton_Voice
		\of,"suspend"		\go,@@!Top,"Script\Suspend\Suspend.s"
		\of,"title"			\go,@@!Top,"Script\Reset\Main.s"
		\of,"quit"			\go,@@!Top,"Script\Title\Main.s"
		\of,"log"			\go,@@!Top,"Script\Log\Main.s"
		\of,"view"			\go,@@!Top,"Script\View\Main.s"
	\end
\thrd,0



@@!MGFuncToFile
	\var,str,f
	\cal,f=""
	\case,ParamStr[0]
		\of,"none"		\cal,f="none"
		\of,"save"		\cal,f="save"
		\of,"load"		\cal,f="load"
		\of,"qsave"		\cal,f="qsave"
		\of,"qload"		\cal,f="qload"
		\of,"sload"		\cal,f="sload"
		\of,"scenetop"	\cal,f="scenetop"
		\of,"sceneskip"	\cal,f="sceneskip"
		\of,"config"	\cal,f="config"
		\of,"screen"	\cal,f="screen"
		\of,"log"		\cal,f="log"
		\of,"auto"		\cal,f="auto"
		\of,"skip"		\cal,f="skip"
		\of,"voice"		\cal,f="voice"
		\of,"title"		\cal,f="title"
		\of,"quit"		\cal,f="quit"
		\of,"suspend"	\cal,f="suspend"
		\of,"view"		\cal,f="view"
	\end
	\cal,ResultSubStr[0]=f
\ret


@@!MGFuncToLock
	\var,int,a
	\cal,a=1
		\srct,1	
		\case,ParamStr[0]
			\of,"none"			\cal,a=1
			\of,"save"			\scp,sys	\?lk	\cal,a=ResultInt[0]&_lkSave
			\of,"load"			\scp,sys	\?lk	\cal,a=ResultInt[0]&_lkLoad
			\of,"qsave"			\scp,sys	\?lk	\cal,a=ResultInt[0]&_lkSave
			\of,"qload"			\scp,sys	\?lk	\cal,a=ResultInt[0]&_lkLoad
			\of,"sload"			\scp,mdat	\?g,"SelectSaveData.svd"	\cal,a=ResultInt[0]==0
			\of,"scenetop"		\scp,sys	\?lk	\cal,a=ResultInt[0]&_lkLoad
			\of,"sceneskip"		\scp,sys	\?lkc	\cal,a=ResultInt[0] & 2
			\of,"config"		\scp,sys	\?lk	\cal,a=ResultInt[0]&_lkConfig
			\of,"log"			\scp,sys	\?lk	\cal,a=ResultInt[0]&_lkConfig
			\of,"auto"			\scp,sys	\?lk	\cal,a=ResultInt[0]&_lkAuto
			\of,"skip"			\scp,sys	\?lk	\cal,a=ResultInt[0]&_lkSkip
			\of,"screen"		\scp,sys	\?lk	\cal,a=ResultInt[0]&_lkScreen
			\of,"voice"			\scp,sys	\?lkc	\cal,a=ResultInt[0] & 1
			\of,"title"			\cal,a=0
			\of,"quit"			\cal,a=0
			\of,"suspend"		\cal,a=0
			\of,"view"			\scp,sys	\?lk	\cal,a=ResultInt[0]&_lkView
		\end
		\srct,0
	\cal,ResultSubInt[0]=a>0
\ret

