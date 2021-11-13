




@@@!AvgSystem_Custom.s
@@@!ImoScripter.s
@@@!misc\misc.s





@@!Avg_Create
	
	\vexs,Avg_InitFlag
	\if,ResultInt[0]>0\then
		\ret
	\end
	
	\gvar,int,Avg_InitFlag
	\cal,Avg_InitFlag=0
	\gvar,int,Avg_InterruptLock
	\cal,Avg_InterruptLock=1
	
	\sub,@@!ImoScripter_Create
	
	\sub,@@!Avg_OnCreate
	
	\scp,sys	\eve,"OnFrame",@@!AVG_OnFrameEvent
	
	\sub,@@!Avg_OnKeySet
	
	\sub,@@!Avg_Create_FileLog
	\scp,flog	\lk,0
	\scp,llog	\lk,0
	
	\scp,Imo_Setting	\?v,"SaveThumPriority"	\stid,ResultStr[0],999
	\scp,sys	\tz,ResultInt[0]
	
	\cal,Avg_InitFlag=1
	\zero
\ret



@@!Avg_Free
	
	\vexs,Avg_InitFlag
	\if,ResultInt[0]==0\then
		\ret
	\end
	
	\scp,flog	\i
	\scp,llog	\i
	
	\sub,@@!Avg_OnKeyReset
	
	\scp,sys	\eve,"OnFrame",""
	
	\sub,@@!Avg_OnFree
	
	\sub,@@!ImoScripter_Free
	
	\del,Avg_InitFlag
	\del,Avg_InterruptLock
	
	\sub,@@!Misc_OnMiscInit
	\zero
	\draw
\ret


@@!Avg_Create_FileLog
	\var,int,i,n
	\var,list,sl
	
	\scp,Imo_Setting	\?v,"FileLog"
	\scp,sl
		\ad,",",ResultStr[0]
		\?c
	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,sl		\?s,i
		\scp,flog	\a,ResultStr[0]
	\end
\ret







@@!Avg_SaveTextScene
	\vexs,Avg_InitFlag
	\if,ResultInt[0]>0\then
		\sub,@@!Avg_SaveThumFilter,,0
	\end
	
	
	\if,ParamStr[0]!=""\then
		\if,ParamStr[0]=="none"\then
			\scp,sys	\n2,0,""
		\else
			\scp,sys	\n2,0,ParamStr[0]
		\end
	\end
	\if,ParamStr[1]!=""\then
		\if,ParamStr[1]=="none"\then
			\scp,sys	\n2,1,""
		\else
			\scp,sys	\n2,1,ParamStr[1]
		\end
	\end
	\if,ParamStr[2]!=""\then
		\if,ParamStr[2]=="none"\then
			\scp,sys	\n2,2,""
		\else
			\scp,sys	\n2,2,ParamStr[2]
		\end
	\end
	
	\vexs,Avg_InitFlag
	\if,ResultInt[0]==0\then
		\ret
	\end
	
	\if,Avg_SceneSkipFlag==1\then
		\ret
	\end
	
	
	\if,ParamStr[0]!=""\then
		\if,#AutoSaveScene==1\then
			\sub,@@!Misc_AutoSave	\zero
		\end
	\end
	\if,ParamStr[1]!=""\then
		\if,#AutoSaveScene==0\then	
			\if,#AutoSaveDay==1\then
				\sub,@@!Misc_AutoSave	\zero
			\end
		\end
	\end
	\if,ParamStr[2]!=""\then
		\if,#AutoSaveScene==0\then	
			\if,#AutoSaveDay==0\then
				\if,#AutoSaveRoute==1\then
					\sub,@@!Misc_AutoSave	\zero
				\end
			\end
		\end
	\end
	
	
	\scp,Imo_Setting	\?v,"SceneTopSave",0
	\if,ResultInt[0]==1\then
		\sub,@@!Misc_SceneTopSave
	\end
\ret




@@!Avg_SaveThumFilter
	\if,ParamInt[0]==1\then
		\var,int,m,x,y
		\scp,Imo_Setting	\?v,"SaveThumMode"		\cal,m=ResultInt[0]
		\scp,Imo_Setting	\?v,"SaveThumParamX"	\cal,x=ResultInt[0]
		\scp,Imo_Setting	\?v,"SaveThumParamY"	\cal,y=ResultInt[0]
		\scp,sys	\tef,m,x,y
	\else
		\scp,sys	\tef,0
	\end
\ret


@@!Avg_SystemReset
	\scp,sys	\r
\ret

