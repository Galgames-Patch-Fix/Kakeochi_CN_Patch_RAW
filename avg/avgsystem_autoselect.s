




@@!Avg_AutoSelectCreate
	\gvar,int,Avg_AutoSelectEnable
	\gvar,list,Avg_AutoSelectList
\ret

@@!Avg_AutoSelectFree
	
\ret




@@!Avg_AutoSelectLoad
	
	\scp,sys	\?ver
	\if,ResultInt[0]==1\then
		\ret
	\end

	\scp,Avg_AutoSelectList
		\l,ParamStr[0]
	\cal,Avg_AutoSelectEnable=1
\ret

@@!Avg_AutoSelectExecute
	\if,Avg_AutoSelectEnable==0\then
		\cal,Resultint[0]=0
		\ret
	\end
	
	\for
		\scp,Avg_AutoSelectList	\?c
		\if,ResultInt[0]==0\then
			\ddlg,"autoselect:自動選択定義ファイルが終端に達しました。"
			\cal,Avg_AutoSelectEnable=0
			\cal,ResultInt[0]=0
			\ret
		\end
		
		\var,str,s
		\scp,Avg_AutoSelectList		\?s,0
		\bsub,ResultStr[0],"\/\/.*",""	
		\trim,ResultStr[0]				
		\cal,s=ResultStr[0]
		\scp,Avg_AutoSelectList		\d,0
		
		\if,s!=""\then
			\brk
		\end
	\end
	
	
	\if,s=="pass"\then
		\cal,ResultInt[0]==0
		\ret
	\end
	
	\var,int,a
	\stid,s,-1	\cal,a=ResultInt[0]
	\if,a!=-1\then
		\cal,ResultBtnInt[0]=a
		\cal,ResultInt[0]=1
		\ret
	\end
	
	\var,int,i,n
	\garr,SelectButtonList	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,SelectButtonList	\?s,i
		\if,ResultStr[0]==s\then
			\cal,ResultBtnInt[0]==i
			\cal,ResultInt[0]=1
			\ret
		\end
	\end
	
	\ddlg,"autoselect:該当する選択肢が見つかりませんでした:"+s
	\cal,Avg_AutoSelectEnable=0
	\cal,ResultInt[0]==0
\ret
