#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
#include-once
#Include "RetropanionEx.au3"


Func ROMs_tab_setup()

	GUICtrlCreateTabItemEx("===> ROMs")
	GUICtrlCreateGroupEx  ("----> ROMs", 20, 140, 250, 500)
	$rebuild_roms_roms_list = 													GUICtrlCreateSingleSelectList(30, 170, 200, 420, 500, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
	$rebuild_roms_refresh_button = 												GUICtrlCreateImageButton("get games list.ico", 30, 590, 36, "Get the list of games (from the RetroPie)", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
	$rebuild_roms_rebuild_button = 												GUICtrlCreateImageButton("repair.ico", 120, 590, 36, "Rebuild / Repair the selected rom")

EndFunc

Func ROMs_tab_child_gui_setup()
EndFunc



Func ROMs_tab_event_handler($msg)

	Switch $msg



		case $rebuild_roms_refresh_button


			_GUICtrlListBox_ResetContent($rebuild_roms_roms_list)

;			$result = MsgBox(4+32+256+8192, $app_name, "A gamelist already exists on your computer (date-time)." & @CRLF & @CRLF & "Do you wish to overwrite this with the RetroPie?")

;			if $result = 6 Then

;				GUICtrlSetData($status_input, "Downloading /opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
;				pscp_download("/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml", $gamelist_filepath)
;				GUICtrlSetData($status_input, "Downloaded " & $gamelist_filepath)
;			EndIf

			GUICtrlSetData($status_input, "Getting rom list from /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)))
			$result = plink("(cd /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " && ls *.{bin,zip,lha,a52,a78,j64,lnx,rom,nes,mgw,gba,love,7z,n64,z64,nds,iso,32x,sfc,smc,vec,ws})", 2)
			Local $rom_filename_arr = StringSplit($result, @LF, 3)
			_ArraySort($rom_filename_arr)
			;_ArrayDisplay($rom_filename_arr)
			GUICtrlSetData($status_input, "")


;			_ArraySort($tmp_roms_list_arr)

			for $i = 0 to (UBound($rom_filename_arr) - 1)

				_GUICtrlListBox_InsertString($rebuild_roms_roms_list, $rom_filename_arr[$i])
			Next

		Case $rebuild_roms_rebuild_button

			FileDelete(@ScriptDir & "\FinalBurn Neo (ClrMame Pro XML, Neogeo only).dat")
			FileDelete(@ScriptDir & "\FinalBurn Neo (ClrMame Pro XML, Neogeo only) updated.dat")
			FileDelete(@ScriptDir & "\FinalBurn Neo (ClrMame Pro XML, Arcade only).dat")
			FileDelete(@ScriptDir & "\FinalBurn Neo (ClrMame Pro XML, Arcade only) updated.dat")
			FileDelete(@ScriptDir & "\clrmamepro_source\*.*")
			FileDelete(@ScriptDir & "\clrmamepro_destination\*.*")

			; get the latest ClrMame Pro DAT files

			GUICtrlSetData($status_input, "Downloading FinalBurn Neo (ClrMame Pro XML, Neogeo only).dat")
			InetGet("https://github.com/libretro/FBNeo/raw/master/dats/FinalBurn%20Neo%20(ClrMame%20Pro%20XML%2C%20Neogeo%20only).dat", @ScriptDir & "\FinalBurn Neo (ClrMame Pro XML, Neogeo only).dat")
			GUICtrlSetData($status_input, "Downloading FinalBurn Neo (ClrMame Pro XML, Arcade only).dat")
			InetGet("https://github.com/libretro/FBNeo/raw/master/dats/FinalBurn%20Neo%20(ClrMame%20Pro%20XML%2C%20Arcade%20only).dat", @ScriptDir & "\FinalBurn Neo (ClrMame Pro XML, Arcade only).dat")
			GUICtrlSetData($status_input, "")

;			Local $rom_filename_arr[1]
			Local $rom_name = _GUICtrlListBox_GetText($rebuild_roms_roms_list, _GUICtrlListBox_GetCurSel($rebuild_roms_roms_list))
;			$rom_filename_arr[0] = $rom_name

			;_FileReadToArray(@ScriptDir & "\my_neogeo_dat.dat", $rom_filename_arr)


			$result = rebuild_roms(@ScriptDir, "FinalBurn Neo (ClrMame Pro XML, Neogeo only).dat", $rom_name)
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $result = ' & $result & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

			if $result = False Then

				$result = rebuild_roms(@ScriptDir, "FinalBurn Neo (ClrMame Pro XML, Arcade only).dat", $rom_name)
				ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $result = ' & $result & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			EndIf




#cs
			Local $xml_dom = _XMLLoadXML(FileRead(@ScriptDir & "\FinalBurn Neo (ClrMame Pro XML, Neogeo only).dat"), "", -1, False)
			Local $num_nodes = _XMLGetNodeCount($xml_dom, "/datafile/game")

			for $i = 1 to $num_nodes

				Local $game_name = _XMLGetAttrib($xml_dom, "/datafile/game[" & $i & "]", "name")
				ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $game_name = ' & $game_name & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

				if _ArraySearch($rom_filename_arr, $game_name & ".zip") < 0 Then

					_XMLDeleteNode($xml_dom, "/datafile/game[" & $i & "]")
					$i = $i - 1
					$num_nodes = $num_nodes - 1
				EndIf

				if $i > $num_nodes Then

					ExitLoop
				EndIf
			Next

			Local $clrmamepro_dat_xml = _XMLGetDocXML($xml_dom)
			$clrmamepro_dat_xml = msWordXML_Beautify($clrmamepro_dat_xml)
			FileDelete(@ScriptDir & "\FinalBurn Neo (ClrMame Pro XML, Neogeo only) updated.dat")
			FileWrite(@ScriptDir & "\FinalBurn Neo (ClrMame Pro XML, Neogeo only) updated.dat", $clrmamepro_dat_xml)


			;_XMLSaveXML($xml_dom, @ScriptDir & "\FinalBurn Neo (ClrMame Pro XML, Neogeo only) updated.dat")
			;_XMLSaveXML($xml_dom, @ScriptDir & "\fred.dat")


			; download roms to rebuild and bios

;			GUICtrlSetData($status_input, "Downloading /opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
			pscp_download("/home/pi/RetroPie/BIOS/neogeo.zip", @ScriptDir & "\clrmamepro_source\neogeo.zip")
			pscp_download("/home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $rom_filename_arr[0], @ScriptDir & "\clrmamepro_source\" & $rom_filename_arr[0])
;			GUICtrlSetData($status_input, "Downloaded " & $gamelist_filepath)


			Local $clrmamepro_dat_filename = "FinalBurn Neo (ClrMame Pro XML, Neogeo only) updated.dat"
			;Local $clrmamepro_dat_filename = "fred.dat"

			Local $clrmamepro_path = "C:\Program Files\clrmamepro"
			Local $clrmamepro_ini_path = $clrmamepro_path & "\cmpro.ini"
			Local $clrmamepro_dat_dirname = @ScriptDir & "\"
			Local $clrmamepro_welcome_win_title = "[TITLE:cmpro64; CLASS:#32770]"
			Local $clrmamepro_profiler_win_title = "[TITLE:>Profiler<; CLASS:#32770]"
			Local $clrmamepro_profiler_selected_entries_1_win_title = "[TITLE:>Profiler< [Selected Entries: 1]; CLASS:#32770]"
			Local $clrmamepro_open_win_title = "[TITLE:Open; CLASS:#32770]"
			Local $clrmamepro_where_do_you_want_to_put_the_dats_win_title = "[TITLE:Where do you want to put the dat(s)?; CLASS:#32770]"
			Local $clrmamepro_no_settings_found_win_title = "[TITLE:No Settings Found; CLASS:#32770]"
			Local $clrmamepro_clrmamepro_win_title = "[TITLE:>clrmamepro<; CLASS:#32770]"
			Local $clrmamepro_scanner_win_title = "[REGEXPTITLE:Scanner | .*; CLASS:#32770]"
			Local $clrmamepro_advanced_scanner_options_win_title = "[TITLE:Advanced Scanner Options; CLASS:#32770]"
			Local $clrmamepro_rebuilder_win_title = "[REGEXPTITLE:Rebuilder | .*; CLASS:#32770]"
			Local $clrmamepro_advanced_rebuilder_options_win_title = "[TITLE:Advanced Rebuilder Options; CLASS:#32770]"
			Local $clrmamepro_statistics_win_title = "[REGEXPTITLE:Statistics | .*; CLASS:#32770]"
			Local $clrmamepro_rebuilding_sets_win_title = "[TITLE:Rebuilding Sets; CLASS:#32770]"

			FileDelete($clrmamepro_path & "\datfiles\*.dat")
			FileDelete($clrmamepro_path & "\settings\*.cmp")
			FileDelete($clrmamepro_path & "\profiler.cache")
			FileDelete($clrmamepro_path & "\profiler.xml")
			FileDelete($clrmamepro_ini_path)
			IniWrite($clrmamepro_ini_path, "CMPRO SETTINGS", "Dir_ProfilerAddDatFileFolder", $clrmamepro_dat_dirname)
			ShellExecute("cmpro64.exe", "", "C:\Program Files\clrmamepro")
			WinWait($clrmamepro_welcome_win_title)
			WinClose($clrmamepro_welcome_win_title)
			WinWait($clrmamepro_profiler_win_title)
			ControlClick($clrmamepro_profiler_win_title, "", "[TEXT:&Add DatFile...]")
			WinWait($clrmamepro_open_win_title)
			ControlSetText($clrmamepro_open_win_title, "", "[CLASS:Edit; INSTANCE:1]", $clrmamepro_dat_filename)
			ControlClick($clrmamepro_open_win_title, "", "[TEXT:&Open]")
			WinWait($clrmamepro_where_do_you_want_to_put_the_dats_win_title)
			ControlClick($clrmamepro_where_do_you_want_to_put_the_dats_win_title, "", "[TEXT:OK]")
			WinWait($clrmamepro_profiler_win_title)
			Local $clrmamepro_profiler_listview_handle = ControlGetHandle($clrmamepro_profiler_win_title, "", "[CLASS:SysListView32; INSTANCE:1]")
			_GUICtrlListView_SetItemSelected($clrmamepro_profiler_listview_handle, 0)
			WinWait($clrmamepro_profiler_selected_entries_1_win_title)
			ControlClick($clrmamepro_profiler_selected_entries_1_win_title, "", "[TEXT:&Load / Update]")
			WinWait($clrmamepro_no_settings_found_win_title)
			ControlClick($clrmamepro_no_settings_found_win_title, "", "[TEXT:&Default]")
			; Illegal backup root folder detected. Using the default backup root folder from now on.
			WinWait($clrmamepro_welcome_win_title)
			WinClose($clrmamepro_welcome_win_title)
			; Illegal download root folder detected. Using the default download root folder from now on.
			WinWait($clrmamepro_welcome_win_title)
			WinClose($clrmamepro_welcome_win_title)
			WinWait($clrmamepro_clrmamepro_win_title)
			ControlClick($clrmamepro_clrmamepro_win_title, "", "[TEXT:S&canner]")
			WinWait($clrmamepro_scanner_win_title)
			ControlClick($clrmamepro_scanner_win_title, "", "[TEXT:N&on-Merged Sets]")
			ControlClick($clrmamepro_scanner_win_title, "", 14542)
			ControlClick($clrmamepro_scanner_win_title, "", "[TEXT:Ad&vanced...]")
			WinWait($clrmamepro_advanced_scanner_options_win_title)
			ControlClick($clrmamepro_advanced_scanner_options_win_title, "", "[TEXT:Separate B&IOS sets]")
			WinClose($clrmamepro_advanced_scanner_options_win_title)
			WinClose($clrmamepro_scanner_win_title)
			WinWait($clrmamepro_clrmamepro_win_title)
			ControlClick($clrmamepro_clrmamepro_win_title, "", "[TEXT:&Rebuilder]")
			WinWait($clrmamepro_rebuilder_win_title)
			ControlSetText($clrmamepro_rebuilder_win_title, "", "[CLASS:ComboBox; INSTANCE:1]", @ScriptDir & "\clrmamepro_source")
			ControlSetText($clrmamepro_rebuilder_win_title, "", "[CLASS:ComboBox; INSTANCE:2]", @ScriptDir & "\clrmamepro_destination")
			ControlClick($clrmamepro_rebuilder_win_title, "", "[TEXT:N&on-Merged Sets]")
			ControlClick($clrmamepro_rebuilder_win_title, "", "[TEXT:Ad&vanced...]")
			WinWait($clrmamepro_advanced_rebuilder_options_win_title)
			ControlClick($clrmamepro_advanced_rebuilder_options_win_title, "", "[TEXT:Separate B&IOS sets]")
			WinClose($clrmamepro_advanced_rebuilder_options_win_title)
			WinWait($clrmamepro_rebuilder_win_title)
			ControlClick($clrmamepro_rebuilder_win_title, "", "[TEXT:Re&build...]")
			Sleep(5000)

			for $i = 1 to 120

				if WinExists($clrmamepro_rebuilding_sets_win_title) = False Then

					ExitLoop
				EndIf

				Sleep(500)
			Next

			ProcessClose("cmpro64.exe")
#ce



	EndSwitch

EndFunc

