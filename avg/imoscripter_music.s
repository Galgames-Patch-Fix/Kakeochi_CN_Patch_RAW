




@@@!ImoScripter_Base.s


@@!Imo_Music_Create
	
	\gvar,table,Imo_MusicParam[Imo_MusicCount]
	\gvar,table,Imo_MusicAbsParam[Imo_MusicCount]
	\gvar,table,Imo_MusicDefault
	\gvar,obj,Imo_MusicCurrent[Imo_MusicCount]
	\gvar,obj,Imo_MusicPrevious[Imo_MusicCount]
	\gvar,int,Imo_MusicBGVMuteFlag		
	\gvar,int,Imo_MusicVolumeDownVoiceFlag
	
	\gvar,table,Imo_MusicTemplate
	\scp,Imo_MusicTemplate	\l,"ImoScripter_Template_Music.txt"	\sort
	
	\gvar,table,Imo_MusicJump
	\scp,Imo_MusicJump
		\v,"file"	,"@@!Imo_Music_00File,@@!Imo_Music_10Basic,@@!Imo_Music_20Volume"
		\v,"vol"	,"@@!Imo_Music_20Volume"
		\v,"pan"	,"@@!Imo_Music_20Volume"
		\v,"time"	,""
		\v,"oncetime",""
		\v,"delay"	,""
		\v,"loop"	,"@@!Imo_Music_20Volume"
		\v,"seek"	,"@@!Imo_Music_02Seek"
		\v,"voltype","@@!Imo_Music_10Basic"
		\v,"sndfilter","@@!Imo_Music_10Basic"
	
	\sub,@@!Imo_Music_DefaultParam
	\var,int,i
	\for,i=0,i<Imo_MusicCount,i++
		
		\sub,@@!Imo_GetEmptyStreamChannel
		\cal,Imo_MusicCurrent[i]=snd[ResultInt[0]]
		\sub,@@!Imo_GetEmptyStreamChannel
		\cal,Imo_MusicPrevious[i]=snd[ResultInt[0]]
		
		\scp,Imo_MusicParam[i]		\asn,Imo_MusicDefault
		
		\scp,Imo_MusicNames			\?n,i
		\scp,Imo_MusicAbsParam[i]
			\v,"*objectname",ResultStr[0]
			\v,"*objectindex",i
	\end
	
	\sub,@@!Imo_Music_Refresh
\ret


@@!Imo_Music_Free
	\var,int,i
	\for,i=0,i<Imo_MusicCount,i++
		\scp,Imo_MusicCurrent[i]	\i
		\scp,Imo_MusicPrevious[i]	\i
	\end
	
	\del,Imo_MusicParam
	\del,Imo_MusicAbsParam
	\del,Imo_MusicDefault
	\del,Imo_MusicCurrent
	\del,Imo_MusicPrevious
	\del,Imo_MusicTemplate
	\del,Imo_MusicJump
	\del,Imo_MusicBGVMuteFlag
	\del,Imo_MusicVolumeDownVoiceFlag
\ret


@@!Imo_Music_DefaultParam
	\scp,Imo_MusicDefault
		\i
		\v,"mode","normal"
		\v,"file","none"
		\v,"vol","100"
		\v,"pan","50"
		\v,"time","1000"
		\v,"oncetime","0"
		\v,"delay","0"
		\v,"loop","true"
		\v,"seek","0"
		\v,"voltype","bgm"
		\v,"trans","none"
		\v,"sndfilter","none"
	\sub,@@!Imo_LoadDefaultFile,,Imo_MusicDefault,"Default_Music.txt"
\ret


@@!Imo_Music_File
	\scp,Imo_Setting	\?v,"PathMusic"
	\sub,@@!Imo_FileSerch,,1,ParamStr[0],ResultStr[0],".ogg"
\ret


@@!Imo_Music_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\var,int,n,i
	\var,obj,p,a
	\var,str,op,s1
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_MusicTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	\scp,sl	\?s,0	\stid,ResultStr[0],0
	\cal,p=Imo_MusicParam[ResultInt[0]],a=Imo_MusicAbsParam[ResultInt[0]]
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1]
		\scp,p	\v,op,s1
		
		\if,op=="clear"\then
			\scp,p	\comb,Imo_MusicDefault
		\end
	\end
	
	
	\sub,@@!Imo_EventHook_Music,,p,a
	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_Music_Refresh
	\var,int,i
	\for,i=0,i<Imo_MusicCount,i++
		\scp,Imo_MusicParam[i]	\?c
		\if,ResultInt[0]>0\then
			\sub,@@!Imo_Music_Refresh_Main,,i
		\end
	\end
\ret

@@!Imo_Music_ParamClear
	\var,int,i
	\for,i=0,i<Imo_MusicCount,i++
		\scp,Imo_MusicParam[i]	\i
	\end
\ret

@@!Imo_Music_Refresh_Main
	\var,obj,a,p
	\var,int,nn
	\cal,nn=ParamInt[0]
	\cal,a=Imo_MusicAbsParam[nn]
	\cal,p=Imo_MusicParam[nn]
	
	
	\scp,a	\comb,p
	
	
	\var,int,n,i
	\var,table,t
	\scp,p	\?c	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,p	\?n,i							
		\scp,Imo_MusicJump	\?v,ResultStr[0]	
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
		\sub,ResultStr[0],,nn,p,a	
	\end
\ret


@@!Imo_Music_00File
	\var,int,nn
	\var,obj,o1,o2,p,a
	\cal,nn=ParamInt[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,str,f
	\scp,a	\?v,"file"
	\sub,@@!Imo_Music_File,,ResultStr[0]
	\cal,f=ResultStr[0]
	\cal,o1=Imo_MusicCurrent[nn]
	
	\scp,p	\?v,"trans"
	\if,ResultStr[0]=="continue"\then
		\scp,o1	\?l
		\if,ResultStr[0]==f\then
			\ret
		\end
	\end
	
	
	\var,obj,sw		
	\cal,sw=Imo_MusicCurrent[nn]
	\cal,Imo_MusicCurrent[nn]=Imo_MusicPrevious[nn]
	\cal,Imo_MusicPrevious[nn]=sw
	\cal,o1=Imo_MusicCurrent[nn]	
	\cal,o2=Imo_MusicPrevious[nn]	
	
	
	\if,f==""\then
		\scp,o1	\i
	\else
		\scp,o1	\i	\l,f
	\end
	\sub,@@!Imo_Zero
\ret

@@!Imo_Music_20Volume
	\var,int,nn
	\var,obj,o1,o2,p,a
	\cal,nn=ParamInt[0],p=ParamStr[1],a=ParamStr[2]
	\cal,o1=Imo_MusicCurrent[nn]	
	\cal,o2=Imo_MusicPrevious[nn]	
	
	
	\var,int,fl
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\cal,fl=1
	\end
	
	
	\var,int,vv,pp,tt,dd,ll,rr,tt2
	\var,str,s1
	\scp,a	\?v,"time",1000	\cal,tt=ResultInt[0]
	\scp,p	\?v,"oncetime"
	\if,ResultStr[0]!=""\then
		\cal,tt=ResultInt[0]
	\end
	\scp,a	\?v,"vol",100	\cal,vv=ResultInt[0]
	\scp,a	\?v,"pan",50	\cal,pp=ResultInt[0]
	\scp,p	\?v,"delay",0	\cal,dd=ResultInt[0]	
	\scp,a	\?v,"loop"		\cal,s1=ResultStr[0]	
	\stid,s1,1	\cal,ll=ResultInt[0]
	\case,s1
		\of,"true"		\cal,ll=-1
		\of,"infinity"	\cal,ll=-1
		\of,"false"		\cal,ll=0
	\end
	
	\scp,Imo_Project	\?v,"OldLoopCount",1
	\if,ResultInt[0]==1\then
		\if,ll>0\then
			\cal,ll=ll-1	
		\end
	\end
	\cal,vv=vv*256/100
	\cal,pp=pp*256/50-256
	
	
	\cal,tt2=tt
	\if,fl==1\then
		\scp,p	\?v,"time"
		\if,ResultStr[0]==""\then
			
			\scp,o2	\?p
			\if,ResultInt[0]<1\then
				\cal,tt2=0
			\end
			
			\scp,o2	\?v
			\if,ResultInt[0]==0\then
				\cal,tt2=0
			\end
		\end
	\end

	
	\if,fl==1\then
		\scp,o1	\v,0,0		\pan,pp,0
		\scp,o2	\v,0,tt,dd		\pan,pp,tt,dd
		\scp,o1	\v,vv,tt2,dd	\pan,pp,tt2,dd
		\scp,o1	\p2,ll
	\else
		\scp,o1	\v,vv,tt,dd	\pan,pp,tt,dd	\p2,ll
	\end
\ret

@@!Imo_Music_02Seek
	\var,int,nn
	\var,obj,o1,p
	\cal,nn=ParamInt[0],p=ParamStr[1]
	\cal,o1=Imo_MusicCurrent[nn]	
	
	\var,int,sk
	\scp,p	\?v,"seek"	\stid,ResultStr[0],100	\cal,sk=ResultInt[0]
	
	\scp,o1	\sk,sk
\ret

@@!Imo_Music_10Basic
	\var,int,nn
	\var,obj,o1,o2,p,a
	\cal,nn=ParamInt[0],p=ParamStr[1],a=ParamStr[2]
	\cal,o1=Imo_MusicCurrent[nn]	
	\cal,o2=Imo_MusicPrevious[nn]	
	
	
	\scp,a	\?v,"sndfilter"
	\sub,@@!Imo_SoundFilterOpConvert,,ResultStr[0]
	\scp,o1	\fo,ResultStr[0]
	
	
	\scp,a	\?v,"voltype"
	\case,ResultStr[0]
		\of,"bgm"		\scp,o1	\vtn,0	\scp,o2	\vtn,0
		\of,"voice"		\scp,o1	\vtn,1	\scp,o2	\vtn,1
		\of,"se"		\scp,o1	\vtn,2	\scp,o2	\vtn,2
	\else
		\stid,ResultStr[0],0
		\scp,o	\vtn,ResultInt[0]
		\scp,o2	\vtn,ResultInt[0]
	\end
\ret



@@!Imo_Music_BGVMuteinVolume
	
	\if,Imo_FormatVoiceExists==0\then
		\ret
	\end
	
	\var,int,vv,tt
	\scp,Imo_Project	\?v,"BGVMuteVolume",0		\cal,vv=ResultInt[0]*256/100
	\scp,Imo_Project	\?v,"BGVMuteinVolume",250	\cal,tt=ResultInt[0]
	
	\var,int,i
	\for,i=0,i<Imo_MusicCount,i++
		\scp,Imo_MusicAbsParam[i]	\?v,"mode"
		\if,ResultStr[0]=="bgv"\then
			\scp,Imo_MusicAbsParam[i]	\?v,"vol"
			\if,ResultInt[0]>0\then
				\scp,Imo_MusicCurrent[i]	\v,vv,tt
				\cal,Imo_MusicBGVMuteFlag=1
			\end
		\end
	\end
\ret

@@!Imo_Music_BGVMuteoutVolume
	
	\if,Imo_MusicBGVMuteFlag==0\then
		\ret
	\end
	
	\scp,snd[#VoicePlaySoundChannel+0]	\?p
	\if,ResultInt[0]>0\then
		\ret
	\end
	
	\var,int,vv,tt
	\scp,Imo_Project	\?v,"BGVMuteoutVolume",1000
	\cal,tt=ResultInt[0]
	
	\var,int,i
	\for,i=0,i<Imo_MusicCount,i++
		\scp,Imo_MusicAbsParam[i]	\?v,"mode"
		\if,ResultStr[0]=="bgv"\then
			\scp,Imo_MusicAbsParam[i]	\?v,"vol"
			\cal,vv=ResultInt[0]*256/100
			
			\if,vv>0\then
				\scp,Imo_MusicCurrent[i]	\v,vv,tt	\p2,-2	
			\end
		\end
	\end
	\cal,Imo_MusicBGVMuteFlag=0
\ret



@@!Imo_Music_VolumeDownVoiceFadein
	
	\if,#MusicVoicePlayVolumeDown==100\then
		\ret
	\end
	
	\if,Imo_FormatVoiceExists==0\then
		\ret
	\end

	\var,int,vv,tt
	\scp,Imo_Setting	\?v,"VoicePlayVolumeDownFadeinTime",250		\cal,tt=ResultInt[0]
	
	\var,int,i
	\for,i=0,i<Imo_MusicCount,i++
		\scp,Imo_MusicAbsParam[i]	\?v,"mode"
		\if,ResultStr[0]=="normal"\then
			\scp,Imo_MusicAbsParam[i]	\?v,"vol"
			\cal,vv=ResultInt[0]*256/100
			\cal,vv=vv*#MusicVoicePlayVolumeDown/100
			\if,ResultInt[0]>0\then
				\scp,Imo_MusicCurrent[i]	\v,vv,tt
				\cal,Imo_MusicVolumeDownVoiceFlag=1
			\end
		\end
	\end
\ret

@@!Imo_Music_VolumeDownVoiceFadeout
	\if,Imo_MusicVolumeDownVoiceFlag==0\then
		\ret
	\end
	
	\scp,snd[#VoicePlaySoundChannel+0]	\?p
	\if,ResultInt[0]>0\then
		\ret
	\end
	
	\var,int,vv,tt
	\scp,Imo_Setting	\?v,"VoicePlayVolumeDownFadeoutTime",1000
	\cal,tt=ResultInt[0]
	
	\var,int,i
	\for,i=0,i<Imo_MusicCount,i++
		\scp,Imo_MusicAbsParam[i]	\?v,"mode"
		\if,ResultStr[0]=="normal"\then
			\scp,Imo_MusicAbsParam[i]	\?v,"vol"
			\cal,vv=ResultInt[0]*256/100
			\if,vv>0\then
				\scp,Imo_MusicCurrent[i]	\v,vv,tt	\p2,-2	
			\end
		\end
	\end
	\cal,Imo_MusicVolumeDownVoiceFlag=0
\ret

