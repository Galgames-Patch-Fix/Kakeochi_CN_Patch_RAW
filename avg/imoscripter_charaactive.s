




@@@!ImoScripter_Base.s
@@@!misc\misc.s


@@!Imo_CharaActive_Create
	
	\gvar,table,Imo_CharaActiveParam
	\gvar,table,Imo_CharaActiveAbsParam
	\gvar,table,Imo_CharaActiveDefault
	
	\gvar,table,Imo_CharaActiveTemplate
	\scp,Imo_CharaActiveTemplate	\l,"ImoScripter_Template_CharaActive.txt"	\sort
	
	\gvar,table,Imo_CharaActiveNameTable
	\scp,Imo_CharaActiveNameTable	\l,"ImoScripter_CharaNameList.txt"	\sort
	
	\sub,@@!Imo_CharaActive_DefaultParam
	
	\scp,Imo_CharaActiveParam	\asn,Imo_CharaActiveDefault
	
	\sub,@@!Imo_CharaActive_Refresh
\ret


@@!Imo_CharaActive_Free
	\del,Imo_CharaActiveParam
	\del,Imo_CharaActiveAbsParam
	\del,Imo_CharaActiveDefault
	\del,Imo_CharaActiveTemplate
	\del,Imo_CharaActiveJump
	\del,Imo_CharaActiveNameTable
\ret


@@!Imo_CharaActive_DefaultParam
	\scp,Imo_CharaActiveDefault
		\i
		\v,"enable","true"
		\v,"acttime","100"
		\v,"actmulcolor","$ffffff"
		\v,"actaddcolor","none"
		\v,"actaddpri","none"
		\v,"deacttime","100"
		\v,"deactmulcolor","$888888"
		\v,"deactaddcolor","none"
		\v,"deactaddpri","none"
		\v,"deftime","0"
		\v,"defmulcolor","$ffffff"
		\v,"defaddcolor","none"
		\v,"defaddpri","none"
	\sub,@@!Imo_LoadDefaultFile,,Imo_ImageDefault,"Default_CharaActive.txt"
\ret


@@!Imo_CharaActive_File
	
	
\ret


@@!Imo_CharaActive_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\var,int,n,i,no
	\var,obj,p,a
	\var,str,op,s1,s2
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_CharaActiveTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	
	
	\cal,p=Imo_CharaActiveParam,a=Imo_CharaActiveAbsParam
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1]
		\scp,p	\v,op,s1
		
		\if,op=="clear"\then
			\scp,p	\comb,Imo_CharaActiveDefault
		\end
	\end
	
	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_CharaActive_Refresh
	\if,Imo_CharaActiveCount>0\then
		\sub,@@!Imo_CharaActive_Refresh_Before,,0
		\scp,Imo_CharaActiveParam	\?c
		\if,ResultInt[0]>0\then
			\sub,@@!Imo_CharaActive_Refresh_Main,,0
		\end
		\sub,@@!Imo_CharaActive_Refresh_After,,0
		\scp,Imo_CharaActiveParam	\i
	\end
\ret

@@!Imo_CharaActive_ParamClear
	\if,Imo_CharaActiveCount>0\then
		\scp,Imo_CharaActiveParam	\i
	\end
\ret

@@!Imo_CharaActive_Refresh_Before
	\var,str,s1
	\var,int,c,n
	\var,obj,a,p,o
	\cal,n=ParamInt[0]
	\cal,p=Imo_CharaActiveParam,a=Imo_CharaActiveAbsParam
	
	
	\scp,a	\comb,p
\ret





@@!Imo_CharaActive_Event
	\if,Imo_CharaActiveCount==0\then
		\ret
	\end
	
	\var,int,active	
	\var,obj,a,p
	\cal,p=Imo_CharaActiveParam
	\cal,a=Imo_CharaActiveAbsParam
	
	\var,obj,charaabs,charaprm
	\cal,charaprm=ParamStr[0]
	\cal,charaabs=ParamStr[1]
	
	
	\scp,p	\?v,"enable"
	\if,ResultStr[0]!=""\then
		
		\if,ResultStr[0]=="true"\then
			\cal,active=2	
		\else
			\cal,active=3	
		\end
	\else
		
		
		\scp,a	\?v,"enable"
		\if,ResultStr[0]!="true"\then
			\ret
		\end
		
		
		\scp,charaabs	\?v,"show"
		\if,ResultStr[0]!="true"\then
			\ret
		\end
		
		
		\scp,charaabs	\?v,"file0"
		\if,ResultStr[0]=="none"\then
			\ret
		\end
		
		
		\var,str,f
		\sub,@@!Imo_Chara8e_GetSubFilename,,charaabs
		\cal,f=ResultStr[0]
		
		\scp,charaabs	\?v,"id"
		\sub,@@!Imo_CharaActive_GetActive,,ResultStr[0],f
		\cal,active=ResultInt[0]
	\end
	
	\var,obj,a=Imo_ActiveCharaAbsParam
	\var,int,change
	\var,str,v,base1,base2
	
	
	\case,active
		\of,0	\cal,base1="deact",base2="deact"
		\of,1	\cal,base1="act",base2="act"
		\of,2	\cal,base1="deact",base2="def"	
		\of,3	\cal,base1="def",base2="def"	
	\end
	
	\scp,a	\?v,base1+"mulcolor","none"
	\cal,v=ResultStr[0]
	\if,v!="none"\then
		\sub,@@!Imo_CharaActive_SetParam,,charaprm,charaabs,"mulcolorbase",v
		\cal,change=change | ResultInt[0]
	\end
	\scp,a	\?v,base1+"addcolor","none"
	\cal,v=ResultStr[0]
	\if,v!="none"\then
		\sub,@@!Imo_CharaActive_SetParam,,charaprm,charaabs,"addcolorbase",v
		\cal,change=change | ResultInt[0]
	\end
	\scp,a	\?v,base1+"addpri","none"
	\cal,v=ResultStr[0]
	\if,v!="none"\then
		\sub,@@!Imo_CharaActive_SetParam,,charaprm,charaabs,"addpri",v
	\end
	
	\if,change==1\then
		\scp,a	\?v,base2+"time","none"
		\cal,v=ResultStr[0]
		\if,v!="none"\then
			\sub,@@!Imo_CharaActive_SetParam,,charaprm,charaabs,"colortime",v,1
		\end
	\end
\ret


@@!Imo_CharaActive_GetActive
	\var,str,id,charaid,charafile
	
	\cal,charaid=ParamStr[0]
	\cal,charafile=ParamStr[1]
	
	\var,int,i
	\for,i=0,i<Imo_FormatMultiIndex,i++
		\cal,id=Imo_FormatName[i]
		\if,id==""\then
			\cnt
		\end
		
		\if,id==charaid\then
			\cal,ResultInt[0]=1
			\ret
		\end
		
		\scp,Imo_CharaActiveNameTable	\?v,id,id	
		\pos,id,charafile
		\if,ResultInt[0]>0\then
			\cal,ResultInt[0]=1
			\ret
		\end
	\end
	
	\cal,ResultInt[0]=0
\ret


@@!Imo_CharaActive_SetParam
	\var,obj,p,a
	\cal,p=ParamStr[0]
	\cal,a=ParamStr[1]
	\var,str,v,n
	\cal,n=ParamStr[2]
	\cal,v=ParamStr[3]
	\scp,p	\?v,n			
	\if,ResultStr[0]==""\then
		\scp,a	\?v,n		
		\if,(ResultStr[0]!=v)||(ParamInt[4]==1)\then
			\scp,p	\v,n,v
			\scp,a	\v,n,v
			\cal,ResultInt[0]=1
			\ret
		\end
	\end
	\cal,ResultInt[0]=0
\ret


@@!Imo_CharaActive_Refresh_Main
	
\ret

@@!Imo_CharaActive_Refresh_After

\ret


