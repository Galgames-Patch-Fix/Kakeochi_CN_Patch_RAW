





@@@!Script\Dialog\main.s


@@Top
@@!Top
	\sub,@@!InterfaceCreate
	\sub,@@!Resume
	\sub,@@!InterfaceFree
	\jmp,@@!Top,"Script\Sequence\OnLoad.s"


@@!Resume
	\sub,@@!DialogShowMessage,,"サスペンドから復帰します。",1000
	
	\var,str,f
	\cal,f=#SystemSuspendFile
	\cal,#SystemSuspendFile=""
	
	\srct,1
		\scp,dat	\l,f
	\srct,0
	\zero	
\ret


@@!InterfaceCreate
	
	\scp,skey
		\a,$10001,"click"
		\a,$0000D,"click"
		\a,$0200D,"screen"				
	\scp,sys	\lk,$FFFF-_lkScreen
	
	\gvar,img,GameImage
	\scp,GameImage
		\i
		\l,"$$$GameThreadImageZ,65535.bmp"	
		\p,0,0,-10
		\e
\ret

@@!InterfaceFree
	\del,GameImage
\ret
