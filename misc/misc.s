




@@!Misc_OnMiscInit
	\del,Misc_VoiceCharaSerchTable
\ret







@@!Misc_NameDivide
	
	\var,str,n,d
	\div,#NameDivideCode,ParamStr[0]
	\if,ResultStr[1]==""\then
		\cal,ResultStr[1]=ResultStr[0]
	\end
	\if,#NameDivideMode==0\then		
		\cal,n=ResultStr[0]
		\cal,d=ResultStr[1]
	\else
		\cal,d=ResultStr[0]
		\cal,n=ResultStr[1]
	\end
	
	\if,ParamInt[1]==1\then
		\if,n==d\then
			
			\scp,cfg	\?cv,n
			\cal,#ConfigVoiceActor[ResultInt[0]]=1
		\end
	\end
	
	\if,d=="none"\then
		\cal,d=""
	\end
	
	
	\cal,ResultStr[0]=n
	\cal,ResultStr[1]=d
\ret






@@!Misc_GetCharaVoiceVolume
	\var,int,v,m
	\var,str,n
	\if,#VoiceCharaSerchMode==0\then
		\sub,@@!Misc_NameDivide,self,ParamStr[0]
		\cal,n=ResultStr[0]
	\else
		\vexs,Misc_VoiceCharaSerchTable	
		\if,ResultInt[0]==0\then
			\gvar,table,Misc_VoiceCharaSerchTable
			\scp,Misc_VoiceCharaSerchTable	\l,"VoiceFileToNameTable.txt"	\sort
		\end
		\sub,@@!Misc_VoiceDivide,,ParamStr[1]
		\scp,Misc_VoiceCharaSerchTable	\bpos,ResultStr[0]
		\cal,n=ResultStr[1]
		\if,n==""\then
			\cal,n="*"	
		\end
	\end
	\scp,cfg	\?cvv,n
	\cal,v=ResultInt[0]
	\scp,cfg	\?cvm,n
	\cal,m=ResultInt[0]
	\cal,ResultInt[0]=v
	\cal,ResultInt[1]=m
\ret



@@!Misc_VoiceDivide
	\div,"＠",ParamStr[0]
\ret




@@!Misc_VolumeSetup
	
	\var,int,v
	\if,#MasterVolume>100\then
		\cal,#MasterVolume=100
	\end
	\if,#MasterVolume<0\then
		\cal,#MasterVolume=0
	\end
	\cal,v=#MasterVolume
	\if,#MasterMute>0\then
		\cal,v=0
	\end
	
	\scp,cfg
		\vtv,0,(#BgmVolume*v/100)*256/100 / 2
		\vtm,0,0
	\scp,cfg
		\vtv,1,(#VoiceVolume*v/100)*256/100
		\vtm,1,0
	\scp,cfg
		\vtv,2,(#SEVolume*v/100)*256/100
		\vtm,2,0
	\scp,cfg
		\vtv,3,(#SysSEVolume*v/100)*256/100
		\vtm,3,0
	\scp,cfg
		\vtv,4,(#MovieVolume*v/100)*256/100
		\vtm,4,0
\ret




@@!Misc_FontSetup
	\var,table,t,p
	\scp,t	\l,"Avg\ImoScripter_FontList.txt"
	\scp,p	\l,"Avg\Setting.txt"
	\scp,t	\comb,p		
	
	\if,ParamInt[0]==1\then
		\scp,t		\?v,"font[0].name","ＭＳ ゴシック"
		\scp,cfg	\fn2,0,ResultStr[0]
		\scp,t		\?v,"font[0].style",1
		\scp,cfg	\fst2,0,ResultInt[0]
		\scp,t		\?v,"font[0].aa",2
		\scp,cfg	\faa2,0,ResultInt[0]
		\scp,t		\?v,"font[0].color",$000000
		\scp,cfg	\fsc2,0,ResultInt[0]
	\end
	
	\var,str,fn
	\var,int,faa,fst,fsc,fil
	\scp,cfg	\?fn	
	\rep,ResultStr[0],".of",""		
		\cal,fn=ResultStr[0]
	\scp,cfg
		\?faa,0	\cal,faa=ResultInt[0]
		\?fst,0	\cal,fst=ResultInt[0]
		\?fsc,0	\cal,fsc=ResultInt[0]
		\?fil,0	\cal,fil=ResultInt[0]
	
	\var,int,i,n
	\var,str,ff
	\for,i=1,i<8,i++
		\fmt,"font[%d]",i	\cal,ff=ResultStr[0]
		
		\scp,t	\?v,ff+".name"
		\if,ResultStr[0]==""\then
			\cnt
		\end
		\rep,ResultStr[0],".of",""		
		\if,ResultStr[0]=="base"\then
			\cal,ResultStr[0]=fn
		\end
		\scp,cfg	\fn,i,ResultStr[0]
		
		\scp,cfg	\faa,i,faa
		
		\scp,t	\?v,ff+".style",1
		\if,ResultStr[0]=="base"\then
			\cal,ResultInt[0]=fst
		\end
		\scp,cfg	\fst,i,ResultInt[0]
		
		\scp,t	\?v,ff+".color",$000000
		\if,ResultStr[0]=="base"\then
			\cal,ResultInt[0]=fsc
		\end
		\scp,cfg	\fsc,i,ResultInt[0]
		
		\scp,t	\?v,ff+".ilrate",50
		\if,ResultStr[0]!=""\then
			\if,ResultStr[0]=="base"\then
				\cal,ResultInt[0]=fil
			\end
			\scp,cfg	\fil,i,ResultInt[0]
		\end
	\end
	
	
	
	
	
	
	
	
\ret



@@!Misc_MessageObjectSetup
	\var,obj,o
	\cal,o=ParamStr[0]
	\scp,o
		\nsw,#IgnoreReturnSpaceWord	
		\kwl,#KinsokuWordLength  	
		\kwb,#GyoutouKinsokuWord
		\kwe,#GyoumatuKinsokuWord
	\if,#ReturnSpaceEnable==1\then
		\ns,-1,#NotReturnSpaceLength
	\else
		\ns,0,0
	\end
	\fmt,"[pi,0,%d]",#LinePitch
		\o,ResultStr[0]
	\fmt,"[rp,0,%d]",#LinePitch*-1
		\o,ResultStr[0]
	\fmt,"[rs,%d",#LinePitch,",%d]",#LinePitch
		\o,ResultStr[0]
		\o,"[rpi,0,0]"
\ret






@@!Misc_MakeFormatList
	\var,obj,sl
	\var,str,f
	\var,int,n,i,b
	
	\cal,sl=ParamStr[0]
	\cal,f=ParamStr[1]
	\cal,n=ParamInt[2]
	\cal,b=ParamInt[3]
	\for,i=0,i<n,i++
		\fmt,f,i+b
		\scp,sl	\a,ResultStr[0]
	\end
\ret




@@!Misc_SearchNewSaveFileList
	\var,obj,sl
	\var,int,i,j,mm,n
	
	\var,str,f,ff
	\var,int,d,t,nd,nt
	
	\cal,sl=ParamStr[0]
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	
	
	\cal,mm=0
	\if,ParamInt[1]==1\then
		\cal,mm=16-1
	\end
	
	\cal,ff="",nd=-1,nt=-1
	\for,i=0,i<n,i++
		\scp,sl	\?s,i
		\cal,f=ResultStr[0]
		
		\scp,dat	\?g,f
		\if,ResultInt[0]==0\then
			\cnt
		\end
		\scp,dat	\?gd,f
		
		\cal,d=ResultInt[0]*480 + ResultInt[1]*40 + ResultInt[2]
		
		\cal,t=ResultInt[3]*3600 + ResultInt[4]*60 + ResultInt[5]
		\if,(nd<d)||((nd==d)&&(nt<t))\then
			\cal,ff=f,nd=d,nt=t
		\end
		\if,i&mm==4\then
			\draw
		\end
	\end
	\cal,ResultStr[0]=ff
\ret




@@!Misc_SortNewSaveFileList
	\var,obj,sl
	\var,int,n
	
	\cal,sl=ParamStr[0]
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	
	\var,int,d[n],t[n]
	\var,str,f[n]
	\var,int,i,j,mm
	
	\cal,mm=0
	\if,ParamInt[1]==1\then
		\cal,mm=16-1
	\end
	
	\for,i=0,i<n,i++
		\scp,sl	\?s,i
		\cal,f[i]=ResultStr[0]
		\scp,dat	\?g,f[i]
		\if,ResultInt[0]==1\then
			\?gd,f[i]
			
			\cal,d[i]=ResultInt[0]*480 + ResultInt[1]*40 + ResultInt[2]
			
			\cal,t[i]=ResultInt[3]*3600 + ResultInt[4]*60 + ResultInt[5]
		\else
			\cal,d[i]=0,t[i]=0
		\end
		\if,i&mm==4\then
			\draw
		\end
	\end
	
	\for,i=n-1,i>-1,i--
		\for,j=0,j<i,j++
			\if,(d[j]<d[j+1])||((d[j]==d[j+1])&&(t[j]<t[j+1]))\then
				\swap,d[j],d[j+1]
				\swap,t[j],t[j+1]
				\swap,f[j],f[j+1]
				\scp,sl	\sw,j,j+1
			\end
		\end
		\if,i&mm==4\then
			\draw
		\end
	\end
\ret




@@!Misc_GetNewMessageText
	\var,str,s
	\var,int,n
	\cal,n=ParamInt[0]
	\if,n<1\then
		\cal,n=#SaveLogTextLength
	\end
	
	\scp,log	\?g,0
	\cal,s=ResultStr[1]
	
	\rep,s,"***LINE***",""
	
	\bsub,ResultStr[0],"\[rb,([^,]+),[^,]+\]","$1"
	
	\bsub,ResultStr[0],"\[pc,([^\]]+)\]","$1"
	
	\bsub,ResultStr[0],"\[([^\]]*).*?\]",""
	
	
	\zenc,ResultStr[0]			
	\cpy,ResultStr[0],1,n		
\ret



@@!Misc_AutoSave
	
	\svar,int,#AutoSaveFileIndex
	\cal,#AutoSaveFileIndex++
	\cal,#AutoSaveFileIndex = #AutoSaveFileIndex % #AutoSaveFileCount
	
	\scp,sys	\?lk
	\if,ResultInt[0] & (_lkLoad | _lkSave) != 0\then
		\ret
	\end
	
	\scp,sys	\dskp
	\if,ResultInt[0]==1\then
		\ret
	\end
	
	
	\scp,sys	\n2,3,""	
	
	\scp,sys	\tz,#SaveThumZPri
	
	\var,str,f
	\cal,f=ParamStr[0]
	\if,f==""\then
		\cal,f="AutoSaveData%d.svd"
	\end
	
	\fmt,f,#AutoSaveFileIndex
	\scp,dat	\s,ResultStr[0]
\ret


@@!Misc_SelectSave
	\sub,@@!Misc_MemorySave,,"SelectSaveData.svd",0,$1 + $2+$8
\ret


@@!Misc_SceneTopSave
	\sub,@@!Misc_MemorySave,,"SceneSaveData.svd",0,0 + $2+$8
\ret



@@!Misc_MemorySave
	\var,str,f
	\var,int,c,m
	\cal,f=ParamStr[0],c=ParamInt[1],m=ParamInt[2]
	
	\scp,sys	\?lk
	\if,ResultInt[0] & (_lkLoad | _lkSave) != 0\then
		\ret
	\end
	
	\scp,sys	\n2,3,""	
	\scp,sys	\tz,#SaveThumZPri
@@!Misc_MemorySave_Point
	
	\if,c==1\then
		\scp,mdat	\i		
	\else
		\scp,mdat	\d,f	
	\end
	
	\scp,mdat	\s,f,m		
	
	\scp,mdat	\?g,f
	\if,ResultInt[0]==0\then
		\jmp,@@!Misc_MemorySave_Point
	\end
\ret




@@!Misc_ExceptionErrorSave
	
	\scp,sys	\?ver
	\if,ResultInt[0]==0\then
		\ret
	\end
	
	\scp,dat	\s,#ExceptionBackupFilename
\ret




@@!Misc_FormCloseSave
	
	\if,SelfThreadName=="game"\then
		\derr,"call system thread only."
	\end
	
	\sub,@@!Misc_GetFormCloseFilename
	\if,ResultStr[0]==""\then
		\ret
	\end
	
	\srct,1	
		\scp,dat	\s,ResultStr[0]
	\srct,0
\ret

@@!Misc_GetFormCloseFilename
	
	\scp,cfg	\?fcs
	\if,ResultInt[0]==0\then
		\ret
	\end
	
	\if,SelfThreadName=="game"\then
		\scp,sys	\?fcs
		\ret
	\end
	
	\srct,1	
		\scp,sys	\?fcs
	\srct,0
\ret

@@!Misc_GetFormCloseCaption
	\sub,@@!Misc_GetFormCloseFilename
	\if,ResultStr[0]==""\then
		\cal,ResultStr[0]=ParamStr[0]
	\else
		\cal,ResultStr[0]=ParamStr[1]
	\end
\ret


@@!Misc_MemoryPlayState
	\gvar,int,misc_KeepPlayState
	\scp,sys	\?p
	\cal,misc_KeepPlayState=ResultInt[0]
	\scp,sys	\p,0
\ret

@@!Misc_RestoryPlayState
	
	\if,ParamInt[0]==1\then
		\scp,sys	\p,0
	\end
	
	\scp,sys	\?p		
	\if,ResultInt[0]==0\then
		
		\if,misc_KeepPlayState==2\then
			\if,#KeepAutoPlay==1\then
				\scp,sys	\p,misc_KeepPlayState
			\end
		\end
		
		\if,misc_KeepPlayState>2\then
			\if,#KeepSkip==1\then
				\scp,sys	\p,misc_KeepPlayState
			\end
		\end
	\end
	\del,misc_KeepPlayState
\ret
