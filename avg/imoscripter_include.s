






@@!Imo_Include_Create
	
	\sub,@@!Imo_Include_AllClearCreate
	
	\scp,rep	\a,"^include","\sub,@@!Imo_Include_Excute,"
\ret


@@!Imo_Include_Free
	\del,Imo_IncludeAllClear
	\scp,rep	\d,"^include"
\ret


@@!Imo_Include_File
	\scp,Imo_Setting	\?v,"PathInclude"
	\sub,@@!Imo_FileSerch,,1,ParamStr[0],ResultStr[0],".s",".txt"
\ret


@@!Imo_Include_AllClearCreate
	\gvar,list,Imo_IncludeAllClear
	\sub,@@!Imo_Include_ListToCode,,Imo_FormatNames
	\sub,@@!Imo_Include_ListToCode,,Imo_SentenceNames
	\sub,@@!Imo_Include_ListToCode,,Imo_NullNames
	\sub,@@!Imo_Include_ListToCode,,Imo_ImageNames
	\sub,@@!Imo_Include_ListToCode,,Imo_CharaNames
	\sub,@@!Imo_Include_ListToCode,,Imo_Chara8eNames
	\sub,@@!Imo_Include_ListToCode,,Imo_SoundNames
	\sub,@@!Imo_Include_ListToCode,,Imo_MusicNames
	\sub,@@!Imo_Include_ListToCode,,Imo_MessageNames
	\sub,@@!Imo_Include_ListToCode,,Imo_FaceNames
	\sub,@@!Imo_Include_ListToCode,,Imo_NameTextNames
	\sub,@@!Imo_Include_ListToCode,,Imo_CameraNames
	\sub,@@!Imo_Include_ListToCode,,Imo_InfoNames
\ret

@@!Imo_Include_ListToCode
	\var,obj,o
	\cal,o=ParamStr[0]	

	\var,int,n,i
	\scp,o	\?c
	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,o	\?n,i
		\fmt,"^%s,",ResultStr[0]
		\scp,Imo_IncludeAllClear	\a,ResultStr[0]+"clear:def"
	\end
\ret


@@!Imo_Include_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\if,ParamStr[0]=="allclear"\then
		
		\scp,sl	\asn,Imo_IncludeAllClear
	\else
		
		\sub,@@!Imo_Include_File,,ParamStr[0]
		\scp,sl	\l,ResultStr[0]
	\end
	
	
	
	\var,int,n,i
	\var,str,s1
	\scp,sl	\?c		\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,sl	\?s,i
		\cal,s1=ResultStr[0]
		
		\if,s1==""\then
			\cnt
		\end
		
		
		
		\scp,rep	\?r,s1
		\cal,s1=ResultStr[0]
		
		\copy,s1,1,1
		\if,ResultStr[0]!="\"\then
			\cnt
		\end
		
		\exop,s1
	\end
	\cal,Imo_SentenceFlag=1
\ret

