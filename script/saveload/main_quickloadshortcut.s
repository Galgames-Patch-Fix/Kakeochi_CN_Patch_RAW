




@@@!Script\Dialog\main.s
@@@!Misc\Misc.s
@@@!Common.s


@@Top
@@!Top
@@!Main
	\sub,@@!CreateInterface
	\sub,@@!Common_QuickLoad
	\if,ResultInt[0]==1\then
		\scp,eff	\c
		\sub,@@!FreeInterface
		\go,@@!Top,"Script\Sequence\OnLoad.s"
	\end
	\sub,@@!FreeInterface
\thrd,0




@@!CreateInterface
	
	\scp,skey
		\i
		\a,$10001,"click"
		\a,$0000D,"click"
		\a,$00011,"KeyClick"
		\a,$00025,"SelectTabPrev"		
		\a,$00026,"SelectTab100Prev"	
		\a,$00027,"SelectTabNext"		
		\a,$00028,"SelectTab100Next"	
	
	\gvar,img,GameImage
	\scp,GameImage
		\i
		\l,"$$$GameThreadImageZ,65535.bmp"	
		\p,0,0,-10
		\fo,0,"blur,4,4"
		\e
	\scp,eff	\i
\ret

@@!FreeInterface
	\del,GameImage
\ret
