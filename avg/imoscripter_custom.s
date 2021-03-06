




@@@!misc\misc.s

@@@!Window\Layout_Window.s
@@@!Window\Layout_Window_Memory.s





@@!Imo_Custom_Create
	\scp,sys	\lkc,0
	
	\gvar,table,Imo_MiscTable
	
	\gvar,table,Imo_ExtEventParam
	
	\gvar,table,Imo_FadeEventList
	\scp,Imo_FadeEventList	\l,"ImoScripter_FadeEventList.txt"
	\gvar,table,Imo_FadeEvent
	
	\gvar,int,Imo_MesWaitCount
	\gvar,int,Imo_AutoPlayTime
	
	\gvar,int,Imo_AutoPlayReadSkip
	
	\gvar,obj,_retobj,_rettbl
	
	\scp,rep
		\a,"^log","\subp,@@!Imo_Log_Add,"
		\a,"^dis","\subp,@@!Imo_Log_Disable,"
		\a,"^getobj","\sub,@@!Imo_GetObject,"
		\a,"^layout","\sub,@@!Imo_InterfaceLayoutChange,"
	
	\gvar,str,Imo_InterfaceName
	\gvar,int,Imo_InterfaceShow
	\sub,@@!Imo_Interface_Load,,Imo_InterfaceName
	\scp,sys	\lkc,$FFFF
\ret


@@!Imo_Custom_Free
	\scp,rep
		\d,"^log"
		\d,"^dis"
		\d,"^getobj"
		\d,"^layout"
	\sub,@@!Imo_Interface_UnLoad,,Imo_InterfaceName
	\del,Imo_InterfaceName,Imo_InterfaceShow
	\del,Imo_MiscTable
	\del,Imo_ExtEventParam
	\del,Imo_FadeEventList,Imo_FadeEvent
	\del,Imo_MesWaitCount,Imo_AutoPlayTime
	\del,Imo_AutoPlayReadSkip
	\del,_retobj,_rettbl
	\scp,sys	\lkc,$FFFF
\ret






@@!Imo_Log_Add
	
	\if,#SceneSkipLogEnable==0\then
		\if,Avg_SceneSkipFlag>0\then
			\ret
		\end
	\end
	
	
	\scp,Imo_RepTextTable	\brep,ParamStr[0]	
	
	\div,",",ResultStr[0]
	\scp,log
		\a,ResultStr[1],ResultStr[2],ResultStr[0]
\ret


@@!Imo_Log_Disable
	\cal,Imo_FormatLog="disable"
\ret






@@!Imo_SerchObject
	\var,str,n
	\cal,n=ParamStr[0]
	\cal,ResultObj[0]=nil,ResultObj[1]=nil
	
	\scp,Imo_ImageNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultObj[0]=Imo_Image[ResultInt[0]]
		\cal,ResultObj[1]=Imo_ImageAbsParam[ResultInt[0]]
		\cal,ResultObj[2]=Imo_ImageParam[ResultInt[0]]
		\ret
	\end
	
	\scp,Imo_CharaNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultObj[0]=Imo_Chara[ResultInt[0]]
		\cal,ResultObj[1]=Imo_CharaAbsParam[ResultInt[0]]
		\cal,ResultObj[2]=Imo_CharaParam[ResultInt[0]]
		\ret
	\end
	
	\scp,Imo_Chara8eNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultObj[0]=Imo_Chara8e[ResultInt[0]]
		\cal,ResultObj[1]=Imo_CharaAbsParam8e[ResultInt[0]]
		\cal,ResultObj[2]=Imo_CharaParam8e[ResultInt[0]]
		\ret
	\end
	
	\scp,Imo_SoundNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultObj[0]=Imo_Sound[ResultInt[0]]
		\cal,ResultObj[1]=Imo_SoundAbsParam[ResultInt[0]]
		\cal,ResultObj[2]=Imo_SoundParam[ResultInt[0]]
		\ret
	\end
	
	\scp,Imo_MusicNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultObj[0]=Imo_MusicCurrent[ResultInt[0]]
		\cal,ResultObj[1]=Imo_MusicAbsParam[ResultInt[0]]
		\cal,ResultObj[2]=Imo_MusicParam[ResultInt[0]]
		\ret
	\end
	
	\scp,Imo_MessageNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultObj[0]=Imo_Message[ResultInt[0]]
		\cal,ResultObj[1]=Imo_MessageAbsParam[ResultInt[0]]
		\cal,ResultObj[2]=Imo_MessageParam[ResultInt[0]]
		\ret
	\end
	
	\scp,Imo_FaceNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultObj[0]=Imo_Face[ResultInt[0]]
		\cal,ResultObj[1]=Imo_FaceAbsParam[ResultInt[0]]
		\cal,ResultObj[2]=Imo_FaceParam[ResultInt[0]]
		\ret
	\end
	
	\scp,Imo_NameTextNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultObj[0]=Imo_NameText[ResultInt[0]]
		\cal,ResultObj[1]=Imo_NameTextAbsParam[ResultInt[0]]
		\cal,ResultObj[2]=Imo_NameTextParam[ResultInt[0]]
		\ret
	\end
	
	\scp,Imo_CameraNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultObj[0]=camex
		\cal,ResultObj[1]=Imo_CameraAbsParam[0]
		\cal,ResultObj[2]=Imo_CameraParam[0]
		\ret
	\end
	
	\scp,Imo_InfoNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultObj[0]=Imo_Info[ResultInt[0]]
		\cal,ResultObj[1]=Imo_InfoAbsParam[ResultInt[0]]
		\cal,ResultObj[2]=Imo_InfoParam[ResultInt[0]]
		\ret
	\end
	
	\scp,Imo_SpineNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultObj[0]=Imo_Spine[ResultInt[0]]
		\cal,ResultObj[1]=Imo_SpineAbsParam[ResultInt[0]]
		\cal,ResultObj[2]=Imo_SpineParam[ResultInt[0]]
		\ret
	\end
	
	\cal,ResultObj[0]=null
	\cal,ResultObj[1]=null
	\cal,ResultObj[2]=null
\ret


@@!Imo_GetObject
	\sub,@@!Imo_SerchObject,,ParamStr[0]
	\cal,_retobj=ResultObj[0]
	\cal,_rettbl=ResultObj[1]
\ret


@@!Imo_AllInit
	\var,int,i
	
	\sub,@@!Imo_Format_Excute,,"0,clear:def"
	\sub,@@!Imo_Format_Refresh
	
	\sub,@@!Imo_Sentence_Excute,,"0,clear:def"
	\sub,@@!Imo_Sentence_Refresh
	
	\for,i=0,i<Imo_ImageCount,i++
		\fmt,"%d,clear:def",i
		\sub,@@!Imo_Image_Excute,,ResultStr[0]
	\end
	\if,Imo_ImageCount>0\then	\sub,@@!Imo_Image_Refresh	\end
	
	\for,i=0,i<Imo_CharaCount,i++
		\fmt,"%d,clear:def",i
		\sub,@@!Imo_Chara_Excute,,ResultStr[0]
	\end
	\if,Imo_CharaCount>0\then	\sub,@@!Imo_Chara_Refresh	\end
	
	\for,i=0,i<Imo_Chara8eCount,i++
		\fmt,"%d,clear:def",i
		\sub,@@!Imo_Chara8e_Excute,,ResultStr[0]
	\end
	\if,Imo_Chara8eCount>0\then	\sub,@@!Imo_Chara8e_Refresh	\end
	
	\for,i=0,i<Imo_SoundCount,i++
		\fmt,"%d,clear:def",i
		\sub,@@!Imo_Sound_Excute,,ResultStr[0]
	\end
	\if,Imo_SoundCount>0\then	\sub,@@!Imo_Sound_Refresh	\end
	
	\for,i=0,i<Imo_MusicCount,i++
		\fmt,"%d,clear:def",i
		\sub,@@!Imo_Music_Excute,,ResultStr[0]
	\end
	\if,Imo_MusicCount>0\then	\sub,@@!Imo_Music_Refresh	\end
	
	\for,i=0,i<Imo_MessageCount,i++
		\fmt,"%d,clear:def",i
		\sub,@@!Imo_Message_Excute,,ResultStr[0]
	\end
	\if,Imo_MessageCount>0\then	\sub,@@!Imo_Message_Refresh	\end
	
	\for,i=0,i<Imo_FaceCount,i++
		\fmt,"%d,clear:def",i
		\sub,@@!Imo_Face_Excute,,ResultStr[0]
	\end
	\if,Imo_FaceCount>0\then	\sub,@@!Imo_Face_Refresh	\end
	
	\for,i=0,i<Imo_NameTextCount,i++
		\fmt,"%d,clear:def",i
		\sub,@@!Imo_NameText_Excute,,ResultStr[0]
	\end
	\if,Imo_NameTextCount>0\then	\sub,@@!Imo_NameText_Refresh	\end
	
	\if,Imo_CameraCount>0\then
		\sub,@@!Imo_Camera_Excute,,"0,clear:def"
		\sub,@@!Imo_Camera_Refresh
	\end
	
	\if,Imo_InfoCount>0\then
		\sub,@@!Imo_Info_Excute,,"0,clear:def"
		\sub,@@!Imo_Info_Refresh
	\end
	
	\if,Imo_CharaActiveCount>0\then
		\sub,@@!Imo_CharaActive_Excute,,"0,clear:def"
		\sub,@@!Imo_CharaActive_Refresh
	\end
	\if,Imo_SpineCount>0\then
		\sub,@@!Imo_Spine_Excute,,"0,clear:def"
		\sub,@@!Imo_Spine_Refresh
	\end
	
\ret



@@!Imo_InterfaceLayoutChange
	
	
	
	
	
	\var,int,a
	\cal,a=Imo_InterfaceShow
	
	\sub,@@!Imo_Interface_UnLoad,,Imo_InterfaceName
	
	\cal,Imo_InterfaceName=ParamStr[0]
	\sub,@@!Imo_Interface_Load,,Imo_InterfaceName
	
	\if,a==1\then
		\sub,@@!Imo_Layout_WindowShow
	\end
\ret





@@!Imo_EventSentenceRefresh
	\scp,sys	\ap,0
	
	\sub,@@!Imo_IndexList_Refresh
	
	\sub,@@!Imo_Format_Refresh
	\if,Imo_FormatLog!="continue"\then
		\if,#ClickVoiceStop==1\then
			\sub,@@!Imo_Format_VoiceStop
		\end
	\end
	\sub,@@!Imo_Format_VoiceLoad
	
	\sub,@@!cfmodule_addlog
	
	\sub,@@!Imo_ApplyFadeEvent
	
	\sub,@@!Imo_Camera_Refresh
	\sub,@@!Imo_NameText_Refresh
	\sub,@@!Imo_Message_Refresh
	\sub,@@!Imo_Image_Refresh
	\sub,@@!Imo_Chara_Refresh
	\sub,@@!Imo_Chara8e_Refresh
	\sub,@@!Imo_Face_Refresh
	\sub,@@!Imo_Music_Refresh
	\sub,@@!Imo_Sound_Refresh
	\sub,@@!Imo_Info_Refresh
	\sub,@@!Imo_CharaActive_Refresh
	\sub,@@!Imo_Spine_Refresh
	
	\sub,@@!Imo_Sound_BGVMuteinVolume
	\sub,@@!Imo_Music_BGVMuteinVolume
	\sub,@@!Imo_Music_VolumeDownVoiceFadein
	\sub,@@!Imo_Format_VoicePlay
	
	\sub,@@!Imo_Camera_ParamClear
	\sub,@@!Imo_NameText_ParamClear
	\sub,@@!Imo_Message_ParamClear
	\sub,@@!Imo_Image_ParamClear
	\sub,@@!Imo_Chara_ParamClear
	\sub,@@!Imo_Chara8e_ParamClear
	\sub,@@!Imo_Face_ParamClear
	\sub,@@!Imo_Music_ParamClear
	\sub,@@!Imo_Sound_ParamClear
	\sub,@@!Imo_Info_ParamClear
	\sub,@@!Imo_Format_ParamClear
	\sub,@@!Imo_CharaActive_ParamClear
	\sub,@@!Imo_Spine_ParamClear
	
	
	\sub,@@!Imo_AutoPlayReadSkipRefresh
	
	\if,Imo_FormatMultiIndex>0\then
		\sub,@@!Avg_LogJumpGameSave
	\end
	
	\sub,@@!Imo_Sentence_Refresh
	
	\sub,@@!Imo_ApplyInterface
	\sub,@@!Imo_ApplySceneSkipButton,,0
	
	\cal,Avg_InterruptLock=0			
	\sub,@@!Imo_ClickTimeWait
	
	\sub,@@!Imo_VoiceTimeWait
	
	\if,Imo_LogText[0]!="" && Imo_SentenceMessageWait==1\then	
		
		\sub,@@!Imo_MesWaitExcute
	\else
		\draw,1
	\end
	\cal,Avg_InterruptLock=1			
	
	\sub,@@!Imo_ApplySceneSkipButton,,1
	
	\sub,@@!Imo_Sound_BGVMuteoutVolume
	\sub,@@!Imo_Music_BGVMuteoutVolume
	\sub,@@!Imo_Music_VolumeDownVoiceFadeout
	
	
	\sub,@@!cfmodule_hidebutton
	
	
	\scp,Imo_ExtEventParam	\i
	\scp,Imo_FadeEvent	\i
	\scp,sys	\ap,0
\ret

@@!Imo_ClickTimeWait
	\if,Imo_SentenceClickLock==0\then
		\scp,sys	\?skp
		\if,(ResultInt[0]==1)|(Imo_AutoPlayReadSkip==1)\then
			\skip,Imo_SentenceSkipTime
			\ret
		\end
	\end
	
	\if,Imo_SentenceClickTime>0\then
		\stop,@@!Imo_ClickWait,Imo_SentenceClickTime,Imo_SentenceSkipTime
		\if,ResultStopInt>0\then
			\sub,@@!Imo_Message_Click
		\end
	\end
\ret

@@!Imo_VoiceTimeWait
	\if,Imo_SentenceVoiceTime<1\then
		\ret
	\end
	\if,Imo_SentenceClickLock==0\then
		\scp,sys	\?skp
		\if,(ResultInt[0]==1)|(Imo_AutoPlayReadSkip==1)\then
			\ret
		\end
	\end
	
	
	\scp,snd[#VoicePlaySoundChannel]	\?p
	\if,ResultInt[0]<1\then
		\stop,@@!Imo_ClickWait,250
		\ret
	\end
	
	\cal,Imo_SentenceVoiceTime
	\scp,snd[#VoicePlaySoundChannel]	\?tt
	\if,Imo_SentenceVoiceTime>ResultInt[0]\then
		\cal,Imo_SentenceVoiceTime=ResultInt[0]
	\end
	
	\stop,@@!Imo_VoiceWait
\ret


@@!Imo_VoiceWait
	\var,int,tt
	\cal,tt=Imo_SentenceVoiceTime
	
	
	\if,Avg_SceneSkipFlag==1\then
		\play	\ret
	\end

	
	\scp,snd[#VoicePlaySoundChannel]	\?p
	\if,ResultInt[0]<1\then
		\play	\ret
	\end
	\scp,snd[#VoicePlaySoundChannel]	\?nt
	\if,ResultInt[0]>tt\then
		\play	\ret
	\end
	
	
	\if,Imo_SentenceClickLock==0\then
		\var,int,a1,a2
		\scp,sys	\?skp	\cal,a1=ResultInt[0]
		\scp,inp	\?sc	\cal,a2=ResultInt[0]
		\if,(a1==1)||(a2==1)\then
			\sub,@@!Imo_VoiceWait_VoiceSeek,,tt
			\sub,@@!Imo_Message_Click
			\play	\ret
		\end
	\end
\ret

@@!Imo_VoiceWait_VoiceSeek
	\var,int,tt,aa
	\cal,tt=ParamInt[0]
	
	\scp,snd[#VoicePlaySoundChannel]	\?nt
	\cal,aa=tt-ResultInt[0]
	\if,aa<200\then	
		\ret
	\end
	\scp,snd[#VoicePlaySoundChannel]	\sk,tt
\ret

@@!Imo_ClickWait
	
	\if,Avg_SceneSkipFlag==1\then
		\play	\ret
	\end
	
	\if,Imo_SentenceClickLock==0\then
		\scp,inp	\?sc
		\if,ResultInt[0]==1\then
			\play	\ret
		\end
		
		\scp,sys	\?skp
		\if,(ResultInt[0]==1)|(Imo_AutoPlayReadSkip==1)\then
			\play	\ret
		\end
	\end
\ret


@@!Imo_NoClickWait
	
	\if,Avg_SceneSkipFlag==1\then
		\play	\ret
	\end
\ret



@@!Imo_MesWaitExcute
	
	\sub,@@!Imo_MesWaitKidokuCheck
	
	
	\var,int,p
	\scp,sys	\?skp	\cal,p=ResultInt[0]
	\if,Imo_SentenceClickLock==1\then
		\cal,p=0
	\end
	\if,Imo_AutoPlayReadSkip==1\then
		\cal,p=1
	\end
	
	\if,p==1\then
		
		\sub,@@!Imo_Message_Click
		\draw,1
	\else
		
		\stop,@@!Imo_MesWaitTextOnStop
		
		
		\sub,@@!Imo_MesWaitGetAutoPlay
		\cal,Imo_AutoPlayTime=ResultInt[0]
		
		\sub,@@!Imo_ApplyCursorPosition		
		\sub,@@!Imo_MesWaitCursorMotion
		\stop,@@!Imo_MesWaitAutoOnStop
	\end

	
	\scp,CursorImage	\m,"none"
\ret

@@!Imo_MesWaitKidokuCheck
	\scp,sys	\?p
	\if,ResultInt[0]==3\then
		\if,#SkipMode==1\then
			\scp,llog	\?k2
			\if,ResultInt[0]!=1\then
				\scp,sys	\p,0
			\end
		\end
	\end
\ret

@@!Imo_MesWaitGetAutoPlay
	
	\var,int,a
	\scp,cfg	\?mcw
	\cal,a=ResultInt[0]
	
	
	\scp,sys	\?ap
	\cal,a=ResultInt[0]+a
	
	\cal,a=a-Imo_SentenceClickTime
	\if,a<0\then
		\cal,a=0
	\end
	\cal,ResultInt[0]=a
\ret

@@!Imo_MesWaitCursorMotion
	\var,str,s
	
	\cal,s="none"
	\scp,sys	\?p
	\case,ResultInt[0]
		\of,0	\cal,s="click"
		\of,2	\cal,s="auto"
		\of,3	\cal,s="skip"
		\of,4	\cal,s="skip"
		\of,5	\cal,s="skip"
	\end
	\if,Imo_SentenceClickLock==1\then
		\cal,s="auto"
	\end
	\scp,CursorImage	\?m
	\if,s!=ResultStr[0]\then
		\m,s
	\end
\ret

@@!Imo_MesWaitTextOnStop
	\cal,Imo_MesWaitCount=Imo_MesWaitCount+1 & 3	
	
	\if,Avg_SceneSkipFlag==1\then
		\play	\ret
	\end
	
	\sub,@@!Imo_Message_GetEOT
	\if,ResultInt[0]==1\then
		\play	\ret
	\end
	
	\if,Imo_SentenceClickLock==0\then
		
		\scp,inp	\?sc
		\if,ResultInt[0]==1\then
			\sub,@@!Imo_Message_Click
		\end
		
		\scp,sys	\?p
		\case,ResultInt[0]
			\of,2		
				
				\sub,@@!Imo_AutoPlayReadSkipRefresh
				\if,Imo_AutoPlayReadSkip==1\then
					\play	\ret
				\end
			\of,3,4,5	
				\sub,@@!Imo_Message_Click
		\end
	\end
	
	
	\if,Imo_MesWaitCount==0\then
		\sub,@@!Imo_OnMessageIdleEvent
	\end
\ret


@@!Imo_MesWaitAutoOnStop
	\cal,Imo_MesWaitCount=Imo_MesWaitCount+1 & 3	
	
	\if,Avg_SceneSkipFlag==1\then
		\play	\ret
	\end
	
	\if,Imo_MesWaitCount==0\then		
		\sub,@@!Imo_MesWaitCursorMotion
		\sub,@@!Imo_ApplySkipButton
		\sub,@@!Imo_OnMessageIdleEvent
		\sub,@@!Imo_Sound_BGVMuteoutVolume
		\sub,@@!Imo_Music_BGVMuteoutVolume
		\sub,@@!Imo_Music_VolumeDownVoiceFadeout
	\end
	
	\scp,sys	\?mt
	\cal,Imo_AutoPlayTime=Imo_AutoPlayTime-ResultInt[0]
	
	\if,Imo_SentenceClickLock==0\then
		
		\scp,inp	\?sc
		\if,ResultInt[0]==1\then
			\play	\ret
		\end
		
		\scp,sys	\?p
		\case,ResultInt[0]
			\of,0		
				\ret
			\of,2		
				\if,Imo_MesWaitCount==0\then
					\sub,@@!Imo_MesWaitAutoPlayCheck,,0
					\if,ResultInt[0]==1\then
						\play	\ret
					\end
				\end
				
				\sub,@@!Imo_AutoPlayReadSkipRefresh
				\if,Imo_AutoPlayReadSkip==1\then
					\play	\ret
				\end
			\of,3,4,5	
				\play	\ret
		\end
	\else
		\if,Imo_MesWaitCount==0\then
			\sub,@@!Imo_MesWaitAutoPlayCheck,,1
			\if,ResultInt[0]==1\then
				\play	\ret
			\end
		\end
	\end
\ret




























@@!Imo_MesWaitAutoPlayCheck
	
	\if,Imo_AutoPlayTime>0\then
		\cal,ResultInt[0]=0
		\ret
	\end
	
	\if,ParamInt[0]==0\then
		\if,#AutoPlayVoiceWait==0\then
			\if,Imo_SentenceClickLock==0\then
				\cal,ResultInt[0]=1
				\ret
			\end
		\end
	\end
	
	
	\if,Imo_FormatVoiceExists==0\then
		\cal,ResultInt[0]=1
		\ret
	\end
	\var,int,i,a
	\for,i=0,i<Imo_FormatMultiIndex,i++
		\scp,snd[#VoicePlaySoundChannel+i]	\?p
		\cal,a=a|ResultInt[0]
	\end
	\cal,ResultInt[0]=(a==0)
\ret


@@!Imo_AutoPlayReadSkipRefresh
	\cal,Imo_AutoPlayReadSkip=0
	\if,#AutoPlayReadSkip==0\then
		\ret
	\end
	\scp,sys	\?p
	\if,ResultInt[0]!=2\then
		\ret
	\end
	\scp,llog	\?k2
	\if,ResultInt[0]==1\then
		\cal,Imo_AutoPlayReadSkip=1
	\end
\ret








@@!Imo_EventHook_Image
	\var,obj,p,a
	\var,table,c
	\var,str,nn
	\cal,p=ParamStr[0],a=ParamStr[1]
	\scp,c	\asn,a	\comb,p
	\scp,a	\?v,"*objectname"	\cal,nn=ResultStr[0]
	
	
	\scp,p	\?v,"show"
	\if,ResultStr[0]=="true"\then
		\sub,@@!Imo_FadeEvent,,nn+"_show"
	\end
	\scp,p	\?v,"show"
	\if,ResultStr[0]=="false"\then
		\sub,@@!Imo_FadeEvent,,nn+"_hide"
	\end
	
	\scp,c	\?v,"show"
	\if,ResultStr[0]=="true"\then
		
		\scp,p	\?v,"file"
		\if,ResultStr[0]!=""\then
			\sub,@@!Imo_FadeEvent,,nn+"_file"
		\end
		
		\var,int,i
		\for,i=0,i<4,i++
			\scp,p	\?v,"rep"+i
			\if,ResultStr[0]!=""\then
				\sub,@@!Imo_FadeEvent,,nn+"_file"
				\brk
			\end
		\end
		
		\scp,p	\?v,"motion"
		\if,ResultStr[0]!=""\then
			\sub,@@!Imo_FadeEvent,,nn+"_motion"
		\end
	\end
\ret


@@!Imo_EventHook_Chara
	\var,obj,p,a
	\var,table,c
	\var,str,nn
	\cal,p=ParamStr[0],a=ParamStr[1]
	\scp,c	\asn,a	\comb,p
	\scp,a	\?v,"*objectname"	\cal,nn=ResultStr[0]
	
	\scp,c	\?v,"hide"
	\if,ResultStr[0]=="false"\then
		
		\scp,p	\?v,"show"
		\if,ResultStr[0]=="true"\then
			\sub,@@!Imo_FadeEvent,,nn+"_show"
		\end
		\scp,p	\?v,"show"
		\if,ResultStr[0]=="false"\then
			\sub,@@!Imo_FadeEvent,,nn+"_hide"
		\end
	
		\scp,c	\?v,"show"
		\if,ResultStr[0]=="true"\then
			
			\scp,p	\?v,"name"
			\if,ResultStr[0]!=""\then
				\sub,@@!Imo_FadeEvent,,nn+"_file"
			\end
			
			\scp,p	\?v,"motion"
			\if,ResultStr[0]!=""\then
				\sub,@@!Imo_FadeEvent,,nn+"_motion"
			\end
			
			\scp,p	\?v,"extmotion"
			\if,ResultStr[0]!=""\then
				\scp,Imo_Project	\?v,"OldCharaMotionEvent"
				\if,ResultStr[0]=="0"\then	
					\sub,@@!Imo_FadeEvent,,nn+"_extmotion"
				\else
					\sub,@@!Imo_FadeEvent,,nn+"_motion"
				\end
			\end
		\end
	\end
\ret


@@!Imo_EventHook_Chara8e
	\var,obj,p,a
	\var,table,c
	\var,str,nn
	\cal,p=ParamStr[0],a=ParamStr[1]
	\scp,c	\asn,a	\comb,p
	\scp,a	\?v,"*objectname"	\cal,nn=ResultStr[0]
	
	\scp,a	\?v,"hide"
	\if,ResultStr[0]=="false"\then
		
		\scp,p	\?v,"show"
		\if,ResultStr[0]=="true"\then
			\sub,@@!Imo_FadeEvent,,nn+"_show"
		\end
		\scp,p	\?v,"show"
		\if,ResultStr[0]=="false"\then
			\sub,@@!Imo_FadeEvent,,nn+"_hide"
		\end

		\scp,c	\?v,"show"
		\if,ResultStr[0]=="true"\then
			
			\var,int,i
			\for,i=0,i<8,i++
				\scp,p	\?v,"file"+i
				\if,ResultStr[0]!=""\then
					\sub,@@!Imo_FadeEvent,,nn+"_file"
					\brk
				\end
			\end
			
			\scp,p	\?v,"motion"
			\if,ResultStr[0]!=""\then
				\sub,@@!Imo_FadeEvent,,nn+"_motion"
			\end
			
			\scp,p	\?v,"extmotion"
			\if,ResultStr[0]!=""\then
				\scp,Imo_Project	\?v,"OldCharaMotionEvent"
				\if,ResultStr[0]=="0"\then	
					\sub,@@!Imo_FadeEvent,,nn+"_extmotion"
				\else
					\sub,@@!Imo_FadeEvent,,nn+"_motion"
				\end
			\end
		\end
	\end
\ret


@@!Imo_EventHook_Message
	\var,obj,p,a
	\cal,p=ParamStr[0],a=ParamStr[1]
	\var,str,v
	
	
	
	\scp,p	\?v,"show"	\cal,v=ResultStr[0]
	\if,v=="true"\then
		\sub,@@!Imo_Layout_WindowShow
	\end
	\if,v=="false"\then
		\sub,@@!Imo_Layout_WindowHide
	\end
	
\ret


@@!Imo_EventHook_Music

\ret


@@!Imo_EventHook_Sound

\ret


@@!Imo_EventHook_Face

\ret


@@!Imo_EventHook_Format

\ret


@@!Imo_EventHook_Sentence_Refresh
	
	\if,#EffectSpeed!=0\then
		\ret
	\end
	
	\var,obj,a,p
	\cal,p=ParamStr[0]
	\cal,a=ParamStr[1]
	
	\var,int,ft,wt
	
	\scp,p	\?v,"fadetime"	\stid,ResultStr[0],0	\cal,ft=ResultInt[0]
	\if,ft==0\then
		\ret
	\end
	\scp,p	\v,"fademode","cut"		
	\scp,p	\v,"fadetime","0"
	
	\scp,p	\?v,"waitmode"
	\if,ResultStr[0]!="click"\then
		\ret
	\end
	\scp,p	\?v,"waittime"	\stid,ResultStr[0],0	\cal,wt=ResultInt[0]
	\cal,wt=wt-ft
	\if,wt<0\then
		\cal,wt=0
	\end
	\scp,p	\v,"fadetime",wt	
\ret


@@!Imo_FadeEvent
	\scp,Imo_FadeEventList	\?v,ParamStr[0]
	\if,ResultStr[0]==""\then
		\ret
	\end
	\var,int,p
	\var,str,v
	\div,",",ResultStr[0]
	\cal,v=ResultStr[0]	
	\cal,p=ResultStr[1]	
	\fmt,"%.4d",p		
	\scp,Imo_FadeEvent	\v,ResultStr[0],v
\ret





@@!Imo_ApplyFadeEvent
	
	\scp,Imo_FadeEvent	\?c
	\if,ResultInt[0]==0\then
		\ret
	\end
	
	\if,#EffectSpeed==0\then
		\ret
	\end
	
	\scp,sys	\?skp
	\if,ResultInt[0]==1 && Imo_SentenceClickLock==0\then
		\ret
	\end
	
	\scp,Imo_SentenceParam	\?c
	\if,ResultInt[0]>0\then
		\ret
	\end
	
	\scp,eff	\?c
	\if,ResultInt[0]==1\then
		\ret
	\end
	
	\var,str,s
	\scp,Imo_FadeEvent	\sort	
	\scp,Imo_FadeEvent	\?c	\?s,ResultInt[0]-1	
	\cal,s=ResultStr[0]
	\sub,@@!Imo_Sentence_Excute,,"0,"+s
\ret



@@!Imo_ApplyInterface
	\sub,@@!Imo_ApplyCustomLock
	
	\sub,@@!Imo_ApplyCursorState
\ret

@@!Imo_ApplyCustomLock
	
	\sub,@@!Imo_ApplySkipButton
	
	\scp,log	\?g,0
	\if,ResultStr[2]!=""\then
		\scp,sys	\?lkc	\lkc,ResultInt[0] & $FFFE
	\else
		\scp,sys	\?lkc	\lkc,ResultInt[0] | $1
	\end
	
	\sub,@@!Imo_ApplySelectLoadButton
	
	\sub,@@!Imo_ApplySceneTopButton
	
	\sub,@@!Imo_ApplySceneSkipButton,,1		
	
	\sub,@@!Imo_ApplyPostMediaButton
\ret

@@!Imo_ApplySceneSkipButton
	\var,int,l	
	\if,ParamInt[0]==1\then
		\cal,l=1
	\else
		\sub,@@!Avg_SceneSkipGetEnbale
		\cal,l=Avg_SceneSkipEnable==0
	\end
	
	\if,l==0\then
		\scp,sys	\?lkc	\lkc,ResultInt[0] & $FFFD	
	\else
		\scp,sys	\?lkc	\lkc,ResultInt[0] | $0002	
	\end
\ret

@@!Imo_ApplyPostMediaButton
	\var,int,l
	
	\vexs,Avg_PostMediaEnable
	\if,ResultInt[0]==0\then
		\cal,l=1
	\else
		\cal,l=Avg_PostMediaEnable == 0
	\end

	\if,l==0\then
		\scp,sys	\?lkc	\lkc,ResultInt[0] & $FFEF	
	\else
		\scp,sys	\?lkc	\lkc,ResultInt[0] | $0010	
	\end
\ret

@@!Imo_ApplyCursorState
	\var,int,i,m
	\var,str,f
	
	\scp,CursorImage	\exv,0,0	\exv,1,0
	
	\if,Imo_FormatText[0]==""\then
		\ret
	\end
	
	\scp,llog	\?k2
	\if,ResultInt[0]==1\then
		\scp,CursorImage	\exv,0,1
	\end
	
	\for,i=0,i<2,i++
		\sub,@@!Imo_IndexList_GetState,,i+1
		\cal,m=ResultInt[0],f=ResultStr[1]	
		\if,m==0\then
			\cnt
		\end
		
		\scp,Imo_Setting	\?v,"PathFormat"
		\fexs,ResultStr[0]+f+".ogg"
		\if,ResultInt[0]==1\then
			\scp,CursorImage	\exv,1,1
		\end
		\ret
	\end
\ret

@@!Imo_ApplySkipButton
	\scp,sys	\?lk	\lk,ResultInt[0] & ($FFFF-_lkSkip)
	\if,#SkipMode==1\then
		\scp,llog	\?k2
		\if,ResultInt[0]!=1\then
			\scp,sys	\?lk	\lk,ResultInt[0] | _lkSkip
		\end
	\end
\ret

@@!Imo_ApplySelectLoadButton
	\var,int,e
	
	\scp,Imo_Setting	\?v,"RewindSaveEnable"
	\if,ResultInt[0]==1\then
		\scp,Avg_RewindSavefileList	\?c
		\cal,e=ResultInt[0]>0
	\else
		\scp,mdat	\?g,"SelectSaveData.svd"
		\cal,e=ResultInt[0]
	\end
	
	\if,e==1\then
		\scp,sys	\?lkc	\lkc,ResultInt[0] & $FFFB	
	\else
		\scp,sys	\?lkc	\lkc,ResultInt[0] | $0004	
	\end
\ret

@@!Imo_ApplySceneTopButton
	\var,int,e
	
	\scp,Imo_Setting	\?v,"RewindSaveEnable"
	\if,ResultInt[0]==1\then
		\scp,Avg_RewindSavefileList	\?c
		\cal,e=ResultInt[0]>0
	\else
		\scp,mdat	\?g,"SceneSaveData.svd"
		\cal,e=ResultInt[0]
	\end
	
	\if,e==1\then
		\scp,sys	\?lkc	\lkc,ResultInt[0] & $FFF7	
	\else
		\scp,sys	\?lkc	\lkc,ResultInt[0] | $0008	
	\end
\ret

@@!Imo_ApplyCursorPosition
	\var,str,ff
	\scp,Imo_MessageAbsParam[0]	\?v,"file"
	\cal,ff="CursorPosition."+ResultStr[0]
	
	\scp,Imo_Setting	\?v,ff+".Mode","layout"
	\sub,@@!Imo_ApplyCursorPositionSub,,ResultStr[0],ff
\ret

@@!Imo_ApplyCursorPositionSub
	\var,str,s,ff
	\var,int,x,y,p,ss
	\cal,s=ParamStr[0],ff=ParamStr[1]
	
	\if,s=="layout"\then
		\cal,x=Imo_CursorLayoutX,y=Imo_CursorLayoutY,p=Imo_CursorLayoutPri
	\end
	\if,s=="message"\then
		
		\cal,p=Imo_CursorLayoutPri
		
		\scp,Imo_Message[0]	\?p		\cal,x=ResultInt[0],y=ResultInt[1]
		\scp,Imo_Setting	\?v,ff+".AddX"	\cal,x=x+ResultInt[0]
		\scp,Imo_Setting	\?v,ff+".AddY"	\cal,y=y+ResultInt[0]
		
		\var,int,ax,ay
		\scp,Imo_Message[0]	\?tmg	\cal,ax=ResultInt[0],ay=ResultInt[1]
		
		\scp,Imo_Message[0]	\?tp	\cal,ax=ax+ResultInt[0],ay=ay+ResultInt[1]
		\scp,Imo_MessageAbsParam[0]	\?v,"*fontsizeh"	\cal,ay=ay+ResultInt[0]	
		\cal,x=x+ax
		\cal,y=y+ay
	\end
	\if,(s=="messagex")||(s=="messagey")\then
		
		\cal,p=Imo_CursorLayoutPri
		
		\scp,Imo_Message[0]	\?p		\cal,x=ResultInt[0],y=ResultInt[1]
		\scp,Imo_Setting	\?v,ff+".AddX"	\cal,x=x+ResultInt[0]
		\scp,Imo_Setting	\?v,ff+".AddY"	\cal,y=y+ResultInt[0]
		
		\var,int,ax,ay
		\scp,Imo_Message[0]	\?tmg	\cal,ax=ResultInt[0],ay=ResultInt[1]
		
		\scp,Imo_Message[0]	\?tda	\cal,ax=ax+ResultInt[2],ay=ay+ResultInt[3]
		
		\if,s=="messagex"\then
			\cal,x=x+ax
		\end
		\if,s=="messagey"\then
			\cal,y=y+ay
		\end
	\end
	
	\scp,CursorImage	\p,x,y,p,0
\ret








@@!Imo_SkipImageObject
	\var,obj,o
	\cal,o=ParamStr[0]
	
	\scp,sys	\?skp
	\if,Imo_SentenceClickLock==0\then
		\cal,ResultInt[0]=0
	\end
	
	\if,#EffectSpeed==0 || ResultInt[0]==1\then
		\scp,o	\skp,500
	\end
\ret



@@!Imo_ClearMessageText
	
\ret


@@!Imo_ApplyMessageName
	\var,obj,o,a
	\var,str,tt,st
	\cal,o=ParamStr[0]		
	\cal,a=ParamStr[1]		
	\cal,tt=ParamStr[2]		
	\cal,st=ParamStr[3]		
	
	
	\scp,a	\?v,"*continueflag"
	\if,ResultInt[0]!=0\then
		\ret
	\end

	
	\scp,a	\?v,"nameformat"
	\if,ResultStr[0]!="none"\then
		\if,tt!=""\then
			\scp,a	\?v,"nameformat"
			\fmt,ResultStr[0]+"[n]",tt		
			\scp,o	\o,st+ResultStr[0]	\mc
		\end
	\end
	
	
	
	
	
	
	
	
	
	
	
\ret

@@!Imo_ApplyMessageText
	\var,obj,o,a
	\cal,o=ParamStr[0]		
	\cal,a=ParamStr[1]		
	\var,int,cf
	\var,str,st,tt
	\cal,cf=ParamInt[2]		
	\cal,tt=ParamStr[3]		
	\cal,st=ParamStr[4]		
	\var,str,cc
	
	\var,str,bf
	\scp,a	\?v,"file","none"	\cal,bf=ResultStr[0]
	
	
	\if,(cf==0)&&(#ReadTextColor==1)\then
		\scp,llog	\?k2
		\if,ResultInt[0]==1\then
			\scp,Imo_Setting
				\?v,"OverrideKidokuColor"		
				\?v,"OverrideKidokuColor."+bf,ResultStr[0]
			\if,ResultStr[0]!=""\then
				\fmt,"[c,%s]",ResultStr[0],"[rc,%s]",ResultStr[0]
				\cal,cc=ResultStr[0]
			\end
		\end
	\end
	
	\scp,o	\o,st+cc+tt
\ret


@@!Imo_ApplyMessageCreate
	
	
\ret



@@!Imo_Layout_WindowShow
	\if,Imo_InterfaceShow==1\then
		\ret
	\end
	\cal,Imo_InterfaceShow=1
	
	\var,int,i,n
	
	\scp,WindowAnimation	\e		
	\scp,CursorImage	\m,"none"	\e
	\scp,CursorImage	\exv,0,0	\exv,1,0	
	
	
	\garr,SysButton		
	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,SysButton[i]	\e
	\end
	\sub,@@!Imo_SkipImageObject,,WindowAnimation,"layout",1
\ret


@@!Imo_Layout_WindowHide
	\if,Imo_InterfaceShow==0\then
		\ret
	\end
	\cal,Imo_InterfaceShow=0
	
	\var,int,i,n
	
	\scp,WindowAnimation	\d		
	\scp,CursorImage		\d
	
	
	\garr,SysButton		
	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,SysButton[i]	\d
	\end
	\sub,@@!Imo_SkipImageObject,,WindowAnimation,"layout",0
	\sub,@@!Imo_Format_VoiceStop
	
	\sub,@@!Imo_Info_AllHide
\ret


@@!Imo_Interface_Load
	\var,str,s
	\gvar,int,Imo_CursorLayoutX,Imo_CursorLayoutY,Imo_CursorLayoutPri
	\cal,s=ParamStr[0]
	\if,s==""\then
		\cal,s="window"
	\end
	\sub,"@@!Layout_"+s+"_Create"
	
	\scp,CursorImage	\?p
	\cal,Imo_CursorLayoutX=ResultInt[0],Imo_CursorLayoutY=ResultInt[1],Imo_CursorLayoutPri=ResultInt[2]
	\cal,Imo_InterfaceShow=0
	
	\var,int,i,n
	\garr,SysButton	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,SysButton[i]	\in,$10	\out,$10
	\end
	\scp,CursorImage	\in,$10	\out,$10
\ret

@@!Imo_Interface_UnLoad
	\var,str,s
	\cal,s=ParamStr[0]
	\if,s==""\then
		\cal,s="window"
	\end
	\sub,"@@!Layout_"+s+"_Free"
	\del,Imo_CursorLayoutX,Imo_CursorLayoutY,Imo_CursorLayoutPri
	\cal,Imo_InterfaceShow=0
\ret



@@!Imo_OnMessageIdleEvent

\ret



@@!Imo_OnLoadEvent
	
	\vexs,Avg_InitFlag
	\if,ResultInt[0]==0\then
		\ret
	\end
	\if,Avg_InitFlag==0\then
		\ret
	\end
	
	
	\if,Avg_InterruptLock==1\then

	\end
	
	\sub,@@!Imo_OnMessageIdleEvent
	\sub,@@!Avg_SceneSkipGetEnbale,,1
\ret

