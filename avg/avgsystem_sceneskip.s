







@@!Avg_SceneSkipCreate
	
	\vexs,Avg_SceneSkipFlag
	\if,ResultInt[0]==0\then
		\gvar,int,Avg_SceneSkipFlag,Avg_SceneSkipLock,Avg_SceneSkipStep,Avg_SceneSkipMode
		\gvar,int,Avg_SceneSkipEnable,Avg_SceneSkipPreExecute
		\gvar,str,Avg_SceneSkipName,Avg_SceneSkipPreName
		\cal,Avg_SceneSkipLock=1
		\cal,Avg_SceneSkipEnable=0
	\end
	\cal,Avg_SceneSkipEnable=0
\ret

@@!Avg_SceneSkipFree
	\cal,Avg_SceneSkipEnable=0
\ret



@@!Avg_SceneSkipOn
	\if,Avg_SceneSkipLock==0\then
		\cal,Avg_SceneSkipFlag=1
		\cal,Avg_SceneSkipMode=0
	\end
\ret

@@!Avg_SceneSkipOn_NextSelect
	\if,Avg_SceneSkipLock==0\then
		\cal,Avg_SceneSkipFlag=1
		\cal,Avg_SceneSkipMode=1	
	\end
\ret

@@!Avg_SceneSkipOn_Cancel
	\if,Avg_SceneSkipFlag==1\then
		\cal,Avg_SceneSkipMode=0
	\end
\ret








@@!Avg_SceneSkipCheckPoint
	
	\cal,Avg_SceneSkipPreExecute=Avg_SceneSkipFlag>0
	
	\if,Avg_SceneSkipName!=""\then
		\fmt,"SceneSkip_%s",Avg_SceneSkipName
		\scp,llog	\s,ResultStr[0],256
	\end
	
	\cal,Avg_SceneSkipStep=0
	\cal,Avg_SceneSkipLock=0
	\if,ParamStr[0]!=""\then
		\if,ParamInt[0]==0\then
			\cal,Avg_SceneSkipLock=1	
		\end
	\end
	
	\if,ParamStr[1]==""\then
		\scp,sys	\?mrd,1
		\cal,Avg_SceneSkipName=ResultStr[0]+ResultStr[1]
	\else
		\cal,Avg_SceneSkipName=ParamStr[1]
	\end
	
	\sub,@@!Avg_SceneSkipGetEnbale,,1	
	
	\if,Avg_SceneSkipFlag>0\then
		
		\if,Avg_SceneSkipEnable==0\then
			\cal,Avg_SceneSkipFlag=0
			\sub,@@!Avg_SceneSkipEnd
			\ret
		\end
		\if,Avg_SceneSkipMode==0\then
			
			\cal,Avg_SceneSkipFlag=0	
			\sub,@@!Avg_SceneSkipEnd
			\ret
		\else
			
			\if,ParamInt[0]==2\then
				\cal,Avg_SceneSkipFlag=0	
				\sub,@@!Avg_SceneSkipEnd
				\ret
			\end
		\end
	\end
\ret

@@!Avg_SceneSkipGetEnbale
	\if,ParamInt[0]==1\then
		\cal,Avg_SceneSkipPreName=""	
	\end
	
	\if,Avg_SceneSkipName==Avg_SceneSkipPreName\then
		\cal,ResultInt[0]=Avg_SceneSkipEnable
		\ret
	\end
	
	\var,int,l
	\cal,l=Avg_SceneSkipLock
	\if,l==0\then
		\vexs,#ModeSceneSkipOpen
		\if,ResultInt[0]==0\then
			\scp,Imo_Setting	\?v,"SceneSkipNeedKidoku"
			\if,ResultInt[0]==1\then
				\fmt,"SceneSkip_%s",Avg_SceneSkipName
				\scp,llog	\?g,ResultStr[0]
				\if,ResultInt[0]<1\then
					\cal,l=1
				\end
			\end
		\end
	\end
	\cal,Avg_SceneSkipEnable = l==0
	\cal,Avg_SceneSkipPreName=Avg_SceneSkipName
	\cal,ResultInt[0]=Avg_SceneSkipEnable
\ret




@@!Avg_SceneSkipStep
	
	\vexs,Avg_SceneSkipImage
	\if,ResultInt[0]==0\then
		\sub,@@!Avg_SceneSkipStart
	\end
	
	\if,Avg_SceneSkipStep&63==0\then	
		\sub,@@!Avg_OnSceneSkipStep		
	\end
	
	\if,Avg_SceneSkipMode==1\then
		\scp,inp	\k2,$10001,$10002,$10004,$1000D,$1001B,$10020,$10009		
		\if,ResultInt[0]!=0\then
			\thrd,1,"@@!SceneSkip_Cancel"
		\end
	\end
	\cal,Avg_SceneSkipStep++
\ret

@@!Avg_SceneSkipStart
	\gvar,int,SceneSkipStartFlag
	
	\sub,@@!Imo_Layout_WindowHide
	
	\scp,skey	\lk,1+2
	
	\gvar,int,Avg_SceneSkipSysLock
	\scp,sys	\?lk
	\cal,Avg_SceneSkipSysLock=ResultInt[0]
	\scp,sys	\lk,$FFFF-_lkSkip
	
	\scp,snd[#VoicePlaySoundChannel]	\v,0,250
	
	\scp,sys	\in,$FFFFFF-$FF	\out,$FFFFFF-$FF
	
	\scp,camex	\i
	
	\var,int,i,n
	\garr,snd	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,snd[i]	\v,0,250
	\end
	\garr,dsnd	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,snd[i]	\i
	\end
	
	\sub,@@!Avg_OnSceneSkipStart	
	\sub,@@!Avg_SceneSkipStep
	\skip,5000
	\draw
\ret


@@!Avg_SceneSkipEnd
	
	\vexs,SceneSkipStartFlag
	\if,ResultInt[0]==0\then
		\ret
	\end
	\del,SceneSkipStartFlag
	
	\var,int,i,n
	\garr,snd	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,snd[i]	\i
	\end
	
	\sub,@@!Imo_AllInit
	
	\scp,sys	\p,0
	\scp,sys	\lk,Avg_SceneSkipSysLock
	\scp,sys	\ap,0
	\del,Avg_SceneSkipSysLock
	
	\scp,skey	\lk,0
	
	\scp,Imo_Setting	\?v,"SceneSkipAddLogText"
	\if,ResultStr[0]!=""\then
		\scp,log	\a,"",ResultStr[0],"",0
	\end
	
	\cal,Imo_LogText=""
	\cal,Imo_LogName=""
	\cal,Imo_LogVoice=""
	
	\sub,@@!Avg_OnSceneSkipEnd		
	
	\scp,sys	\in,$FFFFFF	\out,$FFFFFF
	\draw
\ret





@@!Avg_SceneSkipSelectSuspend
	
	\var,int,i,n
	\garr,snd	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,snd[i]	\i
	\end
	
	\sub,@@!Imo_AllInit
	
	\scp,sys	\p,0
	\scp,sys	\lk,$FFFF-_lkScreen-_lkConfig
	\scp,sys	\lkc,$FFFF
	\scp,sys	\ap,0
	
	\scp,skey	\lk,0
	
	
	
	
	
	
	\cal,Imo_LogText=""
	\cal,Imo_LogName=""
	\cal,Imo_LogVoice=""
	
	\sub,@@!Avg_OnSceneSkipEnd		
	
	\scp,sys	\in,$FFFFFF-$F	\out,$FFFFFF-$F
	
	\scp,Imo_Setting	\?v,"SceneSkipCanSaveSelect"
	\if,ResultInt[0]==1\then
		\sub,@@!Imo_Layout_WindowShow
		\scp,sys	\lk,$FFFF-_lkScreen-_lkConfig-_lkSave-_lkLoad
	\end
\ret

@@!Avg_SceneSkipSelectResume
	
	\sub,@@!Imo_Layout_WindowHide
	
	\scp,skey	\lk,1+2
	
	\scp,sys	\lk,$FFFF
	\scp,sys	\lkc,$FFFF
	
	\scp,snd[#VoicePlaySoundChannel]	\v,0,250
	
	\scp,sys	\in,$FFFFFF-$FF	\out,$FFFFFF-$FF
	
	\scp,camex	\i
	
	\var,int,i,n
	\garr,snd	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,snd[i]	\v,0,250
	\end
	\garr,dsnd	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,snd[i]	\i
	\end
	
	\sub,@@!Avg_OnSceneSkipStart	
	\sub,@@!Avg_SceneSkipStep
	\skip,5000
	\draw
\ret


