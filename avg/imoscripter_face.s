




@@@!ImoScripter_Base.s
@@@!ImoScripter_Format.s
@@@!ImoScripter_Chara.s


@@!Imo_Face_Create
	
	\gvar,table,Imo_FaceParam[Imo_FaceCount]
	\gvar,table,Imo_FaceAbsParam[Imo_FaceCount]
	\gvar,table,Imo_FaceDefault
	\gvar,img,Imo_Face[Imo_FaceCount]
	
	\gvar,table,Imo_FaceRepID
	\gvar,table,Imo_FaceRepFile
	\gvar,table,Imo_FacePosList
	\scp,Imo_FaceRepID		\l,"ImoScripter_Face_RepID.txt"		\sort
	\scp,Imo_FaceRepFile	\l,"ImoScripter_Face_RepFile.txt"	\sort
	\scp,Imo_FacePosList	\l,"ImoScripter_Face_PosList.txt"	\sort
	\gvar,str,Imo_FacePrePosStr
	
	\gvar,table,Imo_FaceTemplate
	\scp,Imo_FaceTemplate	\l,"ImoScripter_Template_Face.txt"	\sort
	
	\gvar,table,Imo_FaceJump
	\scp,Imo_FaceJump
		\v,"mode"		,""
		\v,"disp"		,""
		\v,"show"		,""	
		\v,"id"			,""
		\v,"x"			,"@@!Imo_Face_20Position"
		\v,"y"			,"@@!Imo_Face_20Position"
		\v,"z"			,"@@!Imo_Face_20Position"
		\v,"scalex"		,"@@!Imo_Face_20Position"
		\v,"scaley"		,"@@!Imo_Face_20Position"
		\v,"scalez"		,"@@!Imo_Face_20Position"
		\v,"rotx"		,"@@!Imo_Face_20Position"
		\v,"roty"		,"@@!Imo_Face_20Position"
		\v,"rotz"		,"@@!Imo_Face_20Position"
		\v,"pri"		,"@@!Imo_Face_20Position"
		\v,"alignx"		,"@@!Imo_Face_10Basic"
		\v,"aligny"		,"@@!Imo_Face_10Basic"
		\v,"motion"		,"@@!Imo_Face_12Motion"
		\v,"time"		,""	
		\v,"move"		,"@@!Imo_Face_10Basic"
		\v,"movepow"	,"@@!Imo_Face_10Basic"
		\v,"base"		,"@@!Imo_Face_00BaseFile,@@!Imo_Face_01SubFile,@@!Imo_Face_10Basic,@@!Imo_Face_12Motion"
		\v,"file"		,"@@!Imo_Face_01SubFile,@@!Imo_Face_10Basic,@@!Imo_Face_20Position"
		\v,"texfilter"	,"@@!Imo_Face_10Basic"
		\v,"imgfilter"	,"@@!Imo_Face_11Filter"
		\v,"imgfilterbase","@@!Imo_Face_11Filter"
		\v,"alpha"		,"@@!Imo_Face_20Color"
		\v,"addcolor"	,"@@!Imo_Face_20Color"
		\v,"mulcolor"	,"@@!Imo_Face_20Color"
		\v,"blend"		,"@@!Imo_Face_20Color"
		\v,"genfilter"	,"@@!Imo_Face_30StringGenerator0"
	
	\sub,@@!Imo_Face_DefaultParam
	\var,int,i,n
	\for,i=0,i<Imo_FaceCount,i++
		
		\scp,Imo_Face[i]
			\dc,0
			\vtn,_stSE
			\in,$8	
			\out,$8
		
		\scp,Imo_FaceParam[i]		\asn,Imo_FaceDefault
		
		\scp,Imo_FaceNames		\?n,i
		\scp,Imo_FaceAbsParam[i]
			\v,"*objectname",ResultStr[0]
			\v,"*objectindex",i
	\end
	
	\sub,@@!Imo_Face_Refresh
\ret


@@!Imo_Face_Free
	\del,Imo_FaceParam
	\del,Imo_FaceAbsParam
	\del,Imo_FaceDefault
	\del,Imo_FaceJump
	\del,Imo_FaceTemplate
	\del,Imo_Face
	\del,Imo_FaceRepID,Imo_FaceRepFile,Imo_FacePosList
	\del,Imo_FacePrePosStr
\ret


@@!Imo_Face_DefaultParam
	\scp,Imo_FaceDefault
		\i
		\v,"mode","auto"
		\v,"disp","once"
		\v,"show","false"
		\v,"id","none"
		\v,"x","0"
		\v,"y","0"
		\v,"z","0"
		\v,"scalex","100"
		\v,"scaley","100"
		\v,"scalez","100"
		\v,"rotx","0"
		\v,"roty","0"
		\v,"rotz","0"
		\v,"pri","1200"
		\v,"alignx","left"
		\v,"aligny","top"
		\v,"motion","0"
		\v,"time","0"
		\v,"move","linear"
		\v,"movepow","100"
		\v,"base","none"
		\v,"file","none"
		\v,"texfilter","pass"
		\v,"imgfilter","none"
		\v,"imgfilterbase","none"
		\v,"alpha","$FF"
		\v,"addcolor","$000000"
		\v,"mulcolor","$FFFFFF"
		\v,"blend","pass"
		\v,"genfilter","none"
	\sub,@@!Imo_LoadDefaultFile,,Imo_FaceDefault,"Default_Face.txt"
\ret


@@!Imo_Face_File
	\scp,Imo_Setting	\?v,"PathFace"
	\sub,@@!Imo_FileSerch,,1,ParamStr[0],ResultStr[0],".png",".bmp",".jpg",".b",".ogv"
\ret


@@!Imo_Face_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\var,int,n,i,no
	\var,obj,p,a
	\var,str,op,s1,s2
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_FaceTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	\scp,sl	\?s,0	\stid,ResultStr[0],0
	\cal,no=ResultInt[0]
	\cal,p=Imo_FaceParam[no],a=Imo_FaceAbsParam[no]
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1],s2=ResultStr[2]
		\scp,p
		\case,op
			\of,"align"	\v,"alignx",s1	\v,"aligny",s2	
		\else
			\v,op,s1
		\end
		
		\if,op=="clear"\then
			\scp,p	\comb,Imo_FaceDefault
		\end
	\end
	
	
	\sub,@@!Imo_EventHook_Face,,p,a
	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_Face_Refresh
	\var,int,i
	\for,i=0,i<Imo_FaceCount,i++
		\sub,@@!Imo_Face_Refresh_Main,,i	
	\end
\ret

@@!Imo_Face_ParamClear
	\var,int,i
	\for,i=0,i<Imo_FaceCount,i++
		\scp,Imo_FaceParam[i]	\i
	\end
\ret

@@!Imo_Face_Refresh_Main
	\var,obj,a,p,o
	\var,int,a1,a2,nn
	\var,str,s1,s2
	\cal,nn=ParamInt[0]
	\cal,a=Imo_FaceAbsParam[nn]
	\cal,p=Imo_FaceParam[nn]
	\cal,o=Imo_Face[nn]
	
	\scp,p	\?v,"base"
	\if,ResultStr[0]!=""\then
		\scp,a	\v,"motion","0"
	\end
	
	
	\scp,a	\comb,p
	
	
	\scp,a	\?v,"show"	
	\if,ResultStr[0]=="true"\then
		\scp,a	\?v,"mode"
		\if,ResultStr[0]=="auto"\then
			\scp,p	\?v,"file"	
			\if,ResultStr[0]==""\then
				\sub,@@!Imo_Face_AutoEvent,,o,p,a
			\end
		\end
	\end
	
	
	\var,int,n,i
	\scp,p	\?c	\cal,n=ResultInt[0]
	\if,n>0\then
		\var,table,t
		\for,i=0,i<n,i++
			\scp,p	\?n,i							
			\scp,Imo_FaceJump	\?v,ResultStr[0]	
			\div,",",ResultStr[0]					
			\scp,t
				\v,ResultStr[0],1					
				\v,ResultStr[1],1					
				\v,ResultStr[2],1					
				\v,ResultStr[3],1					
		\end
		\scp,t	\sort								
		\scp,t	\?c	\cal,n=ResultInt[0]
		\for,i=0,i<n,i++
			\scp,t	\?n,i
			\sub,ResultStr[0],,o,p,a	
		\end
	\end
	
	
	\sub,@@!Imo_Face_op11Show,,o,p,a
\ret


@@!Imo_Face_AutoEvent
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,str,id,ff
	
	
	\if,Imo_FormatMultiIndex!=1\then
		\ret
	\end
	
	\scp,Imo_Project	\v,"FaceType"
	\if,ResultInt[0]==0\then
		\cal,id=Imo_FormatName[0]
		
		\sub,@@!Misc_NameDivide,,id
		\cal,id=ResultStr[0]
	\else
		\cal,id=Imo_FormatVoice[0]
	\end
	
	\scp,p	\?v,"id"
	\if,ResultStr[0]!=""\then
		\cal,id=ResultStr[0]
	\end
	\if,id==""||id=="none"\then
		\ret
	\end
	
	\sub,@@!Imo_Face_RepIDExcute,,id
	\cal,id=ResultStr[0]
	
	\sub,@@!Imo_Face_CharaObjectSerch,,id
	\cal,ff=ResultStr[0]
	\if,ff==""\then
		\ret	
	\end
	
	\scp,Imo_FaceRepFile	\brep,ff
	\cal,ff=ResultStr[0]
	
	\scp,Imo_Project	\?v,"FaceDefaultFile"
	\if,ResultStr[0]!=""\then
		\sub,@@!Imo_Face_DefaultFile,,id,ff
		\cal,ff=ResultStr[0]
	\end
	
	\scp,a	\v,"file",ff
	\scp,p	\v,"file",ff
\ret

@@!Imo_Face_RepIDExcute
	\var,int,i,n
	\var,str,id,s1,s2
	\cal,id=ParamStr[0]
	
	\scp,Imo_FaceRepID	\bpos,id
	\if,ResultInt[0]==-1\then
		\cal,ResultStr[0]=id
	\else
		\cal,ResultStr[0]=ResultStr[1]
	\end
\ret

@@!Imo_Face_CharaObjectSerch
	\var,int,n,i
	\var,obj,ca
	\var,str,id1,id2,ff
	\cal,id1=ParamStr[0]
	
	
	\cal,n=Imo_Chara8eCount
	\for,i=0,i<n,i++
		\cal,ca=Imo_Chara8eAbsParam[i]
		\scp,ca	\?v,"*charafile"	\cal,ff=ResultStr[0]
		\scp,ca	\?v,"id"			\cal,id2=ResultStr[0]
		\if,id2!="none"\then
			\if,id1==id2\then
				\cal,ResultStr[0]=ff
				\ret
			\end
		\else
			\pos,id1,ff
			\if,ResultInt[0]>0\then
				\cal,ResultStr[0]=ff
				\ret
			\end
		\end
	\end
	
	
	\cal,n=Imo_CharaCount
	\for,i=0,i<n,i++
		\cal,ca=Imo_CharaAbsParam[i]
		\scp,ca	\?v,"*charafile"	\cal,ff=ResultStr[0]
		\scp,ca	\?v,"id"			\cal,id2=ResultStr[0]
		\if,id2!="none"\then
			\if,id1==id2\then
				\cal,ResultStr[0]=ff
				\ret
			\end
		\else
			\pos,id1,ff
			\if,ResultInt[0]>0\then
				\cal,ResultStr[0]=ff
				\ret
			\end
		\end
	\end
	
	\cal,ResultStr[0]=""
\ret

@@!Imo_Face_DefaultFile
	\var,str,id,ff,fmt
	\cal,id=ParamStr[0],ff=ParamStr[1]
	
	
	\scp,Imo_Setting	\?v,"PathFace"
	\sub,@@!Imo_FileSerch,,0,ff,ResultStr[0],".png",".b",".argb"
	\if,ResultStr[0]!=""\then
		\cal,ResultStr[0]=ff
		\ret
	\end
	
	\scp,Imo_Project	\?v,"FaceDefaultFile"
	\rep,ResultStr[0],"[id]",id
\ret


@@!Imo_Face_op11Show
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,str,s1,s2
	
	\scp,a	\?v,"show"
	\cal,s1=ResultStr[0]	
	
	\scp,a	\?v,"disp"
	\cal,s2=ResultStr[0]	

	
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\cal,s2="keep"
	\end
	
	\if,s1=="true" && s2=="keep"\then
		\scp,o	\e
	\else
		\scp,o	\d
	\end
\ret

@@!Imo_Face_10Basic
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	\var,int,a1,a2
	\var,str,s1,s2

	
	\scp,a	\?v,"alignx"	\cal,s1=ResultStr[0]
	\scp,a	\?v,"aligny"	\cal,s2=ResultStr[0]
	\sub,@@!Imo_AlignStringConvert,,s1,s2
	\scp,o	\alg2,ResultInt[0],ResultInt[1]
	
	\scp,a	\?v,"move","linear"
	\scp,Imo_MoveModeList	\?v,ResultStr[0]	\cal,a1=ResultInt[0]
	\scp,a	\?v,"movepow",100					\cal,a2=ResultInt[0]
	\scp,o	\mm,a1,a2
	
	\scp,a	\?v,"texfilter"
	\scp,Imo_TexFilterList	\?v,ResultStr[0],0	\scp,o	\tf,ResultInt[0]
\ret

@@!Imo_Face_11Filter
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	\var,str,s1,s2
	
	\scp,a	\?v,"imgfilterbase"
	\sub,@@!Imo_ImageFilterOpConvert,,ResultStr[0]
	\cal,s1=ResultStr[0]
	
	\scp,a	\?v,"imgfilter"
	\sub,@@!Imo_ImageFilterOpConvert,,ResultStr[0]
	\cal,s2=ResultStr[0]
	
	\if,s1!=""\then
		\scp,o	\fo,0,s1+"\"+s2
	\else
		\scp,o	\fo,0,s2
	\end
\ret

@@!Imo_Face_00BaseFile
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,a	\?v,"base"
	\sub,@@!Imo_Face_File,,ResultStr[0]
	\scp,o	\l,ResultStr[0]	\m,0
\ret

@@!Imo_Face_01SubFile
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,str,s1
	\scp,a	\?v,"file"	\cal,s1=ResultStr[0]
	\sub,@@!Imo_Face_File,,s1
	\cal,s1=ResultStr[0]

	\scp,a	\?v,"base"
	\if,ResultStr[0]!="none"\then
		\scp,o	\fo,0,""					
		\scp,o	\li,0,s1
	\else
		\var,int,e
		\scp,o	\?e	\cal,e=ResultInt[0]
		\scp,o	\fo,0,""					
		\scp,o	\l,s1
		\if,e==1\then
			\scp,o	\e
		\end
	\end
	
	\sub,@@!Imo_Face_11Filter,,o,p,a

	\sub,@@!Imo_Zero
\ret

@@!Imo_Face_12Motion
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]

	\var,int,a1
	\var,str,s1
	\scp,a	\?v,"motion"	\cal,s1=ResultStr[0]
	\stid,s1,$FFFF
	\cal,a1=ResultInt[0]
	\if,a1==$FFFF\then
		\scp,o	\m,s1
	\else
		\scp,o	\m,a1
	\end
\ret

@@!Imo_Face_20Position
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,int,x,y,z,sx,sy,sz,rx,ry,rz,pri,tt
	\scp,a	\?v,"x"		\cal,x=ResultInt[0]
	\scp,a	\?v,"y"		\cal,y=ResultInt[0]
	\scp,a	\?v,"z"		\cal,z=ResultInt[0]
	\scp,a	\?v,"ax"	\cal,x=x+ResultInt[0]
	\scp,a	\?v,"ay"	\cal,y=y+ResultInt[0]
	\scp,a	\?v,"az"	\cal,z=z+ResultInt[0]
	\scp,a	\?v,"scalex",100	\cal,sx=ResultInt[0]
	\scp,a	\?v,"scaley",100	\cal,sy=ResultInt[0]
	\scp,a	\?v,"scalez",100	\cal,sz=ResultInt[0]
	\scp,a	\?v,"rotx"	\cal,rx=ResultInt[0]
	\scp,a	\?v,"roty"	\cal,ry=ResultInt[0]
	\scp,a	\?v,"rotz"	\cal,rz=ResultInt[0]
	\scp,a	\?v,"pri"	\cal,pri=ResultInt[0]
	\scp,a	\?v,"time"	\cal,tt=ResultInt[0]
	
	\scp,a	\?v,"file"
	\sub,@@!Imo_Face_PosTable,,Imo_FacePosList,ResultStr[0]
	\cal,x=x+ResultInt[0]
	\cal,y=y+ResultInt[1]
	\cal,z=z+ResultInt[2]
	\cal,Imo_FacePrePosStr=ResultStr[0]	
	
	\scp,o	\p4,x,y,z,sx,sy,sz,rx,ry,rz,pri,tt
	\sub,@@!Imo_Zero
\ret


@@!Imo_Face_PosTable
	\var,obj,t
	\cal,t=ParamStr[0]
	\var,str,s

	\scp,t	\bpos,ParamStr[1]
	\cal,s=ResultStr[1]				
	\if,s==""\then
		\scp,t	\?v,"default"		
		\cal,s=ResultStr[0]
	\end
	
	\div,",",s						
	\cal,ResultInt[0]=ResultStr[0]	
	\cal,ResultInt[1]=ResultStr[1]
	\cal,ResultInt[2]=ResultStr[2]
	\cal,ResultStr[0]=s
\ret

@@!Imo_Face_20Color
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,a	\?v,"blend"
	\scp,Imo_BlendModeList	\?v,ResultStr[0]
	\scp,o	\bm,ResultInt[0]
	
	\var,int,alp,addcol,mulcol,tt
	\scp,a	\?v,"time"				\cal,tt=ResultInt[0]
	\scp,a	\?v,"alpha",$FF			\cal,alp=ResultInt[0]
	\scp,a	\?v,"addcolor",$000000	\cal,addcol=ResultInt[0]
	\scp,a	\?v,"mulcolor",$FFFFFF	\cal,mulcol=ResultInt[0]
	\scp,o	\col,alp,mulcol,addcol,tt
	\sub,@@!Imo_Zero
\ret

@@!Imo_Face_30StringGenerator0
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,p	\?v,"genfilter","none"
	\sub,@@!Imo_GeneratorFilterOpConvert,,ResultStr[0]
	
	\scp,o	\g2,ResultStr[0],1		
\ret
