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

_GDIPlus_Startup()


; Create the app data folder

if FileExists($app_data_dir) = False Then

	DirCreate($app_data_dir)
EndIf


; Erase the log

if FileExists($log_filename) = true Then

	FileDelete($log_filename)
EndIf


; Main gui

$main_gui = 											MainGUICreate($tab, 5, 40, 840-10, 720-30-30, $GUI_DOCKVCENTER + $GUI_DOCKBORDERS)
GUICtrlCreateGroupEx  ("----> System", 5, 0, 350, 40)
$system_combo = 										GUICtrlCreateComboFromDict($roms_path_dict, 10, 15, 250)
$system_open_docs_page_button = 						GUICtrlCreateImageButton("open docs page.ico", 270, 10, 28, "Open the RetroPie Docs page for this system")
$system_open_wiki_page_button = 						GUICtrlCreateImageButton("open wiki page.ico", 300, 10, 28, "Open the Wiki page for this system")
GUICtrlCreateGroupEx  ("----> Display", 360, 0, 200, 40)
$display_device_name_combo = 							GUICtrlCreateComboFromDict(Null, 370, 15, 150)
GUICtrlCreateGroupEx  ("----> EmulationStation", 580, 0, 100, 40)
$config_restart_emulationstation_button = 				GUICtrlCreateImageButton("restart.ico", 590, 15, 28, "Restart EmulationStation")
$config_quit_emulationstation_button = 					GUICtrlCreateImageButton("exit.ico", 620, 15, 28, "Quit EmulationStation")
GUICtrlCreateGroupEx  ("----> RetroPie", 700, 0, 100, 40)
$config_reboot_button = 								GUICtrlCreateImageButton("restart.ico", 710, 15, 28, "Restart RetroPie")
$config_shutdown_button = 								GUICtrlCreateImageButton("shutdown.ico", 740, 15, 28, "Shutdown RetroPie")

; Main gui tabs

Settings_tab_setup()
ROMs_tab_setup()
Scrape_Metadata_tab_setup()
Scrape_Images_with_Auto_Join_tab_setup()
Scrape_Images_with_Manual_Join_tab_setup()
Config_tab_setup()
Backup_tab_setup()
GUICtrlCreateTabItemEx("") ; end tabitem definition

$status_input = 															GUICtrlCreateStatusInput("Hint - hover mouse over controls for help", 10, 720 - 25, 800 - 20, 20)

$shift_up_dummy = GUICtrlCreateDummy()
$shift_down_dummy = GUICtrlCreateDummy()
GUISetAccelerators($main_aAccelKeys, $main_gui)

; Child guis

Settings_tab_child_gui_setup()
ROMs_tab_child_gui_setup()
Scrape_Metadata_tab_child_gui_setup()
Scrape_Images_with_Auto_Join_tab_child_gui_setup()
Scrape_Images_with_Manual_Join_tab_child_gui_setup()
Config_tab_child_gui_setup()
Backup_tab_child_gui_setup()








Enable_Emulators_and_Games($GUI_ENABLE)



GUISetState(@SW_SHOW, $main_gui)
$current_gui = $main_gui
GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
_TipDisplayLen(30000)

$rr = IniRead($ini_filename, "Global", "System", "3DO")
ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $rr = ' & $rr & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

_GUICtrlComboBox_SelectString($system_combo, IniRead($ini_filename, "Global", "System", "3DO"))
ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $ini_filename = ' & $ini_filename & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
_GUICtrlTab_SetCurFocus($tab, Number(IniRead($ini_filename, "Global", "Tab", 1)))



#cs
if FileExists($download_path & "\Box_Full") = False Then

	DirCreate($download_path & "\Box_Full")
EndIf


if FileExists($app_data_dir & "\" & $app_name & ".txt") = True Then

	; load the tree

	Local $tree_file_arr
	_FileReadToArray($app_data_dir & "\" & $app_name & ".txt", $tree_file_arr, 0)
	Local $tree_parent_item

	_GUICtrlTreeView_BeginUpdate($idTreeView)

	for $i = 0 to (UBound($tree_file_arr) - 1)

		if StringInStr($tree_file_arr[$i], "	", 1) = 0 Then

			$tree_parent_item = _GUICtrlTreeView_Add($idTreeView, 0, $tree_file_arr[$i])
			_GUICtrlTreeView_SetStateImageIndex($idTreeView, $tree_parent_item, 0)
		Else

			Local $tree_item_part = StringSplit($tree_file_arr[$i], "	", 2)
			local $tree_item_child = _GUICtrlTreeView_AddChild($idTreeView, $tree_parent_item, $tree_item_part[1])

			if StringCompare($tree_item_part[2], "True") = 0 Then

				_GUICtrlTreeView_SetChecked($idTreeView, $tree_item_child, True)
			Else

				_GUICtrlTreeView_SetChecked($idTreeView, $tree_item_child, False)
			EndIf

		EndIf


	Next

	_GUICtrlTreeView_Expand($idTreeView)
	_GUICtrlTreeView_EndUpdate($idTreeView)
EndIf

_GUICtrlTreeView_SelectItem($idTreeView, _GUICtrlTreeView_GetFirstItem($idTreeView))
#ce


While True

	; GUI msg loop...
	$msg = GUIGetMsg()

	Settings_tab_event_handler($msg)
	ROMs_tab_event_handler($msg)
	Scrape_Metadata_tab_event_handler($msg)
	Scrape_Images_with_Auto_Join_tab_event_handler($msg)
	Scrape_Images_with_Manual_Join_tab_event_handler($msg)
	Config_tab_event_handler($msg)
	Backup_tab_event_handler($msg)

	Switch $msg

		Case $GUI_EVENT_CLOSE

			; save the tree
#cs
			Local $tree_file_str = ""
			Local $tree_item = _GUICtrlTreeView_GetFirstItem($idTreeView)

			while $tree_item <> 0

				local $text = _GUICtrlTreeView_GetText($idTreeView, $tree_item)
				$tree_file_str = $tree_file_str & $text & @CRLF
				Local $tree_item_child = _GUICtrlTreeView_GetFirstChild($idTreeView, $tree_item)
				Local $tree_item_last_child = _GUICtrlTreeView_GetLastChild($idTreeView, $tree_item)

				while $tree_item_child <> 0

					Local $text = _GUICtrlTreeView_GetText($idTreeView, $tree_item_child)
					$tree_file_str = $tree_file_str & "	" & $text
					Local $checked = _GUICtrlTreeView_GetChecked($idTreeView, $tree_item_child)
					$tree_file_str = $tree_file_str & "	" & $checked & @CRLF

					if $tree_item_child = $tree_item_last_child Then

						ExitLoop
					EndIf

					$tree_item_child = _GUICtrlTreeView_GetNextSibling($idTreeView, $tree_item_child)
				wend

				$tree_item = _GUICtrlTreeView_GetNextSibling($idTreeView, $tree_item)
			wend


			FileDelete($app_data_dir & "\" & $app_name & ".txt")
			FileWrite($app_data_dir & "\" & $app_name & ".txt", $tree_file_str)
#ce

			GUISetState(@SW_ENABLE, $main_gui)
			GUISetState(@SW_HIDE, $current_gui)

			if $current_gui = $main_gui Then

				GUIDelete($current_gui)
				ExitLoop
			Else

				$current_gui = $main_gui
			EndIf

			if _GUICtrlTab_GetCurSel($tab) = 1 Then

				_GUICtrlListBox_ClickItem($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list))
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


	EndSwitch
WEnd

_GDIPlus_ShutDown ()




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

					GUICtrlSetData($config_emulators_games_group, "Emulators && Games (" & GUICtrlRead($system_combo) & ")")
					IniWrite($ini_filename, "Global", "System", GUICtrlRead($system_combo))
					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : GUICtrlRead($system_combo) = ' & GUICtrlRead($system_combo) & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $ini_filename = ' & $ini_filename & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			EndSwitch

        Case GUICtrlGetHandle($display_device_name_combo)

			Switch $iCode

                Case $CBN_SELCHANGE

					RefreshDisplayDeviceVideoModesListView()
			EndSwitch


    EndSwitch

	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND


