
@@!ShowSystemInfo_SystemState
	\var,int,i
	\var,str,s,f
	\var,list,sl
	
	\for,i=0,i<8,i++
		\fmt,"SystemState%d.txt",i
		\cal,f=ResultStr[0]
		\fexs,f
		\if,ResultInt[0]==1\then
			\scp,sl
				\i
				\l,f
				\?s,0
			\if,s!=""\then
				\cal,s=s+" / "
			\end
			\cal,s=s+ResultStr[0]
		\end
	\end
	\if,s==""\then
		\cal,ResultStr[0]="none"
	\else
		\cal,ResultStr[0]=s
	\end
\ret


@@!ShowSystemInfo
	
	\var,list,sl,drives
	\var,str,s,d
	\var,int,i,n,a
	
	\scp,sl		\a,"■Application"
	\scp,misc	\gcd
	\scp,sl		\a,"Path : "+ResultStr[0]
	\scp,misc	\fsha,self
	\scp,sl		\a,"Hash : "+ResultStr[0]
	\cal,s=""
	\for,i=0,i<16,i++
		\scp,misc	\glpk,i
		\if,ResultInt[0]==1\then
			\if,s!=""\then
				\cal,s=s+","
			\end
			\fmt,"%d",i
			\cal,s=s+ResultStr[0]
		\end
	\end
	\scp,sl		\a,"PackageList : "+s
	\sub,@@!ShowSystemInfo_SystemState
	\scp,sl		\a,"SystemState : "+ResultStr[0]
	\scp,sl		\a,""
	
	\scp,sl		\a,"■Config"
	\scp,cfg	\?fs
	\if,ResultInt[0]==1\then
		\cal,ResultStr[0]="FullScreen"
	\else
		\cal,ResultStr[0]="Window"
	\end
	\scp,sl		\a,"ScreenMode : "+ResultStr[0]
	\scp,cfg	\?fdm
	\if,ResultInt[0]==1\then
		\cal,ResultStr[0]="Window Resize"
	\else
		\cal,ResultStr[0]="DirectX FullScreen"
	\end
	\scp,sl		\a,"FullScreenMode:"+ResultStr[0]
	\scp,sys	\?blt
	\case,ResultInt[0]
		\of,0	\cal,ResultStr[0]="Direct3D9 Linear"
		\of,1	\cal,ResultStr[0]="Direct3D9 SharpLinear"
		\of,2	\cal,ResultStr[0]="Direct3D9 Cubic"
		\of,3	\cal,ResultStr[0]="Direct3D9 Lanczos"
		\of,4	\cal,ResultStr[0]="windows32API BitBlt"
	\end
	\scp,sl		\a,"BltMode : "+ResultStr[0]
	\scp,cfg	\?fps
	\scp,sl		\a,"FPS : "+ResultInt[0]
	\scp,cfg	\?sb
	\cal,ResultInt[0]=ResultInt[0]/1024
	\scp,sl		\a,"StreamBuffer : "+ResultInt[0]+"K"
	\scp,cfg	\?cs
	\cal,ResultInt[0]=ResultInt[0]/(1024*1024)
	\scp,sl		\a,"CacheSize : "+ResultInt[0]+"M"
	
	\scp,sys	\?blt
	\cal,a=ResultInt[0]
	\scp,cfg	\?blt
	\if,a!=ResultInt[0]\then
		\scp,sl		\a,"[!] 転送モードがサポートされておらず、互換モードで動作しています"
	\end
	\scp,cfg	\?gim
	\if,ResultInt[0]==1\then
		\scp,sl		\a,"[!] 整数座標モードが有効になっています"
	\end
	\scp,cfg	\?sfs
	\if,ResultInt[0]==1\then
		\scp,sl		\a,"[!] スクリプトフレームスキップが有効になっています"
	\end
	\scp,sl		\a,""
	
	\scp,sl		\a,"■OS"
	\scp,misc	\info,"OS,Name"
	\scp,sl		\a,"Name : "+ResultStr[0]
	\scp,misc	\info,"OS,CSDVersion"
	\scp,sl		\a,"CSDVersion : "+ResultStr[0]
	\scp,misc	\info,"OS,Build"
	\scp,sl		\a,"Build : "+ResultStr[0]
	\scp,sl		\a,""
	
	\scp,sl		\a,"■DirectX"
	\scp,misc	\info,"DirectX,Version"
	\scp,sl		\a,"Version : "+ResultStr[0]+"以上"
	\scp,misc	\info,"File,FileVersion,ddraw.dll"
	\scp,sl		\a,"ddraw.dll : "+ResultStr[0]
	\scp,misc	\info,"File,FileVersion,dsound.dll"
	\scp,sl		\a,"dsound.dll : "+ResultStr[0]
	\scp,misc	\info,"File,FileVersion,dinput.dll"
	\scp,sl		\a,"dinput.dll : "+ResultStr[0]
	\scp,misc	\info,"File,FileVersion,d3d8.dll"
	\scp,sl		\a,"d3d8.dll : "+ResultStr[0]
	\scp,misc	\info,"File,FileVersion,d3d9.dll"
	\scp,sl		\a,"d3d9.dll : "+ResultStr[0]
	\scp,sl		\a,""
	
	\scp,sl		\a,"■CPU"
	\scp,misc	\info,"CPU,Name"
	\scp,sl		\a,"Name : "+ResultStr[0]
	\scp,misc	\info,"CPU,Vender"
	\scp,sl		\a,"Vender : "+ResultStr[0]
	\scp,misc	\info,"CPU,Clock"
	\scp,sl		\a,"Clock : "+ResultStr[0]+"MHz"
	\scp,misc	\info,"CPU,Famiry"
	\scp,sl		\a,"Famiry : "+ResultStr[0]
	\scp,misc	\info,"CPU,Model"
	\scp,sl		\a,"Model : "+ResultStr[0]
	\scp,misc	\info,"CPU,Stepping"
	\scp,sl		\a,"Stepping : "+ResultStr[0]
	\scp,misc	\info,"CPU,MMX"
	\scp,sl		\a,"MMX : "+ResultStr[0]
	\scp,misc	\info,"CPU,SSE"
	\scp,sl		\a,"SSE : "+ResultStr[0]
	\scp,misc	\info,"CPU,SSE2"
	\scp,sl		\a,"SSE2 : "+ResultStr[0]
	\scp,misc	\info,"CPU,SSE3"
	\scp,sl		\a,"SSE3 : "+ResultStr[0]
	\scp,misc	\info,"CPU,3DNow"
	\scp,sl		\a,"3DNow : "+ResultStr[0]
	\scp,misc	\info,"CPU,3DNow+"
	\scp,sl		\a,"3DNow+ : "+ResultStr[0]
	\scp,misc	\info,"CPU,HTT"
	\scp,sl		\a,"HTT : "+ResultStr[0]
	\scp,misc	\info,"CPU,x8664"
	\scp,sl		\a,"x88664 : "+ResultStr[0]
	\scp,sl		\a,""
	
	\scp,sl		\a,"■Memory"
	\scp,misc	\info,"MEM,AvailMemory"
	\scp,sl		\a,"MEM-Avail : "+ResultStr[0]+"M"
	\scp,misc	\info,"MEM,TotalMemory"
	\scp,sl		\a,"MEM-Total : "+ResultStr[0]+"M"
	\scp,misc	\info,"MEM,AvailPage"
	\scp,sl		\a,"PAGE-Avail : "+ResultStr[0]+"M"
	\scp,misc	\info,"MEM,TotalPage"
	\scp,sl		\a,"PAGE-Total : "+ResultStr[0]+"M"
	\scp,sl		\a,""
	
	\scp,sl		\a,"■Display"
	\scp,misc	\info,"DISPLAY,Name,0"
	\scp,sl		\a,"Name : "+ResultStr[0]
	\scp,misc	\info,"DISPLAY,Width"	\cal,s=ResultStr[0]
	\scp,misc	\info,"DISPLAY,Height"	\cal,s=s+"x"+ResultStr[0]
	\scp,sl		\a,"Size : "+s
	\scp,misc	\info,"DISPLAY,Color"
	\scp,sl		\a,"Color : "+ResultStr[0]
	\scp,misc	\info,"DISPLAY,Refresh"
	\scp,sl		\a,"Refresh : "+ResultStr[0]
	\scp,sl		\a,""
	
	\scp,sl		\a,"■Sound"
	\scp,misc	\info,"SOUND,Name,0"
	\scp,sl		\a,"Name : "+ResultStr[0]
	\scp,sl		\a,""
	
	\scp,sl		\a,"■Drive"
	\scp,misc	\info,"DRIVE,drives"
	\scp,drives
		\i
		\ad,",",ResultStr[0],0,0	
	\scp,drives
		\?c
	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,drives
			\?s,i
		\cal,d=ResultStr[0]	
		\cal,s="["+d+":\] "
		\scp,misc	\info,"DRIVE,Name,"+d
		\if,ResultStr[0]==""\then
			\cal,s=s+"N/A"
		\else
			\cal,s=s+ResultStr[0]
		\end
		\scp,sl		\a,"Name : "+s
		\scp,misc	\info,"DRIVE,Type,"+d
		\scp,sl		\a,"Type : "+ResultStr[0]
		\scp,misc	\info,"DRIVE,FileSystem,"+d
		\scp,sl		\a,"FileSystem : "+ResultStr[0]
		\scp,misc	\info,"DRIVE,Avail,"+d
		\scp,sl		\a,"Avail : "+ResultStr[0]+"M"
		\scp,misc	\info,"DRIVE,Total,"+d
		\scp,sl		\a,"Total : "+ResultStr[0]+"M"
		\scp,sl		\a,""
	\end
	
	
	\scp,dlgs
		\sl,sl,"","システム情報","クリップボードにコピー","","閉じる",0,400,500
	\del,sl
\ret

