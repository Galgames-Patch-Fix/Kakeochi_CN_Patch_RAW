




@@@!Script\Dialog\main.s
@@@!Script\ModeCommon\common.s
@@@!Layout.s


@@Top
@@!Top
@@!Main
	\sub,@@!InterfaceCreate

	\clk,500
	\sub,@@!VoiceCall
	\clk,1500
	\sub,@@!ShowButton
@@!SelectPage
	\stop,@@!OnStopEvent
	\clk,250
	\jmp,ResultBtnStr[0]


@@!Start
	\scp,eff	\c

	\scp,snd[0]	\v,0,3000
	\sub,@@!InterfaceFree
	\scp,eff	\fdi,0,1000
	\zero

	\clk,1000
	\scp,skey	\i
	\scp,eff	\i
	\scp,snd[0]	\i
	\scp,snd[1]	\i
	\go,@@Top,"Scenario\Root.s"		


@@!Quit
	\thrd,1,@@!Quit
	\jmp,@@!SelectPage


@@!Load
	\gvar,int,SystemButtonResetLock
	\thrd,1,@@!Load
	\del,SystemButtonResetLock
	\jmp,@@!SelectPage


@@!Continue
	\thrd,1,@@!ContinueFormClose
	
	\jmp,@@!SelectPage


@@!Config
	\gvar,int,SystemButtonResetLock
	\thrd,1,@@!Config
	\del,SystemButtonResetLock
	\jmp,@@!SelectPage


@@!Extra
	\scp,eff	\c
	\scp,snd[0]	\v,0,250
	\sub,@@!InterfaceFree
	\scp,eff	\fdi,0,300
	\zero
	\clk,500
	\scp,skey	\i
	\scp,eff	\i
	\scp,snd[0]	\i
	\scp,snd[1]	\i
	\sub,@@!Common_Create
	\if,#ModePageIndex<1\then
		\go,@@!top,"Script\AlbumMode\main.s"
	\end
	\if,#ModePageIndex<2\then
		\go,@@!top,"Script\MemoryMode\main.s"
	\end
	\if,#ModePageIndex<3\then
		\go,@@!top,"Script\ChapterMode\main.s"
	\end



	\jmp,@@!top


@@!OnStopEvent
	
	\scp,inp	\gbc
	\if,ResultObj[0]!=null \then
		\cal,ResultBtnStr[0]=ResultStr[0],ResultBtnStr[1]=ResultStr[1],ResultBtnInt[0]=ResultInt[0]
		\play	\ret
	\end
\ret


@@!InterfaceCreate
	
	\sub,@@!SetupSystemKey
	\scp,sys	\lk,$FFFF-_lkScreen-_lkLoad-_lkConfig
	
	\scp,eff	\c
	
	\sub,@@!Layout_Create
	\sub,@@!ButtonLock
	\scp,BackImage	\d	
	
	\scp,snd[0]
		\i
		\l,"bgm\kakeochi_bgm02.ogg"
		\vtn,0
		\v,256
		\p,1
	\zero
	\sub,@@!SoundSync
	\scp,BackImage	\e
	\scp,eff	\fdi,0,250
\ret

@@!InterfaceFree
	\sub,@@!Layout_Free
	\del,GameImage
\ret

@@!SetupSystemKey
	\scp,skey
		\i
		\a,$10001,"click"
		\a,$0000D,"click"
		\a,$00025,"SelectTabPrev"		
		\a,$00026,"SelectTab100Prev"	
		\a,$00027,"SelectTabNext"		
		\a,$00028,"SelectTab100Next"	
		\a,$0200D,"screen"				
\ret

@@!VoiceCall
	\var,int,a
	\var,str,f
	\scp,math	\rnd,$FFFFFF
	\cal,a=ResultInt[0]%4
	\case,a
		\of,0	\cal,f="voice\title_call.ogg"
		\of,1	\cal,f="voice\title_call.ogg"
		\of,2	\cal,f="voice\title_call.ogg"
		\of,3	\cal,f="voice\title_call.ogg"
	\end
	\fexs,f
	\if,ResultInt[0]\then
		\scp,snd[1]
			\i
			\l,f
			\vtn,_stVoice
			\v,256
			\p
	\end
\ret


@@!ShowButton
	\var,int,i,n
	\garr,Button	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,Button[i]	\e
		\clk,50
	\end
\ret

@@!SoundSync
	\var,int,i
	\for,i=0,i<60,i++
		\scp,snd[0]	\?nt
		\if,ResultInt[0]>0\then
			\brk
		\end
		\draw,1	
	\end
\ret

@@!ButtonLock
	\if,#SPOpenflag==1\then
		
		\scp,Button[4]	\lk,0
	\else
		\scp,Button[4]	\lk,1
	\end
\ret

