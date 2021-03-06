


@@!AVG_RouteCreate





	
	\gvar,str,_SelectLabel,_BranchLabel,_RouteJmpFile
	\gvar,int,Avg_RouteNumber,Avg_RouteMove,AVG_SceneOnSkip
	\gvar,str,Avg_RouteParamStr,FragResultStr
	\gvar,int,Avg_RouteParamInt,FragResultInt
	
	\scp,rep	
		\a,"^selectset","\sub,@@!Avg_SelectSetCommand,self,SelfFileName,"	
		\a,"^selectjmp","\jmp,@@!Avg_SelectFlagJmp,self,"	
		\a,"^selectlabel","\sub,@@!Avg_Selectlabel,self"
		\a,"^branchset","\sub,@@!Avg_BranchSet,self"
		\a,"^branchfrag","\sub,@@!Avg_BranchFragSet,self"
		\a,"^branch","\sub,@@!Avg_BranchCommand,self,SelfFileName,"
		\a,"^branchlabel","\sub,@@!Avg_Branchlabel,self"
		\a,"^jmp","\sub,@@!Avg_Jump,self,SelfFileName"
		\a,"^frag","\sub,@@!Avg_Frag,self"
		\a,"^fragcal","\sub,@@!Avg_FragCal,self"
		\a,"^fragtrack","\sub,@@!Avg_Frag2RouteMove,self"
		\a,"^Filedmon","\sub,@@!Avg_Frag2RouteMove,self,SelfFileName"	
		\a,"^filetrack","\sub,@@!Avg_FileTrack,self"		
		\a,"^fragmax","\sub,@@!Avg_FragMax,self"
		\a,"^fragmin","\sub,@@!Avg_FragMin,self"
				
\ret

@@!AVG_RouteFree
	\del,_SelectLabel,_BranchLabel
	\del,Avg_RouteNumber
	\scp,rep
		
		
		
		
		
		
		
		
		
		
		
		
		
		
\ret

@@!SelectGetSelectID
	\var,str,s
	
	\scp,sys	\?mrd,2
	\cal,s="SelectButton_"+ResultStr[0]+"_"+ResultStr[1]+"_"
	\cal,s=s+ResultInt[0]
	\cal,s=s+"_"
	\cal,ResultStr[0]=s
\ret

@@!Avg_SelectSetCommand
	\sub,@@!Avg_SelectFlagPre,self,ParamStr[0],ParamStr[1]

\ret

@@!Avg_RouteSelectCommand
	\sub,@@!CreateAVG,self
	\sub,@@!Avg_SelectCommand,self,ParamStr[0],ParamStr[1],ParamStr[2],ParamStr[3],ParamStr[4],ParamStr[5],ParamStr[6],ParamStr[7],ParamStr[8],ParamStr[9],ParamStr[10]
	\sub,@@!FreeAVG,self
\ret




@@!Avg_SelectFlagPre

	\scp,misc
	\efn,ParamStr[0]
	\cfe,ResultStr[0],""
	
	\cal,_HomeFile=ParamStr[0]
	\cal,_HomeLabel=ResultStr[0]
	\cal,Avg_RouteNumber=ParamStr[1]
	\cal,_SelectLabel= "@@" + ResultStr[0] + "_sel" + Avg_RouteNumber
	\cal,Avg_SelectCurLabel=_SelectLabel + "_" + ResultBtnInt[0]

\ret

@@!Avg_SelectFlagRoute

	\go,ParamStr[0],_SelectFile
	
\ret



@@!Avg_SelectFlagJmp
	\jmp,Avg_SelectCurLabel,_SelectFile
\ret


@@!Avg_SelectEnd
	\jmp,_SelectLabel+"_end",_HomeFile
\ret

@@!Avg_BranchCommand
	\sub,@@!Avg_BranchPre,self,ParamStr[0],ParamStr[1]

\ret


@@!Avg_BranchPre
	\scp,misc
	\efn,ParamStr[0]
	\cfe,ResultStr[0],""
	
	\cal,_HomeFile=ParamStr[0]
	\cal,_HomeLabel=ResultStr[0]
	\cal,Avg_RouteNumber=ParamStr[1]
	\cal,_BranchLabel= "@@" + ResultStr[0] + "_branch" + Avg_RouteNumber
	\cal,Avg_BranchCurLabel=_BranchLabel

\ret


@@!Avg_BranchJmp
	\jmp,Avg_BranchCurLabel,_SelectFile
\ret


@@!Avg_BranchEnd
	\jmp,_BranchLabel+"_end",_HomeFile
\ret


@@!Avg_Jump

	\jmp,ParamStr[1],ParamStr[0]
\ret



@@!FilejumpName

\var,str,f
\scp,misc
\efn,ParamStr[0]
\cfe,ResultStr[0],""
\cal,_HomeFile=ParamStr[0]
\cal,_HomeLabel=ResultStr[0]
\cal,ResultStr[0]= "@@" + ResultStr[0] + "_end"

\ret

@@!FileNameExtract

\var,str,f
\scp,misc
\efn,ParamStr[0]
\cfe,ResultStr[0],""

\ret



@@!Avg_SetRouteParam

	\vexs,Avg_RouteParamStr[0]
	\if,ResultInt[0]==0\then

	\end
	
	\var,int,i
	\for,i=0,i<2,i++
		\cal,Avg_RouteParamStr[i]=ParamStr[i]
		\cal,Avg_RouteParamInt[i]=ParamInt[i]
	\end

\ret




@@!SelectReturn
	\var,str,label
	
	\cal,label=_SelectLabel+"_"+ResultBtnInt[0]
	
	\if,Avg_RouteParamStr[1]!=""\then
		\cal,label=label + "_" + Avg_RouteParamStr[1]
	\end
	
	\case,Avg_RouteParamStr[0]
		\ans,"Route"
			\jmp,label,_RouteFile
		\ans,"","Home"
			\jmp,label,_HomeFile
		\else
			\jmp,label,Avg_RouteParamStr[0]
	\end
	
	
\ret




@@!BranchReturn

	\case,Avg_RouteParamStr[1]
		\ans,"Route"
			\jmp,_BranchLabel+"_"+Avg_RouteParamInt[0],_RouteFile 
		\ans,"","Home"
			\jmp,_BranchLabel+"_"+Avg_RouteParamInt[0],_HomeFile
		\else
			\jmp,_BranchLabel+"_"+Avg_RouteParamInt[0],Avg_RouteParamStr[1]
	\end
\ret



@@!Avg_BranchFragSet
	\sub,@@!Avg_Frag,self,ParamStr[0]
	\cal,Avg_RouteParamInt=FragResultInt
\ret

@@!Avg_BranchSet
	\cal,Avg_RouteParamInt=ParamInt[0]
\ret


@@!Avg_Selectlabel
	\cal,Avg_SelectCurLabel=ParamStr[ResultBtnInt[0]]
	\sub,@@!Avg_Frag2RoutetTrack,self,Avg_SelectCurLabel
	\cal,Avg_RouteMove=1
\ret

@@!Avg_Branchlabel
	\cal,_BranchLabel=ParamStr[Avg_RouteParamInt]
	\sub,@@!Avg_Frag2RoutetTrack,self,_BranchLabel
	\cal,Avg_RouteMove=1
\ret




@@!Avg_Frag2RoutetTrack
	
	\var,str,tmp
	\cal,tmp =  ParamStr[0] + "=1"
	
	\scp,_FlagList	\a,tmp
	\cal,ResultStr[0]=ParamStr[0]
\ret

@@!Avg_FileTrack
	\var,str,tmp
	\cal,tmp = "ファイル≪" + ParamStr[0] + "≫=1"
	
	\scp,_FlagList	\a,tmp
	\cal,ResultStr[0]=ParamStr[0]
\ret

@@!Avg_Frag2RouteMove
 \sub,@@!Avg_Frag2RoutetTrack,self,ParamStr[0]
 \cal,ResultStr[0]=ParamStr[0]
\ret


@@!Avg_Frag
 \case,ParamStr[0]
 	\ans,"+"
 		\sub,@@!Avg_Fragplus,self,ParamStr[1],ParamStr[2]
 	\ans,"-"
  		\sub,@@!Avg_Fragminus,self,ParamStr[1],ParamStr[2]
  	\ans,"="
  		\scp,_FlagList
			\if,ParamStr[1]!=""\then
		 		\v,ParamStr[1],ParamStr[2]
			\end
  	\else
		 \scp,_FlagList
		 	\?v,ParamStr[0]
		 	\cal,FragResultStr=ResultStr[0]
		 	\cal,FragResultInt=ResultStr[0]
	\end
	
	\var,str,tmp0,tmp1
	\var,str,itmp0,itmp1
		
	\cal,tmp0=ResultStr[0]
	\cal,itmp0=ResultInt[0]
	\cal,tmp1=ResultStr[1]
	\cal,itmp1=ResultInt[1]
				 	
	
	\vexs,Debug_Enable_DebugSaveFlagList	
	\if,ResultInt[0]==1\then

		\sub,@@!Avg_DebugSaveFragList
		
	\end

	\cal,ResultStr[0]=tmp0
	\cal,ResultInt[0]=itmp0
	\cal,ResultStr[1]=tmp1
	\cal,ResultInt[1]=itmp1

\ret

@@!Avg_Fragplus
 \scp,_FlagList
 	\?v,ParamStr[0]
 \cal,ResultInt[0]=ResultInt[0]+ParamInt[1]
 	\v,ParamStr[0],ResultInt[0]
\ret

@@!Avg_Fragminus
 \scp,_FlagList
 	\?v,ParamStr[0]
 \cal,ResultInt[0]=ResultInt[0]-ParamInt[1]
  	\v,ParamStr[0],ResultInt[0]
\ret

@@!Avg_FragCal
	\var,str,tmp,stmp
	
	\cal,stmp=ParamStr[0]
	
	\for
		\bsub,"s/.*?\[(.*?)\].*/\1/k",stmp
		\if,ResultStr[0]!=stmp\then
			\cal,tmp=ResultStr[0]
			\sub,@@!Avg_Frag,self,tmp
			\cal,tmp="["+ tmp +"]"
			\rep,stmp,tmp,ResultInt[0]
			\cal,stmp=ResultStr[0]
		\else
			\brk
		\end
	
	\end
	
	\cal,stmp="\cal,FragResultInt=" + stmp
	\exop,stmp
	
\ret

@@!Avg_FragMax
 \var,int,i,RInt0,Rint1
	\scp,_FlagList
		\?v,ParamStr[0]
	\cal,Rint1=ResultInt[0]
	\cal,RInt0=0

	\for,i=1,i<ParamCount,i++
	\if,ParamStr[i]!=""\then
		\scp,_FlagList
			\?v,ParamStr[i]
		\if,ResultInt[0]>Rint1\then
			\cal,Rint1=ResultInt[0]
			\cal,RInt0=i
		\end
		\else
			ResultInt[0]=RInt0
			ResultInt[1]=RInt1
			\ret
		\end
	\end
	
	ResultInt[0]=RInt0
	ResultInt[1]=RInt1
\ret


@@!Avg_FragMin

 \var,int,i,RInt0,Rint1
	\scp,_FlagList
		\?v,ParamStr[0]
	\cal,Rint1=ResultInt[0]
	\cal,RInt0=0

	\for,i=1,i<ParamCount,i++
	\if,ParamStr[i]!=""\then
		\scp,_FlagList
			\?v,ParamStr[i]
		\if,ResultInt[0]<Rint1\then
			\cal,Rint1=ResultInt[0]
			\cal,RInt0=i
		\end
		\else
			ResultInt[0]=RInt0
			ResultInt[1]=RInt1
			\ret
		\end
	\end
	
	ResultInt[0]=RInt0
	ResultInt[1]=RInt1
\ret




@@!Avg_DebugAutoSave
	

	
	\scp,sys	\?ver
	\if,ResultInt[0]==1\then
		\ret
	\end
		

	\var,int,max,min

	\cal,max=200
	\cal,min=100

	
	\if,(Debug_Enable_DebugAutoSave<min)|(Debug_Enable_DebugAutoSave>max)\then
		\cal,Debug_Enable_DebugAutoSave=min
	\end

	
	\fmt,"SaveData%d.svd",Debug_Enable_DebugAutoSave
	
	\srct,1
	\scp,dat	\s,ResultStr[0]
	\srct,0

	\cal,Debug_Enable_DebugAutoSave=Debug_Enable_DebugAutoSave+1

\ret



@@!Avg_DebugSelectUseList
	
	\scp,sys	\?ver
	\if,ResultInt[0]==1\then
		\ret
	\end
	
	\vexs,Debug_Enable_DebugSelectUseList
	\if,ResultInt[0]==0\then
		\ret
	\end
	
	\var,int,i,num
	
	\var,int,sdisable[5],slock[5],m
	\cal,m=1		
	\for,i=0,i<5,i++

		\if,Avg_SelectDisable & m > 0\then
			\cal,sdisable[i]=1
		\end
		
		
		\if,Avg_SelectLock & m > 0\then
			\cal,slock[i]=1
		\end
		\cal,m = m << 1

	\end
	
		
	
	\vexs,Debug_Enable_RandamSelect
	\if,ResultInt[0]!=0\then
		\gvar,int,Debug_SelectCount
		
		
		\gvar,list,Debug_SelectListCount
		
		\cal,Debug_SelectCount=Debug_SelectCount+1
		
		
		\for
			\scp,math
  			\rnd,5
  			\cal,num=ResultInt[0]
			\if,(ParamStr[num]!="")&(sdisable[num]==0)&(slock[num]==0)\then
				\scp,Debug_SelectListCount \a,ParamStr[num]
				\brk
			\end
		\end
		\cal,Debug_Label_DebugSelect=""
		\cal,Avg_SelectBtnInt=num
		
		\ret
	\end
	
	

	
	\vexs,Debug_Label_DebugSelect
	\if,ResultInt[0]==0\then
		\svar,str,Debug_Label_DebugSelect

	\end
	
	
	
	\vexs,Debug_List_DebugSelect	
	\if,ResultInt[0]==0\then	
		
		\fexs,Debug_Enable_DebugSelectUseList
			\if,ResultInt[0]==1\then
				
				\gvar,list,Debug_List_DebugSelect
				\scp,Debug_List_DebugSelect
				\l,Debug_Enable_DebugSelectUseList
			
			\else
					\ret
			\end


	\end
	
	\var,str,tmp,tmp2,tmp3
	\if,Debug_Label_DebugSelect!=""\then
		\sub,@@!Avg_DebugSelectUseList_Label,self
		\cal,Debug_Label_DebugSelect=""
	\end
	
	
@@!Avg_DebugSelectUseList_proces

	\scp,Debug_List_DebugSelect	\?c
	\if,ResultInt[0]==0\then
		\ret
	\end

	\scp,Debug_List_DebugSelect \?s,0
	\cal,tmp=ResultStr[0]

	
	\if,tmp==""\then
		
		\scp,Debug_List_DebugSelect \dd,0
		\jmp,@@!Avg_DebugSelectUseList_proces
	\end

	
	\pos,"//",tmp
	\if,ResultInt==1\then
		
		\scp,Debug_List_DebugSelect \dd,0
		\jmp,@@!Avg_DebugSelectUseList_proces
	\end
	
	
	\pos,"@@",tmp
	\if,ResultInt==1\then
		
		\scp,Debug_List_DebugSelect \dd,0
		\jmp,@@!Avg_DebugSelectUseList_proces
	\end
	
	
	\pos,"^",tmp
	\if,ResultInt==1\then
		
		\div,",",tmp,1
		\case,ResultStr[0]
			\ans,"^save"
			
				\stid,ResultStr[1],0
				\fmt,"SaveData%d.svd",ResultInt[0]
				
				\srct,1
				\scp,dat	\s,ResultStr[0]
				\srct,0

				\zero
			\ans,"^load"
				\cal,tmp3=ResultStr[2]
				\stid,ResultStr[1],0
				\fmt,"SaveData%d.svd",ResultInt[0]
				\cal,tmp2=ResultStr[0]

				\rep,tmp3,#quot,""
				\cal,Debug_Label_DebugSelect=ResultStr[0]
				
				\scp,dat	\?g,tmp2
				\if,ResultInt[0]==1\then
					\srct,1
					\scp,dat	\l,tmp2
					\srct,0
				\else
					\scp,Debug_List_DebugSelect \dd,0
					\ret
				\end
			\ans,"^log"
				\sub,@@!Avg_DebugVoiceListOutAdd,self
				\sub,@@!Avg_DebugSaveFragListADD,self
		\end
		\scp,Debug_List_DebugSelect \dd,0
		\jmp,@@!Avg_DebugSelectUseList_proces
	\end
	
	
	
	
	\for,i=0,i<5,i++
		\if,(tmp==ParamStr[i])&(sdisable[i]==0)&(slock[i]==0)\then
			\cal,Avg_SelectBtnInt=i
				\scp,Debug_List_DebugSelect \dd,0			
			\brk
		\end
	\end
\ret



@@!Avg_DebugSelectUseList_commandonly
	
	\scp,sys	\?ver
	\if,ResultInt[0]==1\then
		\ret
	\end
	
	\vexs,Debug_Enable_DebugSelectUseList
	\if,ResultInt[0]==0\then
		\ret
	\end
		
	\var,int,i
	
	\vexs,Debug_Label_DebugSelect
	\if,ResultInt[0]==0\then
		\svar,str,Debug_Label_DebugSelect

	\end
	
	
	
	\vexs,Debug_Enable_RandamSelect
	\if,ResultInt[0]!=0\then
		
		\scp,_FlagList \i
		
		\vexs,Debug_SelectListCount
		\if,ResultInt[0]!=0\then
			\scp,Debug_SelectListCount \a,"終了"
			\scp,Debug_SelectListCount \a,""
			\sub,@@!Avg_DebugSaveSelectListADD,self
		\end
		
		
		
		\pos,"^load",Debug_Enable_RandamSelect
		\if,ResultInt[0]==1\then
				\var,str,tmp,tmp1,tmp2
				\cal,tmp=Debug_Enable_RandamSelect
				\div,",",tmp,1
				
				\stid,ResultStr[1],0
				\fmt,"SaveData%d.svd",ResultInt[0]
				\cal,tmp2=ResultStr[0]

				
				\scp,dat	\?g,tmp2
				\if,ResultInt[0]==1\then
					\srct,1
					\scp,dat	\l,tmp2
					\srct,0
				\else
					\go,Debug_Enable_RandamSelect,_RouteFile
					\ret
				\end
		
		\else
		
			\go,Debug_Enable_RandamSelect,_RouteFile
		
		\end
		
		
		\ret
	\end
	
	
	
	
	\vexs,Debug_List_DebugSelect	
	\if,ResultInt[0]==0\then	
		
		\fexs,Debug_Enable_DebugSelectUseList
			\if,ResultInt[0]==1\then
				
				\gvar,list,Debug_List_DebugSelect
				\scp,Debug_List_DebugSelect
				\l,Debug_Enable_DebugSelectUseList
			
			\else
			
				\ret
			\end
	\end
	
	\var,str,tmp,tmp2,tmp3
	\if,Debug_Label_DebugSelect!=""\then
		\sub,@@!Avg_DebugSelectUseList_Label,self
		\cal,Debug_Label_DebugSelect=""
	\end
	
	
@@!Avg_DebugSelectUseList_commandonly_proces

	\scp,Debug_List_DebugSelect	\?c
	\if,ResultInt[0]==0\then
		\ret
	\end

	\scp,Debug_List_DebugSelect \?s,0
	\cal,tmp=ResultStr[0]

	
	\if,tmp==""\then
		
		\scp,Debug_List_DebugSelect \dd,0
		\jmp,@@!Avg_DebugSelectUseList_commandonly_proces
	\end

	
	\pos,"//",tmp
	\if,ResultInt==1\then
		
		\scp,Debug_List_DebugSelect \dd,0
		\jmp,@@!Avg_DebugSelectUseList_commandonly_proces
	\end
	
	
	\pos,"@@",tmp
	\if,ResultInt==1\then
		
		\scp,Debug_List_DebugSelect \dd,0
		\jmp,@@!Avg_DebugSelectUseList_commandonly_proces
	\end
	
	
	\pos,"^",tmp
	\if,ResultInt==1\then
		
		\div,",",tmp,1
		\case,ResultStr[0]
			\ans,"^save"
			
				\stid,ResultStr[1],0
				\fmt,"SaveData%d.svd",ResultInt[0]
				
				\srct,1
				\scp,dat	\s,ResultStr[0]
				\srct,0

				\zero
			\ans,"^load"
				\cal,tmp3=ResultStr[2]
				\stid,ResultStr[1],0
				\fmt,"SaveData%d.svd",ResultInt[0]
				\cal,tmp2=ResultStr[0]

				\rep,tmp3,#quot,""
				\cal,Debug_Label_DebugSelect=ResultStr[0]
				
				\scp,dat	\?g,tmp2
				\if,ResultInt[0]==1\then
					\srct,1
					\scp,dat	\l,tmp2
					\scp,sys	\p,3
					\srct,0
				\else
					\scp,Debug_List_DebugSelect \dd,0
					\ret
				\end
			\ans,"^log"
				\sub,@@!Avg_DebugVoiceListOutAdd,self
				\sub,@@!Avg_DebugSaveFragListADD,self
			
		\end
		\scp,Debug_List_DebugSelect \dd,0
		\jmp,@@!Avg_DebugSelectUseList_commandonly_proces
	\end
	
	
	
	\scp,Debug_List_DebugSelect \dd,0
	\jmp,@@!Avg_DebugSelectUseList_commandonly_proces
	
\ret




@@!Avg_DebugAutoSelectListFile

	\case,ParamStr[0]
		\ans,"load"
			\sub,@@!Avg_DebugLoadAutoSelectList
		\ans,"save",""
			\sub,@@!Avg_DebugSaveAutoSelectList
	\end


\ret


@@!Avg_DebugSelectUseList_Label
	\var,list,tmplist
	
	\if,Debug_Label_DebugSelect!=""\then
		\scp,tmplist	\asn,Debug_List_DebugSelect
		
		\scp,Debug_List_DebugSelect
		\i
		\l,Debug_Enable_DebugSelectUseList

			\for							
				\scp,Debug_List_DebugSelect	\?c
				\if,ResultInt[0]==0\then
					\scp,Debug_List_DebugSelect \asn,tmplist
					\ret
				\end
			
				\scp,Debug_List_DebugSelect \?s,0
				\if,Debug_Label_DebugSelect==ResultStr[0]\then
					\scp,Debug_List_DebugSelect \dd,0
					\brk
				\end
				
				\scp,Debug_List_DebugSelect \dd,0
			\end
		
		
		\vexs,Debug_ForceSkip_DebugSelect	
		\if,ResultInt[0]!=0\then		
	
			\srct,1
			\scp,sys	\p,3
			\srct,0
		\end
			
	\end


\ret


@@!Avg_DebugSaveAutoSelectList

	
	\scp,sys	\?ver
	\if,ResultInt[0]==1\then
		\ret
	\end
	
	\var,str,p
	\scp,misc \gsf,$1000
	\cal,p=ResultStr[0]
	\scp,Debug_List_DebugSelect
	\stf,p+"オート選択肢.txt",0
\ret

@@!Avg_DebugLoadAutoSelectList


	
	\scp,sys	\?ver
	\if,ResultInt[0]==1\then 
		\ret
	\end
	
	\var,str,p
	\scp,misc \gsf,$1000
	\cal,p=ResultStr[0]
	\scp,Debug_List_DebugSelect
	\i
	\lff,p+"オート選択肢.txt",0

\ret


@@!Avg_DebugVoiceListOutAdd
	
	
	\scp,sys	\?ver
	\if,ResultInt[0]==1\then
		\ret
	\end
	
	\vexs,AVG_DebugVoiceList
	\if,ResultInt[0]==0\then
		\ret
	\end
	
	\var,list,sl
	\var,str,filename
	\var,int,i,pnum
	\scp,misc \gsf,$1000
	\cal,filename=ResultStr[0]
	\cal,filename=filename+"ボイス抜けリストログ.txt"
	
	\scp,sl
	\lff,filename
	
	\scp,AVG_DebugVoiceList
	\?c
	\cal,pnum=ResultInt[0]
	\for,i=0,i<pnum,i=i++
		\scp,AVG_DebugVoiceList	\?s,i
		\scp,sl	\a,ResultStr[0]
	\end	
	
	
		
	\scp,sl
	\stf,filename

\ret




@@!Avg_DebugSaveFragList

	
	\scp,sys	\?ver
	\if,ResultInt[0]==1\then
		\ret
	\end
	
	\var,str,p
	\scp,misc \gsf,$1000
	\cal,p=ResultStr[0]
	\scp,_FlagList
	\stf,p+"フラグリスト.txt",0
\ret

@@!Avg_DebugSaveFragListADD
	
	
	\scp,sys	\?ver
	\if,ResultInt[0]==1\then
		\ret
	\end
		
	\var,list,sl
	\var,str,filename
	\var,int,i,pnum
	\scp,misc \gsf,$1000
	\cal,filename=ResultStr[0]
	\cal,filename=filename+"フラグリストログ.txt"
	
	\scp,sl
	\lff,filename
	
	\scp,_FlagList
	\?c
	\cal,pnum=ResultInt[0]
	\for,i=0,i<pnum,i=i++
		\scp,_FlagList	\?s,i
		\scp,sl	\a,ResultStr[0]
	\end	
	
	
		
	\scp,sl
	\stf,filename

\ret


@@!Avg_DebugLoadFragList


	
	\scp,sys	\?ver
	\if,ResultInt[0]==1\then
		\ret
	\end
	
	\var,str,p
	\scp,misc \gsf,$1000
	\cal,p=ResultStr[0]
	\scp,_FlagList
	\i
	\lff,p+"フラグリスト.txt",0

\ret





@@!Avg_DebugSaveSelectListADD
	
	
	\scp,sys	\?ver
	\if,ResultInt[0]==1\then
		\ret
	\end
		
	\var,list,sl
	\var,str,filename
	\var,int,i,pnum
	\scp,misc \gsf,$1000
	\cal,filename=ResultStr[0]
	\cal,filename=filename+"選択肢リスト.txt"
	
	\scp,sl
	\lff,filename
	
	\scp,Debug_SelectListCount
	\?c
	\cal,pnum=ResultInt[0]
	\for,i=0,i<pnum,i=i++
		\scp,Debug_SelectListCount	\?s,i
		\scp,sl	\a,ResultStr[0]
	\end	
	
	
		
	\scp,sl
	\stf,filename

\ret

