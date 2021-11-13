



@@!SystemValueInit
	
	
	\var,table,t
	\scp,t	\l,"avg\setting.txt"

	
	\svar,str,#ExceptionBackupFilename
	\cal,#ExceptionBackupFilename="ExceptionBackup.svd"
	
	\svar,str,#NewSaveFilename
	
	
	\svar,int,#VoicePlaySoundChannel
	\scp,t	\?v,"VoicePlaySoundChannel"
	\cal,#VoicePlaySoundChannel=ResultInt[0]
	
	\svar,int,#VoicePlayPolyphonyCount
	\scp,t	\?v,"VoicePlayPolyphonyCount",8
	\cal,#VoicePlayPolyphonyCount=ResultInt[0]
	
	\svar,int,#VoiceCharaSerchMode
	\scp,t	\?v,"VoiceCharaSerchMode"
	\cal,#VoiceCharaSerchMode=ResultInt[0]
	
	
	\svar,int,#SaveLogTextLength
	\scp,t	\?v,"SaveLogTextLength",24
	\cal,#SaveLogTextLength=ResultInt[0]
	
	\svar,int,#SaveThumZPri
	\scp,t	\?v,"SaveThumPriority",999
	\cal,#SaveThumZPri=ResultInt[0]
	
	\svar,int,#SaveFileCount
	\scp,t	\?v,"SaveFileCount",50
	\cal,#SaveFileCount=ResultInt[0]
	
	\svar,int,#AutoSaveFileCount
	\scp,t	\?v,"AutoSaveFileCount"
	\cal,#AutoSaveFileCount=ResultInt[0]
	
	\svar,int,#QuickSaveFileCount
	\scp,t	\?v,"QuickSaveFileCount"
	\cal,#QuickSaveFileCount=ResultInt[0]
	
	\svar,int,#MouseGestureEnable
	\scp,t	\?v,"MouseGestureEnable",0
	\cal,#MouseGestureEnable=ResultInt[0]
	
	\svar,int,#SwipeEnable
	\scp,t	\?v,"SwipeEnable",0
	\cal,#SwipeEnable=ResultInt[0]
	
	
	
	\scp,t	\l,"avg\ProjectSetting.txt"
	
	
	\svar,int,#NameDivideMode
	\scp,t	\?v,"FormatDivNameType",0
	\cal,#NameDivideMode=ResultInt[0]
	
	\svar,str,#NameDivideCode
	\scp,t	\?v,"FormatDivNameCode","＠"
	\cal,#NameDivideCode=ResultStr[0]
	
	\svar,str,#NameConnectCode
	\scp,t	\?v,"FormatConnectNameCode","／"
	\cal,#NameConnectCode=ResultStr[0]
	
	\svar,str,#GyoutouKinsokuWord
	\scp,t	\?v,"KinsokuGyoutouWord"
	\cal,#GyoutouKinsokuWord=ResultStr[0]
	\svar,str,#GyoumatuKinsokuWord
	\scp,t	\?v,"KinsokuGyoumatuWord"
	\cal,#GyoumatuKinsokuWord=ResultStr[0]
	\svar,int,#KinsokuWordLength
	\scp,t	\?v,"KinsokuLength"
	\cal,#KinsokuWordLength=ResultInt[0]
	
	\svar,int,#ReturnSpaceEnable
	\scp,t	\?v,"ReturnSpaceEnable"
	\cal,#ReturnSpaceEnable=ResultInt[0]
	\svar,str,#IgnoreReturnSpaceWord
	\scp,t	\?v,"ReturnSpaceWord"
	\cal,#IgnoreReturnSpaceWord=ResultStr[0]
	\svar,str,#NotReturnSpaceLength
	\scp,t	\?v,"NotReturnSpaceLength"
	\cal,#NotReturnSpaceLength=ResultStr[0]
	
	\svar,int,#LinePitch
	\scp,t	\?v,"LinePitch",8
	\cal,#LinePitch=ResultInt[0]
	
	\svar,str,#TextHedderCode
	\scp,t	\?v,"TextHedderCode",""
	\cal,#TextHedderCode=ResultStr[0]
	
	
	
	\svar,int,#ConfigVoiceActor[64]
\ret
