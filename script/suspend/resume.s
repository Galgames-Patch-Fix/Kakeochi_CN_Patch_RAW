



@@!SubTop
	
	\svar,str,#SystemSuspendFile
	\if,#SystemSuspendFile==""\then
		\ret
	\end
	
	\scp,dat	\?g,#SystemSuspendFile
	\if,ResultInt[0]==0\then
		\ret
	\end
	
	
	\thrd,1,@@!SystemResume
\ret
