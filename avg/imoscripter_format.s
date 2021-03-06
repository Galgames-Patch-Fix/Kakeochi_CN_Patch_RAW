



@@!Imo_Format_Create
	
	\gvar,table,Imo_FormatParam
	\gvar,table,Imo_FormatAbsParam
	\gvar,table,Imo_FormatDefault
	
	\gvar,table,Imo_FormatTemplate
	\scp,Imo_FormatTemplate	\l,"ImoScripter_Template_Format.txt"	\sort
	
	\sub,@@!Imo_Format_DefaultParam
	\scp,Imo_FormatParam	\asn,Imo_FormatDefault
	\scp,Imo_FormatAbsParam	\comb,Imo_FormatParam
	
	\gvar,int,Imo_FormatMultiCount	\cal,Imo_FormatMultiCount=#VoicePlayPolyphonyCount
	\gvar,int,Imo_FormatMultiIndex,Imo_FormatMultiStep
	\gvar,str,Imo_FormatText[Imo_FormatMultiCount]
	\gvar,str,Imo_FormatName[Imo_FormatMultiCount]
	\gvar,str,Imo_FormatVoice[Imo_FormatMultiCount]
	\gvar,int,Imo_FormatVolume	
	\gvar,int,Imo_FormatPan		
	\gvar,str,Imo_FormatFilter	
	\gvar,str,Imo_FormatLog		
	\gvar,int,Imo_FormatVolWeight	
	\gvar,int,Imo_FormatVoiceExists	
	\gvar,int,Imo_FormatLoadFlag
	
	\gvar,str,Imo_LogText[Imo_FormatMultiCount]
	\gvar,str,Imo_LogName[Imo_FormatMultiCount]
	\gvar,str,Imo_LogVoice[Imo_FormatMultiCount]
	\gvar,str,Imo_LogFilter[Imo_FormatMultiCount]
	
	\gvar,int,Imo_FormatMode
	\scp,Imo_Project	\?v,"FormatType"
	\cal,Imo_FormatMode=ResultInt[0]
	
	\gvar,str,Imo_FormatReturn
	\scp,Imo_Setting	\?v,"ReturnCode"
	\cal,Imo_FormatReturn=ResultStr[0]
	
	\scp,rep
		\et,"\subp,@@!Imo_Format_Text,,"	
		\nt,"\subp,@@!Imo_Format_Sentence"	
	
	\gvar,str,Imo_FormatLogExtString
\ret

@@!Imo_Format_Free
	
	\sub,@@!Imo_Format_InitVouceChannel
	
	\scp,rep
		\et,""
		\nt,""
	
	\del,Imo_FormatParam
	\del,Imo_FormatAbsParam
	\del,Imo_FormatDefault
	\del,Imo_FormatTemplate
	
	\del,Imo_FormatMode
	\del,Imo_FormatReturn
	\del,Imo_FormatText
	\del,Imo_FormatName
	\del,Imo_FormatVoice
	\del,Imo_FormatVolume
	\del,Imo_FormatPan
	\del,Imo_FormatFilter
	\del,Imo_FormatLog
	\del,Imo_FormatVolWeight
	\del,Imo_FormatVoiceExists
	
	\del,Imo_LogText
	\del,Imo_LogName
	\del,Imo_LogVoice
	\del,Imo_LogFilter
	
	\del,Imo_FormatMultiIndex,Imo_FormatMultiStep
	\del,Imo_FormatMultiCount
	
	\del,Imo_FormatLogExtString
\ret


@@!Imo_Format_InitVouceChannel
	\var,int,i
	\for,i=0,i<Imo_FormatMultiCount,i++
		\scp,snd[#VoicePlaySoundChannel+i]	\i
	\end
\ret


@@!Imo_Format_DefaultParam
	\scp,Imo_FormatDefault
		\i
		\v,"vol","100"
		\v,"pan","50"
		\v,"log","none"
		\v,"trans","none"
		\v,"sndfilter","none"
	\sub,@@!Imo_LoadDefaultFile,,Imo_FormatDefault,"Default_Format.txt"
\ret


@@!Imo_Format_File
	\var,int,v
	\scp,Imo_Setting	\?v,"VoiceFileError"	\cal,v=ResultInt[0]
	\scp,Imo_Setting	\?v,"PathFormat"
	\sub,@@!Imo_FileSerch,,v,ParamStr[0],ResultStr[0],".ogg"
\ret


@@!Imo_Format_Excute
	\var,list,sl
	\var,obj,p,a
	\var,int,i,n
	\var,str,op,s1
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_FormatTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	\cal,p=Imo_FormatParam,a=Imo_FormatAbsParam
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1]
		\scp,p	\v,op,s1
		
		\if,op=="clear"\then
			\if,s1=="def"\then
				\scp,p	\comb,Imo_FormatDefault
			\end
		\end
	\end
	
	
	\scp,a	\comb,p
	
	
	\sub,@@!Imo_EventHook_Format,,p,a
	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_Format_Refresh
	\scp,Imo_FormatParam	\?c
	\if,ResultInt[0]>0\then
		\sub,@@!Imo_Format_Refresh_Sub,,0
	\end
	
	
	\var,int,i
	\if,Imo_FormatLog=="continue"\then
		\for,i=0,i<Imo_FormatMultiCount,i++
			\cal,Imo_LogText[i]=Imo_LogText[i]+Imo_FormatText[i]
			\cal,Imo_FormatName[i]=Imo_LogName[i]
			\cal,Imo_FormatVoice[i]=Imo_LogVoice[i]
			\cal,Imo_LogFilter[i]=Imo_FormatFilter		
			\if,Imo_LogText[i]!=""\then
				\cal,Imo_FormatMultiIndex=i+1
			\end
			\if,Imo_FormatVoice[i]!=""\then
				\cal,Imo_FormatVoiceExists=1
			\end
		\end
		\sub,@@!Imo_FormatOverrideBackLog
	\else
		\for,i=0,i<Imo_FormatMultiCount,i++
			\cal,Imo_LogText[i]=Imo_FormatText[i]
			\cal,Imo_LogName[i]=Imo_FormatName[i]
			\cal,Imo_LogVoice[i]=Imo_FormatVoice[i]
			\cal,Imo_LogFilter[i]=Imo_FormatFilter		
		\end
		\if,Imo_FormatLog!="disable"\then
			\sub,@@!Imo_FormatAddBackLog
		\end
	\end
\ret

@@!Imo_Format_Refresh_Sub
	\var,obj,a,p
	\var,int,a1,a2
	\var,str,s1,s2
	\cal,a=Imo_FormatAbsParam
	\cal,p=Imo_FormatParam
	
	
	\scp,p	\?v,"vol",100	\cal,Imo_FormatVolume=ResultInt[0]
	
	\scp,p	\?v,"pan",50	\cal,Imo_FormatPan=ResultInt[0]
	
	\scp,p	\?v,"sndfilter"	\cal,Imo_FormatFilter=ResultStr[0]
	\if,Imo_FormatFilter!=""\then
		\sub,@@!Imo_SoundFilterOpConvert,,Imo_FormatFilter
		\cal,Imo_FormatFilter=ResultStr[0]
	\end

	
	\scp,p	\?v,"log"
	\if,ResultStr[0]!=""\then
		\cal,Imo_FormatLog=ResultStr[0]
		
		\if,Imo_FormatLog=="stack"\then
			\cal,Imo_FormatLog="continue"
		\end
	\end
	
	\scp,p	\?v,"trans"
	\if,ResultStr[0]!=""\then
		\case,ResultStr[0]
			\of,"mute"	\sub,@@!Imo_VoiceStop
		\end
	\end
\ret

@@!Imo_Format_ParamClear
	\scp,Imo_FormatParam	\i
\ret


@@!Imo_Format_Text
	
	\if,#SceneSkipLogEnable==0\then
		\if,Avg_SceneSkipFlag>0\then
			\cal,Imo_SentenceFlag=1
			\ret
		\end
	\end
	
	
	\cpy,ParamStr[0],1,1
	\if,ResultStr[0]=="^"\then
		\derr,"format:未定義の命令を検知："+ParamStr[0]
		\ret
	\end
	
	\case,Imo_FormatMode
		\of,0	\subp,@@!Imo_FormatModeSingle,,ParamStr[0]
		\of,1	\subp,@@!Imo_FormatModeMulti,,ParamStr[0]
	\end
	
	\if,Imo_FormatName[Imo_FormatMultiStep]=="none"\then
		\cal,Imo_FormatName[Imo_FormatMultiStep]=""
	\end
	\if,Imo_FormatVoice[Imo_FormatMultiStep]=="none"\then
		\cal,Imo_FormatVoice[Imo_FormatMultiStep]=""
	\end

	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_Format_Sentence
	
	\if,Imo_SentenceFlag==0\then
		\ret
	\end
	
	\sub,@@!Avg_LogJumpStep
	\cal,Imo_FormatLogExtString=""
	
	\if,#SceneSkipLogEnable==0\then
		\if,Avg_SceneSkipFlag>0\then
			\sub,@@!Avg_SceneSkipStep
			\ret
		\end
	\end
	
	
	\var,int,i
	\cal,Imo_FormatMultiIndex=Imo_FormatMultiCount
	\for,i=0,i<Imo_FormatMultiCount,i++
		\if,Imo_FormatText[i]==""\then
			\cal,Imo_FormatMultiIndex=i
			\brk
		\end
	\end
	
	\var,int,vv,vd,vw
	\scp,Imo_Project	\?v,"VoiceVolumePolyDecay",70	\cal,vd=ResultInt[0]
	\for,i=0,i<Imo_FormatMultiIndex,i++
		\if,Imo_FormatVoice[i]!=""\then
			\cal,vv++
		\end
	\end
	\cal,Imo_FormatVolWeight=100
	\if,vv>1\then
		\cal,vw=100*100
		\cal,vw=vw*100/vd
		\cal,vw=vw + vd/2				
		\for,i=0,i<vv,i++
			
			\cal,vw=vw*vd/100
		\end
		\cal,Imo_FormatVolWeight=vw/100
	\end
	
	
	
	\if,Avg_SceneSkipFlag>0\then
		\sub,@@!Avg_SceneSkipStep
		\sub,@@!Imo_Format_Refresh
		\sub,@@!Imo_Format_Refresh_After
	\else
		
		\sub,@@!Avg_LogJumpGetFilename
		\cal,Imo_FormatLogExtString=ResultStr[0]
		\sub,@@!Imo_EventSentenceRefresh
	\end
	
	
	\var,int,i
	\for,i=0,i<Imo_FormatMultiCount,i++
		\cal,Imo_FormatText[i]=""
		\cal,Imo_FormatName[i]=""
		\cal,Imo_FormatVoice[i]=""
	\end
	\cal,Imo_FormatVolume=100
	\cal,Imo_FormatPan=50
	\cal,Imo_FormatFilter=""
	\cal,Imo_FormatLog=""
	
	\cal,Imo_FormatMultiStep=0
	\cal,Imo_SentenceFlag=0
	\cal,Imo_FormatVoiceExists=0
\ret


@@!Imo_FormatModeSingle
	\var,list,sl
	\var,int,n,idx
	
	
	\scp,Imo_RepTextTable	\brep,ParamStr[0]

	\scp,sl
		\ad,",",ResultStr[0],0,0
		\?c
	\cal,n=ResultInt[0]
	\cal,idx=Imo_FormatMultiStep
	
	\if,n==1\then
		
		\if,Imo_FormatText[idx]!=""\then
			\cal,Imo_FormatText[idx]=Imo_FormatText[idx]+Imo_FormatReturn
		\end
		\scp,sl	\?s,0
		\sub,@@!Imo_FormatSpaceCut,,ResultStr[0]
		\cal,Imo_FormatText[idx]=Imo_FormatText[idx]+ResultStr[0]
		\ret
	\end
	\if,n==2\then
		\if,Imo_FormatText[idx]!=""\then
			\cal,Imo_FormatMultiStep++,idx=Imo_FormatMultiStep
		\end
		\scp,sl	\?s,0
		\cal,Imo_FormatName[idx]=ResultStr[0]
		\scp,sl	\?s,1
		\cal,Imo_FormatText[idx]=Imo_FormatText[idx]+ResultStr[0]
		\ret
	\end
	\if,n==3\then
		\if,Imo_FormatText[idx]!=""\then
			\cal,Imo_FormatMultiStep++,idx=Imo_FormatMultiStep
		\end
		\scp,sl	\?s,0
		
		\sub,@@!Imo_Format_File,,ResultStr[0]
		\cal,Imo_FormatVoice[idx]=ResultStr[0]
		\if,ResultStr[0]!=""\then
			\cal,Imo_FormatVoiceExists=1
		\end
		\scp,sl	\?s,1
		\cal,Imo_FormatName[idx]=ResultStr[0]
		\scp,sl	\?s,2
		\cal,Imo_FormatText[idx]=Imo_FormatText[idx]+ResultStr[0]
		\ret
	\end
\ret

@@!Imo_FormatModeMulti
	\var,str,s
	
	
	\trim,ParamStr[0]
	\scp,Imo_RepTextTable	\brep,ResultStr[0]
	\cal,s=ResultStr[0]

	\var,int,idx
	\cal,idx=Imo_FormatMultiStep
	
	\cpy,s,1,1
	\if,ResultStr[0]=="【"\then
		\if,Imo_FormatText[idx]!=""\then
			\cal,Imo_FormatMultiStep++,idx=Imo_FormatMultiStep
		\end
		
		\scp,Imo_Project	\?v,"FormatNameCode"
		\sub,@@!Imo_FormatDeleteCode,,s,ResultStr[0]
		\cal,Imo_FormatName[idx]=ResultStr[0]
		\ret
	\end
	
	\cpy,s,1,1
	\if,ResultStr[0]=="％"\then
		\if,Imo_FormatText[idx]!=""\then
			\cal,Imo_FormatMultiStep++,idx=Imo_FormatMultiStep
		\end
		
		\scp,Imo_Project	\?v,"FormatVoiceCode"
		\sub,@@!Imo_FormatDeleteCode,,s,ResultStr[0]
		
		\sub,@@!Imo_Format_File,,ResultStr[0]
		\cal,Imo_FormatVoice[idx]=ResultStr[0]
		\if,ResultStr[0]!=""\then
			\cal,Imo_FormatVoiceExists=1
		\end
		\ret
	\end
	
	\scp,Imo_Project	\?v,"FormatCharaCode"
	\if,ResultStr[0]!=""\then
		\var,table,pt
		\var,str,ps
		\var,int,pp
		\div,";",ResultStr[0]
		\scp,pt	\v,ResultStr[0],1	\v,ResultStr[1],1	\v,ResultStr[2],1	\v,ResultStr[3],1
		\scp,pt	\bpos,s	\cal,ps=ResultStr[0]	
		\if,ps!=""\then
			\if,Imo_FormatText[idx]!=""\then
				\cal,Imo_FormatMultiStep++,idx=Imo_FormatMultiStep
			\end
			\pos,ps,s	\cal,pp=ResultInt[0]
			\copy,s,1,pp-1	\cal,Imo_FormatName[idx]=ResultStr[0]
			\copy,s,pp,1024	\cal,Imo_FormatText[idx]=ResultStr[0]
			\ret
		\end
	\end
	
	
	\if,Imo_FormatText[idx]!=""\then
		\cal,Imo_FormatText[idx]=Imo_FormatText[idx]+Imo_FormatReturn
	\end
	\sub,@@!Imo_FormatSpaceCut,,s
	\cal,Imo_FormatText[idx]=Imo_FormatText[idx]+ResultStr[0]
\ret

@@!Imo_FormatDeleteCode
	\var,str,d[4]
	\div,";",ParamStr[1]
	\cal,d[0]=ResultStr[0]
	\cal,d[1]=ResultStr[1]

	\rep,ParamStr[0],d[0]
	\rep,ResultStr[0],d[1]
\ret

@@!Imo_FormatSpaceCut
	\scp,Imo_Setting	\?v,"GyoutouSpaceCut"
	\if,ResultInt[0]==0\then
		\cal,ResultStr[0]=ParamStr[0]
		\ret
	\end

	\cpy,ParamStr[0],1,1
	\if,ResultStr[0]=="　"\then
		\cpy,ParamStr[0],2,255
	\end
\ret


@@!Imo_FormatGetDispName
	\var,int,i,n,kidoku
	\var,str,s1,s2
	
	\cal,kidoku=ParamInt[0]
	\cal,n=Imo_FormatMultiIndex
	\cal,s1=""
	\for,i=0,i<n,i++
		\sub,@@!Misc_NameDivide,,Imo_FormatName[i],kidoku
		\cal,s2=ResultStr[1]	
		\if,s1!=s2\then											
			\if,s1!=""\then										
				\cal,s1=s1+#NameConnectCode
			\end
			\cal,s1=s1+s2
		\end
	\end
	\cal,ResultStr[0]=s1
\ret


@@!Imo_FormatOverrideBackLog
	
	\if,Imo_LogText[0]==""\then
		\ret
	\end
	
	\if,Imo_LogFilter[0]!=""
		\scp,log	\s,0,Imo_LogName[0],Imo_LogText[0],Imo_LogVoice[0]+"＠"+Imo_LogFilter[0],Imo_FormatLogExtString
	\else
		\scp,log	\s,0,Imo_LogName[0],Imo_LogText[0],Imo_LogVoice[0],Imo_FormatLogExtString
	\end
\ret

@@!Imo_FormatAddBackLog
	\if,Imo_LogText[0]==""\then
		\ret
	\end
	
	\var,int,i
	\for,i=0,i<Imo_FormatMultiIndex,i++
		\if,Imo_LogText[i]!=""\then
			\if,Imo_LogFilter[i]!=""
				\scp,log	\a,Imo_LogName[i],Imo_LogText[i],Imo_LogVoice[i]+"＠"+Imo_LogFilter[i],Imo_FormatLogExtString
			\else
				\scp,log	\a,Imo_LogName[i],Imo_LogText[i],Imo_LogVoice[i],Imo_FormatLogExtString
			\end
		\end
	\end
\ret



@@!Imo_Format_VoiceLoad
	\var,int,i
	\cal,Imo_FormatLoadFlag=0
	
	
	\scp,misc	\prm
	\if,ResultStr[0]!="--vc"\then
		
		\vexs,#ModeVoiceLoadCheck
		\if,ResultInt[0]==0\then
			\scp,sys	\?skp
			\if,ResultInt[0]==1 && Imo_SentenceClickLock==0\then
				\for,i=0,i<Imo_FormatMultiCount,i++
					\scp,snd[#VoicePlaySoundChannel+i]	\s
				\end
				\ret
			\end
		\end
	\end
	
	\if,Imo_FormatLog=="continue"\then
		\ret
	\end
	
	
	\if,Imo_FormatVoiceExists>0\then
		
		\var,int,n1,n2
		\cal,n1=#VoicePlaySoundChannel+0
		\cal,n2=#VoicePlaySoundChannel+Imo_FormatMultiCount
		\swap,snd[n1],snd[n2]
		\scp,snd[n2]	\v,0,50
		
		\for,i=0,i<Imo_FormatMultiCount,i++
			\scp,snd[#VoicePlaySoundChannel+i]	\s
		\end
		
		\for,i=0,i<Imo_FormatMultiIndex,i++
			\sub,@@!Imo_Format_VoiceLoadSub,,i
		\end
	\end
\ret

@@!Imo_Format_VoiceLoadSub
	\var,int,idx
	\cal,idx=ParamInt[0]
	
	\if,Imo_FormatVoice[idx]==""\then
		\scp,snd[#VoicePlaySoundChannel+idx]	\i
		\ret
	\end
	
	
	\var,int,v1,v2
	\sub,@@!Misc_GetCharaVoiceVolume,,Imo_FormatName[idx],Imo_FormatVoice[idx]
	\if,ResultInt[1]==1\then	
		\cal,v1=0	
	\else
		\cal,v1=ResultInt[0]
	\end
	\cal,v2=Imo_FormatVolume*Imo_FormatVolWeight/100	
	\cal,v2=v2*256/100
	\cal,v1=v1*v2/256
	
	\var,int,p1
	\cal,p1=(Imo_FormatPan-50)*256/50
	
	\var,str,flt
	\cal,flt=Imo_FormatFilter
	
	\scp,snd[#VoicePlaySoundChannel+idx]
		\l,Imo_FormatVoice[idx]		
		\vtn,1
		\v,v1,0
		\pan,p1,0
		\fo,flt
	
	\cal,Imo_FormatLoadFlag=1
\ret

@@!Imo_Format_VoicePlay
	\if,Imo_FormatLoadFlag==0\then
		\ret
	\end
	
	\var,int,i
	\if,Imo_FormatVoiceExists>0\then
		\for,i=0,i<Imo_FormatMultiIndex,i++
			\scp,snd[#VoicePlaySoundChannel+i]	\p,0
		\end
	\end
\ret

@@!Imo_Format_VoiceStop
	\var,int,i
	\for,i=0,i<Imo_FormatMultiCount,i++
		\scp,snd[#VoicePlaySoundChannel+i]	\v,0,250
	\end
\ret

