@@@!AVG\AvgSystem.s
@@@!Avg\AvgSystem_SceneReplay.s

@@!ReplayFunc
	\var,int,i
	\var,str,n
	\scp,sys	\sr,"@@!ReplayFunc"
	\scp,log	\i
	\sub,@@!Avg_Create
	\scp,sys	\lk,_lkSave+_lkLoad		
	\sub,@@!Avg_RewindSaveInit

	\fexs,ParamStr[0]
	\if,ResultInt[0]==0\then
		\ddlg,"ファイルが見つかりません："+ParamStr[0]+ParamStr[1]
	\else
		\sub,@@SceneReplayBegin
		\sub,ParamStr[1],ParamStr[0]
		\sub,@@SceneReplayEnd
	\end
	\scp,eff	\c
	\scp,sys	\sr,""
	\scp,sys	\tef,0			
	\sub,@@!Avg_Free
	\sub,@@!ReplayFreeAfter
	\for,i=0,i<15,i++
		\scp,snd[i]	\i
	\end
	\scp,eff	\i
	\scp,log	\i
	\scp,mdat	\i
	\scp,tdat	\i
	\sub,@@!Avg_RewindSaveInit
\ret

@@!ReplayFreeAfter
	\scp,eff	\fdi,0,250
	\zero
	\clk,300
\ret
