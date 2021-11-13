


@@!cfmodele_create
	\gvar,str,tips_executefilename
	\gvar,str,tips_logtext,tips_logfile
	\cal,tips_executefilename=""
	\cal,tips_logtext=""
	\cal,tips_logfile=""
	
	\scp,rep
		\a,"^tips","\sub,@@!cfmodule_tips,self"
\ret

@@!cfmodule_free
	\del,tips_executefilename
	\del,tips_logtext,tips_logfile
	
	\scp,rep
		\d,"^tips"
\ret



@@!cfmodule_tips
	\var,str,f
	\cal,f=paramstr[0]
	
	\cal,f="tips\"+f+".txt"
	
	
	\fexs,f
	\if,resultint[0]==0\then
		\ddlg,"tips file not found. : "+f
	\end
	
	
	\scp,flog	\s,f,256
	
	
	\cal,tips_logtext="***tips"
	\cal,tips_logfile=f
	
	
	\cal,tips_executefilename=f
	\fexs,f
	\if,resultint[0]==0\then
		\cal,tips_executefilename=""
	\end
	
	\sub,@@!cfmodule_showbutton
\ret

@@!cfmodule_addlog
	\if,tips_logtext==""\then
		\ret
	\end
	
	\scp,log	\a,"",tips_logtext,tips_logfile,"",0,0,0,0
	
	\cal,tips_logtext=""
	\cal,tips_logfile=""
\ret


@@!cfmodule_tipsclear
	\cal,tips_executefilename=""
\ret



@@!cfmodule_showbutton
	\if,tips_executefilename==""\then
		\ret
	\end
	
	
	\var,int,v
	\cal,v=0
	
	\scp,Imo_Message	\?l
	\pos,"_sub",resultstr[0]
	\if,resultint[0]>0\then
		\cal,v=1
	\end
	
	
	\var,list,sl
	\scp,sl
		\l,tips_executefilename
		\?s,0
	\var,str,s
	\cal,s=resultstr[0]
	
	\scp,SysTipsButton
		\cc
		\o,s
		\mc
		\exv,v
		\e
\ret

@@!cfmodule_hidebutton
	\scp,SysTipsButton	\d
\ret

