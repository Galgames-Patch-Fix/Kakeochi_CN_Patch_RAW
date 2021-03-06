




@@@!ImoScripter_Base.s
@@@!ImoScripter_Custom.s
@@@!ImoScripter_IndexList.s
@@@!ImoScripter_Include.s
@@@!ImoScripter_Format.s
@@@!ImoScripter_Sentence.s
@@@!ImoScripter_Image.s
@@@!ImoScripter_Chara.s
@@@!ImoScripter_Chara8e.s
@@@!ImoScripter_Music.s
@@@!ImoScripter_Sound.s
@@@!ImoScripter_Message.s
@@@!ImoScripter_Face.s
@@@!ImoScripter_NameText.s
@@@!ImoScripter_Camera.s
@@@!ImoScripter_Information.s
@@@!ImoScripter_CharaActive.s
@@@!ImoScripter_Spine.s



@@!ImoScripter_Create
	
	\gvar,table,Imo_Setting,Imo_Project
	\scp,Imo_Setting	\l,"Setting.txt"
	\scp,Imo_Project	\l,"ProjectSetting.txt"
	
	
	\sub,@@!Imo_Objects_Create
	
	\sub,@@!Imo_Base_Create
	\sub,@@!Imo_IndexList_Create
	\sub,@@!Imo_Include_Create
	\sub,@@!Imo_Format_Create
	\sub,@@!Imo_Sentence_Create
	\if,Imo_CameraCount>0\then		\sub,@@!Imo_Camera_Create	\end
	\if,Imo_ImageCount>0\then		\sub,@@!Imo_Image_Create	\end
	\if,Imo_CharaCount>0\then		\sub,@@!Imo_Chara_Create	\end
	\if,Imo_Chara8eCount>0\then		\sub,@@!Imo_Chara8e_Create	\end
	\if,Imo_MusicCount>0\then		\sub,@@!Imo_Music_Create	\end
	\if,Imo_SoundCount>0\then		\sub,@@!Imo_Sound_Create	\end
	\if,Imo_MessageCount>0\then		\sub,@@!Imo_Message_Create	\end
	\if,Imo_FaceCount>0\then		\sub,@@!Imo_Face_Create		\end
	\if,Imo_NameTextCount>0\then	\sub,@@!Imo_NameText_Create	\end
	\if,Imo_InfoCount>0\then		\sub,@@!Imo_Info_Create		\end
	\if,Imo_CharaActiveCount>0\then		\sub,@@!Imo_CharaActive_Create		\end
	\if,Imo_SpineCount>0\then		\sub,@@!Imo_Spine_Create		\end
	\sub,@@!Imo_Custom_Create
\ret


@@!ImoScripter_Free
	\sub,@@!Imo_Custom_Free
	\if,Imo_NameTextCount>0\then	\sub,@@!Imo_NameText_Free	\end
	\if,Imo_FaceCount>0\then		\sub,@@!Imo_Face_Free		\end
	\if,Imo_MessageCount>0\then		\sub,@@!Imo_Message_Free	\end
	\if,Imo_SoundCount>0\then		\sub,@@!Imo_Sound_Free		\end
	\if,Imo_MusicCount>0\then		\sub,@@!Imo_Music_Free		\end
	\if,Imo_CharaCount>0\then		\sub,@@!Imo_Chara_Free		\end
	\if,Imo_Chara8eCount>0\then		\sub,@@!Imo_Chara8e_Free	\end
	\if,Imo_ImageCount>0\then		\sub,@@!Imo_Image_Free		\end
	\if,Imo_CameraCount>0\then		\sub,@@!Imo_Camera_Free		\end
	\if,Imo_InfoCount>0\then		\sub,@@!Imo_Info_Free		\end
	\if,Imo_CharaActiveCount>0\then		\sub,@@!Imo_CharaActive_Free		\end
	\if,Imo_SpineCount>0\then		\sub,@@!Imo_Spine_Free		\end
	\sub,@@!Imo_Sentence_Free
	\sub,@@!Imo_Format_Free
	\sub,@@!Imo_Include_Free
	\sub,@@!Imo_IndexList_Free
	\sub,@@!Imo_Base_Free
	
	\sub,@@!Imo_Objects_Free
	\del,Imo_Setting,Imo_Project
\ret


@@!Imo_Objects_Create
	\var,list,sl
	\var,int,n,i,idx
	\var,str,nn,tt,s1,s2
	
	\gvar,table,Imo_EntryRepName
	\gvar,int,Imo_NullCount
	\gvar,int,Imo_ImageCount
	\gvar,int,Imo_CharaCount
	\gvar,int,Imo_Chara8eCount
	\gvar,int,Imo_SoundCount
	\gvar,int,Imo_MusicCount
	\gvar,int,Imo_MessageCount
	\gvar,int,Imo_FaceCount
	\gvar,int,Imo_NameTextCount
	\gvar,int,Imo_CameraCount
	\gvar,int,Imo_InfoCount
	\gvar,int,Imo_CharaActiveCount
	\gvar,int,Imo_SpineCount
	\gvar,table,Imo_FormatNames
	\gvar,table,Imo_SentenceNames
	\gvar,table,Imo_NullNames
	\gvar,table,Imo_ImageNames
	\gvar,table,Imo_CharaNames
	\gvar,table,Imo_Chara8eNames
	\gvar,table,Imo_SoundNames
	\gvar,table,Imo_MusicNames
	\gvar,table,Imo_MessageNames
	\gvar,table,Imo_FaceNames
	\gvar,table,Imo_NameTextNames
	\gvar,table,Imo_CameraNames
	\gvar,table,Imo_InfoNames
	\gvar,table,Imo_CharaActiveNames
	\gvar,table,Imo_SpineNames
	
	\var,str,OperationCode
	\scp,Imo_Project
			\?v,"OperationCode","^"
	\cal,OperationCode=ResultStr[0]
	
	\scp,sl
		\i
		\l,"ProjectObjects.txt"
		\?c
	\cal,n=ResultInt[0]
	
	\for,i=0,i<n,i++
		\scp,sl	\?s,i
		\div,",",ResultStr[0]
		\cal,tt=ResultStr[0],nn=ResultStr[1]
		\cal,s1=""
		\cal,s2=OperationCode+nn		
		\case,tt
			\of,""			
			\of,"null"		\scp,Imo_NullNames	\v,nn,Imo_NullCount
							\cal,Imo_NullCount++
			\of,"format"	\cal,s1="\subp,@@!Imo_Format_Excute,,"+"0"
							\scp,Imo_FormatNames	\v,nn,0
			\of,"sentence"	\cal,s1="\subp,@@!Imo_Sentence_Excute,,"+"0"
							\scp,Imo_SentenceNames	\v,nn,0
			\of,"image"	\cal,s1="\subp,@@!Imo_Image_Excute,,"+Imo_ImageCount
							\scp,Imo_ImageNames	\v,nn,Imo_ImageCount
							\cal,Imo_ImageCount++
			\of,"chara"	\cal,s1="\subp,@@!Imo_Chara_Excute,,"+Imo_CharaCount
							\scp,Imo_CharaNames	\v,nn,Imo_CharaCount
							\cal,Imo_CharaCount++
			\of,"chara8e"	\cal,s1="\subp,@@!Imo_Chara8e_Excute,,"+Imo_Chara8eCount
							\scp,Imo_Chara8eNames	\v,nn,Imo_Chara8eCount
							\cal,Imo_Chara8eCount++
			\of,"sound"	\cal,s1="\subp,@@!Imo_Sound_Excute,,"+Imo_SoundCount
							\scp,Imo_SoundNames	\v,nn,Imo_SoundCount
							\cal,Imo_SoundCount++
			\of,"music"	\cal,s1="\subp,@@!Imo_Music_Excute,,"+Imo_MusicCount
							\scp,Imo_MusicNames	\v,nn,Imo_MusicCount
							\cal,Imo_MusicCount++
			\of,"message"	\cal,s1="\subp,@@!Imo_Message_Excute,,"+Imo_MessageCount
							\scp,Imo_MessageNames	\v,nn,Imo_MessageCount
							\cal,Imo_MessageCount++
			\of,"face"		\cal,s1="\subp,@@!Imo_Face_Excute,,"+Imo_FaceCount
							\scp,Imo_FaceNames	\v,nn,Imo_FaceCount
							\cal,Imo_FaceCount++
			\of,"nametext"	\cal,s1="\subp,@@!Imo_NameText_Excute,,"+Imo_NameTextCount
							\scp,Imo_NameTextNames	\v,nn,Imo_NameTextCount
							\cal,Imo_NameTextCount++
			\of,"camera"	\cal,s1="\subp,@@!Imo_Camera_Excute,,"+Imo_CameraCount
							\scp,Imo_CameraNames	\v,nn,Imo_CameraCount
							\cal,Imo_CameraCount++
			\of,"information"
							\cal,s1="\subp,@@!Imo_Info_Excute,,"+Imo_InfoCount
							\scp,Imo_InfoNames	\v,nn,Imo_InfoCount
							\cal,Imo_InfoCount++
			\of,"charaactive"
							\cal,s1="\subp,@@!Imo_CharaActive_Excute,,"+"0"
							\scp,Imo_CharaActiveNames	\v,nn,0
							\cal,Imo_CharaActiveCount++
			\of,"spine"
							\cal,s1="\subp,@@!Imo_Spine_Excute,,"+"0"
							\scp,Imo_SpineNames	\v,nn,0
							\cal,Imo_SpineCount++
		\else
			\derr,"未定義のオブジェクトが宣言されました："+tt
		\end
		
		\if,s1!=""\then
			
			\scp,rep	\a,s2,s1
			\scp,Imo_EntryRepName	\v,s2,s1
		\end
	\end
\ret

@@!Imo_Objects_Free
	
	\var,int,n,i
	\scp,Imo_EntryRepName	\?c
	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,Imo_EntryRepName	\?n,i
		\scp,rep	\d,ResultStr[0]
	\end
	\del,Imo_FormatNames
	\del,Imo_SentenceNames
	\del,Imo_NullCount
	\del,Imo_ImageCount
	\del,Imo_CharaCount
	\del,Imo_Chara8eCount
	\del,Imo_SoundCount
	\del,Imo_MusicCount
	\del,Imo_MessageCount
	\del,Imo_FaceCount
	\del,Imo_NameTextCount
	\del,Imo_CameraCount
	\del,Imo_InfoCount
	\del,Imo_CharaActiveCount
	\del,Imo_SpineCount
	\del,Imo_NullNames
	\del,Imo_ImageNames
	\del,Imo_CharaNames
	\del,Imo_Chara8eNames
	\del,Imo_SoundNames
	\del,Imo_MusicNames
	\del,Imo_MessageNames
	\del,Imo_FaceNames
	\del,Imo_NameTextNames
	\del,Imo_CameraNames
	\del,Imo_InfoNames
	\del,Imo_CharaActiveNames
	\del,Imo_SpineNames
	
	\del,Imo_EntryRepName
\ret


