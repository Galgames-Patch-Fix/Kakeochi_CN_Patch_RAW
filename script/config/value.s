



@@!ConfigValueInit
	\var,list,sl
	\var,int,i
	\scp,sl		\l,"ValueDefault.txt"
	
	
	\vexs,#SkipMode
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"SkipMode",1
		\svar,int,#SkipMode
		\cal,#SkipMode=ResultInt[0]
	\end
	
	
	\vexs,#ClickVoiceStop
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"ClickVoiceStop",0
		\svar,int,#ClickVoiceStop
		\cal,#ClickVoiceStop=ResultInt[0]
	\end
	
	
	\vexs,#AutoPlayVoiceWait
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"AutoPlayVoiceWait",1
		\svar,int,#AutoPlayVoiceWait
		\cal,#AutoPlayVoiceWait=ResultInt[0]
	\end
	
	
	
	\vexs,#EffectSpeed
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"EffectSpeed",100
		\svar,int,#EffectSpeed
		\cal,#EffectSpeed=ResultInt[0]
	\end
	
	
	\vexs,#SysEffectSpeed
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"SysEffectSpeed",100
		\svar,int,#SysEffectSpeed
		\cal,#SysEffectSpeed=ResultInt[0]
	\end
	
	
	\vexs,#KeepAutoPlay
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"KeepAutoPlay",1
		\svar,int,#KeepAutoPlay
		\cal,#KeepAutoPlay=ResultInt[0]
	\end
	
	\vexs,#KeepSkip
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"KeepSkip",1
		\svar,int,#KeepSkip
		\cal,#KeepSkip=ResultInt[0]
	\end
	
	\vexs,#SceneSkipLogEnable
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"SceneSkipLogEnable",0
		\svar,int,#SceneSkipLogEnable
		\cal,#SceneSkipLogEnable=ResultInt[0]
	\end
	
	\vexs,#LogJumpEnable
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"LogJumpEnable",0
		\svar,int,#LogJumpEnable
		\cal,#LogJumpEnable=ResultInt[0]
	\end
	
	
	\vexs,#LogJumpInterval
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"LogJumpInterval",0
		\svar,int,#LogJumpInterval
		\cal,#LogJumpInterval=ResultInt[0]
	\end
	
	\vexs,#AutoPlayReadSkip
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"AutoPlayReadSkip",0
		\svar,int,#AutoPlayReadSkip
		\cal,#AutoPlayReadSkip=ResultInt[0]
	\end
	
	\vexs,#ReadTextColor
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"ReadTextColor",1
		\svar,int,#ReadTextColor
		\cal,#ReadTextColor=ResultInt[0]
	\end
	
	\vexs,#SelectedColor
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"SelectedColor",1
		\svar,int,#SelectedColor
		\cal,#SelectedColor=ResultInt[0]
	\end
	
	\vexs,#DisplayLocation
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"DisplayLocation",1
		\svar,int,#DisplayLocation
		\cal,#DisplayLocation=ResultInt[0]
		\scp,sl	\?v,"DisplayMusic"
		\svar,int,#DisplayMusic
		\cal,#DisplayMusic=ResultInt[0]
	\end
	
	
	\vexs,#AutoSaveRoute
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"AutoSaveRoute",0
		\svar,int,#AutoSaveRoute
		\cal,#AutoSaveRoute=ResultInt[0]
	\end
	
	\vexs,#AutoSaveDay
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"AutoSaveDay",0
		\svar,int,#AutoSaveDay
		\cal,#AutoSaveDay=ResultInt[0]
	\end
	
	\vexs,#AutoSaveScene
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"AutoSaveScene",0
		\svar,int,#AutoSaveScene
		\cal,#AutoSaveScene=ResultInt[0]
	\end
	
	\vexs,#AutoSaveSelect
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"AutoSaveSelect",0
		\svar,int,#AutoSaveSelect
		\cal,#AutoSaveSelect=ResultInt[0]
	\end
	
	
	
	
	
	\vexs,#MasterVolume
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"MasterVolume",100
		\svar,int,#MasterVolume
		\cal,#MasterVolume=ResultInt[0]
	\end
	\vexs,#MasterMute
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"MasterMute",0
		\svar,int,#MasterMute
		\cal,#MasterMute=ResultInt[0]
	\end
	\vexs,#BGMVolume
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"BGMVolume",100
		\svar,int,#BGMVolume
		\cal,#BGMVolume=ResultInt[0]
	\end
	\vexs,#VoiceVolume
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"VoiceVolume",100
		\svar,int,#VoiceVolume
		\cal,#VoiceVolume=ResultInt[0]
	\end
	\vexs,#SEVolume
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"SEVolume",100
		\svar,int,#SEVolume
		\cal,#SEVolume=ResultInt[0]
	\end
	\vexs,#SysSEVolume
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"SysSEVolume",100
		\svar,int,#SysSEVolume
		\cal,#SysSEVolume=ResultInt[0]
	\end
	\vexs,#MovieVolume
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"MovieVolume",100
		\svar,int,#MovieVolume
		\cal,#MovieVolume=ResultInt[0]
	\end
	
	
	\vexs,#MusicVoicePlayVolumeDown
	\if,ResultInt[0]==0\then
		\scp,sl	\?v,"MusicVoicePlayVolumeDown",100
		\svar,int,#MusicVoicePlayVolumeDown
		\cal,#MusicVoicePlayVolumeDown=ResultInt[0]
	\end
	
	
	\vexs,#MouseGestureFunc
	\if,ResultInt[0]==0\then
		\svar,str,#MouseGestureFunc[8]
		\for,i=0,i<8,i++
			\fmt,"MouseGesture[%d]",i
			\scp,sl,\?v,ResultStr[0],"none"
			\cal,#MouseGestureFunc[i]=ResultStr[0]
		\end
	\end
	
	
	\scp,misc	\prm
	\if,ResultStr[1]=="--lj:0"\then
		\cal,#LogJumpEnable=0
	\end
	\scp,misc	\prm
	\if,ResultStr[1]=="--lj:1"\then
		\cal,#LogJumpEnable=1
	\end
\ret

