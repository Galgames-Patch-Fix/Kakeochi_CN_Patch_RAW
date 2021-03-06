




@@!Imo_Base_Create
	
	\gvar,str,_DivItem,_DivParam
	\cal,_DivItem=",",_DivParam=":"
	
	\gvar,int,Imo_StreamChannel[16]
	\gvar,int,Imo_DirectChannel[16]
	
	\gvar,table,Imo_ImageFilterList
	\scp,Imo_ImageFilterList		\l,"ImoScripter_ImageFilterList.txt"		\sort
	
	\gvar,table,Imo_SoundFilterList
	\scp,Imo_SoundFilterList		\l,"ImoScripter_SoundFilterList.txt"		\sort
	
	\gvar,table,Imo_GeneratorFilterList
	\scp,Imo_GeneratorFilterList	\l,"ImoScripter_GeneratorFilterList.txt"	\sort
	
	\gvar,table,Imo_RepTextTable
	\scp,Imo_RepTextTable	\l,"ImoScripter_RepTextList.txt"	\sort
	
	\gvar,table,Imo_MoveModeList
	\scp,Imo_MoveModeList	\l,"ImoScripter_MoveModeList.txt"
	
	\gvar,table,Imo_BlendModeList
	\scp,Imo_BlendModeList	\l,"ImoScripter_BlendModeList.txt"
	
	\gvar,table,Imo_TexFilterList
	\scp,Imo_TexFilterList	\l,"ImoScripter_TextureFilterList.txt"
	\scp,Imo_Setting	\?v,"LinerFilterLightMode"
	\if,(ResultStr[0]=="1") || (ResultStr[0]=="")\then
		\scp,Imo_TexFilterList	\v,"linear",3	
	\end
	
	\gvar,table,Imo_GModeList
	\scp,Imo_GModeList		\l,"ImoScripter_GModeList.txt"
	\gvar,table,Imo_GFadeList
	\scp,Imo_GFadeList		\l,"ImoScripter_GFadeList.txt"
	
	\gvar,int,Imo_SentenceFlag
\ret

@@!Imo_Base_Free
	\del,Imo_StreamChannel
	\del,Imo_DirectChannel
	\del,_DivItem,_DivParam
	\del,Imo_ImageFilterList,Imo_SoundFilterList,Imo_GeneratorFilterList
	\del,Imo_RepTextTable
	\del,Imo_MoveModeList
	\del,Imo_BlendModeList
	\del,Imo_TexFilterList
	\del,Imo_SentenceFlag
	\del,Imo_GModeList,Imo_GFadeList
\ret


@@!Imo_Zero
	\scp,sys	\?skp
	\if,ResultInt[0]==0 || Imo_SentenceClickLock==1\then
		\zero
	\end
\ret



@@!Imo_TemplateExcute
	\var,obj,t
	\var,int,n
	
	\cal,t=ParamStr[1]
	\scp,t	\?c
	\cal,n=ResultInt[0]
	\if,n==0\then
		\cal,ResultStr[0]=ParamStr[0]
		\ret
	\end
	
	
	
	\scp,t
		\brep,ParamStr[0]	
		\brep,ResultStr[0]	
	
\ret



@@!Imo_FileSerch
	\var,str,f,ff
	\var,str,e[8]
	\var,int,i,j,n1,n2
	\var,list,sl
	
	
	\if,ParamStr[1]=="none" || ParamStr[1]==""\then
		\cal,ResultStr[0]=""
		\ret
	\end
	
	
	\pos,"%%%capture",ParamStr[1]
	\if,ResultInt[0]>0\then
		\rep,ParamStr[1],"%%%capture_","$$$GameThreadImageZ,"
		\cal,ResultStr[0]=ResultStr[0]+".bmp"
		\ret
	\end
	
	
	
	
	
	
	
	\rep,ParamStr[1],"/","\"
	\cal,f=ResultStr[0]
	\cal,n2=ParamCount-2
	\cal,e[0]=""
	\cal,e[1]=ParamStr[3]
	\cal,e[2]=ParamStr[4]
	\cal,e[3]=ParamStr[5]
	\cal,e[4]=ParamStr[6]
	\cal,e[5]=ParamStr[7]
	\cal,e[6]=ParamStr[8]
	\cal,e[7]=ParamStr[9]
	
	\scp,sl
		\ad,";",ParamStr[2]
		\?c
	\cal,n1=ResultInt[0]
	\for,i=0,i<n1,i++
		\scp,sl	\?s,i
		\cal,ff=ResultStr[0]+f
		\for,j=0,j<n2,j++
			\fexs,ff+e[j]
			\if,ResultInt[0]==1\then
				\cal,ResultStr[0]=ff+e[j]
				\ret
			\end
		\end
	\end
	
	\if,ParamInt[0]==1\then
		\derr,ParamStr[2]+f+"：ファイルが見つかりません。"
	\end
	\cal,ResultStr[0]=""
\ret


@@!Imo_GetEmptyStreamChannel
	\var,int,i
	\for,i=0,i<14,i++
		\if,Imo_StreamChannel[i]==0\then
			\cal,Imo_StreamChannel[i]=1
			\cal,ResultInt[0]=i
			\ret
		\end
	\end
	\derr,"ストリームチャンネルの空きがありません"
	\cal,ResultInt[0]=0
	\ret
\ret

@@!Imo_GetEmptyDirectChannel
	\var,int,i
	\for,i=0,i<14,i++
		\if,Imo_DirectChannel[i]==0\then
			\cal,Imo_DirectChannel[i]=1
			\cal,ResultInt[0]=i
			\ret
		\end
	\end
	\derr,"ダイレクトチャンネルの空きがありません"
	\cal,ResultInt[0]=0
	\ret
\ret


@@!Imo_LoadDefaultFile
	\var,str,f,p
	\var,obj,o
	
	\scp,Imo_Setting	\?v,"PathClear"
	\cal,p=ResultStr[0]
	
	\cal,o=ParamStr[0]
	\cal,f=p+ParamStr[1]
	\fexs,f
	\if,ResultInt[0]==1\then
		\var,table,t
		\scp,t	\l,f
		\scp,o	\comb,t
	\end
\ret

@@!Imo_FixFilterFormat
	\var,str,s
	\cal,s=ParamStr[0]
	
	\if,s==""\then
		\cal,ResultStr[0]=s
		\ret
	\end
	\if,s=="none"\then
		\cal,ResultStr[0]=s
		\ret
	\end
	
	
	\cpy,s,1,1
	\if,ResultStr[0]==#quot\then
		\rep,s,#quot,""
		\ret
	\end
	
	\rep,s,"[",""
	\rep,ResultStr[0],"]",""
	\rep,ResultStr[0],"/","\"
	\rep,ResultStr[0],"%","/"
	\rep,ResultStr[0],"+","\"
\ret



@@!Imo_ImageFilterOpConvert
	\var,str,s
	\cal,s=ParamStr[0]
	
	\if,s=="none"||s==""\then
		\cal,ResultStr[0]=""
		\ret
	\end
	
	
	\scp,Imo_ImageFilterList	\brep,s
	
	\sub,@@!Imo_FixFilterFormat,,ResultStr[0]	
\ret


@@!Imo_SoundFilterOpConvert
	\var,str,s
	\cal,s=ParamStr[0]
	
	\if,s=="none"||s==""\then
		\cal,ResultStr[0]=""
		\ret
	\end
	
	
	\scp,Imo_SoundFilterList	\brep,s
	
	\sub,@@!Imo_FixFilterFormat,,ResultStr[0]	
\ret


@@!Imo_GeneratorFilterOpConvert
	\var,str,s
	\cal,s=ParamStr[0]
	
	\if,s=="none"||s==""\then
		\cal,ResultStr[0]=""
		\ret
	\end
	
	
	\scp,Imo_GeneratorFilterList	\brep,s
	
	\sub,@@!Imo_FixFilterFormat,,ResultStr[0]	
\ret


@@!Imo_LoopStringConvert
	\var,str,s
	\var,int,r
	\cal,s=ParamStr[0]
	
	\stid,s,0	\cal,r=ResultInt[0]
	
	\if,s=="true"		\then	\cal,r=-1	\end
	\if,s=="infinity"	\then	\cal,r=-1	\end
	
	
	\scp,Imo_Project	\?v,"OldLoopCount",1
	\if,ResultInt[0]==1\then
		\if,r>0\then
			\cal,r=r-1
		\end
	\end
	
	\cal,ResultInt[0]=r
\ret





@@!Imo_AlignStringConvert
	\var,int,a1,a2,a3
	
	\case,ParamStr[0]
		\of,"left"		\cal,a1=0
		\of,"center"	\cal,a1=50
		\of,"right"		\cal,a1=100
	\else
		\stid,ParamStr[0],0		\cal,a1=ResultInt[0]
	\end
	
	\case,ParamStr[1]
		\of,"top"		\cal,a2=0
		\of,"center"	\cal,a2=50
		\of,"bottom"	\cal,a2=100
	\else
		\stid,ParamStr[1],0		\cal,a2=ResultInt[0]
	\end
	
	\stid,ParamStr[2],0		\cal,a3=ResultInt[0]
	
	\cal,ResultInt[0]=a1
	\cal,ResultInt[1]=a2
	\cal,ResultInt[2]=a3
\ret

