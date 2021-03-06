




@@@!ImoScripter_Base.s
@@@!misc\misc.s


@@!Imo_Message_Create
	
	\gvar,table,Imo_MessageParam[Imo_MessageCount]
	\gvar,table,Imo_MessageAbsParam[Imo_MessageCount]
	\gvar,table,Imo_MessageDefault
	\gvar,msg,Imo_Message[Imo_MessageCount]
	
	\gvar,table,Imo_MessageTemplate
	\scp,Imo_MessageTemplate	\l,"ImoScripter_Template_Message.txt"	\sort
	
	\gvar,table,Imo_MessageJump
	\scp,Imo_MessageJump
		\v,"id"			,""
		\v,"mode"		,""
		\v,"show"		,"@@!Imo_Message_10Base"
		\v,"autoshow"	,""
		\v,"transmode"	,"@@!Imo_Message_30Trans"
		\v,"transparam"	,""
		\v,"disptrans"	,""
		\v,"x"			,"@@!Imo_Message_20Position"
		\v,"y"			,"@@!Imo_Message_20Position"
		\v,"z"			,"@@!Imo_Message_20Position"
		\v,"pri"		,"@@!Imo_Message_20Position"
		\v,"alignx"		,"@@!Imo_Message_10Base"
		\v,"aligny"		,"@@!Imo_Message_10Base"
		\v,"motion"		,"@@!Imo_Message_12Motion"
		\v,"file"		,"@@!Imo_Message_00File,@@!Imo_Message_10Base,@@!Imo_Message_11TextArea,@@!Imo_Message_12Motion"
		\v,"rep0"		,"@@!Imo_Message_00File"
		\v,"rep1"		,"@@!Imo_Message_00File"
		\v,"rep2"		,"@@!Imo_Message_00File"
		\v,"rep3"		,"@@!Imo_Message_00File"
		\v,"textareaw"	,"@@!Imo_Message_11TextArea"
		\v,"textareah"	,"@@!Imo_Message_11TextArea"
		\v,"nameformat"	,""
		\v,"fontsizew"	,""
		\v,"fontsizeh"	,""
		\v,"fontcolor"	,""
		\v,"fontno"		,""
		\v,"text",""
		\v,"oncefontno",""
		\v,"oncefontsizew",""
		\v,"oncefontsizeh",""
		\v,"oncefontcolor",""
		\v,"genfilter"	,"@@!Imo_Image_30StringGenerator0"
	
	\sub,@@!Imo_Message_DefaultParam
	\var,int,i,n
	\for,i=0,i<Imo_MessageCount,i++
		
		\scp,Imo_Message[i]
			\dc,0
			\vtn,_stSE
			\in,$8	
			\out,$8
			\o,"[f,0][s,24,24][c,$FFFFFFFF][pi,0,8][rs,10,10][rpi,0,0][rp,0,-8]"
			\cc
			\ap,1	
			\as,1	
		
		\sub,@@!Misc_MessageObjectSetup,,Imo_Message[i]		
		\sub,@@!Imo_ApplyMessageCreate,,Imo_Message[i]
		
		\scp,Imo_MessageParam[i]	\asn,Imo_MessageDefault
		
		\scp,Imo_MessageNames		\?n,i
		\scp,Imo_MessageAbsParam[i]
			\v,"*objectname",ResultStr[0]
			\v,"*objectindex",i
	\end
	
	\sub,@@!Imo_Message_Refresh
\ret


@@!Imo_Message_Free
	\del,Imo_MessageParam
	\del,Imo_MessageAbsParam
	\del,Imo_MessageDefault
	\del,Imo_MessageTemplate
	\del,Imo_Message
	\del,Imo_MessageJump
\ret


@@!Imo_Message_DefaultParam
	\scp,Imo_MessageDefault
		\i
		\v,"id","none"
		\v,"mode","cls"
		\v,"autoshow","true"
		\v,"file","none"
		\v,"rep0","pass"
		\v,"rep1","pass"
		\v,"rep2","pass"
		\v,"rep3","pass"
		\v,"textareaw","800"
		\v,"textareah","600"
		\v,"show","false"
		\v,"transmode","none"
		\v,"transparam","1"
		\v,"disptrans","none"
		\v,"x","0"
		\v,"y","0"
		\v,"z","0"
		\v,"pri","1100"
		\v,"alignx","left"
		\v,"aligny","top"
		\v,"motion","0"
		\v,"fontsizew","24"
		\v,"fontsizeh","24"
		\v,"fontcolor","$FFFFFF"
		\v,"fontno","0"
		\v,"text","none"
		\v,"nameformat","none"
		\v,"oncefontno","0"
		\v,"oncefontsizew","24"
		\v,"oncefontsizeh","24"
		\v,"oncefontcolor","$FFFFFF"
		\v,"genfilter","none"
	\sub,@@!Imo_LoadDefaultFile,,Imo_ImageDefault,"Default_Message.txt"
\ret


















@@!Imo_Message_File
	\scp,Imo_Setting	\?v,"PathMessage"
	\sub,@@!Imo_FileSerch,,1,ParamStr[0],ResultStr[0],".png",".bmp",".jpg",".b"
\ret


@@!Imo_Message_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\var,int,n,i,no
	\var,obj,p,a
	\var,str,op,s1,s2
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_MessageTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	\scp,sl	\?s,0	\stid,ResultStr[0],0
	\cal,no=ResultInt[0]
	\cal,p=Imo_MessageParam[no],a=Imo_MessageAbsParam[no]
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1]
		\scp,p	\v,op,s1
		
		\if,op=="clear"\then
			\scp,p	\comb,Imo_MessageDefault
		\end
	\end
	
	
	\sub,@@!Imo_EventHook_Message,,p,a
	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_Message_Refresh
	\var,int,i
	\for,i=0,i<Imo_MessageCount,i++
		\sub,@@!Imo_Message_Refresh_Before,,i
		\scp,Imo_MessageParam[i]	\?c
		\if,ResultInt[0]>0\then
			\sub,@@!Imo_Message_Refresh_Main,,i
		\end
		\sub,@@!Imo_Message_Refresh_After,,i
	\end
\ret

@@!Imo_Message_ParamClear
	\var,int,i
	\for,i=0,i<Imo_MessageCount,i++
		\scp,Imo_MessageParam[i]	\i
	\end
\ret

@@!Imo_Message_Refresh_Before
	\var,str,s1
	\var,int,c
	\var,obj,a,p,o
	\cal,o=Imo_Message[ParamInt[0]]
	\cal,a=Imo_MessageAbsParam[ParamInt[0]]
	\cal,p=Imo_MessageParam[ParamInt[0]]

	
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\scp,a	\v,"motion","0"
	\end
	
	
	\scp,a	\comb,p
	
	
	\scp,a	\?v,"mode"
	\cal,s1=ResultStr[0]
	\case,s1
		\of,"stack"
		\of,"cls"
			\cal,c=1
		\of,"keep"
			\if,Imo_FormatText[0]!=""\then	\cal,c=1	\end
	\end
	
	
	\scp,a	\v,"*continueflag",0
	\scp,p	\?v,"transmode"
	\if,ResultStr[0]=="continue" || ResultStr[0]=="stack"\then	
		\cal,c=0
		\scp,a	\v,"*continueflag",1
	\end
	
	
	
	\if,Imo_FormatLog=="continue"\then
		\cal,c=0
		\scp,a	\v,"*continueflag",1
	\end
	
	
	\if,c==1\then
		\scp,o	\cc
		\sub,@@!Imo_ClearMessageText,,o
	\end
	
	
	\scp,a	\?v,"autoshow"
	\if,ResultStr[0]=="true"\then
		\if,Imo_FormatText[0]!=""\then
			\scp,p	\?v,"show"
			\if,ResultStr[0]!="false"\then
				\scp,a	\?v,"show"
				\if,ResultStr[0]=="false"\then
					\scp,p	\v,"show","true"
					\scp,a	\v,"show","true"
					\sub,@@!Imo_EventHook_Message,,p,a		
				\end
			\end
		\end
	\end
\ret


@@!Imo_Message_Refresh_Main
	\var,obj,a,p,o
	\var,int,a1,a2
	\var,str,s1,s2
	\cal,a=Imo_MessageAbsParam[ParamInt[0]]
	\cal,p=Imo_MessageParam[ParamInt[0]]
	\cal,o=Imo_Message[ParamInt[0]]
	
	
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\scp,a
			\v,"motion","0"
			\v,"rep0","pass"
			\v,"rep1","pass"
			\v,"rep2","pass"
			\v,"rep3","pass"
			
			
			
			
			
			
			
			
	\end
	
	
	\var,int,n,i
	\var,table,t
	\scp,p	\?c	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,p	\?n,i								
		\scp,Imo_MessageJump	\?v,ResultStr[0]	
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
\ret

@@!Imo_Message_Refresh_After
	\if,Imo_FormatText[0]==""\then
		\ret
	\end
	\if,AVG_InitFlag==0\then
		\ret
	\end
	
	\var,obj,o,p,a
	\var,int,n,i
	\var,str,s
	\cal,n=ParamInt[0]
	\cal,o=Imo_Message[n],p=Imo_MessageParam[n],a=Imo_MessageAbsParam[n]
	
	
	\var,int,cf,a1,a2,b1,b2
	\var,str,ts,ns
	\scp,a	\?v,"fontno",0	\cal,a1=ResultInt[0],b1=a1
	\scp,p	\?v,"oncefontno"
	\if,ResultStr[0]!=""\then
		\scp,p	\?v,"oncefontno",0	\cal,a1=ResultInt[0]
	\end
	\scp,o
	\fmt,"[f,%d]",a1	\cal,ts=ts+ResultStr[0]
	\fmt,"[rf,%d]",a1	\cal,ts=ts+ResultStr[0]
	\fmt,"[f,%d]",a1	\cal,ns=ns+ResultStr[0]
	
	\scp,a	\?v,"fontsizew",24	\cal,a1=ResultInt[0],b1=a1
	\scp,a	\?v,"fontsizeh",24	\cal,a2=ResultInt[0],b2=a2
	\scp,p	\?v,"oncefontsizew"
	\if,ResultStr[0]!=""\then
		\stid,ResultStr[0],24	\cal,a1=ResultInt[0]
	\end
	\scp,p	\?v,"oncefontsizeh"
	\if,ResultStr[0]!=""\then
		\stid,ResultStr[0],24	\cal,a2=ResultInt[0]
	\end
	\fmt,"[s,%d",a1,",%d]",a2	\cal,ts=ts+ResultStr[0]
	\fmt,"[s,%d",b1,",%d]",b2	\cal,ns=ns+ResultStr[0]
	\scp,a	\v,"*fontsizew",a1
	\scp,a	\v,"*fontsizeh",a2
	
	\scp,a	\?v,"fontcolor",$FFFFFF	\cal,a1=ResultInt[0],b1=a1
	\scp,p	\?v,"oncefontcolor"
	\if,ResultStr[0]!=""\then
		\scp,p	\?v,"oncefontcolor",24	\cal,a1=ResultInt[0]
		\cal,cf=1
	\end
	\cal,a1=a1 | $FF000000
	\cal,b1=b1 | $FF000000
	\fmt,"[c,$%x]",a1	\cal,ts=ts+ResultStr[0]
	\fmt,"[rc,$%x]",a1	\cal,ts=ts+ResultStr[0]
	\fmt,"[c,$%x]",b1	\cal,ns=ns+ResultStr[0]
	
	
	\scp,a	\?v,"mode"
	\if,ResultStr[0]=="stack"\then
		\scp,a	\?v,"*continueflag"
		\if,ResultInt[0]==0\then
			\scp,o	\?tp
			\if,(ResultInt[0]>0)||(ResultInt[1]>#LinePitch)\then
				\scp,o	\o,"[n]"
			\end
		\end
	\end
	
	
	
	\sub,@@!Imo_FormatGetDispName,,1	
	\cal,s=ResultStr[0]
	\sub,@@!Imo_ApplyMessageName,,o,a,s,ns		
	
	
	\scp,p	\?v,"text"
	\if,ResultStr[0]==""||ResultStr[0]=="none"\then
		
		\var,str,bs
		\cal,s=""
		\for,i=0,i<Imo_FormatMultiIndex,i++
			\if,Imo_FormatText[i]==""\then
				\brk
			\end
			
			\if,bs!=Imo_FormatText[i]\then
				\if,s!=""\then
					\cal,s=s+Imo_FormatReturn
				\end
				\cal,s=s+Imo_FormatText[i]
				\cal,bs=Imo_FormatText[i]
			\end
		\end
	\else
		\cal,s=ResultStr[0]
	\end
	\sub,@@!Imo_ApplyMessageText,,o,a,cf,#TextHedderCode+s,ts	

	
	\scp,p	\?v,"disp"
	\if,ResultStr[0]=="nowait"\then
		\scp,o	\mc	
	\end
\ret


@@!Imo_Message_Click
	\var,int,i
	\for,i=0,i<Imo_MessageCount,i++
		\scp,Imo_Message[i]	\mc
	\end
\ret


@@!Imo_Message_GetEOT
	\var,int,i,r
	\cal,r=1
	\for,i=0,i<Imo_MessageCount,i++
		\scp,Imo_Message[i]	\?mc
		\if,ResultInt[0]>0\then
			\cal,r=0
		\end
	\end
	\cal,ResultInt[0]=r
\ret


@@!Imo_Message_10Base
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
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
	
	
	\scp,a	\?v,"show"
	\if,ResultStr[0]=="true"\then
		\scp,o	\e
		\sub,@@!Imo_SkipImageObject,,o,"message",1
	\else
		\scp,o	\d
		\sub,@@!Imo_SkipImageObject,,o,"message",0
	\end
\ret

@@!Imo_Message_11TextArea
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	\var,int,a1,a2
	
	
	\scp,a	\?v,"textareaw",600	\cal,a1=ResultInt[0]
	\scp,a	\?v,"textareah",200	\cal,a2=ResultInt[0]
	\scp,o	\ts,0,0,a1,a2
	
	\var,int,mx,my
	\scp,Imo_Project	\?v,"TextAreaMarginX",0	\cal,mx=ResultInt[0]
	\scp,Imo_Project	\?v,"TextAreaMarginY",0	\cal,my=ResultInt[0]
	\scp,o	\tmg,mx,my
\ret

@@!Imo_Message_00File
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\sub,@@!Imo_Message_File,,ResultStr[0]
		\scp,o	\l,ResultStr[0]	\m,0
		
		
		\scp,o	\exr
	\end
	\scp,p	\?v,"rep0"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_Message_File,,ResultStr[0]
		\scp,o	\li,0,ResultStr[0]
	\end
	\scp,p	\?v,"rep1"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_Message_File,,ResultStr[0]
		\scp,o	\li,1,ResultStr[0]
	\end
	\scp,p	\?v,"rep2"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_Message_File,,ResultStr[0]
		\scp,o	\li,2,ResultStr[0]
	\end
	\scp,p	\?v,"rep3"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_Message_File,,ResultStr[0]
		\scp,o	\li,3,ResultStr[0]
	\end
	
	\sub,@@!Imo_Zero
\ret

@@!Imo_Message_12Motion
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
\ret

@@!Imo_Message_20Position
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]

	\var,int,x,y,z,100,100,100,0,0,0,pri,0
	\scp,a	\?v,"x",0	\cal,x=ResultInt[0]
	\scp,a	\?v,"y",0	\cal,y=ResultInt[0]
	\scp,a	\?v,"z",0	\cal,z=ResultInt[0]
	\scp,a	\?v,"pri",0	\cal,pri=ResultInt[0]
	\scp,o	\p4,x,y,z,100,100,100,0,0,0,pri,0
	\sub,@@!Imo_Zero
\ret

@@!Imo_Message_30trans
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	\var,int,a1
	\var,str,s1

	\scp,p	\?v,"transmode"
	\if,ResultStr[0]!=""\then
		\var,int,i
		\scp,p	\?v,"transmode"		\cal,s1=ResultStr[0]
		\scp,p	\?v,"transparam",1	\cal,a1=ResultInt[0]
		\case,s1
			\of,"none"
			\of,"cls"
				\scp,o	\cc
				\sub,@@!Imo_ClearMessageText,,o
			\of,"return"
				\scp,o
				\for,i=0,i<a1,i++	\o,"[n]"	\end
			\of,"continue"
		\end
	\end
\ret

@@!Imo_Message_30StringGenerator0
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,p	\?v,"genfilter","none"
	\sub,@@!Imo_GeneratorFilterOpConvert,,ResultStr[0]
	
	\scp,o	\g2,ResultStr[0],1		
\ret

