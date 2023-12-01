




@@@!ImoScripter_Base.s


@@!Imo_Image_Create
	
	\gvar,table,Imo_ImageParam[Imo_ImageCount]
	\gvar,table,Imo_ImageAbsParam[Imo_ImageCount]
	\gvar,table,Imo_ImageDefault
	\gvar,img,Imo_Image[Imo_ImageCount]
	
	\gvar,table,Imo_ImageTemplate
	\scp,Imo_ImageTemplate	\l,"ImoScripter_Template_Image.txt"	\sort
	
	\gvar,table,Imo_ImageJump
	\scp,Imo_ImageJump
		\v,"show"		,"@@!Imo_Image_10Basic"
		\v,"x"			,"@@!Imo_Image_22Position"
		\v,"y"			,"@@!Imo_Image_22Position"
		\v,"z"			,"@@!Imo_Image_22Position"
		\v,"ax"			,"@@!Imo_Image_22Position"
		\v,"ay"			,"@@!Imo_Image_22Position"
		\v,"az"			,"@@!Imo_Image_22Position"
		\v,"scalex"		,"@@!Imo_Image_22Position"
		\v,"scaley"		,"@@!Imo_Image_22Position"
		\v,"scalez"		,"@@!Imo_Image_22Position"
		\v,"rotx"		,"@@!Imo_Image_22Position"
		\v,"roty"		,"@@!Imo_Image_22Position"
		\v,"rotz"		,"@@!Imo_Image_22Position"
		\v,"pri"		,"@@!Imo_Image_22Position"
		\v,"addpri"		,"@@!Imo_Image_22Position"
		\v,"alignx"		,"@@!Imo_Image_10Basic"
		\v,"aligny"		,"@@!Imo_Image_10Basic"
		\v,"motion"		,"@@!Imo_Image_12Motion"
		\v,"time"		,""
		\v,"oncetime"	,""
		\v,"movetime"	,""
		\v,"colortime"	,""
		\v,"moveloop",""
		\v,"colorloop",""
		\v,"move"		,"@@!Imo_Image_10Basic"
		\v,"movepow"	,"@@!Imo_Image_10Basic"
		\v,"file"		,"@@!Imo_Image_00File,@@!Imo_Image_10Basic,@@!Imo_Image_12Value,@@!Imo_Image_12Motion"
		\v,"rep0"		,"@@!Imo_Image_00File"
		\v,"rep1"		,"@@!Imo_Image_00File"
		\v,"rep2"		,"@@!Imo_Image_00File"
		\v,"rep3"		,"@@!Imo_Image_00File"
		\v,"imgfilterbase","@@!Imo_Image_11Filter"
		\v,"imgfilter0"	,"@@!Imo_Image_11Filter"
		\v,"imgfilter1"	,"@@!Imo_Image_11Filter"
		\v,"imgfilter2"	,"@@!Imo_Image_11Filter"
		\v,"imgfilter3"	,"@@!Imo_Image_11Filter"
		\v,"imgfilter"	,"@@!Imo_Image_00FilterCompati,@@!Imo_Image_11Filter"		
		\v,"texfilter"	,"@@!Imo_Image_10Basic"
		\v,"alpha"		,"@@!Imo_Image_22Color"
		\v,"addcolor"	,"@@!Imo_Image_22Color"
		\v,"mulcolor"	,"@@!Imo_Image_22Color"
		\v,"blend"		,"@@!Imo_Image_22Color"
		\v,"speed"		,"@@!Imo_Image_10Basic"
		\v,"vol"		,"@@!Imo_Image_10Basic"
		\v,"voltype"	,"@@!Imo_Image_10Basic"
		\v,"dchannel"	,"@@!Imo_Image_10Basic"
		\v,"value0"		,"@@!Imo_Image_12Value"
		\v,"value1"		,"@@!Imo_Image_12Value"
		\v,"value2"		,"@@!Imo_Image_12Value"
		\v,"value3"		,"@@!Imo_Image_12Value"
		\v,"value4"		,"@@!Imo_Image_12Value"
		\v,"value5"		,"@@!Imo_Image_12Value"
		\v,"value6"		,"@@!Imo_Image_12Value"
		\v,"value7"		,"@@!Imo_Image_12Value"
		\v,"bx"			,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"by"			,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"bz"			,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"bax"		,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"bay"		,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"baz"		,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"bscalex"	,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"bscaley"	,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"bscalez"	,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"brotx"		,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"broty"		,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"brotz"		,"@@!Imo_Image_20BeginPosition,@@!Imo_Image_22Position"
		\v,"balpha"		,"@@!Imo_Image_20BeginColor,@@!Imo_Image_22Color"
		\v,"bmulcolor"	,"@@!Imo_Image_20BeginColor,@@!Imo_Image_22Color"
		\v,"baddcolor"	,"@@!Imo_Image_20BeginColor,@@!Imo_Image_22Color"
		\v,"genfilter"	,"@@!Imo_Image_30StringGenerator0"
		
		\v,"gmode1"		,"@@!Imo_Image_30Generator1"
	
	\sub,@@!Imo_Image_DefaultParam
	\var,int,i,n
	\for,i=0,i<Imo_ImageCount,i++
		
		\scp,Imo_Image[i]
			\dc,0		
			\vtn,_stSE	
			\in,$1		
			\out,$1
		
		\scp,Imo_ImageParam[i]		\asn,Imo_ImageDefault
		
		\scp,Imo_ImageNames		\?n,i
		\scp,Imo_ImageAbsParam[i]
			\v,"*objectname",ResultStr[0]
			\v,"*objectindex",i
	\end
	
	\sub,@@!Imo_Image_Refresh
\ret


@@!Imo_Image_Free
	\del,Imo_ImageParam
	\del,Imo_ImageAbsParam
	\del,Imo_ImageDefault
	\del,Imo_ImageJump
	\del,Imo_ImageTemplate
	\del,Imo_Image
\ret


@@!Imo_Image_DefaultParam
	\scp,Imo_ImageDefault
		\i
		\v,"show","false"
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
		\v,"pri","0"
		\v,"addpri","0"
		\v,"alignx","left"
		\v,"aligny","top"
		\v,"alignz","center"
		\v,"motion","0"
		\v,"time","0"
		\v,"oncetime","0"
		\v,"move","linear"
		\v,"movepow","100"
		\v,"moveloop",0
		\v,"colorloop",0
		\v,"file","none"
		\v,"rep0","pass"
		\v,"rep1","pass"
		\v,"rep2","pass"
		\v,"rep3","pass"
		\v,"imgfilterbase","none"
		\v,"imgfilter0","none"
		\v,"imgfilter1","none"
		\v,"imgfilter2","none"
		\v,"imgfilter3","none"
		\v,"imgfilter","none"	
		\v,"texfilter","pass"
		\v,"alpha","$FF"
		\v,"addcolor","$000000"
		\v,"mulcolor","$FFFFFF"
		\v,"blend","pass"
		\v,"speed","100"
		\v,"vol","100"
		\v,"voltype","se"
		\v,"dchannel","0"
		\v,"genfilter","none"
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		\v,"gmode1","none"
		\v,"gtime1",0
		\v,"gcycle1",100
		\v,"ginfinity1","false"
		\v,"gx1",0
		\v,"gy1",0
		\v,"gz1",0
		\v,"gtarget1","position"
		\v,"gfade1","out"
	\sub,@@!Imo_LoadDefaultFile,,Imo_ImageDefault,"Default_Image.txt"
\ret


@@!Imo_Image_File
	\scp,Imo_Setting	\?v,"PathImage"
	\sub,@@!Imo_FileSerch,,1,ParamStr[0],ResultStr[0],".png",".bmp",".jpg",".b",".ogv"
\ret


@@!Imo_Image_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\var,int,n,i,no
	\var,obj,p,a
	\var,str,op,s1,s2
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_ImageTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	\scp,sl	\?s,0	\stid,ResultStr[0],0
	\cal,no=ResultInt[0]
	\cal,p=Imo_ImageParam[no]
	\cal,a=Imo_ImageAbsParam[no]
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1]
		\scp,p	\v,op,s1
		
		\if,op=="clear"\then
			\scp,p	\comb,Imo_ImageDefault
		\end
	\end
	
	
	\sub,@@!Imo_EventHook_Image,,p,a
	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_Image_Refresh
	\var,int,i
	\for,i=0,i<Imo_ImageCount,i++
		\scp,Imo_ImageParam[i]	\?c
		\if,ResultInt[0]>0\then
			\sub,@@!Imo_Image_Refresh_Main,,i
		\end
	\end
\ret

@@!Imo_Image_ParamClear
	\var,int,i
	\for,i=0,i<Imo_ImageCount,i++
		\scp,Imo_ImageParam[i]	\i
	\end
\ret

@@!Imo_Image_Refresh_Main
	\var,obj,a,p,o
	\var,int,a1,a2,nn
	\var,str,s1,s2
	\cal,nn=ParamInt[0]
	\cal,a=Imo_ImageAbsParam[nn]
	\cal,p=Imo_ImageParam[nn]
	\cal,o=Imo_Image[nn]
	
	
	\var,str,spd
	\scp,a	\?v,"speed","100"	\cal,spd=ResultStr[0]
	\scp,Imo_Project	\?v,"OldSpeedResetMode",1		
	\if,ResultInt[0]==0\then
		\cal,spd="100"	
	\end
	
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\scp,a
			\v,"motion","0"
			\v,"rep0","pass"
			\v,"rep1","pass"
			\v,"rep2","pass"
			\v,"rep3","pass"
			\v,"speed",spd
			
			
			
			
			
			
			
			
	\end
	
	\scp,p	\?v,"motion"
	\if,ResultStr[0]!=""\then
		\scp,a	\v,"speed",spd
	\end
	
	
	\scp,a	\comb,p
	
	
	\var,int,n,i
	\var,table,t
	\scp,p	\?c	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,p	\?n,i							
		\scp,Imo_ImageJump	\?v,ResultStr[0]	
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
		\sub,ResultStr[0],,o,p,a	
	\end
\ret


@@!Imo_Image_10Basic
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
	\scp,Imo_TexFilterList	\?v,ResultStr[0]	\scp,o	\tf,ResultInt[0]
	
	\scp,a	\?v,"speed",100	\cal,a1=ResultInt[0]
	\scp,o	\ps,a1
	
	\scp,a	\?v,"voltype"	\cal,s1=ResultStr[0]
	\stid,s1,0	\cal,a1=ResultInt[0]
	\case,s1
		\of,"bgm"		\cal,a1=0
		\of,"voice"	\cal,a1=1
		\of,"se"		\cal,a1=2
	\end
	\scp,o	\vtn,a1
	
	\scp,a	\?v,"dchannel",0
	\scp,o	\dc,ResultInt[0]
	
	\scp,a	\?v,"vol"
	\scp,o	\v,ResultInt[0]*256/100
	\scp,p	\?v,"vol"
	\if,ResultStr[0]=="0"\then
		\scp,o	\?dc
		\scp,dsnd[ResultInt[0]]	\i
	\end
	
	\scp,a	\?v,"show"
	\if,ResultStr[0]=="true"\then
		\scp,o	\e
	\else
		\scp,o	\d
	\end
\ret

@@!Imo_Image_11Filter
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	
	\var,str,bs
	\scp,a	\?v,"imgfilterbase"
	\sub,@@!Imo_ImageFilterOpConvert,,ResultStr[0]
	\cal,bs=ResultStr[0]
	
	\var,int,i
	\for,i=0,i<4,i++
		\fmt,"imgfilter%d",i
		\scp,a	\?v,ResultStr[0]
		\sub,@@!Imo_ImageFilterOpConvert,,ResultStr[0]
		\if,bs!=""\then
			\scp,o	\fo,i,bs+"\"+ResultStr[0]
		\else
			\scp,o	\fo,i,ResultStr[0]
		\end
	\end
\ret

@@!Imo_Image_00File
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]

	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		
		\scp,o	\fo,0,""
		\scp,o	\fo,1,""
		\scp,o	\fo,2,""
		\scp,o	\fo,3,""
		\sub,@@!Imo_Image_File,,ResultStr[0]
		\scp,o	\l,ResultStr[0]	\m,0
		
		
		\scp,o	\exr
	\end
	\scp,p	\?v,"rep0"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\scp,o	\fo,0,""									
		\sub,@@!Imo_Image_File,,ResultStr[0]
		\scp,o	\li,0,ResultStr[0]
	\end
	\scp,p	\?v,"rep1"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\scp,o	\fo,1,""									
		\sub,@@!Imo_Image_File,,ResultStr[0]
		\scp,o	\li,1,ResultStr[0]
	\end
	\scp,p	\?v,"rep2"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\scp,o	\fo,2,""									
		\sub,@@!Imo_Image_File,,ResultStr[0]
		\scp,o	\li,2,ResultStr[0]
	\end
	\scp,p	\?v,"rep3"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\scp,o	\fo,3,""									
		\sub,@@!Imo_Image_File,,ResultStr[0]
		\scp,o	\li,3,ResultStr[0]
	\end
	
	\sub,@@!Imo_Image_11Filter,,o,p,a
	
	\sub,@@!Imo_Zero
\ret

@@!Imo_Image_12Motion
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
	
	
	\scp,a	\?v,"speed",100
	\scp,o	\ps,ResultInt[0]
	
	
	\scp,Imo_Project	\?v,"OldExtValueResetMode",1	
	\if,ResultInt[0]==0\then
		\scp,o	\exr
	\end
\ret

@@!Imo_Image_20BeginPosition
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,int,x,y,z,sx,sy,sz,rx,ry,rz,pri
	
	\scp,a	\?v,"x"				\scp,p	\?v,"bx",ResultInt[0]		\cal,x=ResultInt[0]
	\scp,a	\?v,"y"				\scp,p	\?v,"by",ResultInt[0]		\cal,y=ResultInt[0]
	\scp,a	\?v,"z"				\scp,p	\?v,"bz",ResultInt[0]		\cal,z=ResultInt[0]
	\scp,a	\?v,"ax"			\scp,p	\?v,"bax",ResultInt[0]		\cal,x=x+ResultInt[0]
	\scp,a	\?v,"ay"			\scp,p	\?v,"bay",ResultInt[0]		\cal,y=y+ResultInt[0]
	\scp,a	\?v,"az"			\scp,p	\?v,"baz",ResultInt[0]		\cal,z=z+ResultInt[0]
	\scp,a	\?v,"scalex",100	\scp,p	\?v,"bscalex",ResultInt[0]	\cal,sx=ResultInt[0]
	\scp,a	\?v,"scaley",100	\scp,p	\?v,"bscaley",ResultInt[0]	\cal,sy=ResultInt[0]
	\scp,a	\?v,"scalez",100	\scp,p	\?v,"bscalez",ResultInt[0]	\cal,sz=ResultInt[0]
	\scp,a	\?v,"rotx"			\scp,p	\?v,"brotx",ResultInt[0]	\cal,rx=ResultInt[0]
	\scp,a	\?v,"roty"			\scp,p	\?v,"broty",ResultInt[0]	\cal,ry=ResultInt[0]
	\scp,a	\?v,"rotz"			\scp,p	\?v,"brotz",ResultInt[0]	\cal,rz=ResultInt[0]
	\scp,a	\?v,"pri"	\cal,pri=ResultInt[0]
	\scp,a	\?v,"addpri"\cal,pri=pri+ResultInt[0]
	
	\scp,o	\p4,x,y,z,sx,sy,sz,rx,ry,rz,pri,0
\ret

@@!Imo_Image_22Position
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,int,x,y,z,sx,sy,sz,rx,ry,rz,pri,tt,loop
	\scp,a	\?v,"time",0
	\scp,p	\?v,"oncetime",ResultInt[0]		
	\scp,p	\?v,"movetime",ResultInt[0]	\cal,tt=ResultInt[0]
	
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
	\scp,a	\?v,"addpri"\cal,pri=pri+ResultInt[0]
	\scp,p	\?v,"moveloop",0		\sub,@@!Imo_LoopStringConvert,,ResultStr[0]		\cal,loop=ResultInt[0]
	\scp,o	\p4,x,y,z,sx,sy,sz,rx,ry,rz,pri,tt,loop
	\sub,@@!Imo_Zero
\ret

@@!Imo_Image_20BeginColor
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]

	
	\var,int,alp,addcol,mulcol
	\scp,a	\?v,"alpha"		\scp,p	\?v,"balpha",ResultInt[0]		\cal,alp=ResultInt[0]
	\scp,a	\?v,"mulcolor"	\scp,p	\?v,"bmulcolor",ResultInt[0]	\cal,mulcol=ResultInt[0]
	\scp,a	\?v,"addcolor"	\scp,p	\?v,"baddcolor",ResultInt[0]	\cal,addcol=ResultInt[0]
	
	\scp,o	\col,alp,mulcol,addcol,0
\ret

@@!Imo_Image_22Color
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,a	\?v,"blend"
	\scp,Imo_BlendModeList	\?v,ResultStr[0]
	\scp,o	\bm,ResultInt[0]
	
	\var,int,alp,addcol,mulcol,tt,loop
	\scp,a	\?v,"time",0
	\scp,p	\?v,"oncetime",ResultInt[0]
	\scp,p	\?v,"colortime",ResultInt[0]	\cal,tt=ResultInt[0]
	
	\scp,a	\?v,"alpha",$FF			\cal,alp=ResultInt[0]
	\scp,a	\?v,"addcolor",$000000	\cal,addcol=ResultInt[0]
	\scp,a	\?v,"mulcolor",$FFFFFF	\cal,mulcol=ResultInt[0]
	\scp,p	\?v,"colorloop",0		\sub,@@!Imo_LoopStringConvert,,ResultStr[0]		\cal,loop=ResultInt[0]
	
	\scp,o	\col,alp,mulcol,addcol,tt,loop
	\sub,@@!Imo_Zero
\ret

@@!Imo_Image_12Value
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,int,i
	\for,i=0,i<8,i++
		\scp,p	\?v,"value"+i,$5621232
		\if,ResultInt[0]!=$5621232\then
			\scp,o	\exv,i,ResultInt[0]
		\end
	\end
\ret

@@!Imo_Image_30Generator1
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

@@!Imo_Image_30StringGenerator0
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,p	\?v,"genfilter","none"
	\sub,@@!Imo_GeneratorFilterOpConvert,,ResultStr[0]
	
	\scp,o	\g2,ResultStr[0],1		
\ret


@@!Imo_Image_00FilterCompati
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,p	\?v,"imgfilter"
	\scp,p	\v,"imgfilter0",ResultStr[0]
	\scp,a	\v,"imgfilter0",ResultStr[0]
\ret

