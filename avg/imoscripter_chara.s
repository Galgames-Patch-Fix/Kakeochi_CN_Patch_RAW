




@@@!ImoScripter_Base.s


@@!Imo_Chara_Create
	
	\gvar,table,Imo_CharaParam[Imo_CharaCount]
	\gvar,table,Imo_CharaAbsParam[Imo_CharaCount]
	\gvar,table,Imo_CharaDefault
	\gvar,img,Imo_Chara[Imo_CharaCount]
	\gvar,img,Imo_CharaExt[Imo_CharaCount]
	
	\gvar,table,Imo_CharaTemplate
	\scp,Imo_CharaTemplate	\l,"ImoScripter_Template_Chara.txt"	\sort
	
	\gvar,table,Imo_CharaExtention
	\scp,Imo_CharaExtention	\l,"ImoScripter_ExtentionList.txt"	\sort
	
	\gvar,table,Imo_CharaPosList
	\scp,Imo_CharaPosList	\l,"ImoScripter_CharaPosList.txt"	\sort
	\gvar,str,Imo_CharaPrePosStr
	
	\gvar,table,Imo_CharaKeepWord
	\scp,Imo_CharaKeepWord
		\v,"+","1"
		\v,"＋","1"
	
	\gvar,table,Imo_CharaJump
	\scp,Imo_CharaJump
		\v,"hide"		,"@@!Imo_Chara_00BaseFile,@@!Imo_Chara_01SubFile,@@!Imo_Chara_10Basic"
		\v,"show"		,"@@!Imo_Chara_10Basic"
		\v,"id"			,""
		\v,"x"			,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"y"			,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"z"			,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"ax"			,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"ay"			,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"az"			,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"scalex"		,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"scaley"		,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"scalez"		,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"rotx"		,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"roty"		,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"rotz"		,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"pri"		,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"addpri"		,"@@!Imo_Chara_20Position,@@!Imo_Chara_26ExtPosition"
		\v,"alignx"		,"@@!Imo_Chara_10Basic"
		\v,"aligny"		,"@@!Imo_Chara_10Basic"
		\v,"motion"		,"@@!Imo_Chara_12Motion"
		\v,"time"		,""
		\v,"oncetime"	,""
		\v,"move"		,"@@!Imo_Chara_10Basic"
		\v,"movepow"	,"@@!Imo_Chara_10Basic"
		\v,"base"		,"@@!Imo_Chara_00BaseFile,@@!Imo_Chara_01SubFile,@@!Imo_Chara_10Basic,@@!Imo_Chara_12Motion"
		\v,"path"		,"@@!Imo_Chara_01SubFile,@@!Imo_Chara_24PositionFile"
		\v,"name"		,"@@!Imo_Chara_01SubFile,@@!Imo_Chara_24PositionFile"
		\v,"texfilter"	,"@@!Imo_Chara_10Basic"
		\v,"alpha"		,"@@!Imo_Chara_20Color"
		\v,"addcolor"	,"@@!Imo_Chara_20Color"
		\v,"mulcolor"	,"@@!Imo_Chara_20Color"
		\v,"blend"		,"@@!Imo_Chara_20Color"
		\v,"speed"		,"@@!Imo_Chara_10Basic"
		\v,"imgfilter"	,"@@!Imo_Chara_10Basic"
		\v,"extfile"	,"@@!Imo_Chara_00ExtFile,@@!Imo_Chara_12ExtMotion,@@!Imo_Chara_26ExtPosition"
		\v,"extmotion"	,"@@!Imo_Chara_12ExtMotion,@@!Imo_Chara_26ExtPosition"
		\v,"extax"		,"@@!Imo_Chara_26ExtPosition"
		\v,"extay"		,"@@!Imo_Chara_26ExtPosition"
		\v,"extaz"		,"@@!Imo_Chara_26ExtPosition"
		\v,"extsx"		,"@@!Imo_Chara_26ExtPosition"
		\v,"extsy"		,"@@!Imo_Chara_26ExtPosition"
		
		
		\v,"gmode1"		,"@@!Imo_Chara_30Generator1"
	
	\sub,@@!Imo_Chara_DefaultParam
	\var,int,i
	\for,i=0,i<Imo_CharaCount,i++
		
		\scp,Imo_Chara[i]
			\dc,1
			\vtn,_stSE
			\in,$1	
			\out,$1
		\scp,Imo_CharaExt[i]
			\dc,1
			\vtn,_stSE
			\in,$1	
			\out,$1
		
		\scp,Imo_CharaParam[i]	\asn,Imo_CharaDefault
		
		\scp,Imo_CharaNames		\?n,i
		\scp,Imo_CharaAbsParam[i]
			\v,"*objectname",ResultStr[0]
			\v,"*objectindex",i
	\end
	
	\sub,@@!Imo_Chara_Refresh
\ret


@@!Imo_Chara_Free
	\del,Imo_CharaPrePosStr
	\del,Imo_CharaPosList
	\del,Imo_CharaParam
	\del,Imo_CharaAbsParam
	\del,Imo_CharaDefault
	\del,Imo_CharaTemplate
	\del,Imo_Chara
	\del,Imo_CharaExt
	\del,Imo_CharaJump
	\del,Imo_CharaExtention
	\del,Imo_CharaKeepWord
\ret


@@!Imo_Chara_DefaultParam
	\scp,Imo_CharaDefault
		\i
		\v,"hide","false"
		\v,"show","true"
		\v,"id","none"
		\v,"x","0"
		\v,"y","0"
		\v,"z","0"
		\v,"ax","0"
		\v,"ay","0"
		\v,"az","0"
		\v,"scalex","100"
		\v,"scaley","100"
		\v,"scalez","100"
		\v,"rotx","0"
		\v,"roty","0"
		\v,"rotz","0"
		\v,"pri","500"
		\v,"addpri","0"
		\v,"alignx","center"
		\v,"aligny","bottom"
		\v,"motion","0"
		\v,"time","0"
		\v,"oncetime","0"
		\v,"move","linear"
		\v,"movepow","100"
		\v,"base","none"
		\v,"path","none"
		\v,"name","none"
		\v,"texfilter","pass"
		\v,"alpha","$FF"
		\v,"addcolor","$000000"
		\v,"mulcolor","$FFFFFF"
		\v,"blend","pass"
		\v,"speed","100"
		\v,"imgfilter","none"
		\v,"extfile","none"
		\v,"extmotion","0"
		\v,"extax","0"
		\v,"extay","0"
		\v,"extaz","0"
		\v,"extsx","100"
		\v,"extsy","100"
		\v,"extsz","100"
		
		\v,"gmode1","none"
		\v,"gtime1",0
		\v,"gcycle1",100
		\v,"ginfinity1","false"
		\v,"gx1",0
		\v,"gy1",0
		\v,"gz1",0
		\v,"gtarget1","position"
		\v,"gfade1","out"
	\sub,@@!Imo_LoadDefaultFile,,Imo_CharaDefault,"Default_Chara.txt"
\ret


@@!Imo_Chara_File
	\scp,Imo_Setting	\?v,"PathChara"
	\sub,@@!Imo_FileSerch,,1,ParamStr[0],ResultStr[0],".png",".b","argb",".ogv",".bmp",".jpg"
\ret


@@!Imo_Chara_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\var,int,n,i,no
	\var,obj,p,a
	\var,str,op,s1,s2
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_CharaTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	\scp,sl	\?s,0	\stid,ResultStr[0],0
	\cal,no=ResultInt[0]
	\cal,p=Imo_CharaParam[no],a=Imo_CharaAbsParam[no]
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1],s2=ResultStr[2]
		\scp,p
		\case,op
			\of,"align"	\v,"alignx",s1	\v,"aligny",s2
			\of,"file"		\v,"name",s1	\v,"path",s2
		\else
			\v,op,s1
		\end
		
		\if,op=="clear"\then
			\if,s1=="def"\then
				\scp,p	\comb,Imo_CharaDefault
			\end
		\end
	\end
	
	
	\sub,@@!Imo_EventHook_Chara,,p,a
	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_Chara_Refresh
	\var,int,i
	\for,i=0,i<Imo_CharaCount,i++
		\scp,Imo_CharaParam[i]	\?c
		\if,ResultInt[0]>0\then
			
			
			\sub,@@!Imo_Chara_Refresh_MotionCheck,,i
			
			\sub,@@!Imo_Chara_Refresh_Main,,i
		\end
	\end
\ret

@@!Imo_Chara_ParamClear
	\var,int,i
	\for,i=0,i<Imo_CharaCount,i++
		\scp,Imo_CharaParam[i]	\?i
	\end
\ret

@@!Imo_Chara_Refresh_Main
	\var,obj,a,p,o,o2
	\var,int,a1,a2,nn
	\var,str,s1,s2
	\cal,nn=ParamInt[0]
	\cal,a=Imo_CharaAbsParam[nn]
	\cal,p=Imo_CharaParam[nn]
	\cal,o=Imo_Chara[nn]		
	\cal,o2=Imo_CharaExt[nn]	
	
	
	\scp,p	\?v,"base"
	\if,ResultStr[0]!=""\then
		\scp,a	\v,"motion","0"
	\end
	\scp,p	\?v,"extfile"
	\if,ResultStr[0]!=""\then
		\scp,a	\v,"extmotion","0"
	\end
	
	
	\scp,a	\comb,p
	
	
	\var,int,n,i
	\var,table,t
	\scp,p	\?c	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,p	\?n,i							
		\scp,Imo_CharaJump	\?v,ResultStr[0]	
		\div,",",ResultStr[0]					
		\scp,t
			\v,ResultStr[0],0					
			\v,ResultStr[1],0					
			\v,ResultStr[2],0					
			\v,ResultStr[3],0					
	\end
	\scp,t	\sort								
	
	\scp,t	\?c	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,t	\?n,i
		\sub,ResultStr[0],,o,p,a,o2	
	\end
\ret

@@!Imo_Chara_Refresh_MotionCheck
	\var,int,nn
	\cal,nn=ParamInt[0]
	
	\scp,Imo_CharaAbsParam[nn]	\?v,"*CheckMotion"
	\if,ResultInt[0]==0\then
		\ret
	\end
	\scp,Imo_CharaAbsParam[nn]	\v,"*CheckMotion",0
	
	\scp,Imo_Project	\?v,"CharaMotionResetDisable",0
	\if,ResultInt[0]==1\then
		\ret
	\end
	
	\var,obj,a,p,o,o2
	\cal,a=Imo_CharaAbsParam[nn]
	\cal,p=Imo_CharaParam[nn]
	\cal,o=Imo_Chara[nn]		
	\cal,o2=Imo_CharaExt[nn]	

	\scp,a	\?v,"*CheckMotion"
	\if,ResultInt[0]==0\then
		\ret
	\end
	\scp,a	\v,"*CheckMotion",0

	
	\var,str,s1,s2
	\scp,a	\?v,"show"
	\cal,s1=ResultStr[0]
	\scp,a	\?v,"hide"
	\cal,s2=ResultStr[0]
	\if,s1=="false" || s2=="true"\then
		\scp,o	\m,"def"
		\scp,o2	\m,"def"
		\scp,a	\v,"motion","def"
		\scp,a	\v,"extmotion","def"
		\ret
	\end
	
	
	\scp,a	\?v,"motion"
	\if,ResultStr[0]!=""\then
		\scp,Imo_CharaKeepWord	\bpos,ResultStr[0]	
		\if,ResultInt[0]==-1\then
			\scp,o	\m,"def"
			\scp,a	\v,"motion","def"
		\end
	\end
	
	
	\scp,a	\?v,"extmotion"
	\if,ResultStr[0]!=""\then
		\scp,Imo_CharaKeepWord	\bpos,ResultStr[0]
		\if,ResultInt[0]==-1\then
			\scp,o2	\m,"def"
			\scp,a	\v,"extmotion","def"
		\end
	\end
\ret


@@!Imo_Chara_10Basic
	\var,obj,o,p,a,o2
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2],o2=ParamStr[3]
	\var,int,a1,a2
	\var,str,s1,s2
	
	
	\scp,a	\?v,"alignx"	\cal,s1=ResultStr[0]
	\scp,a	\?v,"aligny"	\cal,s2=ResultStr[0]
	\stid,s1,0	\cal,a1=ResultInt[0]
	\stid,s2,0	\cal,a2=ResultInt[0]
	\case,s1
		\of,"left"		\cal,a1=0
		\of,"center"	\cal,a1=50
		\of,"right"	\cal,a1=100
	\end
	\case,s2
		\of,"top"		\cal,a2=0
		\of,"center"	\cal,a2=50
		\of,"bottom"	\cal,a2=100
	\end
	\scp,o	\alg2,a1,a2
	\scp,o2	\alg2,50,50
	
	\scp,a	\?v,"move","linear"
	\scp,Imo_MoveModeList	\?v,ResultStr[0]	\cal,a1=ResultInt[0]
	\scp,a	\?v,"movepow",100					\cal,a2=ResultInt[0]
	\scp,o	\mm,a1,a2
	\scp,o2	\mm,a1,a2
	
	\scp,a	\?v,"texfilter"
	\scp,Imo_TexFilterList	\?v,ResultStr[0],0
	\scp,o	\tf,ResultInt[0]
	\scp,o2	\tf,0
	
	\scp,a	\?v,"imgfilter"
	\sub,@@!Imo_ImageFilterOpConvert,,ResultStr[0]
	\scp,o	\fo,0,ResultStr[0]
	
	\scp,a	\?v,"speed",100	\cal,a1=ResultInt[0]
	\scp,o	\ps,a1
	\scp,o2	\ps,a1
	
	
	\scp,a	\?v,"show"
	\cal,s1=ResultStr[0]
	\scp,a	\?v,"hide"
	\cal,s2=ResultStr[0]
	\if,s1=="true" && s2=="false"\then
		\scp,o	\e
		\scp,o2	\e
	\else
		\scp,o	\d
		\scp,o2	\d
	\end
\ret

@@!Imo_Chara_00BaseFile
	\var,obj,o,p,a,o2
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2],o2=ParamStr[3]
	
	
	\scp,a	\?v,"hide"
	\if,ResultStr[0]=="true"\then
		\ret
	\end
	
	\scp,a	\?v,"base"
	\sub,@@!Imo_Chara8e_File,,ResultStr[0]
	\scp,o	\l,ResultStr[0]	\m,0
	\sub,@@!Imo_Zero
\ret

@@!Imo_Chara_01SubFile
	\var,obj,o,p,a,o2
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2],o2=ParamStr[3]

	\var,str,s1,s2
	\scp,a	\?v,"path"	\cal,s1=ResultStr[0]
	\scp,a	\?v,"name"	\cal,s2=ResultStr[0]
	\if,s1=="none"\then
		\cal,s1=""
	\end
	\if,s2=="none"\then
		\cal,s2=""
	\end
	
	
	\scp,a	\v,"*charafile",s1+s2

	
	\scp,a	\?v,"hide"
	\if,ResultStr[0]=="true"\then
		\ret
	\end
	
	
	\sub,@@!Imo_Chara_File,,s1+s2
	\cal,s1=ResultStr[0]
	
	\scp,a	\?v,"base"
	\if,ResultStr[0]!="none"\then
		\scp,o	\li,0,s1
	\else
		\var,int,e
		\scp,o	\?e	\cal,e=ResultInt[0]
		\scp,o	\l,s1
		\if,e==1\then
			\scp,o	\e
		\end
	\end

	
	\if,s2==""\then
		\scp,o	\m,"def"
		\scp,o2	\m,"def"
	\end
	
	\sub,@@!Imo_Zero
\ret

@@!Imo_Chara_12Motion
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,str,s1
	\var,int,a1
	\scp,a	\?v,"motion"	\cal,s1=ResultStr[0]
	\stid,s1,$FFFF
	\cal,a1=ResultInt[0]
	\if,a1==$FFFF\then
		\scp,o	\m,s1
	\else
		\scp,o	\m,a1
	\end
	
	
	\scp,a	\v,"*CheckMotion",1
\ret

@@!Imo_Chara_20Position
	\var,obj,o,p,a,o2
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2],o2=ParamStr[3]

	\var,int,x,y,z,sx,sy,sz,rx,ry,rz,pri,tt
	\scp,a	\?v,"time",0	\cal,tt=ResultInt[0]
	\scp,p	\?v,"oncetime"
	\if,ResultStr[0]!=""\then
		\cal,tt=ResultInt[0]
	\end
	\scp,a	\?v,"x"			\cal,x=ResultInt[0]
	\scp,a	\?v,"y"			\cal,y=ResultInt[0]
	\scp,a	\?v,"z"			\cal,z=ResultInt[0]
	\scp,a	\?v,"ax"		\cal,x=x+ResultInt[0]
	\scp,a	\?v,"ay"		\cal,y=y+ResultInt[0]
	\scp,a	\?v,"az"		\cal,z=z+ResultInt[0]
	\scp,a	\?v,"scalex",100	\cal,sx=ResultInt[0]
	\scp,a	\?v,"scaley",100	\cal,sy=ResultInt[0]
	\scp,a	\?v,"scalez",100	\cal,sz=ResultInt[0]
	\scp,a	\?v,"rotx"		\cal,rx=ResultInt[0]
	\scp,a	\?v,"roty"		\cal,ry=ResultInt[0]
	\scp,a	\?v,"rotz"		\cal,rz=ResultInt[0]
	\scp,a	\?v,"pri"		\cal,pri=ResultInt[0]
	\scp,a	\?v,"addpri"	\cal,pri=pri+ResultInt[0]
	
	\scp,a	\?v,"*charafile"
	\sub,@@!Imo_Chara_PosTable,,Imo_CharaPosList,ResultStr[0]
	\cal,x=x+ResultInt[0]
	\cal,y=y+ResultInt[1]
	\cal,z=z+ResultInt[2]
	\cal,Imo_CharaPrePosStr=ResultStr[0]	
	
	\scp,o	\p4,x,y,z,sx,sy,sz,rx,ry,rz,pri,tt
	\sub,@@!Imo_Zero
\ret

@@!Imo_Chara_24PositionFile
	\var,obj,o,p,a,o2
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2],o2=ParamStr[3]
	
	
	\scp,a	\?v,"*charafile"
	\sub,@@!Imo_Chara_PosTable,,Imo_CharaPosList,ResultStr[0]
	\if,Imo_CharaPrePosStr!=ResultStr[0]\then
		\sub,@@!Imo_Chara_20Position,,o,p,a,o2
	\end
\ret

@@!Imo_Chara_20Color
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,a	\?v,"blend"
	\scp,Imo_BlendModeList	\?v,ResultStr[0]
	\scp,o	\bm,ResultInt[0]
	
	\var,int,alp,addcol,mulcol,tt
	\scp,a	\?v,"time",0	\cal,tt=ResultInt[0]
	\scp,p	\?v,"oncetime"
	\if,ResultStr[0]!=""\then
		\cal,tt=ResultInt[0]
	\end
	\scp,a	\?v,"alpha",$FF			\cal,alp=ResultInt[0]
	\scp,a	\?v,"addcolor",$000000	\cal,addcol=ResultInt[0]
	\scp,a	\?v,"mulcolor",$FFFFFF	\cal,mulcol=ResultInt[0]
	\scp,o	\col,alp,mulcol,addcol,tt
	\sub,@@!Imo_Zero
\ret

@@!Imo_Chara_00ExtFile
	\var,obj,p,a,o2
	\cal,p=ParamStr[1],a=ParamStr[2],o2=ParamStr[3]

	\var,int,e
	\scp,o2	\?e	\cal,e=ResultInt[0]
	
	\scp,a	\?v,"extfile"
	\sub,@@!Imo_Chara_File,,ResultStr[0]
	\scp,o2	\l,ResultStr[0]
	
	\if,e==1\then
		\scp,o2	\e
	\end
	
	\sub,@@!Imo_Zero
\ret

@@!Imo_Chara_12ExtMotion
	\var,obj,o,p,a,o2
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2],o2=ParamStr[3]

	\var,str,s1
	\var,int,a1
	\scp,a	\?v,"extmotion"	\cal,s1=ResultStr[0]
	\stid,s1,$FFFF
	\cal,a1=ResultInt[0]
	\if,a1==$FFFF\then
		\scp,o2	\m,s1
	\else
		\scp,o2	\m,a1
	\end
	
	
	\scp,a	\v,"*CheckMotion",1
\ret

@@!Imo_Chara_26ExtPosition
	\var,obj,o,o2,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2],o2=ParamStr[3]
	
	\var,int,x,y,z,sx,sy,sz,pri,tt
	
	\scp,o	\?p4
	\cal,x=ResultInt[0],y=ResultInt[1],z=ResultInt[2],pri=ResultInt[9]
	\cal,sx=ResultInt[3],sy=ResultInt[4],sz=ResultInt[5]
	\scp,a	\?v,"time",0	\cal,tt=ResultInt[0]
	\scp,p	\?v,"oncetime"
	\if,ResultStr[0]!=""\then
		\cal,tt=ResultInt[0]
	\end
	
	\var,int,eax,eay,eaz,extsx,extsy,extsz
	\scp,a	\?v,"extax"	\cal,eax=ResultInt[0]
	\scp,a	\?v,"extay"	\cal,eay=ResultInt[0]
	\scp,a	\?v,"extaz"	\cal,eaz=ResultInt[0]
	\scp,a	\?v,"extsx"	\cal,extsx=ResultInt[0]
	\scp,a	\?v,"extsy"	\cal,extsy=ResultInt[0]
	
	\var,str,mm,ff,ee
	\scp,a	\?v,"*charafile"	\cal,ff=ResultStr[0]
	\scp,a	\?v,"extfile"		\cal,ee=ResultStr[0]
	\scp,a	\?v,"extmotion"		\cal,mm=ResultStr[0]
	\sub,@@!Imo_Chara_PosTable,,Imo_CharaExtention,ee+"_"+mm+"_"+ff
	\cal,eax=eax+ResultInt[0]
	\cal,eay=eay+ResultInt[1]
	\cal,eaz=eaz+ResultInt[2]
	\cal,extsx=extsx*ResultInt[3]/100
	\cal,extsy=extsy*ResultInt[4]/100
	
	\cal,eax=eax*sx/100+x
	\cal,eay=eay*sy/100+y
	\cal,eaz=eaz*sz/100+z
	\cal,sx=extsx*sx/100
	\cal,sy=extsy*sy/100
	
	\scp,o2	\p4,eax,eay,eaz,sx,sy,sz,0,0,0,pri+10,tt
\ret


@@!Imo_Chara_PosTable
	\var,obj,t
	\cal,t=ParamStr[0]
	\var,str,s

	\scp,t	\bpos,ParamStr[1]
	\cal,s=ResultStr[1]				
	\if,s==""\then
		\scp,t	\?v,"default"	
		\cal,s=ResultStr[0]
	\end
	
	\div,",",s,1,1,0				
	
	\if,ResultInt[3]==0\then
		\cal,ResultInt[3]=100
	\end
	\if,ResultInt[4]==0\then
		\cal,ResultInt[4]=100
	\end

	\cal,ResultStr[0]=s
\ret

@@!Imo_Chara_30Generator1
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,int,mm,tt,ct,wx,wy,wz,tg,fd,inf
	
	\scp,a	\?v,"gmode1","none"
	\scp,Imo_GModeList	\?v,ResultStr[0]	\cal,mm=ResultInt[0]
	
	\scp,a	\?v,"gtime1",0
	\if,ResultStr[0]=="infinity"\then
		\cal,tt=-1
	\else
		\cal,tt=ResultInt[0]
	\end
	
	\scp,a	\?v,"gcycle1",100	\cal,ct=ResultInt[0]
	
	\scp,a	\?v,"gx1",0		\cal,wx=ResultInt[0]
	\scp,a	\?v,"gy1",0		\cal,wy=ResultInt[0]
	\scp,a	\?v,"gz1",0		\cal,wz=ResultInt[0]
	
	\scp,a	\?v,"gtarget1","position"
	\case,ResultStr[0]
		\of,"position"		\cal,tg=0
		\of,"zoom","size"	\cal,tg=1
		\of,"rotate"		\cal,tg=2
	\end
	
	\scp,a	\?v,"gfade1","out"
	\scp,Imo_GFadeList	\?v,ResultStr[0]	\cal,fd=ResultInt[0]
	
	\scp,p	\?v,"ginfinity1","false"
	\cal,inf=(ResultStr[0]=="true")
	
	\scp,o	\g,0, mm,tt,ct, wx,wy,wz, tg,fd, inf
\ret

