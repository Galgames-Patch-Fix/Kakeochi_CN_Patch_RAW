
@@@!Avg\AvgSystem_Rewind.s





@@!GameValueInit
	
	\vexs,__RootFile
	\if,ResultInt[0]==0\then
		\gvar,str,__RootFile,__SelectFile
		\gvar,str,_HomeFile,_HomeLabel,__RootFile,_SelectFile,Avg_SelectCurLabel,Avg_BranchCurLabel
		\gvar,int,AVG_SceneOnSkip
		\gvar,list,_FlagList
		\cal,__RootFile="Scenario\root.s",__SelectFile="Scenario\select.s"
	\end
	
	
	
	
	\svar,int,#Game_ClearFlag[16],#SPOpenflag
	\svar,int,#ClearFlag_yuz,#ClearFlag_mah,#ClearFlag_ari,#ClearFlag_nat,#ClearFlag_gra
	\svar,int,#ClearFlag_yuzAF,#ClearFlag_mahAF,#ClearFlag_ariAF,#ClearFlag_natAF
	
	
	
	
	\gvar,int,Game_RouteFlag[16]
	\gvar,str,Game_CurrentRoute
	
	
	\sub,@@!Avg_RewindSaveCreate
\ret



@@!GameValueReset
	
	\sub,@@!GameValueInit
	
	\init,Game_RouteFlag
	
	\sub,@@!Avg_RewindSaveInit
	\scp,log	\i
\ret

