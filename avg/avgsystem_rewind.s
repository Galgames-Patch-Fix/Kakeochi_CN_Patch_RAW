










@@!Avg_RewindSaveCreate
	\gvar,list,Avg_RewindLog		
	\gvar,int,Avg_RewindIndex		
	\gvar,table,Avg_RewindReturnTable	
	\gvar,list,Avg_RewindDebug	
	
	\gvar,list,Avg_RewindSavefileList	
	\gvar,str,Avg_RewindPreFilename		
	\gvar,int,Avg_RewindSavefileIndex	
	\gvar,str,Avg_RewindCurrentFilename	
\ret

@@!Avg_RewindSaveFree
	
\ret




@@!Avg_RewindSaveInit
	\sub,@@!Avg_RewindSaveCreate
	
	\scp,Avg_RewindLog			\i
	\cal,Avg_RewindIndex=0
	\scp,Avg_RewindReturnTable	\i
	\scp,Avg_RewindDebug		\i
	
	\scp,Avg_RewindSaveFileList	\i
	\cal,Avg_RewindPreFilename="none"
	\cal,Avg_RewindSavefileIndex=0
	\cal,Avg_RewindCurrentFilename=""
\ret





@@!Avg_RewindSaveSet
	\var,str,calc
	\var,int,idx
	\cal,idx=ParamInt[0]
	\cal,calc=ParamStr[1]
	
	\if,idx<1\then
		\derr,"RewindSaveSet:0以上の優先度値を設定してください。"
	\end
	
	\fmt,"%d,",idx,"%s",calc
	\scp,Avg_RewindLog	\a,ResultStr[0]
	
	
	\if,Avg_RewindIndex<idx\then
		\cal,Avg_RewindIndex=idx
	\end
\ret














@@!Avg_OnRewindSaveLoadBegin
	
	\gvar,list,Avg_RewindLogBackup
	\vget,Avg_RewindLogBackup,Avg_RewindLog
\ret


@@!Avg_OnRewindSaveLoadEnd
	
	\var,int,idx1
	\vget,idx1,Avg_RewindIndex
	
	
	\var,int,i,n,idx2
	\var,str,s
	\var,list,sl
	\scp,Avg_RewindLogBackup	\?c		\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,Avg_RewindLogBackup,	\?s,i
		\cal,s=ResultStr[0]
		
		\div,",",s
		\stid,ResultStr[0],0		\cal,idx2=ResultInt[0]
		
		\if,idx2<=idx1\then
			\scp,sl		\a,s
		\end
	\end
	
	
	\vset,Avg_RewindLog,sl

	\del,Avg_RewindLogBackup
\ret




@@!Avg_RewindSaveGetValue
	\scp,Avg_RewindDebug	\i
	
	
	\scp,Avg_RewindReturnTable	\i
	
	\var,int,i,j,n1,n2
	\var,list,sl
	\scp,Avg_RewindLog	\?c
	\cal,n1=ResultInt[0]
	\for,i=0,i<n1,i++
		\scp,Avg_RewindLog	\?s,i
		
		\scp,sl
			\i
			\ad,",",ResultStr[0]
			\?c
		\cal,n2=ResultInt[0]
		\for,j=1,j<n2,j++
			\scp,sl		\?s,j
			\sub,@@!Avg_RewindSaveCalc,,Avg_RewindReturnTable,ResultStr[0]
		\end
	\end
\ret




@@!Avg_RewindSaveCalc
	\var,obj,tbl
	\var,str,s1,s2
	\cal,tbl=ParamStr[0]
	\cal,s1=ParamStr[1]
	
	\if,s1==""\then
		\ret
	\end
	
	\var,int,v
	
	\pos,"=",s1
	\if,ResultInt[0]>0\then
		\div,"=",s1
		\cal,s1=ResultStr[0],s2=ResultStr[1]
		\stid,s2,0	\cal,v=ResultInt[0]
		\scp,tbl	\v,s1,v
	\end
	
	\pos,"+",s1
	\if,ResultInt[0]>0\then
		\div,"+",s1
		\cal,s1=ResultStr[0],s2=ResultStr[1]
		\scp,tbl	\?v,s1	\cal,v=ResultInt[0]
		\stid,s2,0			\cal,v=v+ResultInt[0]
		\scp,tbl	\v,s1,v
	\end
	
	\pos,"-",s1
	\if,ResultInt[0]>0\then
		\div,"-",s1
		\cal,s1=ResultStr[0],s2=ResultStr[1]
		\scp,tbl	\?v,s1	\cal,v=ResultInt[0]
		\stid,s2,0			\cal,v=v-ResultInt[0]
		\scp,tbl	\v,s1,v
	\end
	
	\pos,"*",s1
	\if,ResultInt[0]>0\then
		\div,"*",s1
		\cal,s1=ResultStr[0],s2=ResultStr[1]
		\scp,tbl	\?v,s1	\cal,v=ResultInt[0]
		\stid,s2,0			\cal,v=v*ResultInt[0]
		\scp,tbl	\v,s1,v
	\end
	
	\pos,"/",s1
	\if,ResultInt[0]>0\then
		\div,"/",s1
		\cal,s1=ResultStr[0],s2=ResultStr[1]
		\scp,tbl	\?v,s1	\cal,v=ResultInt[0]
		\stid,s2,0			\cal,v=v/ResultInt[0]
		\scp,tbl	\v,s1,v
	\end
	
	\pos,"%",s1
	\if,ResultInt[0]>0\then
		\div,"%",s1
		\cal,s1=ResultStr[0],s2=ResultStr[1]
		\scp,tbl	\?v,s1	\cal,v=ResultInt[0]
		\stid,s2,0			\cal,v=v%ResultInt[0]
		\scp,tbl	\v,s1,v
	\end
\ret







@@!Avg_RewindSavePoint
	\var,str,s1,s2,s3
	\cal,s1=ParamStr[0]
	\cal,s2=ParamStr[1]
	\cal,s3=ParamStr[2]
	
	\rep,s1,"\","_"
	\rep,ResultStr[0],".s",""
	\rep,ResultStr[0],".","_"
	\rep,ResultStr[0],"@",""
	\rep,ResultStr[0],"!",""
	\rep,ResultStr[0],"?",""
	\cal,s1=ResultStr[0]
	\if,s2==""\then
		\cal,s2="scene"
	\end
	
	\if,s1==""\then
		\cal,s1=Avg_RewindPreFilename	
	\end
	\if,s1==""\then
		\derr,"巻き戻りセーブポイントのベースファイル名を指定してください。"
	\end
	
	\if,s1!=Avg_RewindPreFilename\then
		\cal,Avg_RewindSavefileIndex=0
	\end
	\cal,Avg_RewindPreFilename=s1
	
	
	\scp,sys	\?sr
	\if,ResultStr[0]!=""\then
		\cal,s1="Replay_"+s1
	\end
	
	\fmt,"%s_",s1,"%d.svd",Avg_RewindSavefileIndex
	\cal,s1=ResultStr[0]
	\cal,Avg_RewindCurrentFilename=s1
	
	\cal,Avg_RewindSavefileIndex=Avg_RewindSavefileIndex+1	
	
	
	
	
	
	\scp,Avg_RewindSavefileList		\a,s1+","+s2+","+s3
	
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	
	\scp,dat	\s,"RewindData\"+s1,$1+$2+$8,1	
	
	\sub,@@!Avg_RewindSaveMakeThum
\ret







@@!Avg_RewindSaveMakeThum
	
	\scp,sys	\?ver
	\if,ResultInt[0]!=0\then
		\ret
	\end
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,str,p
	\scp,Imo_Setting	\?v,"RewindThumPath"	\cal,p=ResultStr[0]
	\if,p==""\then
		\ret
	\end
	
	\if,Avg_RewindCurrentFilename==""\then
		\derr,"^rewindpointが設定されていません。"
	\end
	
	\var,int,w,h
	\scp,Imo_Setting	\?v,"RewindThumWidth",106	\cal,w=ResultInt[0]
	\scp,Imo_Setting	\?v,"RewindThumHeight",60	\cal,h=ResultInt[0]
	
	\var,int,z,m
	\scp,Imo_Setting	\?v,"RewindThumPriZ",1000		\cal,z=ResultInt[0]
	\scp,Imo_Setting	\?v,"RewindThumMask",$FFFF		\cal,m=ResultInt[0]
	\if,ParamInt[0]!=0\then
		\cal,z=ParamInt[0]
	\end
	\if,ParamInt[1]!=0\then
		\cal,m=ParamInt[1]
	\end
	
	\var,str,f
	\cal,f=p+Avg_RewindCurrentFilename
	\scp,misc	\cfe,f,".jpg"	\cal,f=ResultStr[0]
	
	
	\draw
	\dthm,f,w,h,z,m,100
\ret

