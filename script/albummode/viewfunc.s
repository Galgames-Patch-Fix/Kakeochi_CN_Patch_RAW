
@@@!Layout_View.s




@@!View
	\sub,@@!View_SetSystemKey
	\scp,eff	\bg,$FFFFFF
	\gvar,img,CgImage
	\gvar,int,Zoom,MoveAx,MoveAy
	\gvar,int,ImageWidth,ImageHeight,view_mx,view_my
	\gvar,int,CgListIndex
	\cal,Zoom=1
	\sub,@@!Layout_AlbumView_Create
	
	\scp,ThumList	\?s,ResultBtnInt[0]
	\sub,@@!MakeFilename,self,ResultStr[0]
	
	\cal,CgListIndex=-1
	\sub,@@!View_SerchIndex,self,1
	
	\scp,CgImage
		\i
		\p,1280/2,720/2,0
		\in,$10000
		\out,$10000
		\alg,1,1	
		\mm,3,100
		\tf,2
@@!View_Disp
	
	\sub,@@!View_FileLoad,,ResultFilename[CgListIndex]
	\sub,@@!ViewSetup
	\sub,@@!ViewRefreshImagePos,,0
	\zero
	\scp,eff	\fdi,0,200,,999
@@!ViewSelect
	\stop,@@!OnStopEventView
	\jmp,ResultBtnStr[0]

@@!View_FileLoad
	\scp,CgImage
		\l,ParamStr[0]
		\e
\ret

@@!View_Step
	\if,ResultFilenameCount==1\then
		\jmp,@@!ViewSelect
	\end
	\scp,eff	\c,999
	\sub,@@!View_SerchIndex,self,ResultbtnInt[0]
	\jmp,@@!View_Disp

@@!View_Zoom
	\if,zoom==1\then
		\cal,zoom=2
	\else
		\cal,zoom=1
	\end
	\sub,@@!ViewSetup
	\sub,@@!ViewRefreshImagePos,,100
	\jmp,@@!ViewSelect

@@!View_Quit
	\if,zoom==2\then
		\jmp,@@!View_Zoom
		\clk,100
	\end
	\scp,eff	\c
	\scp,eff	\bg,$000000
	\scp,inp	\swe,1,1
	\sub,@@!Layout_AlbumView_Free
	\del,CgListIndex
	\del,CgImage
	\del,Zoom
	\del,MoveAx,MoveAy
	\del,ImageWidth,ImageHeight,view_mx,view_my
\ret


@@!View_SerchIndex
	\var,int,n
	\cal,n=CgListIndex
	
	\for
		\cal,n=n+ParamInt[0]
		\cal,n=(n+ResultFilenameCount) % ResultFilenameCount
		\if,ResultFilenameEnable[n]==1\then
			\brk
		\end
	\end
	\cal,CgListIndex=n
\ret

@@!ViewSetup
	
	\scp,CgImage	\?wh
	\cal,ImageWidth=ResultInt[0],ImageHeight=ResultInt[1]
	\cal,MoveAx=(ResultInt[0]*Zoom-1280)/2
	\cal,MoveAy=(ResultInt[1]*Zoom-720)/2	
	\if,MoveAx<0\then
		\cal,MoveAx=0
	\end
	\if,MoveAy<0\then
		\cal,MoveAy=0
	\end
	
	\if,(MoveAX<10)&&(MoveAY<10)\then
		\scp,inp	\swe,1,0
	\else
		\scp,inp	\swe,1,1
	\end
	
	\scp,View_PageIndexText
		\cc
	\fmt,"[pc,%d/",CgListIndex+1,"%d]",ResultFilenameCount
		\o,ResultStr[0]
		\mc
\ret

@@!ViewMouseMove
	\scp,inp	\mp
	\cal,view_mx=(ResultInt[0]-640)*MoveAx/640
	\cal,view_my=(ResultInt[1]-360)*MoveAy/360
	\sub,@@!ViewRefreshImagePos,,paramInt[0]
\ret

@@!ViewSwipeMove
	
	\scp,inp	\?swp
	\if,ResultInt[4]==0\then
		\ret
	\end
	\cal,view_mx=view_mx-ResultInt[6]
	\cal,view_my=view_my-ResultInt[7]
	
	\sub,@@!ViewRefreshImagePos,,0
\ret

@@!ViewRefreshImagePos
	\if,view_mx<-MoveAx\then
		\cal,view_mx=-MoveAx
	\end
	\if,view_mx>MoveAx\then
		\cal,view_mx=MoveAx
	\end
	\if,view_my<-MoveAy\then
		\cal,view_my=-MoveAy
	\end
	\if,view_my>MoveAy\then
		\cal,view_my=MoveAy
	\end
	
	\scp,CgImage
		\mm,3
		\p2,640-view_mx,360-view_my,0,100*Zoom,100*Zoom,ParamInt[0]
\ret


@@!OnStopEventView
	
	\scp,inp	\sc
	\if,ResultInt[0]==1\then
		\if,ResultFilenameEnable[CgListIndex+1]==0\then
			\cal,ResultBtnStr[0]="@@!View_Quit"
			\play	\ret
		\else
			\cal,ResultBtnStr[0]="@@!View_Step",ResultBtnInt[0]=1
			\play	\ret
		\end
	\end
	
	\scp,inp	\gbc
	\if,ResultObj[0]!=null \then
		\cal,ResultBtnStr[0]=ResultStr[0],ResultBtnStr[1]=ResultStr[1],ResultBtnInt[0]=ResultInt[0]
		\play
		\ret
	\end
	
	\scp,inp	\k2,$10002,$1001B,$10008,$10004		
	\case,ResultInt[0]
		\ans,$10004
			\cal,ResultBtnStr[0]="@@!View_Zoom"
			\play	\ret
		\ans,$10002,$1001B,$10008
			\cal,ResultBtnStr[0]="@@!View_Quit"
			\play	\ret
	\end
	
	\scp,inp	\k2,$400F0,$400F1,$10025,$10027,$10026,$10028,$10011
	\case,ResultInt[0]
		\ans,$400F0,$10025,$10026
			\cal,ResultBtnStr[0]="@@!View_Step",ResultBtnInt[0]=-1
			\play	\ret
		\ans,$400F1,$10027,$10028,$10011
			\cal,ResultBtnStr[0]="@@!View_Step",ResultBtnInt[0]=1
			\play	\ret
	\end
	
	\sub,@@!ViewSwipeMove
	
\ret

@@!View_SetSystemKey
	\scp,skey
		\i
		\a,$10001,"click"
		\a,$0000D,"click"
		\a,$0200D,"screen"				
\ret
