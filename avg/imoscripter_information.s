




@@@!ImoScripter_Base.s
@@@!misc\misc.s


@@!Imo_Info_Create
	
	\gvar,table,Imo_InfoParam[Imo_InfoCount]
	\gvar,table,Imo_InfoAbsParam[Imo_InfoCount]
	\gvar,obj,Imo_InfoTargetTable[Imo_InfoCount]	
	\gvar,table,Imo_InfoSearchTable[Imo_InfoCount]
	\gvar,int,Imo_InfoProgressTime[Imo_InfoCount]
	\gvar,table,Imo_InfoDefault
	\gvar,msg,Imo_Info[Imo_InfoCount]
	\gvar,timer,Imo_InfoTimer
	
	\gvar,table,Imo_InfoTemplate
	\scp,Imo_InfoTemplate	\l,"ImoScripter_Template_Information.txt"	\sort
	
	\gvar,table,Imo_InfoJump
	\scp,Imo_InfoJump
		\v,"type"		,""
		\v,"enable"		,"@@!Imo_Info_10Base"
		\v,"show"		,"@@!Imo_Info_10Base"
		\v,"target"		,"@@!Imo_Info_10Base"
		\v,"tablefile"	,"@@!Imo_Info_10Base"
		\v,"time"		,""
		\v,"autoshow"	,""
		\v,"x"			,"@@!Imo_Info_20Position"
		\v,"y"			,"@@!Imo_Info_20Position"
		\v,"z"			,"@@!Imo_Info_20Position"
		\v,"pri"		,"@@!Imo_Info_20Position"
		\v,"alignx"		,"@@!Imo_Info_10Base"
		\v,"aligny"		,"@@!Imo_Info_10Base"
		\v,"motion"		,"@@!Imo_Info_12Motion"
		\v,"file"		,"@@!Imo_Info_00File,@@!Imo_Info_10Base,@@!Imo_Info_11TextArea,@@!Imo_Info_12Motion"
		\v,"rep0"		,"@@!Imo_Info_00File"
		\v,"rep1"		,"@@!Imo_Info_00File"
		\v,"rep2"		,"@@!Imo_Info_00File"
		\v,"rep3"		,"@@!Imo_Info_00File"
		\v,"textareaw"	,"@@!Imo_Info_11TextArea"
		\v,"textareah"	,"@@!Imo_Info_11TextArea"
		\v,"fontsizew"	,""
		\v,"fontsizeh"	,""
		\v,"fontcolor"	,""
		\v,"fontno"		,""
		\v,"output"		,""
		\v,"format"		,""
		\v,"text"		,""
	
	\sub,@@!Imo_Info_DefaultParam
	\var,int,i,n
	\for,i=0,i<Imo_InfoCount,i++
		
		\scp,Imo_Info[i]
			\dc,0
			\vtn,_stSE
			\in,$8	
			\out,$8
			\o,"[f,0][s,24,24][c,$FFFFFFFF][pi,0,0][rs,10,10][rpi,0,0][rp,0,-8]"
			\cc
			\ap,1	
			\as,1	
			\kwe,0	
			\ns,0	
		
		\scp,Imo_InfoParam[i]	\asn,Imo_InfoDefault
		
		\scp,Imo_InfoNames		\?n,i
		\scp,Imo_InfoAbsParam[i]
			\v,"*objectname",ResultStr[0]
			\v,"*objectindex",i
	\end
	
	\sub,@@!Imo_Info_Refresh
	
	\scp,Imo_InfoTimer
		\t,250
		\l,@@!Imo_Info_TimerEvent
		\e
\ret


@@!Imo_Info_Free
	\del,Imo_InfoTimer
	\del,Imo_InfoParam
	\del,Imo_InfoAbsParam
	\del,Imo_InfoTargetTable
	\del,Imo_InfoSearchTable
	\del,Imo_InfoProgressTime
	\del,Imo_InfoDefault
	\del,Imo_InfoTemplate
	\del,Imo_Info
	\del,Imo_InfoJump
\ret


@@!Imo_Info_DefaultParam
	\scp,Imo_InfoDefault
		\i
		\v,"type","none"
		\v,"enable","true"
		\v,"target","none"
		\v,"tablefile","none"
		\v,"disptime","3000"
		\v,"autoshow","true"
		\v,"show","false"
		\v,"file","none"
		\v,"rep0","pass"
		\v,"rep1","pass"
		\v,"rep2","pass"
		\v,"rep3","pass"
		\v,"textareaw","400"
		\v,"textareah","50"
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
		\v,"output","text"
		\v,"format","%s"
		\v,"text","none"
	\sub,@@!Imo_LoadDefaultFile,,Imo_ImageDefault,"Default_Information.txt"
\ret


@@!Imo_Info_File
	\scp,Imo_Setting	\?v,"PathInformation"	
	\sub,@@!Imo_FileSerch,,1,ParamStr[0],ResultStr[0],".png",".bmp",".jpg",".b",".ogv",".txt"
\ret


@@!Imo_Info_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\var,int,n,i,no
	\var,obj,p,a
	\var,str,op,s1,s2
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_InfoTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	\scp,sl	\?s,0	\stid,ResultStr[0],0
	\cal,no=ResultInt[0]
	\cal,p=Imo_InfoParam[no],a=Imo_InfoAbsParam[no]
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1]
		\scp,p	\v,op,s1
		
		\if,op=="clear"\then
			\scp,p	\comb,Imo_InfoDefault
		\end
	\end
	
	
	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_Info_Refresh
	\var,int,i
	\for,i=0,i<Imo_InfoCount,i++
		\sub,@@!Imo_Info_Refresh_Before,,i
		\scp,Imo_InfoParam[i]	\?c
		\if,ResultInt[0]>0\then
			\sub,@@!Imo_Info_Refresh_Main,,i
		\end
		\sub,@@!Imo_Info_Refresh_After,,i
		\scp,Imo_InfoParam[i]	\i
	\end
\ret

@@!Imo_Info_ParamClear
	\var,int,i
	\for,i=0,i<Imo_InfoCount,i++
		\scp,Imo_InfoParam[i]	\i
	\end
\ret

@@!Imo_Info_Refresh_Before
	\var,str,s1
	\var,int,c,n
	\var,obj,a,p,o
	\cal,n=ParamInt[0]
	\cal,o=Imo_Info[n],p=Imo_InfoParam[n],a=Imo_InfoAbsParam[n]
	
	
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\scp,a	\v,"motion","0"
				\v,"rep0","pass"
				\v,"rep1","pass"
				\v,"rep2","pass"
				\v,"rep3","pass"
	\end
	
	
	\scp,a	\comb,p

	
	\scp,a	\?v,"enable"
	\if,ResultStr[0]=="true"\then
		\sub,@@!Imo_InfoEvent,,p,a,n
	\end
\ret

@@!Imo_InfoEvent
	\var,obj,p,a
	\var,int,n
	\cal,p=ParamStr[0]
	\cal,a=ParamStr[1]
	\cal,n=ParamInt[2]
	
	\var,str,tt
	\scp,p
		\?v,"text"		\cal,tt=ResultStr[0]
	\var,str,output,fmt
	\scp,a
		\?v,"output"	\cal,output=ResultStr[0]
		\?v,"format"	\cal,fmt=ResultStr[0]
	\if,tt==""\then
		
		\sub,@@!Imo_InfoSearchTarget,,n
		\scp,Imo_InfoSearchTable[n]	\bpos,ResultStr[0]
		\cal,tt=ResultStr[1]	
	\else
		
	\end
	
	
	\if,tt=="none"\then
		\cal,tt=""
	\end
	
	\if,tt==""\then
		\ret
	\end
	
	\scp,p	\v,"text",""
	\scp,a	\v,"text",""
	\if,fmt=="none"\then
		\cal,tt=""
	\else
		\if,tt!=""\then
			\fmt,fmt,tt	\cal,tt=ResultStr[0]
		\end
	\end
	\case,output
		\of,"text"		\scp,p	\v,"text",tt	\scp,a	\v,"text",tt
		\of,"motion"	\scp,p	\v,"motion",tt	\scp,a	\v,"motion",tt
		\of,"file"		\scp,p	\v,"file",tt	\scp,a	\v,"file",tt
		\of,"rep0"		\scp,p	\v,"rep0",tt	\scp,a	\v,"rep0",tt
		\of,"rep1"		\scp,p	\v,"rep1",tt	\scp,a	\v,"rep1",tt
		\of,"rep2"		\scp,p	\v,"rep2",tt	\scp,a	\v,"rep2",tt
		\of,"rep3"		\scp,p	\v,"rep3",tt	\scp,a	\v,"rep3",tt
	\end
	
	
	\scp,a	\?v,"autoshow"
	\if,ResultStr[0]=="true"\then
		
		\scp,p	\?v,"show"
		\if,ResultStr[0]==""\then
			\scp,p	\v,"show","true"	\scp,a	\v,"show","true"
		\end
	\end
\ret

@@!Imo_InfoSearchTarget
	\var,obj,t
	\cal,t=Imo_InfoTargetTable[ParamInt[0]]
	
	\if,t==null\then
		\cal,ResultStr[0]=""
		\ret
	\end
	
	
	
	\scp,t	\?v,"file"
	\if,ResultStr[0]!=""\then
		\ret
	\end
	\scp,t	\?v,"rep0"
	\if,ResultStr[0]!=""\then
		\ret
	\end
	\scp,t	\?v,"rep1"
	\if,ResultStr[0]!=""\then
		\ret
	\end
	\scp,t	\?v,"rep2"
	\if,ResultStr[0]!=""\then
		\ret
	\end
	\scp,t	\?v,"rep3"
	\if,ResultStr[0]!=""\then
		\ret
	\end
\ret

@@!Imo_Info_Refresh_Main
	\var,obj,a,p,o
	\var,int,a1,a2,n
	\var,str,s1,s2
	\cal,n=ParamInt[0]
	\cal,o=Imo_Info[n],p=Imo_InfoParam[n],a=Imo_InfoAbsParam[n]
	
	
	\var,int,n,i
	\var,table,t
	\scp,p	\?c	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,p	\?n,i								
		\scp,Imo_InfoJump	\?v,ResultStr[0]	
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

@@!Imo_Info_Refresh_After
	\if,AVG_InitFlag==0\then
		\ret
	\end
	
	\var,obj,o,p,a
	\var,int,a1,a2,n
	\cal,n=ParamInt[0]
	\cal,o=Imo_Info[n],p=Imo_InfoParam[n],a=Imo_InfoAbsParam[n]
	
	\scp,a	\?v,"output"
	\if,ResultStr[0]!="text"\then
		\ret
	\end
	
	\var,str,tt
	\scp,p	\?v,"text"	\cal,tt=ResultStr[0]
	\if,tt==""\then
		\ret
	\end
	
	
	\var,str,st
	\scp,a	\?v,"fontno"	\stid,ResultStr[0],0	\cal,a1=ResultInt[0]
	\fmt,"[f,%d]",a1	\cal,st=st+ResultStr[0]
	\fmt,"[rf,%d]",a1	\cal,st=st+ResultStr[0]
	
	\scp,a	\?v,"fontsizew",24	\cal,a1=ResultInt[0]
	\scp,a	\?v,"fontsizeh",24	\cal,a2=ResultInt[0]
	\fmt,"[s,%d",a1,",%d]",a2	\cal,st=st+ResultStr[0]
	
	
	
	
	
	
	\scp,a	\?v,"colormode"
	\if,ResultStr[0]=="auto"\then
		\scp,Imo_InfoColorList	\?v,s
		\if,ResultStr[0]==""\then
			\scp,Imo_InfoColorList	\?v,"default"
		\end
		\stid,ResultStr[0],$FFFFFF	\cal,a1=ResultInt[0] | $FF000000
	\else
		\scp,a	\?v,"fontcolor",$FFFFFF	\cal,a1=ResultInt[0] | $FF000000
	\end
	\fmt,"[c,$%x]",a1	\cal,st=st+ResultStr[0]
	\fmt,"[rc,$%x]",a1	\cal,st=st+ResultStr[0]
	
	\scp,o	\cc	\o,st+tt	\mc
\ret

@@!Imo_Info_AllHide
	\var,int,i
	\for,i=0,i<Imo_InfoCount,i++
		\scp,Imo_Info[i]	\d
		\cal,Imo_InfoProgressTime[i]=0
	\end
\ret

@@!Imo_Info_TimerEvent
	\var,int,i,t
	
	\scp,Imo_InfoTimer	\?t
	\cal,t=ResultInt[0]
	
	\for,i=0,i<Imo_InfoCount,i++
		\if,Imo_InfoProgressTime[i]>0\then
			\cal,Imo_InfoProgressTime[i]=Imo_InfoProgressTime[i]-t
			\if,Imo_InfoProgressTime[i]<1\then
				
				\scp,Imo_Info[i]	\d
				\cal,Imo_InfoProgressTime[i]=0
			\end
		\end
	\end
\ret


@@!Imo_Info_10Base
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	\var,int,a1,a2
	\var,str,s1,s2
	
	\var,int,idx
	\scp,a	\?v,"*objectindex"	\cal,idx=ResultInt[0]
	
	
	\scp,p	\?v,"target"
	\if,ResultStr[0]!=""\then
		\sub,@@!Imo_SerchObject,,ResultStr[0]
		\cal,Imo_InfoTargetTable[idx]=ResultObj[2]	
	\end
	
	
	\scp,p	\?v,"tablefile"
	\if,ResultStr[0]!=""\then
		\scp,Imo_InfoSearchTable[idx]	\i
		\sub,@@!Imo_Info_File,,ResultStr[0]
		\if,ResultStr[0]!=""\then
			\scp,Imo_InfoSearchTable[idx]	\l,ResultStr[0]
		\end
	\end
	
	
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
	
	
	
	
	\scp,a	\?v,"type"
	\sub,@@!Imo_Info_CopnfigEnableCheck,,ResultStr[0]
	\if,ResultInt[0]==1\then
		
		\scp,p	\?v,"show"
		\if,ResultStr[0]=="true"\then
			\scp,o	\d	\e	
			
			\scp,a	\?v,"disptime"
			\cal,Imo_InfoProgressTime[idx]=ResultInt[0]
		\else
			\scp,o	\d
		\end
	\end
\ret

@@!Imo_Info_CopnfigEnableCheck
	\var,str,s
	\cal,s=ParamStr[0]
	
	\if,s=="location"\then
		\if,#DisplayLocation>0\then
			\cal,ResultInt[0]=1
			\ret
		\end
	\end
	\if,s=="music"\then
		\if,#DisplayMusic>0\then
			\cal,ResultInt[0]=1
			\ret
		\end
	\end
	
	\cal,ResultInt[0]=0
\ret

@@!Imo_Info_11TextArea
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	\var,int,a1,a2
	
	
	\scp,a	\?v,"textareaw",0	\cal,a1=ResultInt[0]
	\scp,a	\?v,"textareah",0	\cal,a2=ResultInt[0]
	\scp,o	\ts,0,0,a1,a2
	
	\var,int,mx,my
	\scp,Imo_Project	\?v,"TextAreaMarginX",0	\cal,mx=ResultInt[0]
	\scp,Imo_Project	\?v,"TextAreaMarginY",0	\cal,my=ResultInt[0]
	\scp,o	\tmg,mx,my
\ret

@@!Imo_Info_00File
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\sub,@@!Imo_Info_File,,ResultStr[0]
		\scp,o	\l,ResultStr[0]
		
		
		\scp,o	\exr
	\end
	
	\scp,p	\?v,"rep0"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_Info_File,,ResultStr[0]
		\scp,o	\li,0,ResultStr[0]
	\end
	\scp,p	\?v,"rep1"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_Info_File,,ResultStr[0]
		\scp,o	\li,1,ResultStr[0]
	\end
	\scp,p	\?v,"rep2"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_Info_File,,ResultStr[0]
		\scp,o	\li,2,ResultStr[0]
	\end
	\scp,p	\?v,"rep3"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_Info_File,,ResultStr[0]
		\scp,o	\li,3,ResultStr[0]
	\end
	\sub,@@!Imo_Zero
\ret

@@!Imo_Info_12Motion
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]

	\var,str,s1
	\var,int,a1	
	\scp,a	\?v,"motion",0	\cal,s1=ResultStr[0]
	\stid,s1,$FFFF
	\cal,a1=ResultInt[0]
	\if,a1==$FFFF\then
		\scp,o	\m,s1
	\else
		\scp,o	\m,a1
	\end
\ret

@@!Imo_Info_20Position
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

