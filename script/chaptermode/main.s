
@@@!Layout.s
@@@!memoryfunc.s

@@@!Script\ModeCommon\Layout.s
@@@!Script\ModeCommon\common.s


@@Top
@@!Top
	
	\sub,@@!SoundPlay
	\sub,@@!CreateInterface
@@!Select
	\stop,@@!OnStopEvent
	\jmp,ResultBtnStr[0]

@@!Cancel
	
	\sub,@@!SoundStop
	\scp,eff	\c
	\sub,@@!FreeInterface,self
	\scp,eff	\fdi,0,300
	\clk,500
	\go,@@!Top,"Script\Title\main.s"

@@!PageInc
	\cal,#ModePageIndex=#ModePageIndex+ResultBtnInt[0]
	\cal,#ModePageIndex=(#ModePageIndex+PageCount)%PageCount
	\jmp,@@!PageChange

@@!Page
	\cal,#ModePageIndex=ResultBtnInt[0]
	\jmp,@@!PageChange

@@!PageChange
	\scp,eff	\c
	\sub,@@!LoadList
	\sub,@@!PageCheck,,"change"
	\sub,@@!ButtonCheck
	\sub,@@!ScrollCheck
	\if,ResultInt[1]<1000\then

		\scp,eff	\fdi,0,400
	\else
		\scp,eff	\fdi,0,400
	\end
	\zero
	\clk,200
	\jmp,@@!Select
	
@@!Thum
	\sub,@@!Replay
	\jmp,@@!Select


@@!Swipe
	\scp,ScrollBar
		\?v
		\v,ResultInt[0]+ResultBtnInt[0]
	\sub,@@!SetupPos,,0
	\jmp,@@!Select

@@!ScrollInc
	\scp,ScrollBar
		\?v
		\v,ResultInt[0]+ResultBtnInt[0]
@@!Scroll
	\sub,@@!SetupPos,,150
	\jmp,@@!Select


@@!CGPage
	\scp,eff	\c,999
	\sub,@@!FreeInterface
	\cal,#ModePageIndex=ResultBtnInt[0]
	\jmp,@@!Top,"Script\AlbumMode\main.s"
	
@@!ScenePage
	\scp,eff	\c,999
	\sub,@@!FreeInterface
	\cal,#ModePageIndex=ResultBtnInt[0]
	\jmp,@@!Top,"Script\MemoryMode\main.s"
	
@@!ChapterPage	
	\sub,@@!Page
	
@@!BGMPage
	\scp,eff	\c,999
	\sub,@@!FreeInterface
	\cal,#ModePageIndex=ResultBtnInt[0]
	\jmp,@@!Top,"Script\MusicMode\main.s"

@@!SongPage
	\scp,eff	\c,999
	\sub,@@!FreeInterface
	\cal,#ModePageIndex=ResultBtnInt[0]
	\jmp,@@!Top,"Script\SongMode\main.s"
	
	

@@!SetupPos
	\var,int,y,a,t,n
	\var,int,i
	
	\cal,t=ParamInt[0]
	\scp,Scrollbar	\?v
	\cal,y=ResultInt[0]
	\if,_my==y\then
		\ret
	\end
	
	\cal,_my=y
	\scp,Anchor
		\mm,_mmOutQuart		\p,0,-_my,0,t
\ret


@@!OnStopEvent
	
	\scp,inp	\gsc
	\if,ResultObj[0]!=null \then
		\cal,ResultBtnStr[0]=ResultStr[0],ResultBtnStr[1]=ResultStr[1]
		\play
		\ret
	\end
	
	\scp,inp	\gbc
	\if,ResultObj[0]!=null \then
		\cal,ResultBtnStr[0]=ResultStr[0],ResultBtnStr[1]=ResultStr[1],ResultBtnInt[0]=ResultInt[0]
		\play
		\ret
	\end
	
	\scp,inp	\k2,$10002,$1001B,$10008,$00021,$00022
	\case,ResultInt[0]
		\ans,$10002,$1001B,$10008
			\cal,ResultBtnStr[0]="@@!Cancel"
			\play
		\ans,$00021		
			\cal,ResultBtnStr[0]="@@!ScrollInc",ResultBtnInt[0]=-_bh
			\play	\ret
		\ans,$00022,	
			\cal,ResultBtnStr[0]="@@!ScrollInc",ResultBtnInt[0]=+_bh
			\play	\ret
	\end
	
	\scp,inp	\k2,$400F0,$400F1
	\case,ResultInt[0]
		\ans,$400F0,$400F1
			\scp,inp	\?mw
			\cal,ResultBtnStr[0]="@@!ScrollInc",ResultBtnInt[0]=-ResultInt[0]
			\play	\ret
	\end
	
	\scp,inp	\?swp,1
	\if,ResultInt[4]!=0\then
		\if,ResultInt[7]!=0\then
			\cal,ResultBtnStr[0]="@@!Swipe",ResultBtnInt[0]=-ResultInt[7]
			\play	\ret
		\end
	\end
	
	
	












\ret



@@!ScrollCheck
	\var,int,a
	\cal,a=((ThumCount+3)/4)*_bh-540
	\if,a>0\then
		\scp,ScrollBar
			\mv,a
			\v,0,1
			\lk,0
		\scp,UpDownButton[0]	\lk,0
		\scp,UpDownButton[1]	\lk,0
	\else
		\scp,ScrollBar
			\mv,0
			\v,0,1
			\lk,1
		\scp,UpDownButton[0]	\lk,1
		\scp,UpDownButton[1]	\lk,1
	\end
	\cal,_my=0
	\scp,Anchor	\p,0,0,0
\ret


@@!PageCheck
	\sub,@@!Common_Setup
\ret

@@!ButtonCheck
	\del,ThumButton,ThumNoText
	\gvar,btn,ThumButton[ThumCount]
	
	\var,int,i,n,a,xx,yy
	\var,str,ss,th
	\cal,n=ThumCount
	\for,i=0,i<n,i++
		\scp,ThumList	\?s,i
		\cal,ss=ResultStr[0]
		\if,ss!=""\then
			\if,ThumEnable[i]>0\then
				\div,",",ss,1
				\cal,th="Thumbnail\"+ResultStr[0]+".png"
				\scp,ThumButton[i]
					\i
					\l,"ThumButton.b"
				\fexs,th
				\if,ResultInt[0]==1\then
					\li,0,th
				\end
					
					\ls,1,"misc\Sys_OnClick.wav"
					\vtn,3
					\us,"@@!Thum"
					\ui,i
					\lk,0
					
					
					\e
					\m,"*Enable"
			\else
				\scp,ThumButton[i]
					\i
					\l,"ThumButton.b"
					\us,"@@!Thum"
					\ui,i
					\lk,1
					
					\e
					\m,"*OnLock"
			\end
		\else
			\scp,ThumButton[i]	\d
		\end
		
		
		\scp,ThumButton[i]	\anc,Anchor		
		
		\cal,xx=i%7,yy=i/7
		\cal,xx=xx*165,yy=yy*227
		\scp,ThumButton[i]	\p,_bx+xx,_by+yy,50
	\end
\ret

@@!LoadList
	
	\scp,ThumList
		\i
	\fmt,"List%d.txt",#ModePageIndex-2
		\l,ResultStr[0]
	
	\var,int,i
	\scp,ThumList	\?c
	\cal,ThumCount=ResultInt[0]
	\for,i=0,i<ThumCount,i++

		\cal,ThumEnable[i]=1







	\end
\ret





@@!ReadCheck
	\sub,@@!MakeFilename,self,ParamStr[0]
	
	\fexs,ResultFile
	\if,ResultInt[0]==0\then
		\ddlg,"ファイルが存在しません："+ResultFile
	\end
\ret



@@!MakeFilename
	\div,",",ParamStr[0]	
	\cal,ResultImage=ResultStr[0]
	\cal,ResultLabel=ResultStr[1]
	\cal,ResultFile="Scenario\"+ResultStr[2]+".s"
	\cal,ResultOption1=ResultStr[3]
	\scp,llog	\g,ResultFile+ResultLabel
	\cal,ResultLabelCount=ResultInt[0]
	
	\vexs,#ModeAllOpen
	\if,ResultInt[0]>0\then
		\cal,ResultLabelCount=100
	\end
\ret


@@!SoundPlay
	\scp,snd[0]
		\i
		\l,"bgm\kakeochi_bgm04.ogg"
		\v,256
		\vtn,0
		\p,1
\ret

@@!SoundStop
	\scp,snd[0]
		\v,0,250
\ret


@@!CreateInterface
	\scp,eff	\c
	
	\scp,inp	\bsv,1,5
	\scp,inp	\swe,1
	\sub,@@!SetSystemKey
	\scp,sys	\lk,$FFFF-_lkScreen
	
	\gvar,int,PageCount
	\gvar,int,ThumCount,ThumEnable[64]
	\gvar,list,ThumList
	\gvar,str,ResultImage,ResultFile,ResultLabel
	\gvar,int,ResultLabelCount,ResultOption1
	
	\cal,PageCount=7
	\if,#ModePageIndex>=PageCount\then
		\cal,#ModePageIndex=7
	\end
	
	\gvar,int,_bh,_bx,_by
	\cal,_bh=165
	
	\sub,@@!Layout_Common_Create
	\sub,@@!Layout_Create
	
	\sub,@@!Common_Create
	
	\sub,@@!LoadList
	
	\var,int,n1,n2,n3,i
	\for,i=0,i<ThumCount,i++
		\cal,n2=n2+1
		\cal,n1=n1+(ThumEnable[i]>0)
	\end
	
	
	
	
	
	
	
	
	\scp,TempThumButton	\?p
	\cal,_bx=ResultInt[0],_by=ResultInt[1]
	\gvar,int,_my
	
	\gvar,img,Anchor
	\scp,Anchor
		\pri,1
		\p,0,0,0
	
	\sub,@@!PageCheck,,"def"
	\sub,@@!ButtonCheck
	\sub,@@!ScrollCheck
	
	\scp,ScrollBar	\v,ParamInt[1]
	\sub,@@!SetupPos,,0
	
	\zero
	\scp,eff	\?c		
	\if,ResultInt[1]<1000\then

		\scp,eff	\fdi,0,400
	\else
		\scp,eff	\fdi,0,400
	\end
	\clk,500
\ret

@@!FreeInterface
	\scp,eff	\c
	\del,PageCount,DispCount
	\del,ThumEnable,ThumCount
	\del,ThumList
	\del,ResultImage,ResultFile,ResultLabel
	\del,ResultLabelCount,ResultOption1
	
	\del,ThumButton
	\del,_bh,_bx,_by,_my
	\del,Anchor
	
	\sub,@@!Layout_Free
	\sub,@@!Layout_Common_Free
	\if,ParamInt[0]==1\then
		\scp,eff	\fdi,0,250
		\clk,300
	\end
	\scp,skey	\i
	\scp,inp	\swe,0
\ret

@@!SetSystemKey
	\scp,skey
		\i
		\a,$10001,"click"
		\a,$0000D,"click"
		\a,$0200D,"screen"				
		
		
		
		
		
		
		
		
	\scp,inp	\bsv,1,5
	\scp,skey
		\a,$00025,"SelectLeft"		
		\a,$00026,"SelectUp"		
		\a,$00027,"SelectRight"		
		\a,$00028,"SelectDown"		
\ret

@@!Replay
	\var,str,f,l,opt
	\var,int,p,sp
	\scp,ThumList	\?s,ResultBtnInt[0]
	\sub,@@!MakeFilename,self,ResultStr[0]
	\cal,l=ResultLabel
	\cal,f=ResultFile
	\cal,opt=ResultOption1
	\scp,ScrollBar	\?v
	\cal,sp=ResultInt[0]
	\scp,eff	\c
	\scp,snd[0]	\v,0,400
	\sub,@@!FreeInterface
	\zero
	\scp,eff	\fdi,0,500
	\clk,750
	\scp,snd[0]	\i
	
	\sub,@@!ReplayFunc,"memoryfunc.s",f,l
	
	\scp,eff	\c
	\sub,@@!SoundPlay
	\sub,@@!CreateInterface,,"",sp
\ret
