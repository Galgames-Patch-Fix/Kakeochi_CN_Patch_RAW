




@@@!ImoScripter_Base.s


@@!Imo_Camera_Create
	
	\gvar,table,Imo_CameraParam
	\gvar,table,Imo_CameraAbsParam
	\gvar,table,Imo_CameraDefault
	
	\gvar,table,Imo_CameraTemplate
	\scp,Imo_CameraTemplate	\l,"ImoScripter_Template_Camera.txt"	\sort
	
	\scp,camex	\i
	
	
	\gvar,table,Imo_CameraJump
	\scp,Imo_CameraJump
		\v,"pri1"		,"@@!Imo_Camera_10Basic"
		\v,"pri2"		,"@@!Imo_Camera_10Basic"
		\v,"ax"			,"@@!Imo_Camera_22Position"
		\v,"ay"			,"@@!Imo_Camera_22Position"
		\v,"az"			,"@@!Imo_Camera_22Position"
		\v,"zoomx"		,"@@!Imo_Camera_22Position"
		\v,"zoomy"		,"@@!Imo_Camera_22Position"
		\v,"zoomz"		,"@@!Imo_Camera_22Position"
		\v,"rotx"		,"@@!Imo_Camera_22Position"
		\v,"roty"		,"@@!Imo_Camera_22Position"
		\v,"rotz"		,"@@!Imo_Camera_22Position"
		\v,"time"		,""
		\v,"oncetime"	,""
		\v,"movetime"	,""
		\v,"colortime"	,""
		\v,"moveloop",""
		\v,"colorloop",""
		\v,"move"		,"@@!Imo_Camera_10Basic"
		\v,"movepow"	,"@@!Imo_Camera_10Basic"
		\v,"texfilter"	,"@@!Imo_Camera_10Basic"
		\v,"blend"		,"@@!Imo_Camera_22Color"
		\v,"alpha"		,"@@!Imo_Camera_22Color"
		\v,"color"		,"@@!Imo_Camera_22Color"
		\v,"bax"		,"@@!Imo_Camera_20BeginPosition,@@!Imo_Camera_22Position"
		\v,"bay"		,"@@!Imo_Camera_20BeginPosition,@@!Imo_Camera_22Position"
		\v,"baz"		,"@@!Imo_Camera_20BeginPosition,@@!Imo_Camera_22Position"
		\v,"bzoomx"		,"@@!Imo_Camera_20BeginPosition,@@!Imo_Camera_22Position"
		\v,"bzoomy"		,"@@!Imo_Camera_20BeginPosition,@@!Imo_Camera_22Position"
		\v,"bzoomz"		,"@@!Imo_Camera_20BeginPosition,@@!Imo_Camera_22Position"
		\v,"brotx"		,"@@!Imo_Camera_20BeginPosition,@@!Imo_Camera_22Position"
		\v,"broty"		,"@@!Imo_Camera_20BeginPosition,@@!Imo_Camera_22Position"
		\v,"brotz"		,"@@!Imo_Camera_20BeginPosition,@@!Imo_Camera_22Position"
		\v,"balpha"		,"@@!Imo_Camera_20BeginColor,@@!Imo_Camera_22Color"
		\v,"bcolor"		,"@@!Imo_Camera_20BeginColor,@@!Imo_Camera_22Color"
		
		\v,"gmode1"		,"@@!Imo_Camera_30Generator1"
		\v,"gmode2"		,"@@!Imo_Camera_30Generator2"
		\v,"genfilter"	,"@@!Imo_Camera_30StringGenerator0"
	
	\sub,@@!Imo_Camera_DefaultParam
	\var,int,i,n
	
	\scp,camex	\i
	
	\scp,Imo_CameraParam	\asn,Imo_CameraDefault
	
	\scp,Imo_CameraNames	\?n,0
	\scp,Imo_CameraAbsParam
			\v,"*objectname",ResultStr[0]
			\v,"*objectindex",0
	
	\sub,@@!Imo_Camera_Refresh
\ret


@@!Imo_Camera_Free
	\scp,camex	\i
	
	\del,Imo_CameraParam
	\del,Imo_CameraAbsParam
	\del,Imo_CameraDefault
	\del,Imo_CameraTemplate
	\del,Imo_CameraJump
\ret


@@!Imo_Camera_DefaultParam
	\scp,Imo_CameraDefault
		\i
		\v,"pri1","-100"
		\v,"pri2","999"
		\v,"ax","0"
		\v,"ay","0"
		\v,"az","0"
		\v,"zoomx","100"
		\v,"zoomy","100"
		\v,"zoomz","100"
		\v,"rotx","0"
		\v,"roty","0"
		\v,"rotz","0"
		\v,"time","0"
		\v,"move","linear"
		\v,"movepow","100"
		\v,"moveloop","0"
		\v,"colorloop","0"
		\v,"texfilter","pass"
		\v,"blend","normal"
		\v,"alpha","$00"
		\v,"color","$FFFFFF"
		\v,"genfilter","none"
		
		
		
		
		\v,"gmode1","none"
		\v,"gtime1","0"
		\v,"gcycle1","100"
		\v,"ginfinity1","false"
		\v,"gx1","0"
		\v,"gy1","0"
		\v,"gz1","0"
		\v,"gtarget1","position"
		\v,"gfade1","out"
		
		\v,"gmode2","none"
		\v,"gtime2","0"
		\v,"gcycle2","100"
		\v,"ginfinity2","false"
		\v,"gx2","0"
		\v,"gy2","0"
		\v,"gz2","0"
		\v,"gtarget2","position"
		\v,"gfade2","out"
	\sub,@@!Imo_LoadDefaultFile,,Imo_CameraDefault,"Default_Camera.txt"
\ret









@@!Imo_Camera_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\var,obj,p,a
	\var,int,i,n,pri
	\var,str,op,s1,s2,s3,s4
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_CameraTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	\cal,p=Imo_CameraParam,a=Imo_CameraAbsParam
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1]
		\scp,p	\v,op,s1
		
		\if,op=="clear"\then
			\scp,p	\comb,Imo_CameraDefault
		\end
	\end
	
	
	
	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_Camera_Refresh
	\if,Imo_CameraCount==0\then
		\ret
	\end
	
	\scp,Imo_CameraParam	\?c
	\if,ResultInt[0]>0\then
		\sub,@@!Imo_Camera_Refresh_Main,,0
	\end
\ret

@@!Imo_Camera_ParamClear
	\if,Imo_CameraCount==0\then
		\ret
	\end
	
	\scp,Imo_CameraParam	\i
\ret



@@!Imo_Camera_Refresh_Main
	\var,obj,a,p
	\var,int,a1,a2,pri
	\var,str,s1,s2
	\cal,a=Imo_CameraAbsParam
	\cal,p=Imo_CameraParam
	
	
	\scp,a	\comb,p
	
	
	\var,int,n,i
	\var,table,t
	\scp,p	\?c	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,p	\?n,i							
		\scp,Imo_CameraJump	\?v,ResultStr[0]	
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
		\sub,ResultStr[0],,camex,p,a	
	\end
\ret


@@!Imo_Camera_10Basic
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	\var,int,a1,a2
	
	
	\scp,a	\?v,"pri1",-100		\cal,a1=ResultInt[0]
	\scp,a	\?v,"pri2",999		\cal,a2=ResultInt[0]
	\scp,o	\pri,a1,a2
	
	\scp,a	\?v,"move","linear"
	\scp,Imo_MoveModeList	\?v,ResultStr[0]	\cal,a1=ResultInt[0]
	\scp,a	\?v,"movepow",100					\cal,a2=ResultInt[0]
	\scp,o	\mm,a1,a2
	
	\scp,a	\?v,"texfilter"
	\scp,Imo_TexFilterList	\?v,ResultStr[0]	\scp,o	\tf,ResultInt[0]
\ret


@@!Imo_Camera_20BeginPosition
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,int,ax,ay,az,zx,zy,zz,rx,ry,rz
	
	\scp,a	\?v,"ax"		\scp,p	\?v,"bax",ResultInt[0]	\cal,ax=ResultInt[0]
	\scp,a	\?v,"ay"		\scp,p	\?v,"bay",ResultInt[0]	\cal,ay=ResultInt[0]
	\scp,a	\?v,"az"		\scp,p	\?v,"baz",ResultInt[0]	\cal,az=ResultInt[0]
	\scp,a	\?v,"zoomx",100	\scp,p	\?v,"bzoomx",ResultInt[0]	\cal,zx=ResultInt[0]
	\scp,a	\?v,"zoomy",100	\scp,p	\?v,"bzoomy",ResultInt[0]	\cal,zy=ResultInt[0]
	
	
	
	\scp,a	\?v,"rotz"		\scp,p	\?v,"brotz",ResultInt[0]	\cal,rz=ResultInt[0]
	
	\scp,o	\p,ax,ay,az, zx,zy,100, 0,0,rz, 0
\ret

@@!Imo_Camera_22Position
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	
	\var,int,x,y,z,sx,sy,sz,rx,ry,rz,tt,loop
	\scp,a	\?v,"time",0
	\scp,p	\?v,"oncetime",ResultInt[0]
	\scp,p	\?v,"movetime",ResultInt[0]	\cal,tt=ResultInt[0]
	
	\scp,a	\?v,"ax"	\cal,x=ResultInt[0]
	\scp,a	\?v,"ay"	\cal,y=ResultInt[0]
	\scp,a	\?v,"az"	\cal,z=ResultInt[0]
	\scp,a	\?v,"zoomx",100	\cal,sx=ResultInt[0]
	\scp,a	\?v,"zoomy",100	\cal,sy=ResultInt[0]
	
	
	
	\scp,a	\?v,"rotz"	\cal,rz=ResultInt[0]
	\scp,p	\?v,"moveloop",0		\sub,@@!Imo_LoopStringConvert,,ResultStr[0]		\cal,loop=ResultInt[0]
	
	\scp,o	\p,x,y,z, sx,sy,100, 0,0,rz, tt,loop
	\sub,@@!Imo_Zero
\ret

@@!Imo_Camera_20BeginColor
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]

	
	\var,int,alp,col
	\scp,a	\?v,"alpha"	\scp,p	\?v,"balpha",ResultInt[0]	\cal,alp=ResultInt[0]
	\scp,a	\?v,"color"	\scp,p	\?v,"bcolor",ResultInt[0]	\cal,col=ResultInt[0]
	
	\scp,o	\col,alp,col,0
\ret

@@!Imo_Camera_22Color
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,a	\?v,"blend"
	\scp,Imo_BlendModeList	\?v,ResultStr[0]
	\scp,o	\bm,ResultInt[0]
	
	\var,int,alp,col,tt,loop
	\scp,a	\?v,"time",0
	\scp,p	\?v,"oncetime",ResultInt[0]
	\scp,p	\?v,"colortime",ResultInt[0]	\cal,tt=ResultInt[0]
	
	\scp,a	\?v,"alpha",$FF		\cal,alp=ResultInt[0]
	\scp,a	\?v,"color",$000000	\cal,col=ResultInt[0]
	\scp,p	\?v,"colorloop",0		\sub,@@!Imo_LoopStringConvert,,ResultStr[0]		\cal,loop=ResultInt[0]
	
	\scp,o	\col,alp,col,tt,loop
	\sub,@@!Imo_Zero
\ret

@@!Imo_Camera_30Generator1
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
		\of,"position"	\cal,tg=0
		\of,"zoom"		\cal,tg=1
		\of,"rotate"	\cal,tg=2
	\end
	
	\scp,a	\?v,"gfade1","out"
	\scp,Imo_GFadeList	\?v,ResultStr[0]	\cal,fd=ResultInt[0]
	
	\scp,p	\?v,"ginfinity1","false"
	\cal,inf=(ResultStr[0]=="true")
	
	\scp,o	\g,0, mm,tt,ct, wx,wy,wz, tg,fd, inf
\ret

@@!Imo_Camera_30Generator2
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,int,mm,tt,ct,wx,wy,wz,tg,fd,inf
	
	\scp,a	\?v,"gmode2","none"
	\scp,Imo_GModeList	\?v,ResultStr[0]	\cal,mm=ResultInt[0]
	
	\scp,a	\?v,"gtime2",0
	\if,ResultStr[0]=="infinity"\then
		\cal,tt=-1
	\else
		\cal,tt=ResultInt[0]
	\end
	
	\scp,a	\?v,"gcycle2",100	\cal,ct=ResultInt[0]
	
	\scp,a	\?v,"gx2",0		\cal,wx=ResultInt[0]
	\scp,a	\?v,"gy2",0		\cal,wy=ResultInt[0]
	\scp,a	\?v,"gz2",0		\cal,wz=ResultInt[0]
	
	\scp,a	\?v,"gtarget2","position"
	\case,ResultStr[0]
		\of,"position"	\cal,tg=0
		\of,"zoom"		\cal,tg=1
		\of,"rotate"	\cal,tg=2
	\end
	
	\scp,a	\?v,"gfade2","out"
	\scp,Imo_GFadeList	\?v,ResultStr[0]	\cal,fd=ResultInt[0]
	
	\scp,p	\?v,"ginfinity1","false"
	\cal,inf=(ResultStr[0]=="true")
	
	\scp,o	\g,1, mm,tt,ct, wx,wy,wz, tg,fd, inf
\ret

@@!Imo_Camera_30StringGenerator0
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,p	\?v,"genfilter","none"
	\sub,@@!Imo_GeneratorFilterOpConvert,,ResultStr[0]
	
	\scp,o	\g2,ResultStr[0],1		
\ret
