#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
#include-once
#Include "RetropanionEx.au3"
#include <IE.au3>
#include "GIFAnimation.au3"


Func Config_tab_setup()

	GUICtrlCreateTabItemEx("Config")
	$boot_config_x = 20
	$boot_config_y = 75
	$systems_list_config_x = 130
	$systems_list_config_y = $boot_config_y
	$input_devices_config_x = 20
	$input_devices_config_y = 610
	$system_config_x = 300
	$system_config_y = 75
	$game_config_x = 310
	$game_config_y = $boot_config_y + 230
	GUICtrlCreateGroupEx  ("RetroPie Config", $boot_config_x, $boot_config_y, 100, 70)
	$config_boot_edit_config_button = 											GUICtrlCreateImageButton("edit startup.ico", $boot_config_x + 10, $boot_config_y + 20, 36, "Edit the Boot Config of the RetroPie")
	GUICtrlCreateGroupEx  ("EmulationStation Config", $systems_list_config_x, $systems_list_config_y, 150, 70)
	$config_edit_systems_list_button = 											GUICtrlCreateImageButton("edit consoles.ico", $systems_list_config_x + 10, $systems_list_config_y + 20, 36, "Edit the Systems List of the RetroPie")
	GUICtrlCreateGroupEx  ("Display Config", 20, 150, 260, 450)
	$display_device_scan_modes_button = 										GUICtrlCreateImageButton("scan video modes.ico", $boot_config_x + 10, 170, 28, "Scan all video modes for the connected Display Device")
	$display_label = 															GUICtrlCreateLabel("Video Modes for the ""..."" display", 30, 210, 200, 20)
	$display_device_listview = 													GUICtrlCreateListViewEx(30, 230, 240, 360, "Video Mode", 90, "Resolution", 160)

	Local $display_device_filename_arr = _FileListToArray($app_data_dir, "display device *.txt", 1)

	if @error = 0 Then

		for $i = 1 to $display_device_filename_arr[0]

			Local $display_device_filename = $display_device_filename_arr[$i]
			$display_device_filename = StringReplace($display_device_filename, "display device ", "")
			$display_device_filename = StringReplace($display_device_filename, ".txt", "")
			_GUICtrlComboBox_AddString($display_device_name_combo, $display_device_filename)
		Next

		_GUICtrlComboBox_SetCurSel($display_device_name_combo, 0)
		RefreshDisplayDeviceVideoModesListView()
		GUICtrlSetData($display_label, "Video Modes for the """ & GUICtrlRead($display_device_name_combo) & """ display")
	EndIf

	GUICtrlCreateGroupEx  ("Input Config", $input_devices_config_x, $input_devices_config_y, 200, 70)
	$config_joystick_0_test_button = 											GUICtrlCreateImageButton("joystick0.ico", $input_devices_config_x + 10, $input_devices_config_y + 20, 36, "Joystick 0 test")
	;_GUIToolTip_AddTool($tooltip, 0, "The output of this can be used in the configuration of RetroArch", GUICtrlGetHandle($config_joystick_0_test_button))
	$config_joystick_1_test_button = 											GUICtrlCreateImageButton("joystick1.ico", $input_devices_config_x + 50, $input_devices_config_y + 20, 36, "Joystick 1 test")
	;_GUIToolTip_AddTool($tooltip, 0, "The output of this can be used in the configuration of RetroArch", GUICtrlGetHandle($config_joystick_1_test_button))
	GUICtrlCreateGroupEx  ("Emulators && Games Config", $system_config_x, $system_config_y, 520, 605)
	$config_emulators_games_reload_button = 									GUICtrlCreateImageButton("get from retropie.ico", $system_config_x + 470, $system_config_y + 10, 36, "Reload from RetroPie")
	$config_emulators_label = 													GUICtrlCreateLabelEx("Emulators (0)", $system_config_x + 10, $system_config_y + 30, 100, 20, "/opt/retropie/configs/all/videomodes.cfg")
	$config_system_listview = 													GUICtrlCreateListViewEx($system_config_x + 10, $system_config_y + 50, 500, 190, "Emulator Name", 200, "Video Mode", 150, "Default Emulator", 120)
	$config_games_label = 														GUICtrlCreateLabelEx("Games (0)", $game_config_x + 10, $game_config_y + 20, 100, 20, "/opt/retropie/configs/all/emulators.cfg")
	$config_game_listview = 													GUICtrlCreateListViewEx($system_config_x + 10, $game_config_y + 40, 500, 240, "Game Name", 200, "Emulator Name", 200)
	GUICtrlCreateGroupEx  ("Wiki", $system_config_x + 10, $game_config_y + 290, 110, 75)
	$config_wiki_compare_button = 												GUICtrlCreateImageButton("compare.ico", $system_config_x + 20, $game_config_y + 305, 36, "Compare (and optionally update) the Wiki games list to the RetroPie")

	; disabling the following temporary for a later version ...

	;GUICtrlCreateGroupEx  ("RetroPie", $system_config_x + 130, $game_config_y + 290, 290, 75)
	;$config_games_link_games_to_emulator_and_save_button = 						GUICtrlCreateButton("Link Games to Emulator and Save", $system_config_x + 140, $game_config_y + 305, 180, 20)
	;$config_games_launch_game_button = 											GUICtrlCreateButtonEx("Launch Game", $system_config_x + 330, $game_config_y + 305, 80, 20, "Only works if EmulationStation has been Quit")
	;$config_games_update_emulator_and_save_game_before_launch_game_checkbox = 	GUICtrlCreateCheckboxEx("Update Emulator to Game and Save before Launch", $game_config_x + 140, $game_config_y + 330, 260, 20, True)
	;GUICtrlCreateGroupEx  ("PC", $system_config_x + 430, $game_config_y + 290, 80, 70)
	;$config_games_open_button = 												GUICtrlCreateButton("Open", $system_config_x + 430 + 10, $game_config_y + 305, 50, 20)
	;$config_games_save_as_button = 												GUICtrlCreateButton("Save As", $system_config_x + 430 + 10, $game_config_y + 335, 60, 20)


EndFunc

Func Config_tab_child_gui_setup()

	$boot_config_gui = 															ChildGUICreate($app_name & " - Boot GUI", 640, 480, $main_gui)
	GUICtrlCreateGroupEx  ("----> RetroPie (/boot/config.txt)", 5, 5, 180, 40)
	$boot_config_load_button = 													GUICtrlCreateButton("Load", 10, 20, 80, 20)
	$boot_config_save_button = 													GUICtrlCreateButton("Save", 100, 20, 80, 20)
	GUICtrlCreateGroupEx  ("----> PC", 200, 5, 180, 40)
	$boot_config_open_button = 													GUICtrlCreateButton("Open", 205, 20, 80, 20)
	$boot_config_save_as_button = 												GUICtrlCreateButton("Save As", 295, 20, 80, 20)
	$boot_config_edit = 														GUICtrlCreateEdit("", 10, 50, 620, 400)
	$boot_config_status_input = 												GUICtrlCreateInput("", 10, 480 - 25, 640 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)

	$systems_list_gui = 														ChildGUICreate($app_name & " - Systems List GUI", 800, 480, $main_gui)
	GUICtrlCreateGroupEx  ("----> RetroPie (/etc/emulationstation/es_systems.cfg)", 5, 5, 250, 40)
	$systems_list_load_button = 												GUICtrlCreateButton("Load", 10, 20, 80, 20)
	$systems_list_save_button = 												GUICtrlCreateButton("Save", 100, 20, 80, 20)
	GUICtrlCreateGroupEx  ("----> PC", 270, 5, 180, 40)
	$systems_list_open_button = 												GUICtrlCreateButton("Open", 275, 20, 80, 20)
	$systems_list_save_as_button = 												GUICtrlCreateButton("Save As", 365, 20, 80, 20)
	$systems_list_edit = 														GUICtrlCreateEdit("", 10, 50, 620, 400)
	GUICtrlCreateGroupEx  ("----> Custom Order", 650, 5, 140, 400)
	$systems_list_custom_order_list = 											GUICtrlCreateList("", 660, 20, 120, 350, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))
	$systems_list_custom_order_reorder_button = 								GUICtrlCreateButton("ReOrder", 660, 360, 80, 20)
	$systems_list_status_input = 												GUICtrlCreateInput("", 10, 480 - 25, 640 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)

	$compare_games_to_wiki_gui = 												ChildGUICreate($app_name & " - Compare Game List to Wiki GUI", 1024, 480, $main_gui)
	$compare_games_to_wiki_accept_button = 										GUICtrlCreateButton("Accept Wiki page game list (left side)", 10, 5, 200, 40)
	$compare_games_to_wiki_open_wiki_page_button = 								GUICtrlCreateImageButton("open wiki page.ico", 220, 10, 36, "Open the Wiki page for this system")
	$compare_games_to_wiki_ie = _IECreateEmbedded()
	GUICtrlCreateObj($compare_games_to_wiki_ie, 10, 50, 1004, 400)
	$compare_games_to_wiki_status_input = 										GUICtrlCreateInput("", 10, 480 - 25, 640 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)

	$compare_games_to_wiki_dummy = 												GUICtrlCreateDummy()
	Local $compare_aAccelKeys[1][2] = [["{Esc}", $compare_games_to_wiki_dummy]]
	GUISetAccelerators($compare_aAccelKeys, $compare_games_to_wiki_gui)

EndFunc




Func Config_tab_event_handler($msg)

	Switch $msg

		Case $GUI_EVENT_CLOSE

			if $current_gui = $boot_config_gui Then

				GUISetState(@SW_ENABLE, $main_gui)
				GUISetState(@SW_HIDE, $current_gui)
				$current_gui = $main_gui
				raise_button_and_enable_gui($config_boot_edit_config_button)
			EndIf

			if $current_gui = $systems_list_gui Then

				GUISetState(@SW_ENABLE, $main_gui)
				GUISetState(@SW_HIDE, $current_gui)
				$current_gui = $main_gui
				raise_button_and_enable_gui($config_edit_systems_list_button)
			EndIf

			if $current_gui = $compare_games_to_wiki_gui Then

				GUISetState(@SW_ENABLE, $main_gui)
				GUISetState(@SW_HIDE, $current_gui)
				$current_gui = $main_gui
				;raise_button_and_enable_gui($config_edit_systems_list_button)
			EndIf

		Case $config_boot_edit_config_button

			depress_button_and_disable_gui($msg)
			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $boot_config_gui)
			$current_gui = $boot_config_gui

			; load the config.txt from the RetroPie

			GUICtrlSetData($boot_config_status_input, "Reading /boot/config.txt from RetroPie ...")
			$result = plink("cat /boot/config.txt", 2)
			$result = StringStripCR($result)
			$result = StringReplace($result, @LF, @CRLF)
			GUICtrlSetData($boot_config_edit, $result)
			GUICtrlSetData($boot_config_status_input, "")


		Case $boot_config_load_button

			GUICtrlSetData($boot_config_status_input, "Reading /boot/config.txt from RetroPie ...")
			$result = plink("cat /boot/config.txt", 2)
			$result = StringStripCR($result)
			$result = StringReplace($result, @LF, @CRLF)
			GUICtrlSetData($boot_config_edit, $result)
			GUICtrlSetData($boot_config_status_input, "")

		Case $boot_config_save_button

			$result = GUICtrlRead($boot_config_edit)

			; the following uses PLINK instead of WinSCP because WinSCP is unable to automate the editing of /boot/config.txt
			;	the only method I have found to automate the editing of /boot/config.txt is via ed

			GUICtrlSetData($boot_config_status_input, "Erasing config.txt on the RetroPie ...")
			plink_delete_all_text_in_file("/boot/config.txt")
			GUICtrlSetData($boot_config_status_input, "Saving config.txt to /boot on the RetroPie ...")
			plink_insert_text_in_file("/boot/config.txt", $result)
			GUICtrlSetData($boot_config_status_input, "Saved config.txt to /boot on the RetroPie.")

		Case $boot_config_open_button

			$result = FileOpenDialog($app_name, $app_data_dir, "Text files (*.txt)")


		Case $boot_config_save_as_button

			$result = FileSaveDialog($app_name, $app_data_dir, "Text files (*.txt)")




		Case $display_device_scan_modes_button

			_GUICtrlListView_DeleteAllItems($display_device_listview)
			GUICtrlStatusInput_SetText($status_input, "Please Wait. Executing ""/opt/retropie/supplementary/mesa-drm/modetest -c"" on the RetroPie ...")
			$result = plink("/opt/retropie/supplementary/mesa-drm/modetest -c", 2)
			GUICtrlStatusInput_SetText($status_input, "")
			Local $modetest_line_arr = StringSplit($result, @LF, 3)
			Local $modes_header_num = 99999
			Local $video_mode_arr[0][2]

			for $each_modetest_line in $modetest_line_arr

				if StringCompare($each_modetest_line, "  modes:") = 0 Then

					$modes_header_num = 1
				EndIf

				if $modes_header_num < 0 Then

					Local $modetest_part_arr = StringSplit($each_modetest_line, " ", 3)

					if StringRegExp($modetest_part_arr[2], "[a-z]+:") = 1 Then

						ExitLoop
					EndIf

					_ArrayAdd($video_mode_arr, "87-" & UBound($video_mode_arr) & "|" & $modetest_part_arr[2] & " @ " & $modetest_part_arr[3] & " Hz")
				EndIf

				$modes_header_num = $modes_header_num - 1
			Next

			if UBound($video_mode_arr) < 1 Then

				GUICtrlStatusInput_SetText($status_input, "No video modes detected. RetroPie must be active on your display, then try again.")
			else

				_GUICtrlListView_AddArray($display_device_listview, $video_mode_arr)
				Local $display_device_filename = $app_data_dir & "\display device " & GUICtrlRead($display_device_name_combo) & ".txt"
				_FileWriteFromArray($display_device_filename, $video_mode_arr)
			EndIf



		Case $compare_games_to_wiki_dummy

			GUISetState(@SW_ENABLE, $main_gui)
			GUISetState(@SW_HIDE, $current_gui)
			$current_gui = $main_gui


		Case $compare_games_to_wiki_accept_button


			Local $gamelist_arr
			_FileReadToArray($wiki_emulators_cfg_file_path, $gamelist_arr, 4, " = ")

			for $i = 0 to (UBound($gamelist_arr) - 1)

				$gamelist_arr[$i][1] = StringReplace($gamelist_arr[$i][1], """", "")
				;ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $gamelist_arr[$i][0] = ' & $gamelist_arr[$i][0] & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
				;ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $gamelist_arr[$i][1] = ' & $gamelist_arr[$i][1] & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			Next

			_GUICtrlListView_DeleteAllItems($config_game_listview)
			_GUICtrlListView_AddArray($config_game_listview, $gamelist_arr)

			GUISetState(@SW_ENABLE, $main_gui)
			GUISetState(@SW_HIDE, $current_gui)
			$current_gui = $main_gui


		Case $compare_games_to_wiki_open_wiki_page_button

			depress_button_and_disable_gui($msg, 100)
			ShellExecute("https://github.com/seanhaydongriffin/" & $app_name & "/wiki/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "-Emulator-Game-Compatibility")
			raise_button_and_enable_gui($msg)





		Case $config_wiki_compare_button

			GUISetState(@SW_DISABLE, $main_gui)
			_IENavigate($compare_games_to_wiki_ie, "about:blank")
			GUISetState(@SW_SHOW, $compare_games_to_wiki_gui)
			$current_gui = $compare_games_to_wiki_gui

			; convert the wiki games data into a RetroPie emulator.cfg formatted file

			GUICtrlSetData($compare_games_to_wiki_status_input, "Reading https://github.com/seanhaydongriffin/" & $app_name & "/wiki/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "-Emulator-Game-Compatibility")
			Local $iPID = Run('curl.exe -s -k -H "Content-Type: text/html; charset=utf-8" https://github.com/seanhaydongriffin/' & $app_name & '/wiki/' & $roms_path_dict.Item(GUICtrlRead($system_combo)) & '-Emulator-Game-Compatibility', @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
			ProcessWaitClose($iPID)
			Local $html = StdoutRead($iPID)
			GUICtrlSetData($compare_games_to_wiki_status_input, "")

			Local $arr = StringRegExp($html, "(?s)<th>Game</th>(?U)(.*)</tr>", 3)
			$arr[0] = StringStripWS($arr[0], 3)
			Local $wiki_emulator = StringSplit($arr[0], @LF, 3)

			for $i = 0 to (UBound($wiki_emulator) - 1)

				$wiki_emulator[$i] = StringReplace($wiki_emulator[$i], "<th>", "")
				$wiki_emulator[$i] = StringReplace($wiki_emulator[$i], "</th>", "")
				$wiki_emulator[$i] = StringReplace($wiki_emulator[$i], "Â¹", "")
				$wiki_emulator[$i] = StringReplace($wiki_emulator[$i], "Â²", "")
				$wiki_emulator[$i] = StringReplace($wiki_emulator[$i], "Â³", "")
				$wiki_emulator[$i] = StringReplace($wiki_emulator[$i], "â´", "")
				$wiki_emulator[$i] = StringReplace($wiki_emulator[$i], "âµ", "")
				$wiki_emulator[$i] = StringReplace($wiki_emulator[$i], "â¶", "")
				$wiki_emulator[$i] = StringReplace($wiki_emulator[$i], ")", "")
				$wiki_emulator[$i] = StringReplace($wiki_emulator[$i], "(", "-")
				$wiki_emulator[$i] = StringStripWS($wiki_emulator[$i], 8)
			Next

			Local $html_arr = StringSplit($html, @LF, 3)
			Local $found_game_table = False
			Local $searching_for_game_name = False
			Local $searching_for_game_emulator = False
			Local $emulator_index = -1

			Local $wiki_game_emulator_arr[0][4]
			; [n][0] = wiki game name
			; [n][1] = best matching rom filename
			; [n][2] = best emulator
			; [n][3] = the matching accuracy of the best matching rom filename

			Local $game_name = ""
			Local $emulator_name = ""

			; for every line in the Wiki HTML

			for $i = 0 to (UBound($html_arr) - 1)

				;ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $html_arr[$i] = ' & $html_arr[$i] & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console


				if StringCompare($html_arr[$i], "<th>Game</th>") = 0 Then

					$found_game_table = True
				EndIf

				if $found_game_table = True Then


					Local $arr = StringRegExp($html_arr[$i], "<td>(?U)(.+?)</td>", 3)

					if UBound($arr) > 0 Then

						$game_name = $arr[0]


						; convert the game name from the Wiki to a short rom name

						$game_name = $roms_path_dict.Item(GUICtrlRead($system_combo)) & "_" & $game_name
						$game_name = StringReplace($game_name, " ", "")
						$game_name = StringReplace($game_name, "(", "")
						$game_name = StringReplace($game_name, ")", "")
						$game_name = StringReplace($game_name, ",", "")
						$game_name = StringReplace($game_name, ".", "")
						$game_name = StringReplace($game_name, "[", "")
						$game_name = StringReplace($game_name, "]", "")
						$game_name = StringReplace($game_name, "!", "")
						$game_name = StringReplace($game_name, "'", "")

						ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $game_name = ' & $game_name & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

						$emulator_index = -2

						while StringCompare($html_arr[$i], "</tr>") <> 0

							$emulator_index = $emulator_index + 1
							ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $emulator_index = ' & $emulator_index & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
							ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $html_arr[$i] = ' & $html_arr[$i] & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

							if StringCompare($html_arr[$i], "<td><strong>best</strong></td>") = 0 Then

								_ArrayAdd($wiki_game_emulator_arr, $game_name & "||""" & $wiki_emulator[$emulator_index] & """|")
							EndIf

							$i = $i + 1
						WEnd
					EndIf
				EndIf
			Next

			Local $num_wiki_games = UBound($wiki_game_emulator_arr)

			for $i = 0 to ($num_wiki_games - 1)

				if $i > ($num_wiki_games - 1) Then ExitLoop

				$game_name = $wiki_game_emulator_arr[$i][0]

				; Search for this game name in the game listview (RetroPie gamelist)

				;for $j = StringLen($game_name) to 1 Step -1

					Local $rom_name_search_text = $game_name ; StringLeft($game_name, $j)
					Local $game_name_match[0]
					Local $find_text_from_index = -1

					While True

						$result = _GUICtrlListView_FindText($config_game_listview, $rom_name_search_text, $find_text_from_index, True, False)

						if $result > -1 Then

							_ArrayAdd($game_name_match, _GUICtrlListView_GetItemText($config_game_listview, $result))
							$find_text_from_index = $result
						Else

							ExitLoop
						EndIf
					WEnd

					; if only a single game name from the Wiki is a complete match

					if UBound($game_name_match) = 1 and StringCompare($game_name, $game_name_match[0]) = 0 Then

						;$game_name = $game_name_match[0]
						$wiki_game_emulator_arr[$i][1] = $game_name_match[0]
						;$wiki_game_emulator_arr[$i][2] = $game_name_match[0]
						$wiki_game_emulator_arr[$i][3] = 0
						;ExitLoop
					EndIf

					; if multiple game names from the Wiki are matching
					; find the game name that is the closest match (lowest number of differences)

					Local $least_num_diffs = 9999

					for $k = 0 to (UBound($game_name_match) - 1)

						$num_diffs = _Typos($rom_name_search_text, $game_name_match[$k])

						if $num_diffs < $least_num_diffs Then

							$least_num_diffs = $num_diffs
;								$game_name = $game_name_match[$k]
							$wiki_game_emulator_arr[$i][1] = $game_name_match[$k]
							$wiki_game_emulator_arr[$i][3] = $least_num_diffs
						EndIf
					Next

					; if no best matching rom filename was found then remove from the comparison

					if StringLen($wiki_game_emulator_arr[$i][1]) < 1 Then

						_ArrayDelete($wiki_game_emulator_arr, $i)
						$num_wiki_games = $num_wiki_games - 1
						$i = $i - 1
					EndIf

					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $game_name = ' & $game_name & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
					;ExitLoop
				;Next
			Next



;_ArrayDisplay($wiki_game_emulator_arr)


			if FileExists($wiki_emulators_cfg_file_path) = True Then

				FileDelete($wiki_emulators_cfg_file_path)
			EndIf


;			_ArrayDisplay($wiki_game_emulator_arr)
			_ArraySort($wiki_game_emulator_arr)

;			$ee = StringStripWS(_ArrayToString($wiki_game_emulator_arr, "|", -1, -1, @CRLF, 1, 2), 3)
;			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $ee = ' & $ee & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

			FileWrite($wiki_emulators_cfg_file_path, StringStripWS(_ArrayToString($wiki_game_emulator_arr, " = ", -1, -1, @CRLF, 1, 2), 3))

			; convert the Retropie games list into a RetroPie emulator.cfg formatted file

			$gameslist_emulators_str = ""

			for $i = 0 to (_GUICtrlListView_GetItemCount($config_game_listview) - 1)

				Local $game_name = _GUICtrlListView_GetItemText($config_game_listview, $i, 0)
				Local $emulator_name = _GUICtrlListView_GetItemText($config_game_listview, $i, 1)

				if StringCompare($emulator_name, $default_emulator) <> 0 Then

					if StringLen($gameslist_emulators_str) > 0 Then

						$gameslist_emulators_str = $gameslist_emulators_str & @CRLF
					EndIf

					$gameslist_emulators_str = $gameslist_emulators_str & $game_name & " = """ & $emulator_name & """"
				EndIf
			Next

			Local $gameslist_emulators_cfg_file_path = $app_data_dir & "\gameslist_emulators.cfg"

			if FileExists($gameslist_emulators_cfg_file_path) = True Then

				FileDelete($gameslist_emulators_cfg_file_path)
			EndIf

			FileWrite($gameslist_emulators_cfg_file_path, $gameslist_emulators_str)
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $gameslist_emulators_str = ' & $gameslist_emulators_str & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

			Local $winmerge_output_file_path = $app_data_dir & "\emulators_cfg_diff.html"

			$cmd = "WinMergeU.exe"
			$cmd_params = """" & $wiki_emulators_cfg_file_path & """ """ & $gameslist_emulators_cfg_file_path & """ -minimize -noninteractive -u -or """ & $winmerge_output_file_path & """"
			$full_cmd = $cmd & " " & $cmd_params
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $full_cmd = ' & $full_cmd & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			_FileWriteLog($log_filename, $full_cmd)

			GUICtrlSetData($compare_games_to_wiki_status_input, "Comparing " & $wiki_emulators_cfg_file_path & " to " & $gameslist_emulators_cfg_file_path)
			ShellExecuteWait($cmd, $cmd_params, "c:\Program Files\WinMerge\WinMergeU.exe", "", @SW_HIDE)

			$html = FileRead($winmerge_output_file_path)
			$html = StringReplace($html, "table {margin: 0; border: 1px solid #a0a0a0; box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.15);}", "html * {font-size: 12px !important; font-family: Arial !important;}" & @CRLF & "table {margin: 0; border: 1px solid #a0a0a0; box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.15); display: block; overflow-x: auto; white-space: nowrap;}")
;			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $html = ' & $html & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			_IEDocWriteHTML($compare_games_to_wiki_ie, $html)
			GUICtrlSetData($compare_games_to_wiki_status_input, "")


;Exit

			;for $i = 0 to (UBound($arr) - 1) step 2

			;	$arr[$i + 1] = StringRegExpReplace($arr[$i + 1], '\\|/|:|\*|\?|\"|\<|\>|\|', "")










;		Case $config_shutdown_emulationstation_button

;			GUICtrlStatusInput_SetText($status_input, "Shutting down EmulationStation ...")
;			plink("sudo touch /tmp/es-shutdown")
;			plink("sudo pkill -f \""/opt/retropie/supplementary/.*/emulationstation([^.]|$)\""")
;			GUICtrlStatusInput_SetText($status_input, "")

		Case $config_joystick_0_test_button

			depress_button_and_disable_gui($msg, -1, 100)
			Run("plink.exe -ssh " & GUICtrlRead($retropie_hostname_input) & " -l " & GUICtrlRead($retropie_username_input) & " -pw " & GUICtrlRead($retropie_password_input) & " -batch jstest /dev/input/js0", @ScriptDir)
			raise_button_and_enable_gui($msg)

		Case $config_joystick_1_test_button

			depress_button_and_disable_gui($msg, -1, 100)
			Run("plink.exe -ssh " & GUICtrlRead($retropie_hostname_input) & " -l " & GUICtrlRead($retropie_username_input) & " -pw " & GUICtrlRead($retropie_password_input) & " -batch jstest /dev/input/js1", @ScriptDir)
			raise_button_and_enable_gui($msg)



		Case $config_emulators_games_reload_button

			ReloadEmulatorsAndGamesConfig()

	; disabling the following temporary for a later version ...

;		case $config_games_link_games_to_emulator_and_save_button

;			update_games_emulator()
;			save_games()

;		Case $config_games_launch_game_button

;			if GUICtrlRead($config_games_update_emulator_and_save_game_before_launch_game_checkbox) = $GUI_CHECKED Then

;				update_games_emulator()
;				save_games()
;			EndIf

;			Local $selected_game = _GUICtrlListView_GetItemText($config_game_listview, Number(_GUICtrlListView_GetSelectedIndices($config_game_listview)), 0)
;			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $selected_game = ' & $selected_game & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

			; find the rom that matches the game name from emulators.cfg

;			for $each_all_roms_line in $all_roms_line_arr

;				_PathSplit($each_all_roms_line, $sDrive1, $sDir1, $sFileName1, $sExtension1)
;				Local $short_rom_name = $roms_path_dict.Item(GUICtrlRead($system_combo)) & "_" & $sFileName1
;				$short_rom_name = StringReplace($short_rom_name, " ", "")
;				$short_rom_name = StringReplace($short_rom_name, "(", "")
;				$short_rom_name = StringReplace($short_rom_name, ")", "")
;				$short_rom_name = StringReplace($short_rom_name, ",", "")
;				$short_rom_name = StringReplace($short_rom_name, ".", "")
;				$short_rom_name = StringReplace($short_rom_name, "[", "")
;				$short_rom_name = StringReplace($short_rom_name, "]", "")
;				$short_rom_name = StringReplace($short_rom_name, "!", "")
;				$short_rom_name = StringReplace($short_rom_name, "'", "")

;				if StringCompare($short_rom_name, $selected_game) = 0 Then

;					Local $rom_name_for_runcommand = $each_all_roms_line
;					$rom_name_for_runcommand = StringReplace($rom_name_for_runcommand, " ", "\ ")
;					$rom_name_for_runcommand = StringReplace($rom_name_for_runcommand, "(", "\(")
;					$rom_name_for_runcommand = StringReplace($rom_name_for_runcommand, ")", "\)")

					; quitting emulationstation (otherwise the game runs underneath emulationstation) and launching the rom

;					GUICtrlStatusInput_SetText($status_input, "Quitting EmulationStation and Launching """ & $sFileName1 & $sExtension1 & """ ... (to restart EmulationStation click RetroPie Restart)")
;					plink("sudo pkill -f \""/opt/retropie/supplementary/.*/emulationstation([^.]|$)\""")

;					Local $plink_cmd = "sudo /opt/retropie/supplementary/runcommand/runcommand2.sh 0 _SYS_ n64 """ & $rom_name_for_runcommand & """"
;					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $plink_cmd = ' & $plink_cmd & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
;					$result = plink($plink_cmd, 2)

;				EndIf

;			Next




;		Case $config_games_open_button

;			$result = FileOpenDialog($app_name, $app_data_dir, "Config files (*.cfg)", 0, $app_name & " n64 emulators.cfg", $main_gui)

;			if @error = 0 Then

;				Enable_Config()
;				GUICtrlSetData($config_games_label, "Games")
;				_GUICtrlListView_DeleteAllItems($config_game_listview)

;				Local $emulators_cfg_arr
;				_FileReadToArray($result, $emulators_cfg_arr, 0, "=")

;				for $i = 0 to (UBound($emulators_cfg_arr) - 1)

;					$emulators_cfg_arr[$i][0] = StringStripWS($emulators_cfg_arr[$i][0], 3)
;					$emulators_cfg_arr[$i][1] = StringReplace($emulators_cfg_arr[$i][1], """", "")
;					$emulators_cfg_arr[$i][1] = StringStripWS($emulators_cfg_arr[$i][1], 3)
;				Next

;				_GUICtrlListView_BeginUpdate($config_game_listview)
;				_GUICtrlListView_AddArray($config_game_listview, $emulators_cfg_arr)

;				GUICtrlStatusInput_SetText($status_input, "Please Wait. Reading directory from /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " on the RetroPie ...")
;				$result = plink("ls /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/*.{bin,zip,lha,a52,a78,j64,lnx,rom,nes,mgw,gba,love,7z,n64,z64,nds,iso,32x,sfc,smc,vec,ws}", 2)
;				Local $all_roms_line_arr = StringSplit($result, @LF, 3)

;				for $each_all_roms_line in $all_roms_line_arr

;					_PathSplit($each_all_roms_line, $sDrive1, $sDir1, $sFileName1, $sExtension1)
;					$each_all_roms_line = $roms_path_dict.Item(GUICtrlRead($system_combo)) & "_" & $sFileName1
;					$each_all_roms_line = StringReplace($each_all_roms_line, " ", "")
;					$each_all_roms_line = StringReplace($each_all_roms_line, "(", "")
;					$each_all_roms_line = StringReplace($each_all_roms_line, ")", "")
;					$each_all_roms_line = StringReplace($each_all_roms_line, ",", "")
;					$each_all_roms_line = StringReplace($each_all_roms_line, ".", "")
;					$each_all_roms_line = StringReplace($each_all_roms_line, "[", "")
;					$each_all_roms_line = StringReplace($each_all_roms_line, "]", "")
;					$each_all_roms_line = StringReplace($each_all_roms_line, "!", "")
;					$each_all_roms_line = StringReplace($each_all_roms_line, "'", "")

;					$result = _GUICtrlListView_FindText($config_game_listview, $each_all_roms_line, -1, False)

;					if $result < 0 Then

;						Local $index = _GUICtrlListView_AddItem($config_game_listview, $each_all_roms_line)
;						_GUICtrlListView_AddSubItem($config_game_listview, $index, $default_emulator, 1)
;					EndIf
;				Next

;				Local $g_bSortSense = False
;				_GUICtrlListView_SimpleSort($config_game_listview, $g_bSortSense, 0, False)
;				_GUICtrlListView_EndUpdate($config_game_listview)
;				Enable_Config($GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE)
;				GUICtrlSetData($config_games_label, "Games (" & _GUICtrlListView_GetItemCount($config_game_listview) & ")")
;				GUICtrlStatusInput_SetText($status_input, "Games updated.")

;			EndIf

;		Case $config_games_save_as_button

;			$result = FileSaveDialog($app_name, $app_data_dir, "Config files (*.cfg)", 0, $app_name & " n64 emulators.cfg", $main_gui)

;			if @error = 0 Then

;				Enable_Config()
;				$emulators_cfg_str = ""

;				for $i = 0 to (_GUICtrlListView_GetItemCount($config_game_listview) - 1)

;					Local $game_name = _GUICtrlListView_GetItemText($config_game_listview, $i, 0)
;					Local $emulator_name = _GUICtrlListView_GetItemText($config_game_listview, $i, 1)

;					if StringCompare($emulator_name, $default_emulator) <> 0 Then

;						if StringLen($emulators_cfg_str) > 0 Then

;							$emulators_cfg_str = $emulators_cfg_str & @CRLF
;						EndIf

;						$emulators_cfg_str = $emulators_cfg_str & $game_name & " = """ & $emulator_name & """"
;					EndIf
;				Next

;				GUICtrlStatusInput_SetText($status_input, "Please Wait. Erasing " & $result & " ...")
;				FileDelete($result)
;				GUICtrlStatusInput_SetText($status_input, "Please Wait. Saving " & $result & " ...")
;				FileWrite($result, $emulators_cfg_str)
;				GUICtrlStatusInput_SetText($status_input, "Saved " & $result & ".")
;				Enable_Config($GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE)
;			EndIf

		case $config_edit_systems_list_button

			depress_button_and_disable_gui($msg)
			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $systems_list_gui)
			$current_gui = $systems_list_gui

			; load the es_systems.cfg from the RetroPie

			GUICtrlSetData($systems_list_edit, "")
			GUICtrlSetData($systems_list_status_input, "Reading /etc/emulationstation/es_systems.cfg from RetroPie ...")
			$result = plink("cat /etc/emulationstation/es_systems.cfg", 2)
			$result = StringStripCR($result)
			$result = StringReplace($result, @LF, @CRLF)
			GUICtrlSetData($systems_list_edit, $result)
			GUICtrlSetData($systems_list_status_input, "Read /etc/emulationstation/es_systems.cfg from RetroPie.")

			; load the Retropanion Systems Custom Order.cfg if that exists

			if FileExists(@ScriptDir & "\" & $app_name & " Systems Custom Order.cfg") = True Then

				Local $custom_order_arr
				_FileReadToArray(@ScriptDir & "\" & $app_name & " Systems Custom Order.cfg", $custom_order_arr, 0)

				for $each in $custom_order_arr

					_GUICtrlListBox_InsertString($systems_list_custom_order_list, $each)
				Next
			EndIf

		Case $systems_list_load_button

			GUICtrlSetData($systems_list_edit, "")
			GUICtrlSetData($systems_list_status_input, "Loading es_systems.cfg from the RetroPie ...")
			$result = plink("cat /etc/emulationstation/es_systems.cfg", 2)
			$result = StringStripCR($result)
			$result = StringReplace($result, @LF, @CRLF)
			GUICtrlSetData($systems_list_edit, $result)
			GUICtrlSetData($systems_list_status_input, "Loaded es_systems.cfg from /etc/emulationstation on the RetroPie.")

		Case $systems_list_save_button

			$result = GUICtrlRead($systems_list_edit)
			GUICtrlSetData($systems_list_status_input, "Erasing es_systems.cfg on the RetroPie ...")
			plink_delete_all_text_in_file("/etc/emulationstation/es_systems.cfg")
			GUICtrlSetData($systems_list_status_input, "Saving es_systems.cfg to /etc/emulationstation on the RetroPie ...")
			plink_insert_text_in_file("/etc/emulationstation/es_systems.cfg", $result)
			GUICtrlSetData($systems_list_status_input, "Saved es_systems.cfg to /etc/emulationstation on the RetroPie.")

			$result = MsgBox(1+32+8192, $app_name, "Restart EmulationStation to see the updated Systems List?")

			if $result = 1 Then

				GUICtrlSetData($systems_list_status_input, "Restarting EmulationStation ...")
				plink("sudo touch /tmp/es-restart")
				plink("sudo pkill -f \""/opt/retropie/supplementary/.*/emulationstation([^.]|$)\""")
				GUICtrlSetData($systems_list_status_input, "")
			EndIf

;									_WinSCP_ExecuteCommand("sudo chmod 666 /etc/emulationstation/es_systems.cfg")
;									$result = _WinSCP_PutFiles(@ScriptDir & "\es_systems.cfg", "/etc/emulationstation/es_systems.cfg")
;									_WinSCP_ExecuteCommand("sudo chmod 644 /etc/emulationstation/es_systems.cfg")


		Case $systems_list_open_button



		Case $systems_list_save_as_button



		Case $systems_list_custom_order_reorder_button

			Local $es_systems_xml_dom = _XMLLoadXML(GUICtrlRead($systems_list_edit), "")
			Local $num_nodes = _XMLGetNodeCount($es_systems_xml_dom, "/systemList/system")
			Local $unsorted_index = _GUICtrlListBox_GetCount($systems_list_custom_order_list) - 1
			Local $es_systems_xml_arr[$num_nodes + 3]
			$es_systems_xml_arr[0] = "<?xml version=""1.0""?>"
			$es_systems_xml_arr[1] = "<systemList>"
			$es_systems_xml_arr[UBound($es_systems_xml_arr) - 1] = "</systemList>"

			for $i = 1 to $num_nodes

				Local $system_xml = _XMLGetXML($es_systems_xml_dom, "/systemList/system[" & $i & "]")
				Local $system_name = _XMLGetValue($es_systems_xml_dom, "/systemList/system[" & $i & "]/name")
				$result = _GUICtrlListBox_FindString($systems_list_custom_order_list, $system_name, True)

				if $result < 0 Then

					$unsorted_index = $unsorted_index + 1
					$es_systems_xml_arr[$unsorted_index + 2] = "  " & $system_xml
				Else

					$es_systems_xml_arr[$result + 2] = "  " & $system_xml
				EndIf
			Next

			Local $es_systems_xml = _ArrayToString($es_systems_xml_arr, @CRLF)

			if @error <> 0 Then

				GUICtrlSetData($systems_list_status_input, "Error creating es_systems_xml. Aborted.")
			Else

				GUICtrlSetData($systems_list_edit, $es_systems_xml)
				GUICtrlSetData($systems_list_status_input, "XML reordered according to the Custom Order.")
			EndIf
	EndSwitch

EndFunc



Func update_games_emulator()

	$selected_games = _GUICtrlListView_GetSelectedIndices($config_game_listview, true)

	if $selected_games[0] > 0 Then

		_ArrayDelete($selected_games, 0)
		Local $selected_emulator = _GUICtrlListView_GetItemText($config_system_listview, Number(_GUICtrlListView_GetSelectedIndices($config_system_listview)), 0)

		for $each_game_index In $selected_games

			_GUICtrlListView_SetItemText($config_game_listview, $each_game_index, $selected_emulator, 1)
		Next
	EndIf

EndFunc


Func save_games()

	Enable_Config()
	$emulators_cfg_str = ""

	for $i = 0 to (_GUICtrlListView_GetItemCount($config_game_listview) - 1)

		Local $game_name = _GUICtrlListView_GetItemText($config_game_listview, $i, 0)
		Local $emulator_name = _GUICtrlListView_GetItemText($config_game_listview, $i, 1)

		if StringCompare($emulator_name, $default_emulator) <> 0 Then

			if StringLen($emulators_cfg_str) > 0 Then

				$emulators_cfg_str = $emulators_cfg_str & @CRLF
			EndIf

			$emulators_cfg_str = $emulators_cfg_str & $game_name & " = """ & $emulator_name & """"
		EndIf
	Next

	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $emulators_cfg_str = ' & $emulators_cfg_str & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	GUICtrlStatusInput_SetText($status_input, "Please Wait. Erasing emulators.cfg on the RetroPie ...")
	plink_delete_all_text_in_file("/opt/retropie/configs/all/emulators.cfg")
	GUICtrlStatusInput_SetText($status_input, "Please Wait. Saving emulators.cfg to /opt/retropie/configs/all on the RetroPie ...")
	plink_insert_text_in_file("/opt/retropie/configs/all/emulators.cfg", $emulators_cfg_str)
	GUICtrlStatusInput_SetText($status_input, "Saved emulators.cfg to /opt/retropie/configs/all on the RetroPie. Start the game using the RetroPie to try the emulator.")
	Enable_Config($GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE)

EndFunc


Func Enable_Config($retropie_edit_boot_config_button = $GUI_DISABLE, $retropie_restart_button = $GUI_DISABLE, $retropie_shutdown_button = $GUI_DISABLE, $emulationstation_edit_systems_list_button = $GUI_DISABLE, $emulationstation_restart_button = $GUI_DISABLE, $reload_button = $GUI_DISABLE, $system_listview = $GUI_DISABLE, $game_listview = $GUI_DISABLE, $update_games_emulator_button = $GUI_DISABLE, $save_games_button = $GUI_DISABLE, $open_button = $GUI_DISABLE, $save_as_button = $GUI_DISABLE)

	GUICtrlSetState($config_boot_edit_config_button, $retropie_edit_boot_config_button)
	GUICtrlSetState($retropie_reboot_button, $retropie_restart_button)
	GUICtrlSetState($retropie_shutdown_button, $retropie_shutdown_button)
	GUICtrlSetState($config_edit_systems_list_button, $emulationstation_edit_systems_list_button)
;	GUICtrlSetState($config_restart_emulationstation_button, $emulationstation_restart_button)

	Enable_Emulators_and_Games($reload_button, $system_listview, $game_listview, $update_games_emulator_button, $save_games_button, $open_button, $save_as_button)
EndFunc

Func Enable_Emulators_and_Games($reload_button = $GUI_DISABLE, $system_listview = $GUI_DISABLE, $game_listview = $GUI_DISABLE, $update_games_emulator_button = $GUI_DISABLE, $save_games_button = $GUI_DISABLE, $open_button = $GUI_DISABLE, $save_as_button = $GUI_DISABLE)

	GUICtrlSetState($config_emulators_games_reload_button, $reload_button)
	GUICtrlSetState($config_system_listview, $system_listview)
	GUICtrlSetState($config_game_listview, $game_listview)
;	GUICtrlSetState($config_games_link_games_to_emulator_and_save_button, $update_games_emulator_button)
;	GUICtrlSetState($config_games_open_button, $open_button)
;	GUICtrlSetState($config_games_save_as_button, $save_as_button)
EndFunc

Func ReloadEmulatorsAndGamesConfig()

	;Enable_Config()
	;GUICtrlSetData($config_emulators_label, "Emulators")
	;GUICtrlSetData($config_games_label, "Games")

	depress_button_and_disable_gui($config_emulators_games_reload_button)

	_GUICtrlListView_DeleteAllItems($config_system_listview)
	_GUICtrlListView_DeleteAllItems($config_game_listview)
	$spinner1_gif = _GUICtrlCreateGIF(@ScriptDir & "\" & $spinner200_gif_filename, "", $system_config_x + 10, $system_config_y + 50, -1, -1, 1)
	$spinner2_gif = _GUICtrlCreateGIF(@ScriptDir & "\" & $spinner200_gif_filename, "", $system_config_x + 10, $game_config_y + 70, -1, -1, 1)

	GUICtrlStatusInput_SetText($status_input, "Please Wait. Reading directory from /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " on the RetroPie ...")
	$result = plink("ls /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/*.{bin,zip,lha,a52,a78,j64,lnx,rom,nes,mgw,gba,love,7z,n64,z64,nds,iso,32x,sfc,smc,vec,ws}", 2)

	if @error <> 0 Then

		raise_button_and_enable_gui($config_emulators_games_reload_button)
		_GIF_DeleteGIF($spinner1_gif)
		_GIF_DeleteGIF($spinner2_gif)
		GUICtrlStatusInput_SetText($status_input, $result & ' - {\field{\*\fldinst{HYPERLINK "click_here_to_Troubleshoot"}}{\fldrslt{\ul\cf5\b click here to Troubleshoot}}}\b0\f0\par\par ')
		Return
	EndIf

	$all_roms_line_arr = StringSplit($result, @LF, 3)

	Local $display_device_filename = $app_data_dir & "\display device " & GUICtrlRead($display_device_name_combo) & ".txt"
	Local $display_device_arr
	_FileReadToArray($display_device_filename, $display_device_arr, 0, "|")
;				_ArrayDisplay($video_mode_arr)

	if UBound($display_device_arr) < 1 Then

		raise_button_and_enable_gui($config_emulators_games_reload_button)
		_GIF_DeleteGIF($spinner1_gif)
		_GIF_DeleteGIF($spinner2_gif)
		GUICtrlStatusInput_SetText($status_input, 'Cannot load emulator and games config until the video modes for display "' & GUICtrlRead($display_device_name_combo) & '" are scanned - {\field{\*\fldinst{HYPERLINK "scanning_video_modes"}}{\fldrslt{\ul\cf5\b click here for help}}}\b0\f0\par\par  ')
		Return
	EndIf


	GUICtrlStatusInput_SetText($status_input, "Please Wait. Reading emulators.cfg from /opt/retropie/configs/all on the RetroPie ...")
	$result = plink("cat /opt/retropie/configs/all/emulators.cfg", 2)
	Local $all_emulators_line_arr = StringSplit($result, @LF, 3)

	GUICtrlStatusInput_SetText($status_input, "Please Wait. Reading emulators.cfg from /opt/retropie/configs/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " on the RetroPie ...")
	$result = plink("cat /opt/retropie/configs/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/emulators.cfg", 2)
	Local $system_emulators_line_arr = StringSplit($result, @LF, 3)

	GUICtrlStatusInput_SetText($status_input, "Please Wait. Reading videomodes.cfg from /opt/retropie/configs/all on the RetroPie ...")
	$result = plink("cat /opt/retropie/configs/all/videomodes.cfg", 2)
	Local $videomodes_arr = _StringSplit2d($result, " = ")

	for $i = 0 to (UBound($videomodes_arr) - 1)

		if StringLen($videomodes_arr[$i][0]) = 0 Then

			_ArrayDelete($videomodes_arr, $i)
		EndIf
	Next


	GUICtrlStatusInput_SetText($status_input, "Please Wait. Updating Emulators ...")
	_GUICtrlListView_BeginUpdate($config_system_listview)

	for $each_system_emulator_line in $system_emulators_line_arr

		Local $system_emulator_part_arr = StringSplit($each_system_emulator_line, " = ", 3)

		if StringCompare($system_emulator_part_arr[0], "default") = 0 Then

			$default_emulator = StringReplace($system_emulator_part_arr[1], """", "")
		Else

			_GUICtrlListView_AddItem($config_system_listview, $system_emulator_part_arr[0])
		EndIf
	Next

	_GUICtrlListView_SetItemText($config_system_listview, _GUICtrlListView_FindText($config_system_listview, $default_emulator, -1, False), "Yes", 2)

	for $i = 0 to (UBound($videomodes_arr) - 1)

		$videomodes_arr[$i][1] = StringReplace($videomodes_arr[$i][1], """", "")

		$result = _ArraySearch($display_device_arr, $videomodes_arr[$i][1])

		if $result > -1 Then

			_GUICtrlListView_SetItemText($config_system_listview, _GUICtrlListView_FindText($config_system_listview, $videomodes_arr[$i][0], -1, False), $display_device_arr[$result][1], 1)
		EndIf
	Next

	Local $g_bSortSense = False
	_GUICtrlListView_SimpleSort($config_system_listview, $g_bSortSense, 0, False)
	_GUICtrlListView_EndUpdate($config_system_listview)
	GUICtrlSetData($config_emulators_label, "Emulators (" & _GUICtrlListView_GetItemCount($config_system_listview) & ")")
	_GIF_DeleteGIF($spinner1_gif)

	GUICtrlStatusInput_SetText($status_input, "Please Wait. Updating Games ...")

	_GUICtrlListView_BeginUpdate($config_game_listview)

	for $each_all_emulator_line in $all_emulators_line_arr

		Local $all_emulator_part_arr = StringSplit($each_all_emulator_line, " = ", 3)
		Local $all_emulator_system_part_arr = StringSplit($all_emulator_part_arr[0], "_", 3)

		if StringCompare($all_emulator_system_part_arr[0], $roms_path_dict.Item(GUICtrlRead($system_combo))) = 0 Then

			$all_emulator_part_arr[1] = StringReplace($all_emulator_part_arr[1], """", "")
			Local $index = _GUICtrlListView_AddItem($config_game_listview, $all_emulator_part_arr[0])
			_GUICtrlListView_AddSubItem($config_game_listview, $index, $all_emulator_part_arr[1], 1)
		EndIf
	Next

	for $each_all_roms_line in $all_roms_line_arr

		_PathSplit($each_all_roms_line, $sDrive1, $sDir1, $sFileName1, $sExtension1)
		$each_all_roms_line = $roms_path_dict.Item(GUICtrlRead($system_combo)) & "_" & $sFileName1
		$each_all_roms_line = StringReplace($each_all_roms_line, " ", "")
		$each_all_roms_line = StringReplace($each_all_roms_line, "(", "")
		$each_all_roms_line = StringReplace($each_all_roms_line, ")", "")
		$each_all_roms_line = StringReplace($each_all_roms_line, ",", "")
		$each_all_roms_line = StringReplace($each_all_roms_line, ".", "")
		$each_all_roms_line = StringReplace($each_all_roms_line, "[", "")
		$each_all_roms_line = StringReplace($each_all_roms_line, "]", "")
		$each_all_roms_line = StringReplace($each_all_roms_line, "!", "")
		$each_all_roms_line = StringReplace($each_all_roms_line, "'", "")

		$result = _GUICtrlListView_FindText($config_game_listview, $each_all_roms_line, -1, False)

		if $result < 0 Then

			Local $index = _GUICtrlListView_AddItem($config_game_listview, $each_all_roms_line)
			_GUICtrlListView_AddSubItem($config_game_listview, $index, $default_emulator, 1)
		EndIf
	Next

	Local $g_bSortSense = False
	_GUICtrlListView_SimpleSort($config_game_listview, $g_bSortSense, 0, False)
	_GUICtrlListView_EndUpdate($config_game_listview)
	GUICtrlSetData($config_games_label, "Games (" & _GUICtrlListView_GetItemCount($config_game_listview) & ")")
	Enable_Config($GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE)
	GUICtrlStatusInput_SetText($status_input, "Emulators & Games reloaded.")
	_GIF_DeleteGIF($spinner2_gif)

	; compare the emulators to the wiki page for differences

	GUICtrlStatusInput_SetText($status_input, "Please Wait. Reading https://github.com/seanhaydongriffin/" & $app_name & "/wiki/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "-Emulator-Game-Compatibility")
	Local $iPID = Run('curl.exe -s -k -H "Content-Type: text/html; charset=utf-8" https://github.com/seanhaydongriffin/' & $app_name & '/wiki/' & $roms_path_dict.Item(GUICtrlRead($system_combo)) & '-Emulator-Game-Compatibility', @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
	ProcessWaitClose($iPID)
	GUICtrlStatusInput_SetText($status_input, "")
	Local $html = StdoutRead($iPID)
	Local $html_arr = StringSplit($html, @LF, 3)
	Local $found_emulator_table = False
	Local $wiki_emulator_arr[0][3]

	for $i = 0 to (UBound($html_arr) - 1)

		if StringInStr($html_arr[$i], "<th>Emulator</th>") > 0 Then

			$found_emulator_table = True
		EndIf

		if $found_emulator_table = True Then

			if StringInStr($html_arr[$i], "<tr>") > 0 Then

				$i = $i + 1
				Local $emulator_name = $html_arr[$i]
				$emulator_name = StringReplace($emulator_name, "<td>", "")
				$emulator_name = StringReplace($emulator_name, "</td>", "")
				$emulator_name = StringReplace($emulator_name, " (", "-")
				$emulator_name = StringReplace($emulator_name, ")", "")
				$i = $i + 1
				Local $video_mode = $html_arr[$i]
				$video_mode = StringReplace($video_mode, "<td>", "")
				$video_mode = StringReplace($video_mode, "</td>", "")
				Local $default_emulator_str = ""

				if StringInStr($emulator_name, "*") > 0 Then

					$default_emulator_str = "Yes"
					$emulator_name = StringReplace($emulator_name, "*", "")
				EndIf

				$emulator_name = StringStripWS($emulator_name, 3)
				$video_mode = StringStripWS($video_mode, 3)

				_ArrayAdd($wiki_emulator_arr, $emulator_name & "|" & $video_mode & "|" & $default_emulator_str)
			EndIf

			if StringInStr($html_arr[$i], "</tbody>") > 0 Then

				ExitLoop
			EndIf
		EndIf
	Next

			;_ArrayDisplay($wiki_emulator_arr)

	for $i = 0 to (_GUICtrlListView_GetItemCount($config_system_listview) - 1)

		Local $emulator_name = _GUICtrlListView_GetItemText($config_system_listview, $i, 0)
		Local $video_mode = _GUICtrlListView_GetItemText($config_system_listview, $i, 1)
		$result = _ArraySearch($wiki_emulator_arr, $emulator_name)

		if $result > -1 Then

			if StringCompare($video_mode, $wiki_emulator_arr[$result][1]) <> 0 Then

				$result = MsgBox(1+48+8192, $app_name, "Emulator Video Modes not matching Wiki." & @CRLF & @CRLF & "Click OK to update Retropie with Wiki, or" & @CRLF & "click Cancel and investigate.")

				if $result = 1 Then

					Local $videomodes_str = ""

					for $i = 0 to (UBound($wiki_emulator_arr) - 1)

						$result = _ArraySearch($videomodes_arr, $wiki_emulator_arr[$i][0])

						if $result = -1 Then

							$result = _ArraySearch($display_device_arr, $wiki_emulator_arr[$i][1], 0, 0, 1, 0, 1, 1)

							if $result > -1 Then

								_ArrayAdd($videomodes_arr, $wiki_emulator_arr[$i][0] & "|" & $display_device_arr[$result][0])
							EndIf

						Else

							$display_device_index = _ArraySearch($display_device_arr, $wiki_emulator_arr[$i][1], 0, 0, 1, 0, 1, 1)

							if $display_device_index > -1 Then

								$videomodes_arr[$result][1] = $display_device_arr[$display_device_index][0]
							EndIf
						EndIf
					Next

					for $i = 0 to (UBound($videomodes_arr) - 1)

						$videomodes_arr[$i][1] = """" & $videomodes_arr[$i][1] & """"
					Next

					;_ArrayDisplay($videomodes_arr)
					Local $videomodes_str = _ArrayToString($videomodes_arr, " = ", -1, -1, @LF)
					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $videomodes_str = ' & $videomodes_str & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

					GUICtrlStatusInput_SetText($status_input, "Please Wait. Erasing videomodes.cfg on the RetroPie ...")
					plink_delete_all_text_in_file("/opt/retropie/configs/all/videomodes.cfg")
					GUICtrlStatusInput_SetText($status_input, "Please Wait. Saving videomodes.cfg to /opt/retropie/configs/all/videomodes.cfg on the RetroPie ...")
					plink_insert_text_in_file("/opt/retropie/configs/all/videomodes.cfg", $videomodes_str)
					GUICtrlStatusInput_SetText($status_input, "Saved videomodes.cfg to /opt/retropie/configs/all on the RetroPie.")

					; reload from RetroPie after above updates
					ReloadEmulatorsAndGamesConfig()

					ExitLoop
				EndIf

				ExitLoop
			EndIf
		EndIf
	Next

	raise_button_and_enable_gui($config_emulators_games_reload_button)


EndFunc


Func Config_tab_WM_NOTIFY_handler($hWndFrom, $iCode)

	Switch $hWndFrom


		Case GUICtrlGetHandle($config_game_listview)

			Switch $iCode

				Case $LVN_ITEMCHANGED

					Local $arr = _GUICtrlListView_GetItemTextArray($config_game_listview)

					if StringLen($arr[2]) > 0 Then

;						ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $arr[2] = ' & $arr[2] & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
						_GUICtrlListView_SetItemSelected($config_system_listview, _GUICtrlListView_FindText($config_system_listview, $arr[2], -1, False))
					EndIf

;					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $LVN_ITEMCHANGED = ' & $LVN_ITEMCHANGED & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console



			EndSwitch


	EndSwitch

EndFunc


Func RefreshDisplayDeviceVideoModesListView()

	GUICtrlSetData($display_label, "Video Modes for the """ & GUICtrlRead($display_device_name_combo) & """ display")
	_GUICtrlListView_DeleteAllItems($display_device_listview)
	Local $display_device_filename = $app_data_dir & "\display device " & GUICtrlRead($display_device_name_combo) & ".txt"
	Local $display_device_arr
	_FileReadToArray($display_device_filename, $display_device_arr, 0, "|")
	_GUICtrlListView_AddArray($display_device_listview, $display_device_arr)
EndFunc
