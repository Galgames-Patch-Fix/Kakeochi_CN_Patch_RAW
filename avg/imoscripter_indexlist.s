






@@!Imo_IndexList_Create
	\gvar,list,Imo_IndexList
	\gvar,str,Imo_IndexListScriptFile
	\gvar,int,Imo_IndexListIndex
	
	\scp,rep	\a,"^index","\sub,@@!Imo_IndexList_Excute,"
\ret


@@!Imo_IndexList_Free
	\scp,rep	\d,"^index"
	\del,Imo_IndexList
	\del,Imo_IndexListScriptFile
	\del,Imo_IndexListIndex
\ret


@@!Imo_IndexList_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\cal,Imo_IndexListIndex=ParamInt[0]
\ret



@@!Imo_IndexList_Refresh
	\var,str,f
	\scp,sys	\?mrd	
	\cal,f=ResultStr[0]
	\if,f!=Imo_IndexListScriptFile\then
		\sub,@@!Imo_IndexList_Refresh_Load,,f
	\end
\ret

@@!Imo_IndexList_Refresh_Load
	\var,str,f
	\cal,f=ParamStr[0]
	
	\cal,Imo_IndexListScriptFile=f
	\rep,f,".s",".idx"	
	\cal,f=ResultStr[0]
	
	\scp,Imo_IndexList	\i
	\fexs,f
	\if,ResultInt[0]==1\then
		\scp,Imo_IndexList	\l,f
	\end
\ret







@@!Imo_IndexList_GetState
	\var,int,a
	\cal,a=Imo_IndexListIndex+ParamInt[0]
	\scp,Imo_IndexList	\?c
	\if,a<ResultInt[0]\then
		\scp,Imo_IndexList	\?s,a
	\else
		\cal,ResultStr[0]=""
	\end
	\div,",",ResultStr[0]
	\cal,ResultInt[0]=ResultStr[0]	
\ret

