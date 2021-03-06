




@@@!ImoScripter_Base.s


@@!Imo_Sound_Create
	
	\gvar,table,Imo_SoundParam[Imo_SoundCount]
	\gvar,table,Imo_SoundAbsParam[Imo_SoundCount]
	\gvar,table,Imo_SoundDefault
	\gvar,obj,Imo_Sound[Imo_SoundCount]
	\gvar,int,Imo_SoundBGVMuteFlag		
	
	\gvar,table,Imo_SoundTemplate
	\scp,Imo_SoundTemplate	\l,"ImoScripter_Template_Sound.txt"	\sort
	
	\gvar,table,Imo_SoundJump
	\scp,Imo_SoundJump
		\v,"file"	,"@@!Imo_Sound_00File,@@!Imo_Sound_20Volume,@@!Imo_Sound_10Basic"
		\v,"vol"	,"@@!Imo_Sound_20Volume"
		\v,"pan"	,"@@!Imo_Sound_20Volume"
		\v,"time"	,""
		\v,"oncetime",""
		\v,"delay"	,""
		\v,"loop"	,"@@!Imo_Sound_20Volume"
		\v,"seek"	,"@@!Imo_Sound_05Seek"
		\v,"sndfilter","@@!Imo_Sound_10Basic"
		\v,"voltype","@@!Imo_Sound_10Basic"
	
	\sub,@@!Imo_Sound_DefaultParam
	\var,int,i
	\for,i=0,i<Imo_SoundCount,i++
		
		\sub,@@!Imo_GetEmptyStreamChannel
		\cal,Imo_Sound[i]=snd[ResultInt[0]]
		
		\scp,Imo_SoundParam[i]		\asn,Imo_SoundDefault
		
		\scp,Imo_SoundNames			\?n,i
		\scp,Imo_SoundAbsParam[i]
			\v,"*objectname",ResultStr[0]
			\v,"*objectindex",i
	\end
	
	\sub,@@!Imo_Sound_Refresh
\ret


@@!Imo_Sound_Free
	\var,int,i
	\for,i=0,i<Imo_SoundCount,i++
		\scp,Imo_Sound[i]	\i
	\end
	
	\del,Imo_SoundParam
	\del,Imo_SoundAbsParam
	\del,Imo_SoundDefault
	\del,Imo_SoundTemplate
	\del,Imo_SoundJump
	\del,Imo_Sound
	\del,Imo_SoundBGVMuteFlag
\ret


@@!Imo_Sound_DefaultParam
	\scp,Imo_SoundDefault
		\i
		\v,"id","none"
		\v,"mode","normal"
		\v,"file","none"
		\v,"vol","100"
		\v,"pan","50"
		\v,"time","0"
		\v,"oncetime","0"
		\v,"delay","0"
		\v,"loop","false"
		\v,"seek","0"
		\v,"voltype","se"
		\v,"trans","none"
		\v,"sndfilter","none"
	\sub,@@!Imo_LoadDefaultFile,,Imo_SoundDefault,"Default_Sound.txt"
\ret


@@!Imo_Sound_File
	\scp,Imo_Setting	\?v,"PathSound"
	\sub,@@!Imo_FileSerch,,1,ParamStr[0],ResultStr[0],".ogg"
\ret


@@!Imo_Sound_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\var,int,n,i
	\var,obj,p,a
	\var,str,op,s1
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_SoundTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	\scp,sl	\?s,0	\stid,ResultStr[0],0
	\cal,p=Imo_SoundParam[ResultInt[0]],a=Imo_SoundAbsParam[ResultInt[0]],
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1]
		\scp,p	\v,op,s1
		
		\if,op=="clear"\then
			\scp,p	\comb,Imo_SoundDefault
		\end
	\end
	
	
	\sub,@@!Imo_EventHook_Sound,,p,a
	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_Sound_Refresh
	\var,int,i
	\for,i=0,i<Imo_SoundCount,i++
		\scp,Imo_SoundParam[i]	\?c
		\if,ResultInt[0]>0\then
			\sub,@@!Imo_Sound_Refresh_Main,,i
		\end
	\end
\ret

@@!Imo_Sound_ParamClear
	\var,int,i
	\for,i=0,i<Imo_SoundCount,i++
		\scp,Imo_SoundParam[i]	\i
	\end
\ret

@@!Imo_Sound_Refresh_Main
	\var,obj,a,p,o
	\var,int,nn
	\cal,nn=ParamInt[0]
	\cal,a=Imo_SoundAbsParam[nn]
	\cal,p=Imo_SoundParam[nn]
	\cal,o=Imo_Sound[nn]
	
	
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\scp,a
			\v,"vol","100"
			\v,"pan","50"
			\v,"time","0"
			\v,"oncetime","0"
			\v,"delay","0"
			\v,"loop","false"
			\v,"seek","0"
			\v,"sndfilter","none"
	\end
	
	
	\scp,a	\comb,p
	
	
	\var,int,n,i
	\var,table,t
	\scp,p	\?c	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,p	\?n,i							
		\scp,Imo_SoundJump	\?v,ResultStr[0]	
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


@@!Imo_Sound_00File
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]

	
	\scp,sys	\dskp
	\if,ResultInt[0]==1\then
		\scp,o	\i
		\scp,p	\i
		\ret
	\end
	
	\var,str,f
	\scp,a	\?v,"file"
	\sub,@@!Imo_Sound_File,,ResultStr[0]
	\cal,f=ResultStr[0]
	
	
	\scp,p	\?v,"trans"
	\if,ResultStr[0]=="continue"\then
		\scp,o	\?l
		\if,ResultStr[0]==f\then
			\ret
		\end
	\end
	
	
	\if,f==""\then
		\scp,o	\i
	\else
		\scp,o	\i	\l,f
		\sub,@@!Imo_Zero
	\end
\ret

@@!Imo_Sound_20Volume
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	
	\var,int,fl
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\cal,fl=1
	\end
	
	
	\var,int,vv,pp,tt,dd,ll,rr
	\var,str,s1
	\scp,a	\?v,"vol",100	\cal,vv=ResultInt[0]
	\scp,a	\?v,"pan",50	\cal,pp=ResultInt[0]
	\scp,p	\?v,"delay",0	\cal,dd=ResultInt[0]	
	\scp,a	\?v,"loop"		\cal,s1=ResultStr[0]	
	\stid,s1,0	\cal,ll=ResultInt[0]
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
	\scp,a	\?v,"time",1000	\cal,tt=ResultInt[0]
	\scp,p	\?v,"oncetime"
	\if,ResultStr[0]!=""\then
		\cal,tt=ResultInt[0]
	\end
	\cal,vv=vv*256/100
	\cal,pp=pp*256/50-256
	
	\sub,@@!Imo_GetVolumeFromID,,a
	\cal,vv=vv*ResultInt[0]/256
	
	
	\if,fl==1\then
		
		\scp,o	\v,0,0			\pan,pp,0
		\scp,o	\v,vv,tt,dd		\pan,pp,tt,dd
		\if,vv>0\then
			\scp,o	\p2,ll
		\end
	\else
		
		\scp,o	\v,vv,tt,dd	\pan,pp,tt,dd
		\if,vv>0\then
			\scp,o	\p2,ll
		\end
	\end
\ret

@@!Imo_Sound_05Seek
	\var,obj,o,p
	\cal,o=ParamStr[0],p=ParamStr[1]
	
	\var,int,sk
	\scp,p	\?v,"seek",0	\cal,sk=ResultInt[0]
	\scp,o	\sk,sk
\ret

@@!Imo_Sound_10Basic
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	
	\scp,a	\?v,"sndfilter"
	\sub,@@!Imo_SoundFilterOpConvert,,ResultStr[0]
	\scp,o	\fo,ResultStr[0]
	
	
	\scp,a	\?v,"voltype"
	\case,ResultStr[0]
		\of,"bgm"		\scp,o	\vtn,0
		\of,"voice"		\scp,o	\vtn,1
		\of,"se"		\scp,o	\vtn,2
	\else
		\stid,ResultStr[0],0	\scp,o	\vtn,ResultInt[0]
	\end
\ret





@@!Imo_GetVolumeFromID
	\var,obj,a
	\cal,a=ParamStr[0]
	
	\var,str,id,mode
	\scp,a
		\?v,"id"	\cal,id=ResultStr[0]
		\?v,"mode"	\cal,mode=ResultStr[0]
	
	\if,mode=="normal"\then
		\cal,ResultInt[0]=256
		\ret
	\end 
	
	
	\var,int,v
	\if,id=="none"\then
		\cal,v=256
	\else
		
		\scp,cfg	\?cvv,id	\cal,v=ResultInt[0]
		
		\scp,cfg	\?cvm,id
		\if,ResultInt[0]==1\then
			\cal,v=0
		\end
	\end
	\cal,ResultInt[0]=v
\ret

@@!Imo_Sound_BGVMuteinVolume
	
	\if,Imo_FormatVoiceExists==0\then
		\ret
	\end
	
	\var,int,vv,tt
	\scp,Imo_Project	\?v,"BGVMuteVolume",0		\cal,vv=ResultInt[0]*256/100
	\scp,Imo_Project	\?v,"BGVMuteinVolume",250	\cal,tt=ResultInt[0]
	
	\var,int,i,vv2
	\for,i=0,i<Imo_SoundCount,i++
		\scp,Imo_SoundAbsParam[i]	\?v,"mode"
		\if,ResultStr[0]=="bgv"\then
			\scp,Imo_SoundAbsParam[i]	\?v,"vol"
			\cal,vv2=ResultInt[0]
			\if,vv2>0\then
				\cal,vv2=vv2*vv/100
				\sub,@@!Imo_Sound_BGVMuteoutVolume,,Imo_SoundAbsParam[i]
				\cal,vv2=vv2*ResultInt[0]/256
				\scp,Imo_Sound[i]	\v,vv2,tt
				\cal,Imo_SoundBGVMuteFlag=1
			\end
		\end
	\end
\ret

@@!Imo_Sound_BGVMuteoutVolume
	
	\if,Imo_SoundBGVMuteFlag==0\then
		\ret
	\end
	
	\scp,snd[#VoicePlaySoundChannel+0]	\?p
	\if,ResultInt[0]>0\then
		\ret
	\end
	
	\var,int,tt
	\scp,Imo_Project	\?v,"BGVMuteoutVolume",1000
	\cal,tt=ResultInt[0]
	
	\var,int,i,vv2
	\for,i=0,i<Imo_SoundCount,i++
		\scp,Imo_SoundAbsParam[i]	\?v,"mode"
		\if,ResultStr[0]=="bgv"\then
			\scp,Imo_SoundAbsParam[i]	\?v,"vol"
			\cal,vv2=ResultInt[0]*256/100
			\sub,@@!Imo_GetVolumeFromID,,Imo_SoundAbsParam[i]
			\cal,vv2=vv2*ResultInt[0]/256
			\scp,Imo_Sound[i]	\v,vv2,tt	\p2,-2	
		\end
	\end
	\cal,Imo_SoundBGVMuteFlag=0
\ret
