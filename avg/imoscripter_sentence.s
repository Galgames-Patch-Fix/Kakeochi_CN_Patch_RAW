




@@@!ImoScripter_Base.s


@@!Imo_Sentence_Create
	
	\gvar,table,Imo_SentenceParam
	\gvar,table,Imo_SentenceAbsParam
	\gvar,table,Imo_SentenceDefault
	\gvar,int,Imo_SentenceMessageWait
	\gvar,int,Imo_SentenceVoiceTime,Imo_SentenceClickTime,Imo_SentenceSkipTime,Imo_SentenceClickLock
	
	\gvar,table,Imo_SentenceTemplate
	\scp,Imo_SentenceTemplate	\l,"ImoScripter_Template_Sentence.txt"	\sort
	
	\scp,eff	\dc,3
	
	\sub,@@!Imo_Sentence_DefaultParam
	\scp,Imo_SentenceParam		\asn,Imo_SentenceDefault
	
	\sub,@@!Imo_Sentence_Refresh
\ret


@@!Imo_Sentence_Free
	\del,Imo_SentenceParam
	\del,Imo_SentenceAbsParam
	\del,Imo_SentenceDefault
	\del,Imo_SentenceMessageWait
	\del,Imo_SentenceVoiceTime,Imo_SentenceClickTime,Imo_SentenceSkipTime,Imo_SentenceClickLock
	\del,Imo_SentenceTemplate
	
	\scp,eff	\fdm,_mmLinear,100	\fdp,0,0,100,100,0
\ret


@@!Imo_Sentence_DefaultParam
	\scp,Imo_SentenceDefault
		\i
		\v,"fademode","skip"
		\v,"fadetime","0"
		\v,"fadefile","none"
		\v,"fadepow","4"
		\v,"waitmode","skip"
		\v,"waittime","0"
		\v,"skiptime","0"
		\v,"clicklock","false"
		
		\v,"bgcolor","$000000"
		\v,"autowait","false"
		\v,"pri","990"
		\v,"timemode","linear"
		\v,"timepow","100"
		\v,"fadeax","0"
		\v,"fadeay","0"
		\v,"fadescalex","100"
		\v,"fadescaley","100"
		\v,"faderotz","0"
	\sub,@@!Imo_LoadDefaultFile,,Imo_SentenceDefault,"Default_Sentence.txt"
\ret


@@!Imo_Sentence_File
	\scp,Imo_Setting	\?v,"PathSentence"
	\sub,@@!Imo_FileSerch,,1,ParamStr[0],ResultStr[0],".b",".png",".bmp",".jpg"
\ret


@@!Imo_Sentence_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\var,obj,p,a
	\var,int,i,n,pri
	\var,str,op,s1,s2,s3,s4
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_SentenceTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	\cal,p=Imo_SentenceParam,a=Imo_SentenceAbsParam
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1],s2=ResultStr[2],s3=ResultStr[3],s4=ResultStr[4]
		\scp,p
		
		\case,op
			\of,"fade"
				\if,s1!=""\then \v,"fademode",s1 \end
				\if,s2!=""\then \v,"fadetime",s2 \end
				\if,s3!=""\then \v,"fadefile",s3 \end
				\if,s4!=""\then \v,"fadepow",s4 \end
			\of,"wait"
				\if,s1!=""\then \v,"waitmode",s1 \end
				\if,s2!=""\then \v,"waittime",s2 \end
				\if,s3!=""\then \v,"skiptime",s3 \end
		\else
			\v,op,s1
		\end
		
		\if,op=="clear"\then
			\scp,p	\comb,Imo_SentenceDefault
		\end
	\end
	
	\scp,p	\?v,"fademode"
	\cal,s1=ResultStr[0]
	\if,s1!="" && s1!="none" && s1!="cut" && s1!="skip"\then
		\sub,@@!Imo_Sentence_Catch
	\end
	\cal,Imo_SentenceFlag=1
\ret

@@!Imo_Sentence_Catch
	
	\if,Avg_InitFlag==0\then
		\ret
	\end
	
	\var,int,pri
	\scp,Imo_SentenceAbsParam	\?v,"pri"	\stid,ResultStr[0],999	\cal,pri=ResultInt[0]
	\scp,eff	\c,pri
\ret


@@!Imo_Sentence_Refresh
	\cal,Imo_SentenceMessageWait=1
	\cal,Imo_SentenceVoiceTime=0
	\cal,Imo_SentenceClickTime=0
	\cal,Imo_SentenceSkipTime=0
	\cal,Imo_SentenceClickLock=0
	
	\scp,Imo_SentenceParam	\?c
	\if,ResultInt[0]>0\then
		\sub,@@!Imo_Sentence_Refresh_Sub,,0
	\end
	
	
	\scp,Imo_SentenceAbsParam	\?v,"clicklock"
	\case,ResultStr[0]
		\of,"true"		\cal,Imo_SentenceClickLock=1
		\of,"unread"	\scp,llog	\?k2	\cal,Imo_SentenceClickLock=(ResultInt[0]==0)	
	\end
\ret

@@!Imo_Sentence_Refresh_Sub
	\var,obj,a,p
	\cal,a=Imo_SentenceAbsParam
	\cal,p=Imo_SentenceParam
	
	
	\scp,a	\comb,p
	
	
	\scp,p	\?v,"bgcolor"
	\if,ResultStr[0]!=""\then
		\stid,ResultStr[0],$000000
		\scp,eff	\bg,ResultInt[0]
	\end
	
	
	\if,Avg_InitFlag==0\then
		\scp,p	\i
		\ret
	\end
	
	
	\scp,a	\?v,"autowait"
	\if,ResultStr[0]=="true"\then
		\sub,@@!Imo_Sentence_AutoWaitEvent,,p,a
	\end

	
	\sub,@@!Imo_EventHook_Sentence_Refresh,,p,a

	
	\scp,p	\?v,"fademode"
	\if,ResultStr[0]!=""\then
		\sub,@@!Imo_Sentence_Refresh_Fade
	\end
	
	\scp,p	\?v,"waitmode"
	\if,ResultStr[0]!=""\then
		\sub,@@!Imo_Sentence_Refresh_Wait
	\end
	
	
	\scp,p	\i
\ret

@@!Imo_Sentence_Refresh_Fade
	\var,obj,a,p
	\cal,a=Imo_SentenceAbsParam
	\cal,p=Imo_SentenceParam
	
	\var,int,tt,pp,tm,tp,fax,fay,fsx,fsy,frr,pri
	\var,str,ff,s1
	\scp,p	\?v,"fademode"
	\cal,s1=ResultStr[0]
	\scp,a	\?v,"pri",999			\cal,pri=ResultInt[0]
	\scp,p	\?v,"fadetime",0		\cal,tt=ResultInt[0]
	\scp,p	\?v,"fadepow",4			\cal,pp=ResultInt[0]
	\scp,p	\?v,"timemode","linear"	\scp,Imo_MoveModeList	\?v,ResultStr[0]	\cal,tm=ResultInt[0]
	\scp,p	\?v,"timepow",100		\cal,tp=ResultInt[0]
	\scp,eff	\fdm,tm,tp
	\scp,p	\?v,"fadeax",0			\cal,fax=ResultInt[0]
	\scp,p	\?v,"fadeay",0			\cal,fay=ResultInt[0]
	\scp,p	\?v,"fadescalex",100	\cal,fsx=ResultInt[0]
	\scp,p	\?v,"fadescaley",100	\cal,fsy=ResultInt[0]
	\scp,p	\?v,"faderotz",0		\cal,frr=ResultInt[0]
	\scp,eff	\fdp,fax,fay,fsx,fsy,frr
	\scp,p	\?v,"fadefile"
	\sub,@@!Imo_Sentence_File,,ResultStr[0]
	\cal,ff=ResultStr[0]
	\case,s1
		\of,"skip"		
		\of,"catch"	
		\of,"cut"		\scp,eff	\i
		\of,"overlap"	\scp,eff	\fdi,0,tt,"",pri
		\of,"rule"		\scp,eff	\fdi,0,tt,ff,pri,pp
		\of,"anime"	\scp,eff	\fdi,0,tt,ff,pri
		\of,"mosaic"	\scp,eff	\fdi,4,tt,"",pri
	\end
	\sub,@@!Imo_Zero
\ret

@@!Imo_Sentence_Refresh_Wait
	\var,obj,a,p
	\cal,a=Imo_SentenceAbsParam
	\cal,p=Imo_SentenceParam

	\var,int,cw,vt,mw,sk,lk,tt
	\var,str,s1
	\scp,p	\?v,"waitmode"
	\cal,s1=ResultStr[0]
	\scp,p	\?v,"waittime"
	\rep,ResultStr[0],"infinity","$FFFFFF"
	\stid,ResultStr[0],0	\cal,tt=ResultInt[0]
	
	\if,tt<30000\then
		\cal,sk=tt
	\end
	\scp,p	\?v,"skiptime"
	\if,ResultStr[0]!=""\then
		\stid,ResultStr[0],0	\cal,sk=ResultInt[0]
	\end
	\case,s1
		\of,"skip"		\cal,cw=0	,mw=0	,vt=0	,lk=0
		\of,"click"	\cal,cw=tt	,mw=1	,vt=0	,lk=0
		\of,"clickonly"\cal,cw=tt	,mw=0	,vt=0	,lk=0
		\of,"wait"		\cal,cw=tt	,mw=1	,vt=0	,lk=1
		\of,"waitonly"	\cal,cw=tt	,mw=0	,vt=0	,lk=1
		\of,"message"	\cal,cw=0	,mw=1	,vt=0	,lk=0
		\of,"voice"	\cal,cw=0	,mw=0	,vt=tt	,lk=0
	\end
	\cal,Imo_SentenceClickTime=cw	
	
	\cal,Imo_SentenceMessageWait=mw	
	\cal,Imo_SentenceVoiceTime=vt	
	\cal,Imo_SentenceSkipTime=sk	
	\cal,Imo_SentenceClickLock=lk	
	
	
	
	
	
	
	
	
	\if,Imo_FormatText[0]!=""\then
		\if,s1=="click"\then
			\if,Imo_SentenceClickTime<500\then
				\cal,Imo_SentenceClickTime=0
			\else
				\cal,Imo_SentenceClickTime=Imo_SentenceClickTime-250	
			\end
			
		\end
	\end
\ret

@@!Imo_Sentence_AutoWaitEvent
	\var,obj,a,p
	\cal,p=ParamStr[0]
	\cal,a=ParamStr[1]
	
	\var,str,t
	
	\scp,p	\?v,"fadetime"
	\cal,t=ResultStr[0]
	\if,t==""\then
		\ret
	\end
	
	\scp,p	\?v,"waitmode"
	\if,ResultStr[0]!=""\then
		\ret
	\end
	
	\scp,p	\v,"waitmode","click"
	\scp,p	\v,"waittime",t
	\scp,a	\v,"waitmode","click"
	\scp,a	\v,"waittime",t
\ret
