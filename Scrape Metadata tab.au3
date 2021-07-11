#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
#include-once
#Include "RetropanionEx.au3"
#include <GuiImageList.au3>
#include <Math.au3>
#include <IE.au3>

Func Scrape_Metadata_tab_setup()

	GUICtrlCreateTabItemEx("===> Scrape Metadata")
	GUICtrlCreateGroupEx  ("----> Scraping Metadata", 20, 70, 680, 55)
	$scrape_metadata_website_combo = 											GUICtrlCreateComboFromDictWithLabel($scrape_metadata_websites_label, "Website(s)", 30, 90, 70, 20, "The website(s) to scrape the box art from", Null, 90, 90, 150, 20)
	_GUICtrlComboBox_AddString($scrape_metadata_website_combo, "LaunchBox")
	_GUICtrlComboBox_SetCurSel($scrape_metadata_website_combo, 0)
	$scrape_metadata_minimized_scrapers_checkbox = 								GUICtrlCreateCheckboxEx("Minimized Scrapers", 250, 90, 120, 20, True, "If checked then run each scraper in a minimized window")
	$scrape_metadata_max_scrapers_input = 										GUICtrlCreateInputWithLabel("10", 450, 90, 30, 20, $scrape_metadata_max_scrapers_label, "Max Scrapers", 380, 90, 80, 20, "The maximum number of scrapers that will run in parallel")
	$scrape_metadata_max_scrapers_slider = 										GUICtrlCreateSliderEx(490, 90, 150, 20, $GUI_DOCKALL, 10, 1, 10)
	$scrape_metadata_scrape_button = 											GUICtrlCreateImageButton("scrape metadata.ico", 650, 80, 36, _
		"Scrapes game metadata according to the selections above." & @CRLF & _
		@CRLF & _
		"Front Covers will be stored in the Box folder." & @CRLF  & _
		"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
		"Full Covers will be stored in the BoxFull folder." & @CRLF, $GUI_DOCKALL)
	$scrape_metadata_match_scraped_data_to_games_radio = 						GUICtrlCreateRadioEx("Match Scraped Data to Games", 30, 140, 180, 20, True, "", $GUI_DOCKALL)
	$scrape_metadata_match_games_to_scraped_data_radio = 						GUICtrlCreateRadioEx("Match Games to Scraped Data", 220, 140, 180, 20, False, "", $GUI_DOCKALL)
	$scrape_metadata_refresh_button = 											GUICtrlCreateImageButton("get games metadata.ico", 400, 140, 36, "Get scraped metadata plus game names (from the RetroPie)", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
	$scrape_metadata_scraped_data_label = 										GUICtrlCreateLabelEx("Scraped Data", 20, 180, 70, 20)
	$scrape_metadata_scraped_data_files_label = 								GUICtrlCreateLabelEx("0 Files", 180, 180, 70, 20)
	$scrape_metadata_scraped_data_list = 										GUICtrlCreateSingleSelectList(20, 200, 200, 420, 500, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
	$scrape_metadata_games_label = 												GUICtrlCreateLabelEx("Games", 240, 180, 100, 20)
	$scrape_metadata_games_files_label = 										GUICtrlCreateLabelEx("0 Files", 400, 180, 70, 20)
	$scrape_metadata_games_list = 												GUICtrlCreateSingleSelectList(240, 200, 200, 420, -1, $GUI_DOCKALL + $GUI_DOCKBOTTOM) ; BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL)) ;, $LBS_EXTENDEDSEL))
	GUICtrlCreateGroupEx  ("----> Mismatching Metadata Type", 460, 200, 200, 150)
	$scrape_metadata_release_date_checkbox = 									GUICtrlCreateCheckboxEx("Release Date", 480, 220, 120, 20)
	$scrape_metadata_developer_checkbox = 										GUICtrlCreateCheckboxEx("Developer", 480, 240, 120, 20)
	$scrape_metadata_publisher_checkbox = 										GUICtrlCreateCheckboxEx("Publisher", 480, 260, 120, 20)
	$scrape_metadata_genre_checkbox = 											GUICtrlCreateCheckboxEx("Genre", 480, 280, 120, 20)
	$scrape_metadata_players_checkbox = 										GUICtrlCreateCheckboxEx("Players", 480, 300, 120, 20, True)
	$scrape_metadata_listview = 												GUICtrlCreateListViewEx(460, 370, 350, 200, "Metadata Name", 110, "Scraped", 100, "RetroPie", 100, Null, Null, Null, Null, "Release Date", Null, Null, Null, Null, "Developer", Null, Null, Null, Null, "Publisher", Null, Null, Null, Null, "Genre", Null, Null, Null, Null, "Players", Null, Null, Null, Null)
	$scrape_metadata_imagelist = _GUIImageList_Create(16, 16)
	_GUIImageList_Add($scrape_metadata_imagelist, _GUICtrlListView_CreateSolidBitMap($scrape_metadata_listview, $COLOR_WHITE, 16, 16))
	_GUIImageList_Add($scrape_metadata_imagelist, _GUICtrlListView_CreateSolidBitMap($scrape_metadata_listview, $COLOR_GREEN, 16, 16))
	_GUIImageList_Add($scrape_metadata_imagelist, _GUICtrlListView_CreateSolidBitMap($scrape_metadata_listview, $COLOR_RED, 16, 16))
	_GUICtrlListView_SetImageList($scrape_metadata_listview, $scrape_metadata_imagelist, 1)
	$scrape_metadata_update_gamelist_button = 									GUICtrlCreateButtonEx("&Apply Scraped Data", 460, 580, 120, 20, "", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
	$scrape_metadata_upload_gamelist_button = 									GUICtrlCreateButtonEx("Upload Data to Retro&Pie", 680, 640, 140, 40, "", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)


EndFunc

Func Scrape_Metadata_tab_child_gui_setup()


	$upload_data_to_retropie_gui = 												ChildGUICreate($app_name & " - Upload Game List to RetroPie", 1024, 480, $main_gui)
	$upload_data_to_retropie_upload_button = 									GUICtrlCreateButton("Upload game list (left side)", 10, 5, 200, 40)
	$upload_data_to_retropie_ie = _IECreateEmbedded()
	GUICtrlCreateObj($upload_data_to_retropie_ie, 10, 50, 1004, 400)
	$upload_data_to_retropie_status_input = 									GUICtrlCreateStatusInput("", 10, 480 - 25, 640 - 20, 20)

	$upload_data_to_retropie_dummy = 											GUICtrlCreateDummy()
	GUISetAccelerators($upload_data_aAccelKeys, $upload_data_to_retropie_gui)

EndFunc


Func Scrape_Metadata_tab_event_handler($msg)

	Switch $msg


		case $scrape_metadata_scrape_button

			Local $system_name
			Local $scraper_exe

			if StringCompare(GUICtrlRead($scrape_metadata_website_combo), "Atarimania") = 0 Then

				$system_name = "Atarimania"
				$scraper_exe = $app_name & " Atarimania Scraper.exe"
			endif

			if StringCompare(GUICtrlRead($scrape_metadata_website_combo), "LaunchBox") = 0 Then

				$system_name = "LaunchBox"
				$scraper_exe = $app_name & " LaunchBox Scraper.exe"
			endif

			GUICtrlSetData($status_input, "Getting number of pages from " & $system_name & " ...")
			Local $iPID = Run($scraper_exe & " """ & GUICtrlRead($system_combo) & """", @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
			ProcessWaitClose($iPID)
			Local $num_pages = StdoutRead($iPID)
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $num_pages = ' & $num_pages & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			GUICtrlSetData($status_input, "")

			Local $pages_per_scraper = Ceiling(Number($num_pages) / Number(GUICtrlRead($scrape_metadata_max_scrapers_input)))
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $pages_per_scraper = ' & $pages_per_scraper & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

			Local $showflag = @SW_SHOW

			if GUICtrlRead($scrape_metadata_minimized_scrapers_checkbox) = $GUI_CHECKED Then

				$showflag = @SW_MINIMIZE
			EndIf

			for $page_num = 1 to $num_pages step $pages_per_scraper

				Local $start_page_num = $page_num
				Local $end_page_num = _Min(Number($page_num + ($pages_per_scraper - 1)), Number($num_pages))
				ConsoleWrite("Executing " & $scraper_exe & " " & """" & GUICtrlRead($system_combo) & """ metadata " & $start_page_num & " " & $end_page_num & @CRLF)
				ShellExecute($scraper_exe, """" & GUICtrlRead($system_combo) & """ metadata " & $start_page_num & " " & $end_page_num, @ScriptDir, "", $showflag)
			Next




		case $scrape_metadata_match_scraped_data_to_games_radio

			GUICtrlSetPos($scrape_metadata_scraped_data_label, 20, 180, 70, 20)
			GUICtrlSetPos($scrape_metadata_scraped_data_files_label, 180, 180, 70, 20)
			GUICtrlSetPos($scrape_metadata_scraped_data_list, 20, 200, 200, 420)
			GUICtrlSetPos($scrape_metadata_games_label, 240, 180, 100, 20)
			GUICtrlSetPos($scrape_metadata_games_files_label, 400, 180, 70, 20)
			GUICtrlSetPos($scrape_metadata_games_list, 240, 200, 200, 420)


		case $scrape_metadata_match_games_to_scraped_data_radio

			GUICtrlSetPos($scrape_metadata_games_label, 20, 180, 100, 20)
			GUICtrlSetPos($scrape_metadata_games_files_label, 180, 180, 70, 20)
			GUICtrlSetPos($scrape_metadata_games_list, 20, 200, 200, 420)
			GUICtrlSetPos($scrape_metadata_scraped_data_label, 240, 180, 70, 20)
			GUICtrlSetPos($scrape_metadata_scraped_data_files_label, 400, 180, 70, 20)
			GUICtrlSetPos($scrape_metadata_scraped_data_list, 240, 200, 200, 420)




		Case $scrape_metadata_refresh_button

			_GUICtrlListBox_ResetContent($scrape_metadata_scraped_data_list)
			_GUICtrlListBox_ResetContent($scrape_metadata_games_list)
			Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"

			$result = MsgBox(4+32+256+8192, $app_name, "A gamelist already exists on your computer (date-time)." & @CRLF & @CRLF & "Do you wish to overwrite this with the RetroPie?")

			if $result = 6 Then

				GUICtrlSetData($status_input, "Downloading /opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
				pscp_download("/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml", $gamelist_filepath)
				GUICtrlSetData($status_input, "Downloaded " & $gamelist_filepath)
			EndIf

			GUICtrlSetData($status_input, "Getting rom list from /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)))
			$result = plink("(cd /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " && ls *.{bin,zip,lha,a52,a78,j64,lnx,rom,nes,mgw,gba,love,7z,n64,z64,nds,iso,32x,sfc,smc,vec,ws})", 2)
			Local $rom_filename_arr = StringSplit($result, @LF, 3)
			_ArraySort($rom_filename_arr)
			;_ArrayDisplay($rom_filename_arr)
			GUICtrlSetData($status_input, "")

			; gamelist XML to array mapping:
			;	[n][0] = path
			;	[n][1] = name
			;	[n][2] = desc
			;	[n][3] = image
			;	[n][4] = releasedate
			;	[n][5] = developer
			;	[n][6] = publisher
			;	[n][7] = genre
			;	[n][8] = players
			;	[n][9] = playcount
			;	[n][10] = lastplayed

			Local $mismatched_rom_filename_arr[0][11]

			$gamelist_xml_dom = _XMLLoadXML(FileRead($gamelist_filepath), "")

			; find roms that aren't in gamelist.xml

			for $i = 0 to (UBound($rom_filename_arr) - 1)

				ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $rom_filename_arr[$i] = ' & $rom_filename_arr[$i] & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
;				Local $game_path_value = _XMLGetValue($gamelist_xml_dom, "/gameList/*/path[text()='./" & $rom_filename_arr[$i] & "']")
				Local $game_path_value = _XMLGetValue($gamelist_xml_dom, "/gameList/*/path[text()=""./" & $rom_filename_arr[$i] & """]")
				ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $game_path_value = ' & $game_path_value & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

				if StringLen($game_path_value) = 0 Then

					_ArrayAdd($mismatched_rom_filename_arr, "./" & $rom_filename_arr[$i] & "|" & $rom_filename_arr[$i] & "|||||||||")
				EndIf
			Next

;_ArrayDisplay($mismatched_rom_filename_arr)

			; find metadata in gamelist.xml games that mismatches the scraped metadata

			; populate the roms list

			Local $tmp_roms_list_arr[0]
			Local $gamelist_num_nodes = _XMLGetNodeCount($gamelist_xml_dom, "/gameList/game")
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $gamelist_num_nodes = ' & $gamelist_num_nodes & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

			for $i = 0 to (UBound($mismatched_rom_filename_arr) - 1)

;					_GUICtrlListBox_InsertString($scrape_metadata_games_list, $mismatched_rom_filename_arr[$i][1])
				_ArrayAdd($tmp_roms_list_arr, $mismatched_rom_filename_arr[$i][1])
			Next

			for $i = 1 to $gamelist_num_nodes

				Local $game_name = _XMLGetValue($gamelist_xml_dom, "/gameList/game[" & $i & "]/name")
;					_GUICtrlListBox_InsertString($scrape_metadata_games_list, $game_name)
				_ArrayAdd($tmp_roms_list_arr, $game_name)

			Next

			_ArraySort($tmp_roms_list_arr)

			for $i = 0 to (UBound($tmp_roms_list_arr) - 1)

				_GUICtrlListBox_InsertString($scrape_metadata_games_list, $tmp_roms_list_arr[$i])
			Next

			Local $arr = _FileListToArrayRec($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Metadata", "*.xml", 1, 0, 1)
			;_ArrayDisplay($arr)
			;Exit
			Local $num_files = 0

			for $i = 1 to $arr[0]

				Local $metadata_name = StringReplace($arr[$i], ".xml", "")
				_GUICtrlListBox_InsertString($scrape_metadata_scraped_data_list, $metadata_name)
			Next

			_GUICtrlListBox_SetCurSel($scrape_metadata_scraped_data_list, 0)
			GUICtrlSetState($scrape_metadata_scraped_data_list, $GUI_FOCUS)


		case $scrape_metadata_update_gamelist_button

			Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"
			Local $scraped_name = _GUICtrlListBox_GetText($scrape_metadata_scraped_data_list, _GUICtrlListBox_GetCurSel($scrape_metadata_scraped_data_list))
			Local $game_index = _GUICtrlListBox_GetCurSel($scrape_metadata_games_list)
			Local $game_name = _GUICtrlListBox_GetText($scrape_metadata_games_list, $game_index)

			if StringCompare(_GUICtrlListView_GetItemText($scrape_metadata_listview, 4, 1), _GUICtrlListView_GetItemText($scrape_metadata_listview, 4, 2)) <> 0 Then

				Local $tmp_name = _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()='" & $game_name & "']")

				; if the game (node) does not exist in gamelist.xml, then create it

				if StringLen($tmp_name) = 0 Then

					Local $game_path = $game_name
					$game_name = $scraped_name
					_XMLCreateChildNodes($gamelist_xml_dom, "/gameList", "game", "path", "./" & $game_path)
					XMLUpdateOrCreateChildNode($gamelist_xml_dom, "/gameList/*/path[text()='./" & $game_path & "']/..", "name", $game_name)
					_GUICtrlListBox_ReplaceString($scrape_metadata_games_list, $game_index, $game_name)
					_GUICtrlListBox_SetCurSel($scrape_metadata_games_list, $game_index)
				EndIf

;				XMLUpdateOrCreateChildNode($gamelist_xml_dom, "/gameList/*/name[text()='" & $game_name & "']/..", "players", _GUICtrlListView_GetItemText($scrape_metadata_listview, 4, 1))
				XMLUpdateOrCreateChildNode($gamelist_xml_dom, "/gameList/*/name[text()=""" & $game_name & """]/..", "players", _GUICtrlListView_GetItemText($scrape_metadata_listview, 4, 1))
			EndIf

			Local $gamelist_xml = _XMLGetDocXML($gamelist_xml_dom)
			$gamelist_xml = msWordXML_Beautify($gamelist_xml)
			FileDelete($gamelist_filepath)
			FileWrite($gamelist_filepath, $gamelist_xml)
;Exit
;			Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"
;			_XMLSaveXML($gamelist_xml_dom, $gamelist_filepath)
			RefreshMetadataListview()

			if GUICtrlRead($scrape_metadata_match_scraped_data_to_games_radio) = $GUI_CHECKED Then

				GUICtrlSetState($scrape_metadata_scraped_data_list, $GUI_FOCUS)
			Else

				GUICtrlSetState($scrape_metadata_games_list, $GUI_FOCUS)
			EndIf

		case $scrape_metadata_upload_gamelist_button

			GUISetState(@SW_DISABLE, $main_gui)
			_IENavigate($upload_data_to_retropie_ie, "about:blank")
			GUISetState(@SW_SHOW, $upload_data_to_retropie_gui)
			$current_gui = $upload_data_to_retropie_gui

			Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"
			Local $retropie_gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\retropie_gamelist.xml"

			; download the latest gamelist.xml from the RetroPie for compare

			FileDelete($retropie_gamelist_filepath)
			GUICtrlSetData($upload_data_to_retropie_status_input, "Downloading /opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
			pscp_download("/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml", $retropie_gamelist_filepath)
			GUICtrlSetData($upload_data_to_retropie_status_input, "Downloaded " & $retropie_gamelist_filepath)
			Local $retropie_gamelist_xml = FileRead($retropie_gamelist_filepath)
			$retropie_gamelist_xml = msWordXML_Beautify($retropie_gamelist_xml)
			FileDelete($retropie_gamelist_filepath)
			FileWrite($retropie_gamelist_filepath, $retropie_gamelist_xml)

			; compare the retropie gamelist.xml to the local (updated) copy

			Local $winmerge_output_file_path = $app_data_dir & "\gamelist_diff.html"

			$cmd = "WinMergeU.exe"
			$cmd_params = """" & $gamelist_filepath & """ """ & $retropie_gamelist_filepath & """ -minimize -noninteractive -u -or """ & $winmerge_output_file_path & """"
			$full_cmd = $cmd & " " & $cmd_params
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $full_cmd = ' & $full_cmd & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			_FileWriteLog($log_filename, $full_cmd)

			GUICtrlSetData($upload_data_to_retropie_status_input, "Comparing " & $gamelist_filepath & " to " & $retropie_gamelist_filepath)
			ShellExecuteWait($cmd, $cmd_params, "c:\Program Files\WinMerge\WinMergeU.exe", "", @SW_HIDE)

			$html = FileRead($winmerge_output_file_path)
			$html = StringReplace($html, "table {margin: 0; border: 1px solid #a0a0a0; box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.15);}", "html * {font-size: 12px !important; font-family: Arial !important;}" & @CRLF & "table {margin: 0; border: 1px solid #a0a0a0; box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.15); display: block; overflow-x: auto; white-space: nowrap;}")
;			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $html = ' & $html & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			_IEDocWriteHTML($upload_data_to_retropie_ie, $html)
			GUICtrlSetData($upload_data_to_retropie_status_input, "")



		Case $upload_data_to_retropie_upload_button

			Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"

			GUICtrlSetData($upload_data_to_retropie_status_input, "Uploading " & $gamelist_filepath)
			pscp_upload($gamelist_filepath, "/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
			GUICtrlSetData($upload_data_to_retropie_status_input, "Uploaded " & $gamelist_filepath)

			GUISetState(@SW_HIDE, $current_gui)
			GUISetState(@SW_ENABLE, $main_gui)
			GUISetState(@SW_SHOWNORMAL, $main_gui)
			$current_gui = $main_gui






	EndSwitch

EndFunc



Func Scrape_Metadata_tab_WM_COMMAND_handler($hWndFrom, $iCode)


    Switch $hWndFrom


        Case GUICtrlGetHandle($scrape_metadata_scraped_data_list)

			Switch $iCode

                Case $LBN_SELCHANGE ; Sent when the user cancels the selection in a list box

					Local $art_name = _GUICtrlListBox_GetText($scrape_metadata_scraped_data_list, _GUICtrlListBox_GetCurSel($scrape_metadata_scraped_data_list))
					Local $selected_index = -1

					if GUICtrlRead($scrape_metadata_match_scraped_data_to_games_radio) = $GUI_CHECKED Then

						$selected_index = 0
						GUICtrlUnselect($scrape_metadata_games_list)

						for $i = 1 to StringLen($art_name)

							Local $rom_name_search_text = StringLeft($art_name, $i)
							$result = _GUICtrlListBox_FindString($scrape_metadata_games_list, $rom_name_search_text)

							if $result < 0 Then

								ExitLoop
							EndIf

							$selected_index = $result
						Next

						_GUICtrlListBox_SetCurSel($scrape_metadata_games_list, $selected_index)
						_GUICtrlListBox_SetTopIndex($scrape_metadata_games_list, $selected_index - 11)
					EndIf

					RefreshMetadataListview($selected_index)
			EndSwitch


        Case GUICtrlGetHandle($scrape_metadata_games_list)

			Switch $iCode

                Case $LBN_SELCHANGE ; Sent when the user cancels the selection in a list box

					Local $game_name = _GUICtrlListBox_GetText($scrape_metadata_games_list, _GUICtrlListBox_GetCurSel($scrape_metadata_games_list))
					Local $selected_index = _GUICtrlListBox_GetCurSel($scrape_metadata_games_list) ; -1

					if GUICtrlRead($scrape_metadata_match_games_to_scraped_data_radio) = $GUI_CHECKED Then

						$selected_index = -1 ; 0
						GUICtrlUnselect($scrape_metadata_scraped_data_list)

						for $i = 1 to StringLen($game_name)

							Local $scraped_data_name_search_text = StringLeft($game_name, $i)
							$result = _GUICtrlListBox_FindString($scrape_metadata_scraped_data_list, $scraped_data_name_search_text)

							if $result < 0 Then

								ExitLoop
							EndIf

							;$selected_index = $result
						Next

						_GUICtrlListBox_SetCurSel($scrape_metadata_scraped_data_list, $result) ; $selected_index)
						_GUICtrlListBox_SetTopIndex($scrape_metadata_scraped_data_list, $result - 11) ; $selected_index - 11)

					EndIf

					RefreshMetadataListview($selected_index)


				;	Local $game_name = _GUICtrlListBox_GetText($scrape_metadata_games_list, _GUICtrlListBox_GetCurSel($scrape_metadata_games_list))

				;	_GUICtrlListView_SetItemText($scrape_metadata_listview, 0, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()=""" & $game_name & """]/../releasedate"), 2)
				;	_GUICtrlListView_SetItemText($scrape_metadata_listview, 1, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()=""" & $game_name & """]/../developer"), 2)
				;	_GUICtrlListView_SetItemText($scrape_metadata_listview, 2, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()=""" & $game_name & """]/../publisher"), 2)
				;	_GUICtrlListView_SetItemText($scrape_metadata_listview, 3, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()=""" & $game_name & """]/../genre"), 2)
				;	_GUICtrlListView_SetItemText($scrape_metadata_listview, 4, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()=""" & $game_name & """]/../players"), 2)

			EndSwitch


	EndSwitch

EndFunc




