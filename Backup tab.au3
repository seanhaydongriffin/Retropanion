#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
#include-once
#Include "Seans RetroPie Companion UDF.au3"


Func Backup_tab_setup()

	GUICtrlCreateTabItemEx("===> Backup")
																				GUICtrlCreateLabel("Local Path", 70, 150, 80)
																				GUICtrlCreateLabel("Remote Path", 360, 150, 80)
																				GUICtrlCreateLabel("File Mask", 540, 150, 80)
																				GUICtrlCreateLabel("Include", 700, 150, 40)
	$backup_path_1_y = 170
	$backup_path_1_local_input = 												GUICtrlCreateInputWithLabel($local_path & "\boot", 70, $backup_path_1_y, 250, 20, $backup_path_1_label, "Pair #1", 20, $backup_path_1_y, 80, 20)
	$backup_path_1_remote_input = 												GUICtrlCreateInput("/boot", 360, $backup_path_1_y, 140)
	$backup_path_1_filemask_input = 											GUICtrlCreateInput("config.txt", 540, $backup_path_1_y, 140)
	$backup_path_1_include_checkbox = 											GUICtrlCreateCheckboxEx("", 700, $backup_path_1_y, 20, 20, True)
	$backup_path_2_y = $backup_path_1_y + 20
	$backup_path_2_local_input = 												GUICtrlCreateInputWithLabel($local_path & "\home\pi\GPIOnext", 70, $backup_path_2_y, 250, 20, $backup_path_2_label, "Pair #2", 20, $backup_path_2_y, 80, 20)
	$backup_path_2_remote_input = 												GUICtrlCreateInput("/home/pi/GPIOnext", 360, $backup_path_2_y, 140)
	$backup_path_2_filemask_input = 											GUICtrlCreateInput("", 540, $backup_path_2_y, 140)
	$backup_path_2_include_checkbox = 											GUICtrlCreateCheckboxEx("", 700, $backup_path_2_y, 20, 20, True)
	$backup_path_3_y = $backup_path_2_y + 20
	$backup_path_3_local_input = 												GUICtrlCreateInputWithLabel($local_path & "\home\pi\RetroPie\BIOS", 70, $backup_path_3_y, 250, 20, $backup_path_3_label, "Pair #3", 20, $backup_path_3_y, 80, 20)
	$backup_path_3_remote_input = 												GUICtrlCreateInput("/home/pi/RetroPie/BIOS", 360, $backup_path_3_y, 140)
	$backup_path_3_filemask_input = 											GUICtrlCreateInput("", 540, $backup_path_3_y, 140)
	$backup_path_3_include_checkbox = 											GUICtrlCreateCheckboxEx("", 700, $backup_path_3_y, 20, 20, True)
	$backup_path_4_y = $backup_path_3_y + 20
	$backup_path_4_local_input = 												GUICtrlCreateInputWithLabel($local_path & "\opt\retropie\configs", 70, $backup_path_4_y, 250, 20, $backup_path_4_label, "Pair #4", 20, $backup_path_4_y, 80, 20)
	$backup_path_4_remote_input = 												GUICtrlCreateInput("/opt/retropie/configs", 360, $backup_path_4_y, 140)
	$backup_path_4_filemask_input = 											GUICtrlCreateInput("|*.iso", 540, $backup_path_4_y, 140)
	$backup_path_4_include_checkbox = 											GUICtrlCreateCheckboxEx("", 700, $backup_path_4_y, 20, 20, True)
	$backup_path_5_y = $backup_path_4_y + 20
	$backup_path_5_local_input = 												GUICtrlCreateInputWithLabel($local_path & "\home\pi\RetroPie\roms", 70, $backup_path_5_y, 250, 20, $backup_path_5_label, "Pair #5", 20, $backup_path_5_y, 80, 20)
	$backup_path_5_remote_input = 												GUICtrlCreateInput("/home/pi/RetroPie/roms", 360, $backup_path_5_y, 140)
	$backup_path_5_filemask_input = 											GUICtrlCreateInput("", 540, $backup_path_5_y, 140)
	$backup_path_5_include_checkbox = 											GUICtrlCreateCheckboxEx("", 700, $backup_path_5_y, 20, 20, True)
	$backup_path_6_y = $backup_path_5_y + 20
	$backup_path_6_local_input = 												GUICtrlCreateInputWithLabel($local_path & "\etc\emulationstation", 70, $backup_path_6_y, 250, 20, $backup_path_6_label, "Pair #6", 20, $backup_path_6_y, 80, 20)
	$backup_path_6_remote_input = 												GUICtrlCreateInput("/etc/emulationstation", 360, $backup_path_6_y, 140)
	$backup_path_6_filemask_input = 											GUICtrlCreateInput("es_systems.cfg", 540, $backup_path_6_y, 140)
	$backup_path_6_include_checkbox = 											GUICtrlCreateCheckboxEx("", 700, $backup_path_6_y, 20, 20, True)
	$backup_path_7_y = $backup_path_6_y + 20
	$backup_path_7_local_input = 												GUICtrlCreateInputWithLabel($local_path & "\etc\emulationstation\themes", 70, $backup_path_7_y, 250, 20, $backup_path_7_label, "Pair #7", 20, $backup_path_7_y, 80, 20)
	$backup_path_7_remote_input = 												GUICtrlCreateInput("/etc/emulationstation/themes", 360, $backup_path_7_y, 140)
	$backup_path_7_filemask_input = 											GUICtrlCreateInput("", 540, $backup_path_7_y, 140)
	$backup_path_7_include_checkbox = 											GUICtrlCreateCheckboxEx("", 700, $backup_path_7_y, 20, 20, True)
	$backup_mirror_button = 													GUICtrlCreateButton("WinSCP Mirror", 20, 325, 180)

EndFunc




Func Backup_tab_event_handler($msg)

	Switch $msg



		Case $backup_mirror_button

			; create the local directories
			DirCreateSafe(GUICtrlRead($backup_path_1_local_input))
			DirCreateSafe(GUICtrlRead($backup_path_2_local_input))
			DirCreateSafe(GUICtrlRead($backup_path_3_local_input))
			DirCreateSafe(GUICtrlRead($backup_path_4_local_input))
			DirCreateSafe(GUICtrlRead($backup_path_5_local_input))
			DirCreateSafe(GUICtrlRead($backup_path_6_local_input))
			DirCreateSafe(GUICtrlRead($backup_path_7_local_input))

			; create the winscp backup script
			;Local $winscp_script = _
			;	"open scp://pi:raspberry@retropie/ -hostkey=""ssh-ed25519 255 cq4AFscwWDozkpWLAzpJmZak8M7USnljP1lO36e23Co="" -rawsettings Shell=""sudo%20su%20-""" & @CRLF & _
			;	"synchronize local -delete -mirror -transfer=binary -filemask=""config.txt"" D:\dwn\RetroPie\boot /boot" & @CRLF & _
			;	"synchronize local -delete -mirror -transfer=binary -filemask=""config.txt"" D:\dwn\RetroPie\home\pi\GPIOnext /home/pi/GPIOnext" & @CRLF & _
			;	"synchronize local -delete -mirror -transfer=binary D:\dwn\RetroPie\home\pi\RetroPie\BIOS /home/pi/RetroPie/BIOS" & @CRLF & _
			;	"synchronize local -delete -mirror -transfer=binary -filemask=""|*.iso"" D:\dwn\RetroPie\opt\retropie\configs /opt/retropie/configs" & @CRLF & _
			;	"synchronize local -delete -mirror -transfer=binary D:\dwn\RetroPie\home\pi\RetroPie\roms /home/pi/RetroPie/roms" & @CRLF & _
			;	"exit" & @CRLF


			Local $winscp_script = "open scp://" & GUICtrlRead($retropie_username_input) & ":" & GUICtrlRead($retropie_password_input) & "@" & GUICtrlRead($retropie_hostname_input) & "/ -hostkey=""" & GUICtrlRead($retropie_ssh_key_input) & """ -rawsettings Shell=""sudo%20su%20-"" SendBuf=0 SshSimple=0" & @CRLF

			if GUICtrlRead($backup_path_1_include_checkbox) = $GUI_CHECKED and StringLen(GUICtrlRead($backup_path_1_local_input)) > 0 And StringLen(GUICtrlRead($backup_path_1_remote_input)) > 0 Then

				Local $filemask = ""

				if StringLen(GUICtrlRead($backup_path_1_filemask_input)) > 0 Then

					$filemask = " -filemask=""" & GUICtrlRead($backup_path_1_filemask_input) & """"
				EndIf

				$winscp_script = $winscp_script & "synchronize local -delete -mirror -transfer=binary" & $filemask & " " & GUICtrlRead($backup_path_1_local_input) & " " & GUICtrlRead($backup_path_1_remote_input) & @CRLF
			EndIf

			if GUICtrlRead($backup_path_2_include_checkbox) = $GUI_CHECKED and StringLen(GUICtrlRead($backup_path_2_local_input)) > 0 And StringLen(GUICtrlRead($backup_path_2_remote_input)) > 0 Then

				Local $filemask = ""

				if StringLen(GUICtrlRead($backup_path_2_filemask_input)) > 0 Then

					$filemask = " -filemask=""" & GUICtrlRead($backup_path_2_filemask_input) & """"
				EndIf

				$winscp_script = $winscp_script & "synchronize local -delete -mirror -transfer=binary" & $filemask & " " & GUICtrlRead($backup_path_2_local_input) & " " & GUICtrlRead($backup_path_2_remote_input) & @CRLF
			EndIf

			if GUICtrlRead($backup_path_3_include_checkbox) = $GUI_CHECKED and StringLen(GUICtrlRead($backup_path_3_local_input)) > 0 And StringLen(GUICtrlRead($backup_path_3_remote_input)) > 0 Then

				Local $filemask = ""

				if StringLen(GUICtrlRead($backup_path_3_filemask_input)) > 0 Then

					$filemask = " -filemask=""" & GUICtrlRead($backup_path_3_filemask_input) & """"
				EndIf

				$winscp_script = $winscp_script & "synchronize local -delete -mirror -transfer=binary" & $filemask & " " & GUICtrlRead($backup_path_3_local_input) & " " & GUICtrlRead($backup_path_3_remote_input) & @CRLF
			EndIf

			if GUICtrlRead($backup_path_4_include_checkbox) = $GUI_CHECKED and StringLen(GUICtrlRead($backup_path_4_local_input)) > 0 And StringLen(GUICtrlRead($backup_path_4_remote_input)) > 0 Then

				Local $filemask = ""

				if StringLen(GUICtrlRead($backup_path_4_filemask_input)) > 0 Then

					$filemask = " -filemask=""" & GUICtrlRead($backup_path_4_filemask_input) & """"
				EndIf

				$winscp_script = $winscp_script & "synchronize local -delete -mirror -transfer=binary" & $filemask & " " & GUICtrlRead($backup_path_4_local_input) & " " & GUICtrlRead($backup_path_4_remote_input) & @CRLF
			EndIf

			if GUICtrlRead($backup_path_5_include_checkbox) = $GUI_CHECKED and StringLen(GUICtrlRead($backup_path_5_local_input)) > 0 And StringLen(GUICtrlRead($backup_path_5_remote_input)) > 0 Then

				Local $filemask = ""

				if StringLen(GUICtrlRead($backup_path_5_filemask_input)) > 0 Then

					$filemask = " -filemask=""" & GUICtrlRead($backup_path_5_filemask_input) & """"
				EndIf

				$winscp_script = $winscp_script & "synchronize local -delete -mirror -transfer=binary" & $filemask & " " & GUICtrlRead($backup_path_5_local_input) & " " & GUICtrlRead($backup_path_5_remote_input) & @CRLF
			EndIf

			if GUICtrlRead($backup_path_6_include_checkbox) = $GUI_CHECKED and StringLen(GUICtrlRead($backup_path_6_local_input)) > 0 And StringLen(GUICtrlRead($backup_path_6_remote_input)) > 0 Then

				Local $filemask = ""

				if StringLen(GUICtrlRead($backup_path_6_filemask_input)) > 0 Then

					$filemask = " -filemask=""" & GUICtrlRead($backup_path_6_filemask_input) & """"
				EndIf

				$winscp_script = $winscp_script & "synchronize local -delete -mirror -transfer=binary" & $filemask & " " & GUICtrlRead($backup_path_6_local_input) & " " & GUICtrlRead($backup_path_6_remote_input) & @CRLF
			EndIf

			if GUICtrlRead($backup_path_7_include_checkbox) = $GUI_CHECKED and StringLen(GUICtrlRead($backup_path_7_local_input)) > 0 And StringLen(GUICtrlRead($backup_path_7_remote_input)) > 0 Then

				Local $filemask = ""

				if StringLen(GUICtrlRead($backup_path_7_filemask_input)) > 0 Then

					$filemask = " -filemask=""" & GUICtrlRead($backup_path_7_filemask_input) & """"
				EndIf

				$winscp_script = $winscp_script & "synchronize local -delete -mirror -transfer=binary" & $filemask & " " & GUICtrlRead($backup_path_7_local_input) & " " & GUICtrlRead($backup_path_7_remote_input) & @CRLF
			EndIf

			$winscp_script = $winscp_script	& "exit" & @CRLF

			FileDelete($app_data_dir & "\" & $app_name & ".log")
			FileDelete($app_data_dir & "\" & $app_name & ".log.1")
			FileDelete($app_data_dir & "\" & $app_name & ".txt")
			FileWrite($app_data_dir & "\" & $app_name & ".txt", $winscp_script)

			; run the winscp backup script
;			ShellExecuteWait("C:\Program Files (x86)\WinSCP\WinSCP.exe", "/console /logsize=1*1M /log=""" & @ScriptDir & "\" & $app_name & ".log"" /ini=nul /script=""" & @ScriptDir & "\" & $app_name & ".txt""", @ScriptDir)
;			ShellExecuteWait("C:\Program Files (x86)\WinSCP\WinSCP.com", "/logsize=1*1M /log=""" & @ScriptDir & "\" & $app_name & ".log"" /ini=nul /script=""" & @ScriptDir & "\" & $app_name & ".txt""", @ScriptDir)
			Run(@ComSpec & ' /k ""C:\Program Files (x86)\WinSCP\WinSCP.com" /log="' & $app_data_dir & '\' & $app_name & '.log" /loglevel=2 /ini=nul /script="' & $app_data_dir & '\' & $app_name & '.txt""', @ScriptDir)



	EndSwitch

EndFunc

