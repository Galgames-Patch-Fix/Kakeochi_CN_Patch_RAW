@@@!avg\AvgSystem.s




@@SceneReplayBegin
	\scp,sys	\lk,_lkSave+_lkLoad
	\scp,log	\i
^logjumppoint	
^postmedia,0
^layout,"window_memory"
^include,allset
\ret


@@SceneReplayEnd
	\sub,@@!SceneReplaySoundMute
\ret

@@!SceneReplaySoundMute
	\var,int,i,n
	
	\garr,snd	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,snd[i]	\v,0,250
	\end
\ret
