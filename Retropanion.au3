#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
#include-once
#Include "Settings tab.au3"
#Include "ROMs tab.au3"
#Include "Scrape Metadata tab.au3"
#Include "Scrape Images with Auto Join tab.au3"
#Include "Scrape Images with Manual Join tab.au3"
#Include "Config tab.au3"
#Include "Backup tab.au3"

Retropanion_Startup()

; Main gui

$main_gui = 																	MainGUICreate($tab, 5, 50, 840-10, 720-80, $GUI_DOCKVCENTER + $GUI_DOCKBORDERS)
GUICtrlCreateGroupEx  ("System", 5, 0, 330, 47)
$system_combo = 																GUICtrlCreateComboFromDict($roms_path_dict, 10, 15, 250)
$system_open_docs_page_button = 												GUICtrlCreateImageButton("open docs page.ico", 270, 10, 28, "Open the RetroPie Docs page for this system")
$system_open_wiki_page_button = 												GUICtrlCreateImageButton("open wiki page.ico", 300, 10, 28, "Open the Wiki page for this system")
GUICtrlCreateGroupEx  ("Display", 340, 0, 235, 47)
$display_device_name_combo = 													GUICtrlCreateComboFromDict(Null, 350, 15, 150)
$display_device_add_button = 													GUICtrlCreateImageButton("add.ico", 510, 10, 28, "Add a new Display Device")
$display_device_delete_button = 												GUICtrlCreateImageButton("delete.ico", 540, 10, 28, "Delete the selected Display Device")
GUICtrlCreateGroupEx  ("EmulationStation", 580, 0, 100, 47)
$emulationstation_restart_button = 												GUICtrlCreateImageButton("restart.ico", 590, 15, 28, "Restart EmulationStation")
$emulationstation_quit_button = 												GUICtrlCreateImageButton("exit.ico", 620, 15, 28, "Quit EmulationStation")
GUICtrlCreateGroupEx  ("RetroPie", 700, 0, 80, 47)
$retropie_reboot_button = 														GUICtrlCreateImageButton("restart.ico", 710, 15, 28, "Restart RetroPie")
$retropie_shutdown_button = 													GUICtrlCreateImageButton("shutdown.ico", 740, 15, 28, "Shutdown RetroPie")
$help_button = 																	GUICtrlCreateImageButton("help.ico", 795, 10, 36, "Help")
$status_input = 																GUICtrlCreateStatusInput("Hint - hover mouse over controls for help", 5, 720 - 25, 830, 20)

$shift_up_dummy = 																GUICtrlCreateDummy()
$shift_down_dummy = 															GUICtrlCreateDummy()
Local $main_aAccelKeys[2][2] = [["+{UP}", $shift_up_dummy], ["+{DOWN}", $shift_down_dummy]]
GUISetAccelerators($main_aAccelKeys, $main_gui)

; Main gui tabs

Settings_tab_setup()
ROMs_tab_setup()
Scrape_Metadata_tab_setup()
Scrape_Images_with_Auto_Join_tab_setup()
Scrape_Images_with_Manual_Join_tab_setup()
Config_tab_setup()
Backup_tab_setup()
GUICtrlCreateTabItemEx("") ; end tabitem definition

; Child guis

Settings_tab_child_gui_setup()
ROMs_tab_child_gui_setup()
Scrape_Metadata_tab_child_gui_setup()
Scrape_Images_with_Auto_Join_tab_child_gui_setup()
Scrape_Images_with_Manual_Join_tab_child_gui_setup()
Config_tab_child_gui_setup()
Backup_tab_child_gui_setup()


;Enable_Emulators_and_Games($GUI_ENABLE)

$current_gui = $main_gui
GUISetState(@SW_SHOW, $main_gui)
GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
_TipDisplayLen(30000)


_GUICtrlComboBox_SelectString($system_combo, IniRead($ini_filename, "Global", "System", "3DO"))
_GUICtrlComboBox_SelectString($display_device_name_combo, IniRead($ini_filename, "Global", "Display", ""))
_GUICtrlTab_SetCurFocus($tab, Number(IniRead($ini_filename, "Global", "Tab", 1)))
RefreshDisplayDeviceVideoModesListView()




While True

	; GUI msg loop...
	$msg = GUIGetMsg()

	Switch $msg

		Case $GUI_EVENT_CLOSE

			if $current_gui = $main_gui Then

				GUISetState(@SW_ENABLE, $main_gui)
				GUISetState(@SW_HIDE, $current_gui)
				GUIDelete($current_gui)
				ExitLoop

	;			if _GUICtrlTab_GetCurSel($tab) = 1 Then

	;				_GUICtrlListBox_ClickItem($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list))
	;			EndIf
			EndIf

;		Case $GUI_EVENT_RESIZED

;			if $current_gui = $art_gui2 Then

;				Local $pos = WinGetPos($current_gui)
;				GUICtrlSetPos($art_big_pic2, 0, 0, $pos[2], $pos[3])
;				GUICtrlSetSizeAndImage($art_big_pic2, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)) & "-full-cover.jpg", $pos[2], -1, True)
;			EndIf


;		case $shift_up_dummy

;			Local $arr = _GUICtrlListBox_GetSelItems($scrape_manual_join_rom_list)
;			_GUICtrlListBox_SelItemRange($scrape_manual_join_rom_list, $arr[UBound($arr)-1], $arr[UBound($arr)-1], False)

;		case $shift_down_dummy

;			Local $arr = _GUICtrlListBox_GetSelItems($scrape_manual_join_rom_list)
;			_GUICtrlListBox_SelItemRange($scrape_manual_join_rom_list, $arr[UBound($arr)-1]+1, $arr[UBound($arr)-1]+1)



		Case $system_open_wiki_page_button

			depress_button_and_disable_gui($msg, -1, 100)
			ShellExecute("https://github.com/seanhaydongriffin/" & $app_name & "/wiki/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "-Emulator-Game-Compatibility")
			raise_button_and_enable_gui($msg)


		Case $display_device_add_button

			depress_button_and_disable_gui($msg)
			$result = InputBox($app_name, "Enter a name to identify the new device", "", "", 240, 140, Default, Default, 0, $main_gui)

			if StringLen($result) > 0 Then

				Local $display_device_filename = $app_data_dir & "\display device " & $result & ".txt"
				FileWrite($display_device_filename, "")
				_GUICtrlComboBox_AddString($display_device_name_combo, $result)
				_GUICtrlComboBox_SelectString($display_device_name_combo, $result)
			EndIf
			raise_button_and_enable_gui($msg)


		Case $display_device_delete_button

			depress_button_and_disable_gui($msg, -1, 100)
			Local $display_device_filename = $app_data_dir & "\display device " & GUICtrlRead($display_device_name_combo) & ".txt"

			if FileExists($display_device_filename) Then

				FileDelete($display_device_filename)
			EndIf

			_GUICtrlComboBox_DeleteString($display_device_name_combo, _GUICtrlComboBox_GetCurSel($display_device_name_combo))
			_GUICtrlComboBox_SetCurSel($display_device_name_combo, 0)
			raise_button_and_enable_gui($msg)


		Case $emulationstation_restart_button

			depress_button_and_disable_gui($msg)
			GUICtrlSetData($status_input, "Restarting EmulationStation ...")
			plink("sudo touch /tmp/es-restart")
			plink("sudo pkill -f \""/opt/retropie/supplementary/.*/emulationstation([^.]|$)\""")
			GUICtrlSetData($status_input, "")
			raise_button_and_enable_gui($msg)


		Case $emulationstation_quit_button

			depress_button_and_disable_gui($msg)
			GUICtrlSetData($status_input, "Quitting EmulationStation ...")
			plink("sudo pkill -f \""/opt/retropie/supplementary/.*/emulationstation([^.]|$)\""")
			GUICtrlSetData($status_input, "")
			raise_button_and_enable_gui($msg)

		Case $retropie_reboot_button

			depress_button_and_disable_gui($msg)
			GUICtrlSetData($status_input, "Restarting the RetroPie ...")
			plink("sudo reboot")
			GUICtrlSetData($status_input, "")
			raise_button_and_enable_gui($msg)

		Case $retropie_shutdown_button

			depress_button_and_disable_gui($msg)
			GUICtrlSetData($status_input, "Shutting down the RetroPie ...")
			plink("sudo shutdown -h now")
			GUICtrlSetData($status_input, "")
			raise_button_and_enable_gui($msg)

		Case $help_button

			depress_button_and_disable_gui($msg, -1, 100)
			Run('"' & @WindowsDir & '\hh.exe" "' & @ScriptDir & '\Retropanion.chm"')
			raise_button_and_enable_gui($msg)


	EndSwitch

	Settings_tab_event_handler($msg)
	ROMs_tab_event_handler($msg)
	Scrape_Metadata_tab_event_handler($msg)
	Scrape_Images_with_Auto_Join_tab_event_handler($msg)
	Scrape_Images_with_Manual_Join_tab_event_handler($msg)
	Config_tab_event_handler($msg)
	Backup_tab_event_handler($msg)


WEnd

Retropanion_Shutdown()

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam

	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")

	; TAB specific WM_NOTIFY handlers ...

	Settings_tab_WM_NOTIFY_handler($hWndFrom, $iCode)
	Config_tab_WM_NOTIFY_handler($hWndFrom, $iCode)
	Scrape_Images_with_Auto_Join_tab_WM_NOTIFY_handler($hWndFrom, $iCode)

	; Global WM_NOTIFY handler ...

	Switch $hWndFrom

		Case GUICtrlGetHandle($tab)

			Switch $iCode

				Case $NM_CLICK

					if _GUICtrlTab_GetCurSel($tab) = 1 Then

						GUICtrlSetState($scrape_auto_join_upload_button, $GUI_DEFBUTTON)
					EndIf

					if _GUICtrlTab_GetCurSel($tab) = 2 Then

						GUICtrlSetState($scrape_manual_join_upload_button, $GUI_DEFBUTTON)
					EndIf

					IniWrite($ini_filename, "Global", "Tab", _GUICtrlTab_GetCurSel($tab))

			EndSwitch

        Case $status_input

			Switch $iCode

				Case $EN_LINK

					$tMsgFilter = DllStructCreate($tagMSGFILTER, $lParam)

                    If DllStructGetData($tMsgFilter, "msg") = $WM_LBUTTONUP Then

                        $tEnLink = DllStructCreate($tagENLINK, $lParam)
                        $sLink = _GUICtrlRichEdit_GetTextInRange($status_input, DllStructGetData($tEnLink, "cpMin"), DllStructGetData($tEnLink, "cpMax"))

						; if "click here to Troubleshoot" is clicked...

						if StringCompare($sLink, "click_here_to_Troubleshoot") = 0 Then

							; then open the Troubleshooting help page
							Run('"' & @WindowsDir & '\hh.exe" "' & @ScriptDir & '\Retropanion.chm::/Troubleshooting.html"')
						EndIf

						if StringCompare($sLink, "scanning_video_modes") = 0 Then

							; then open the scanning video modes help page
							Run('"' & @WindowsDir & '\hh.exe" "' & @ScriptDir & '\Retropanion.chm::/Scan-the-Video-Modes-for-your-displays.html"')
						EndIf
					EndIf
            EndSwitch


	EndSwitch

	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY



Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
    #forceref $hWnd, $iMsg
    Local $hWndFrom = $lParam
    Local $iCode = BitShift($wParam, 16) ; Hi Word

	; TAB specific WM_COMMAND handlers ...

	Scrape_Images_with_Auto_Join_tab_WM_COMMAND_handler($hWndFrom, $iCode)
	Scrape_Metadata_tab_WM_COMMAND_handler($hWndFrom, $iCode)
	Scrape_Images_with_Manual_Join_tab_WM_COMMAND_handler($hWndFrom, $iCode)

	; Global WM_COMMAND handler ...

    Switch $hWndFrom

        Case GUICtrlGetHandle($system_combo)

			Switch $iCode

                Case $CBN_SELCHANGE

					IniWrite($ini_filename, "Global", "System", GUICtrlRead($system_combo))

					; clear all related controls that may already be set to another system

					GUICtrlSetData($scrape_auto_join_art_label, "Art (0)")
					GUICtrlSetData($scrape_auto_join_rom_label, "Roms (0)")
					_GUICtrlListBox_ResetContent($scrape_auto_join_art_list)
					_GUICtrlListBox_ResetContent($scrape_auto_join_rom_list)
					GUICtrlSetState($scrape_auto_join_art_1_pic, $GUI_HIDE)
					GUICtrlSetState($scrape_auto_join_rotate_art_button, $GUI_HIDE)
					GUICtrlSetState($scrape_auto_join_upload_button, $GUI_HIDE)

					GUICtrlSetData($scrape_manual_join_art_label, "Art (0)")
					GUICtrlSetData($scrape_manual_join_rom_label, "Roms (0)")
					_GUICtrlListBox_ResetContent($scrape_manual_join_art_list)
					_GUICtrlListBox_ResetContent($scrape_manual_join_rom_list)
					GUICtrlSetState($scrape_manual_join_down_button, $GUI_HIDE)
					GUICtrlSetState($scrape_manual_join_up_button, $GUI_HIDE)
					GUICtrlSetState($scrape_manual_join_art_1_pic, $GUI_HIDE)
					GUICtrlSetState($art_1_front, $GUI_HIDE)
					GUICtrlSetState($art_1_back, $GUI_HIDE)
					GUICtrlSetState($scrape_manual_join_art_2_pic, $GUI_HIDE)
					GUICtrlSetState($art_2_front, $GUI_HIDE)
					GUICtrlSetState($art_2_back, $GUI_HIDE)
					GUICtrlSetState($scrape_manual_join_art_3_pic, $GUI_HIDE)
					GUICtrlSetState($art_3_front, $GUI_HIDE)
					GUICtrlSetState($art_3_back, $GUI_HIDE)
					GUICtrlSetState($scrape_manual_join_art_4_pic, $GUI_HIDE)
					GUICtrlSetState($art_4_front, $GUI_HIDE)
					GUICtrlSetState($art_4_back, $GUI_HIDE)
					GUICtrlSetState($scrape_manual_join_art_5_pic, $GUI_HIDE)
					GUICtrlSetState($art_5_front, $GUI_HIDE)
					GUICtrlSetState($art_5_back, $GUI_HIDE)
					GUICtrlSetState($scrape_manual_join_upload_button, $GUI_HIDE)

					GUICtrlSetData($config_emulators_label, "Emulators (0)")
					GUICtrlSetData($config_games_label, "Games (0)")
					_GUICtrlListView_DeleteAllItems($config_system_listview)
					_GUICtrlListView_DeleteAllItems($config_game_listview)


			EndSwitch

        Case GUICtrlGetHandle($display_device_name_combo)

			Switch $iCode

                Case $CBN_SELCHANGE

					IniWrite($ini_filename, "Global", "Display", GUICtrlRead($display_device_name_combo))
					RefreshDisplayDeviceVideoModesListView()
					ReloadEmulatorsAndGamesConfig()
			EndSwitch


    EndSwitch

	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND


