










@@!Avg_LogJumpCreate
	\gvar,int,Avg_LogJumpStep
	\gvar,int,Avg_LogJumpLock
	\gvar,str,Avg_LogJumpBasename
	\cal,Avg_LogJumpLock=1
\ret

@@!Avg_LogJumpFree
	\del,Avg_LogJumpStep
	\del,Avg_LogJumpLock
	\del,Avg_LogJumpBasename
\ret




@@!Avg_LogJumpPoint
	\if,ParamStr[0]==""\then
		\cal,Avg_LogJumpLock=0
	\else
		\cal,Avg_LogJumpLock=ParamInt[0] ^ 1	
	\end
	\cal,Avg_LogJumpStep=0
	
	\if,ParamStr[1]==""\then
		\scp,sys	\?mrd,1		
		\rep,ResultStr[0],".s",""
		\rep,ResultStr[0],"\","_"
		\rep,ResultStr[0],"/","_"
		\rep,ResultStr[0],"@","_"
		\rep,ResultStr[0],"!","_"
		\cal,Avg_LogJumpBasename=ResultStr[0]
	\else
		\cal,Avg_LogJumpBasename=ParamStr[1]
	\end
	
	
	\scp,Imo_Setting	\?v,"LogJumpLimit",16
	\if,ResultInt[0]==0\then
		\scp,tdat	\i
	\end
\ret


@@!Avg_LogJumpGetFilename
	\var,str,f
	\fmt,"%d",Avg_LogJumpStep
	\cal,f=Avg_LogJumpBasename+"_"+ResultStr[0]+".svd"
	\cal,ResultStr[0]=f
\ret



@@!Avg_LogJumpStep
	\cal,Avg_LogJumpStep=Avg_LogJumpStep+1
\ret


@@!Avg_LogJumpGameSave
	\if,Avg_LogJumpLock==1\then
		\ret
	\end
	\if,#LogJumpEnable==0\then
		\ret
	\end
	
	
	\var,int,interval
	\cal,interval=#LogJumpInterval
	\if,interval == 0\then
		
		\if,Imo_LogName[0]==""\then
			\ret
		\end
	\else
		
		\if,Avg_LogJumpStep % interval > 0\then
			\ret
		\end
	\end
	
	\var,str,f
	\sub,@@!Avg_LogJumpGetFilename
	\cal,f=ResultStr[0]
	
	\var,int,opt,mode,limit
	\scp,Imo_Setting
		\?v,"LogJumpLimit",16		\cal,limit=ResultInt[0]
		\?v,"LogJumpSaveOption",14	\cal,opt=ResultInt[0]
		\?v,"LogJumpSaveMode",1		\cal,mode=ResultInt[0]
	
	
	\scp,tdat
		\lim,limit
		\s,f,opt,mode
\ret
