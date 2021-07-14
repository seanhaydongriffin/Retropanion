#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
#include-once
#Include "RetropanionEx.au3"
#include <Math.au3>
#include "GIFAnimation.au3"


Func Scrape_Images_with_Manual_Join_tab_setup()

	GUICtrlCreateTabItemEx("Scrape Art and Manual Join")
	GUICtrlCreateGroupEx  ("Step 1: Scrape Art", 12, 80, 410, 80)
	$scrape_manual_join_website_combo = 										GUICtrlCreateComboFromDictWithLabel($scrape_manual_join_websites_label, "Website(s)", 30, 100, 70, 20, "The website(s) to scrape the box art from", Null, 90, 100, 150, 20)
	_GUICtrlComboBox_AddString($scrape_manual_join_website_combo, "Atarimania")
	_GUICtrlComboBox_AddString($scrape_manual_join_website_combo, "LaunchBox")
	_GUICtrlComboBox_SetCurSel($scrape_manual_join_website_combo, 0)
	$scrape_manual_join_minimized_scrapers_checkbox = 							GUICtrlCreateCheckboxEx("Minimized Scrapers", 250, 100, 120, 20, True, "If checked then run each scraper in a minimized window")
	$scrape_manual_join_max_scrapers_input = 									GUICtrlCreateInputWithLabel("10", 100, 130, 30, 20, $scrape_manual_join_max_scrapers_label, "Max Scrapers", 30, 130, 80, 20, "The maximum number of scrapers that will run in parallel")
	$scrape_manual_join_max_scrapers_slider = 									GUICtrlCreateSliderEx(140, 130, 150, 20, $GUI_DOCKALL, 10, 1, 10)
	$scrape_manual_join_scrape_button = 										GUICtrlCreateImageButton("scrape art.ico", 370, 100, 36, _
		"Scrapes game metadata according to the selections above." & @CRLF & _
		@CRLF & _
		"Front Covers will be stored in the Box folder." & @CRLF  & _
		"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
		"Full Covers will be stored in the BoxFull folder." & @CRLF, $GUI_DOCKALL)
	GUICtrlCreateGroupEx  ("Step 2: Assign Art to Roms", 12, 170, 475, 445)
	$scrape_manual_join_match_art_to_roms_radio = 								GUICtrlCreateRadioEx("Match Art to Roms", 20, 190, 120, 20, True, "", $GUI_DOCKALL)
	$scrape_manual_join_match_roms_to_art_radio = 								GUICtrlCreateRadioEx("Match Roms to Art", 150, 190, 120, 20, False, "", $GUI_DOCKALL)
	$scrape_manual_join_exclude_uploaded_art_checkbox = 						GUICtrlCreateCheckboxEx("Exclude Uploaded Art", 280, 190, 120, 20, True)
	$scrape_manual_join_refresh_button = 										GUICtrlCreateImageButton("get games art.ico", 420, 190, 36, "Get scraped art plus game names (from the RetroPie) - Alt+R", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
	$scrape_manual_join_art_label = 											GUICtrlCreateLabelEx("Art (0)", 20, 230, 70, 20)
	$scrape_manual_join_art_list = 												GUICtrlCreateSingleSelectList(20, 250, 200, 360, 500, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
	$scrape_manual_join_rom_label = 											GUICtrlCreateLabelEx("Roms (0)", 240, 230, 100, 20)
	$scrape_manual_join_rom_list = 												GUICtrlCreateSingleSelectList(240, 250, 200, 360, -1, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
	GUICtrlCreateGroupEx  ("", 486, 70, 338, 615)

	; the following visually hides the border between two groups above
    GUICtrlCreateLabel("", 481, 178, 10, 435)
    GUICtrlSetBkColor(-1, _ColorFlip(_WinAPI_GetSysColor($COLOR_WINDOW)))

	$scrape_manual_join_art_1_pic = 											GUICtrlCreatePicEx(500, 80, 220, 110, "Left mouse click to view enlarged", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKTOP + $GUI_DOCKAUTO, True)
	$scrape_manual_join_art_2_pic = 											GUICtrlCreatePicEx(500, 200, 220, 110, "Left mouse click to view enlarged", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKAUTO, True)
	$scrape_manual_join_art_3_pic = 											GUICtrlCreatePicEx(500, 320, 220, 110, "Left mouse click to view enlarged", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKAUTO, True)
	$scrape_manual_join_art_4_pic = 											GUICtrlCreatePicEx(500, 440, 220, 110, "Left mouse click to view enlarged", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKAUTO, True)
	$scrape_manual_join_art_5_pic = 											GUICtrlCreatePicEx(500, 560, 220, 110, "Left mouse click to view enlarged", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKBOTTOM, True)
	$scrape_manual_join_down_button = 											GUICtrlCreateImageButton("down.ico", 730, 80, 36, "Move selection down", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT, True)
	$scrape_manual_join_up_button = 											GUICtrlCreateImageButton("up.ico", 780, 80, 36, "Move selection up", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT, True)
	GUIStartGroup()
	$art_1_front = 																GUICtrlCreateRadioEx("Front", 725, 130, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
	$art_2_front = 																GUICtrlCreateRadioEx("Front", 725, 240, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
	$art_3_front = 																GUICtrlCreateRadioEx("Front", 725, 370, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
	$art_4_front = 																GUICtrlCreateRadioEx("Front", 725, 480, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
	$art_5_front = 																GUICtrlCreateRadioEx("Front", 725, 610, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
	GUIStartGroup()
	$art_1_back = 																GUICtrlCreateRadioEx("Back", 775, 130, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
	$art_2_back = 																GUICtrlCreateRadioEx("Back", 775, 240, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
	$art_3_back = 																GUICtrlCreateRadioEx("Back", 775, 370, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
	$art_4_back = 																GUICtrlCreateRadioEx("Back", 775, 480, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
	$art_5_back = 																GUICtrlCreateRadioEx("Back", 775, 610, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
	$scrape_manual_join_upload_button = 										GUICtrlCreateImageButton("upload art.ico", 780, 640, 36, "Upload selected art with game name (to the RetroPie) - Alt+A", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT, True)
	GUICtrlCreateGroupEx  ("Step 3: Update Gamelist with Assigned Art", 12, 620, 250, 60)
	$scrape_manual_join_upload_gamelist_button = 								GUICtrlCreateImageButton("update list.ico", 20, 640, 36, "Update games list (on the RetroPie) with all art uploaded - Alt+G", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)


EndFunc

Func Scrape_Images_with_Manual_Join_tab_child_gui_setup()

	$art_gui = 																	ChildGUICreate($app_name & " - Art Enlarged", 640, 480, $main_gui)
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $art_gui = ' & $art_gui & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	$art_big_pic = 																GUICtrlCreatePicEx(0, 0, 640, 480, "", $GUI_DOCKAUTO)

	$art_dummy = 																GUICtrlCreateDummy()
	Local $art_aAccelKeys[1][2] = [["{Esc}", $art_dummy]]
	GUISetAccelerators($art_aAccelKeys, $art_gui)

EndFunc


Func Scrape_Images_with_Manual_Join_tab_event_handler($msg)

	Switch $msg


		case $scrape_manual_join_scrape_button

			Local $system_name
			Local $scraper_exe

			if StringCompare(GUICtrlRead($scrape_manual_join_website_combo), "Atarimania") = 0 Then

				$system_name = "Atarimania"
				$scraper_exe = $app_name & " Atarimania Scraper.exe"
			endif

			if StringCompare(GUICtrlRead($scrape_manual_join_website_combo), "LaunchBox") = 0 Then

				$system_name = "LaunchBox"
				$scraper_exe = $app_name & " LaunchBox Scraper.exe"
			endif

			GUICtrlStatusInput_SetText($status_input, "Please Wait. Getting number of pages from " & $system_name & " ...")
			Local $iPID = Run($scraper_exe & " """ & GUICtrlRead($system_combo) & """", @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
			ProcessWaitClose($iPID)
			Local $num_pages = StdoutRead($iPID)
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $num_pages = ' & $num_pages & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			GUICtrlStatusInput_SetText($status_input, "")

			Local $pages_per_scraper = Ceiling(Number($num_pages) / Number(GUICtrlRead($scrape_manual_join_max_scrapers_input)))
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $pages_per_scraper = ' & $pages_per_scraper & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

			Local $showflag = @SW_SHOW

			if GUICtrlRead($scrape_manual_join_minimized_scrapers_checkbox) = $GUI_CHECKED Then

				$showflag = @SW_MINIMIZE
			EndIf

			for $page_num = 1 to $num_pages step $pages_per_scraper

				Local $start_page_num = $page_num
				Local $end_page_num = _Min(Number($page_num + ($pages_per_scraper - 1)), Number($num_pages))
				ConsoleWrite("Executing " & $scraper_exe & " " & """" & GUICtrlRead($system_combo) & """ images " & $start_page_num & " " & $end_page_num & @CRLF)
				ShellExecute($scraper_exe, """" & GUICtrlRead($system_combo) & """ images " & $start_page_num & " " & $end_page_num, @ScriptDir, "", $showflag)
			Next
#cs
			Local $num_scrapers_running = ""

			Do

				Local $arr = ProcessList($scraper_exe)
				$num_scrapers_running = Number($arr[0][0])

				if $num_scrapers_running <= 0 Then

					ExitLoop
				EndIf

				GUICtrlStatusInput_SetText($status_input, "Please Wait. Waiting for " & $num_scrapers_running & " scrapers to complete ...")
				Sleep(5000)
			Until $num_scrapers_running <= 0

			GUICtrlStatusInput_SetText($status_input, "")
#ce



		case $scrape_manual_join_match_art_to_roms_radio

			GUICtrlSetPos($scrape_manual_join_art_label, 20, 240, 70, 20)
			GUICtrlSetPos($scrape_manual_join_art_list, 20, 260, 200, 420)
			GUICtrlSetPos($scrape_manual_join_rom_label, 240, 240, 100, 20)
			GUICtrlSetPos($scrape_manual_join_rom_list, 240, 260, 200, 420)

		case $scrape_manual_join_match_roms_to_art_radio

			GUICtrlSetPos($scrape_manual_join_rom_label, 20, 240, 70, 20)
			GUICtrlSetPos($scrape_manual_join_rom_list, 20, 260, 200, 420)
			GUICtrlSetPos($scrape_manual_join_art_label, 240, 240, 100, 20)
			GUICtrlSetPos($scrape_manual_join_art_list, 240, 260, 200, 420)



		Case $scrape_manual_join_refresh_button

			depress_button_and_disable_gui($scrape_manual_join_refresh_button)
			$spinner1_gif = _GUICtrlCreateGIF(@ScriptDir & "\" & $spinner200_gif_filename, "", 20, 220, -1, -1, 1)
			$spinner2_gif = _GUICtrlCreateGIF(@ScriptDir & "\" & $spinner200_gif_filename, "", 240, 220, -1, -1, 1)
			_GUICtrlListBox_ResetContent($scrape_manual_join_art_list)
			_GUICtrlListBox_ResetContent($scrape_manual_join_rom_list)

			GUICtrlStatusInput_SetText($status_input, "Please Wait. Getting rom list from /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " ...")
			$result = plink("(cd /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " && ls *.{bin,zip,lha,a52,a78,j64,lnx,rom,nes,mgw,gba,love,7z,n64,z64,nds,iso,32x,sfc,smc,vec,ws})", 2)
			GUICtrlStatusInput_SetText($status_input, "")
			Local $num_files = 0

			if @error <> 0 Then

				GUICtrlStatusInput_SetText($status_input, $result & ' - {\field{\*\fldinst{HYPERLINK "click_here_to_Troubleshoot"}}{\fldrslt{\ul\cf5\b click here to Troubleshoot}}}\b0\f0\par\par ')
			Else

				Local $rom_filename_arr = StringSplit($result, @LF, 3)
				_ArraySort($rom_filename_arr)

				if GUICtrlRead($scrape_manual_join_exclude_uploaded_art_checkbox) = $GUI_CHECKED Then

					GUICtrlStatusInput_SetText($status_input, "Please Wait. Getting images list from /opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " ...")
					$result = plink("(cd /opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " && ls *-full-cover.jpg)", 2)
					GUICtrlStatusInput_SetText($status_input, "")

					if @error <> 0 Then

						GUICtrlStatusInput_SetText($status_input, $result & ' - {\field{\*\fldinst{HYPERLINK "click_here_to_Troubleshoot"}}{\fldrslt{\ul\cf5\b click here to Troubleshoot}}}\b0\f0\par\par ')
					Else

						Local $art_filename_arr = StringSplit($result, @LF, 3)
						_ArraySort($art_filename_arr)
						_GUICtrlListBox_BeginUpdate($scrape_manual_join_rom_list)
						$num_files = 0

						for $i = 0 to (UBound($rom_filename_arr) - 1)

							_PathSplit($rom_filename_arr[$i], $sDrive1, $sDir1, $sFileName1, $sExtension1)

							if _ArrayBinarySearch($art_filename_arr, $sFileName1 & "-full-cover.jpg") < 0 Then

								_GUICtrlListBox_InsertString($scrape_manual_join_rom_list, $rom_filename_arr[$i])
								$num_files = $num_files + 1
							EndIf
						Next

						_GUICtrlListBox_EndUpdate($scrape_manual_join_rom_list)

					EndIf
				Else

					_GUICtrlListBox_BeginUpdate($scrape_manual_join_rom_list)
					$num_files = 0

					for $i = 0 to (UBound($rom_filename_arr) - 1)

						_GUICtrlListBox_InsertString($scrape_manual_join_rom_list, $rom_filename_arr[$i])
						$num_files = $num_files + 1
					Next

					_GUICtrlListBox_EndUpdate($scrape_manual_join_rom_list)
				EndIf

				GUICtrlSetData($scrape_manual_join_rom_label, "Roms (" & $num_files & ")")
			EndIf

			_GIF_DeleteGIF($spinner2_gif)

			Local $arr = _FileListToArrayRec($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box", "*.jpg;*.png", 1, 0, 1)
			$num_files = 0
			_GUICtrlListBox_BeginUpdate($scrape_manual_join_art_list)

			for $i = 1 to $arr[0]

				Local $art_name = StringRegExpReplace($arr[$i], "-[0-9]*.(?:jpg|png)", "")

				if StringInStr($art_name, ".jpg") < 1 And StringInStr($art_name, ".png") < 1 Then

					if _GUICtrlListBox_FindString($scrape_manual_join_art_list, $art_name, True) < 0 Then

						_GUICtrlListBox_InsertString($scrape_manual_join_art_list, $art_name)
						$num_files = $num_files + 1
					EndIf
				EndIf

			Next

			_GUICtrlListBox_EndUpdate($scrape_manual_join_art_list)
			GUICtrlSetData($scrape_manual_join_art_label, "Art (" & $num_files & ")")
			_GIF_DeleteGIF($spinner1_gif)
			raise_button_and_enable_gui($scrape_manual_join_refresh_button)



		Case $scrape_manual_join_upload_button

			GUICtrlSetState($scrape_manual_join_art_list, $GUI_DISABLE)
			GUICtrlSetState($scrape_manual_join_rom_list, $GUI_DISABLE)
			GUICtrlSetState($scrape_manual_join_upload_button, $GUI_DISABLE)

			Local $art_name = _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list))
			Local $rom_name = _GUICtrlListBox_GetText($scrape_manual_join_rom_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_rom_list))
			Local $selected_indices = _GUICtrlListBox_GetSelItems($scrape_manual_join_rom_list)

			for $index_num = $selected_indices[0] to 1 step -1

				Local $rom_name = _GUICtrlListBox_GetText($scrape_manual_join_rom_list, $selected_indices[$index_num])
				_PathSplit($rom_name, $sDrive1, $sDir1, $sFileName1, $sExtension1)
				Local $old_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $art_name & "-full-cover.jpg"
				Local $new_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $sFileName1 & "-full-cover.jpg"
				Local $new_art_compressed_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $sFileName1 & "-full-cover-compressed.jpg"
				Local $left_art_path
				Local $right_art_path

				; rename the art filename to match the rom filename

				if StringCompare($art_name, $sFileName1) <> 0 Then

					Local $curr_index = _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)
					_GUICtrlListBox_ReplaceString($scrape_manual_join_art_list, $curr_index, $sFileName1)
					_GUICtrlListBox_SetCurSel($scrape_manual_join_art_list, $curr_index)
	;				FileMove($old_art_path, $new_art_path, 1)

					for $i = 1 to 10

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-" & $i & ".jpg") = True Then

							FileMove($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-" & $i & ".jpg", $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-" & $i & ".jpg", 1)
						EndIf

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-" & $i & ".png") = True Then

							FileMove($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-" & $i & ".png", $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-" & $i & ".png", 1)
						EndIf
					Next

				EndIf

				if GUICtrlRead($art_1_back) = $GUI_CHECKED Then

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-1.jpg") = True Then

						$left_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-1.jpg"
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-1.png") = True Then

						$left_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-1.png"
					EndIf
				EndIf

				if GUICtrlRead($art_2_back) = $GUI_CHECKED Then

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-2.jpg") = True Then

						$left_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-2.jpg"
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-2.png") = True Then

						$left_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-2.png"
					EndIf
				EndIf

				if GUICtrlRead($art_3_back) = $GUI_CHECKED Then

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-3.jpg") = True Then

						$left_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-3.jpg"
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-3.png") = True Then

						$left_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-3.png"
					EndIf
				EndIf

				if GUICtrlRead($art_4_back) = $GUI_CHECKED Then

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-4.jpg") = True Then

						$left_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-4.jpg"
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-4.png") = True Then

						$left_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-4.png"
					EndIf
				EndIf

				if GUICtrlRead($art_5_back) = $GUI_CHECKED Then

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-5.jpg") = True Then

						$left_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-5.jpg"
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-5.png") = True Then

						$left_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-5.png"
					EndIf
				EndIf

				if GUICtrlRead($art_1_front) = $GUI_CHECKED Then

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-1.jpg") = True Then

						$right_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-1.jpg"
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-1.png") = True Then

						$right_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-1.png"
					EndIf
				EndIf

				if GUICtrlRead($art_2_front) = $GUI_CHECKED Then

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-2.jpg") = True Then

						$right_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-2.jpg"
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-2.png") = True Then

						$right_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-2.png"
					EndIf
				EndIf

				if GUICtrlRead($art_3_front) = $GUI_CHECKED Then

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-3.jpg") = True Then

						$right_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-3.jpg"
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-3.png") = True Then

						$right_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-3.png"
					EndIf
				EndIf

				if GUICtrlRead($art_4_front) = $GUI_CHECKED Then

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-4.jpg") = True Then

						$right_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-4.jpg"
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-4.png") = True Then

						$right_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-4.png"
					EndIf
				EndIf

				if GUICtrlRead($art_5_front) = $GUI_CHECKED Then

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-5.jpg") = True Then

						$right_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-5.jpg"
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-5.png") = True Then

						$right_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $sFileName1 & "-5.png"
					EndIf
				EndIf

				; join the selected back and front art from Box to Box_Full
	;			ShellExecuteWait("magick.exe", """" & $left_art_path & """ """ & $right_art_path & """ +append """ & $new_art_path & """", $ImageMagick_path, "", @SW_HIDE)

				; compress
	;			ShellExecuteWait("magick.exe", "-quality 80% """ & $new_art_path & """ -resize ""1920x1080>"" """ & $new_art_compressed_path & """", $ImageMagick_path, "", @SW_HIDE)

				; resize back and front art to be the same (1920x1080), join together and output to Box_Full at quality 80%

				if StringCompare($left_art_path, $right_art_path) = 0 Then

;					ShellExecuteWait("magick.exe", """" & $left_art_path & """ -resize ""1920x1080>"" -quality 80% """ & $new_art_path & """", $ImageMagick_path, "", @SW_HIDE)
					ShellExecuteWait("magick.exe", """" & $left_art_path & """ -resize ""1920x1080"" -quality 80% """ & $new_art_path & """", $ImageMagick_path, "", @SW_HIDE)
				Else

					ShellExecuteWait("magick.exe", """" & $left_art_path & """ """ & $right_art_path & """ -resize ""1920x1080"" +append -resize ""1920x1080>"" -quality 80% """ & $new_art_path & """", $ImageMagick_path, "", @SW_HIDE)
				EndIf

				Local $filesize = FileGetSize($new_art_path)
				Local $filesize_compressed = FileGetSize($new_art_compressed_path)
				local $compression_ratio = int(($filesize_compressed / $filesize) * 100)

				if $compression_ratio >= 80 Then

					FileDelete($new_art_compressed_path)
				Else

					FileMove($new_art_compressed_path, $new_art_path, 1)
				EndIf

				; upload the joined art to the RetroPie

				Local $msg2 = "Please Wait. Saving to the RetroPie - " & $sFileName1 & "-full-cover.jpg ..."
				ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $msg2 = ' & $msg2 & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
				GUICtrlStatusInput_SetText($status_input, $msg2)
				pscp_upload($new_art_path, "/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $sFileName1 & "-full-cover.jpg")
				GUICtrlStatusInput_SetText($status_input, "Saved """ & $sFileName1 & "-full-cover.jpg"" to the RetroPie")


				Local $num_rom_files = _GUICtrlListBox_GetCount($scrape_manual_join_rom_list) ;Number(StringReplace(GUICtrlRead($scrape_manual_join_rom_files_label), " Files", ""))
				;Local $rom_list_selected_index = _GUICtrlListBox_GetCurSel($scrape_manual_join_rom_list)

				_GUICtrlListBox_DeleteString($scrape_manual_join_rom_list, $selected_indices[$index_num])
				$num_rom_files = $num_rom_files - 1
				GUICtrlSetData($scrape_manual_join_rom_label, "Roms (" & $num_rom_files & ")")

			Next

			Local $num_art_files = _GUICtrlListBox_GetCount($scrape_manual_join_art_list) ;Number(StringReplace(GUICtrlRead($scrape_manual_join_art_files_label), " Files", ""))
			Local $art_list_selected_index = _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)

			if GUICtrlRead($scrape_manual_join_exclude_uploaded_art_checkbox) = $GUI_CHECKED Then

				_GUICtrlListBox_DeleteString($scrape_manual_join_art_list, $art_list_selected_index)
				$num_art_files = $num_art_files - 1
			EndIf

			GUICtrlSetData($scrape_manual_join_art_label, "Art (" & $num_art_files & ")")

			if GUICtrlRead($scrape_manual_join_match_art_to_roms_radio) = $GUI_CHECKED Then

				GUICtrlSetState($scrape_manual_join_art_list, $GUI_ENABLE)
				_GUICtrlListBox_ClickItem($scrape_manual_join_art_list, $art_list_selected_index)


;				if GUICtrlRead($scrape_manual_join_exclude_uploaded_art_checkbox) = $GUI_CHECKED Then

;					_GUICtrlListBox_ClickItem($scrape_manual_join_art_list, $art_list_selected_index)
;				Else

					;_GUICtrlListBox_SetCurSel($scrape_manual_join_rom_list, $rom_list_selected_index)
;					GUICtrlSetState($scrape_manual_join_art_list, $GUI_FOCUS)
;				EndIf
			EndIf

			GUICtrlStatusInput_SetText($status_input, "")
			GUICtrlSetState($scrape_manual_join_art_list, $GUI_ENABLE)
			GUICtrlSetState($scrape_manual_join_rom_list, $GUI_ENABLE)
			GUICtrlSetState($scrape_manual_join_upload_button, $GUI_ENABLE)

			if GUICtrlRead($scrape_manual_join_match_roms_to_art_radio) = $GUI_CHECKED Then

				;GUICtrlSetState($scrape_manual_join_rom_list, $GUI_ENABLE)
				GUICtrlSetState($scrape_manual_join_rom_list, $GUI_FOCUS)
				_GUICtrlListBox_SetCaretIndex($scrape_manual_join_rom_list, $selected_indices[1])
				_GUICtrlListBox_ClickItem($scrape_manual_join_rom_list, $selected_indices[1])
			EndIf

		Case $scrape_manual_join_upload_gamelist_button


			Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"

			GUICtrlStatusInput_SetText($status_input, "Please Wait. Downloading /opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
			pscp_download("/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml", $gamelist_filepath)
			GUICtrlStatusInput_SetText($status_input, "Downloaded " & $gamelist_filepath)

			GUICtrlStatusInput_SetText($status_input, "Please Wait. Updating gamelist.xml ...")

			$gamelist_xml_dom = _XMLLoadXML(FileRead($gamelist_filepath), "")
			Local $gamelist_num_nodes = _XMLGetNodeCount($gamelist_xml_dom, "/gameList/game")
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $gamelist_num_nodes = ' & $gamelist_num_nodes & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

			for $i = 1 to $gamelist_num_nodes

				;Local $game_name = _XMLGetValue($gamelist_xml_dom, "/gameList/game[" & $i & "]/name")
				Local $game_path = _XMLGetValue($gamelist_xml_dom, "/gameList/game[" & $i & "]/path")
				_PathSplit($game_path, $sDrive1, $sDir1, $sFileName1, $sExtension1)
				XMLUpdateOrCreateChildNode($gamelist_xml_dom, "/gameList/game[" & $i & "]", "image", "~/.emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $sFileName1 & "-full-cover.jpg")
			Next

			Local $gamelist_xml = _XMLGetDocXML($gamelist_xml_dom)
			$gamelist_xml = msWordXML_Beautify($gamelist_xml)
			FileDelete($gamelist_filepath)
			FileWrite($gamelist_filepath, $gamelist_xml)

			GUICtrlStatusInput_SetText($status_input, "Please Wait. Uploading " & $gamelist_filepath)
			pscp_upload($gamelist_filepath, "/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
			GUICtrlStatusInput_SetText($status_input, "Uploaded " & $gamelist_filepath)



		case $scrape_manual_join_art_1_pic

			if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-1.jpg") = True Then

				GUISetImage($art_gui, $art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-1.jpg")
			Else

				GUISetImage($art_gui, $art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-1.png")
			EndIf

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_2_pic

			if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-2.jpg") = True Then

				GUISetImage($art_gui, $art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-2.jpg")
			Else

				GUISetImage($art_gui, $art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-2.png")
			EndIf

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_3_pic

			if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-3.jpg") = True Then

				GUISetImage($art_gui, $art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-3.jpg")
			Else

				GUISetImage($art_gui, $art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-3.png")
			EndIf

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_4_pic

			if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-4.jpg") = True Then

				GUISetImage($art_gui, $art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-4.jpg")
			Else

				GUISetImage($art_gui, $art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-4.png")
			EndIf

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_5_pic

			if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-5.jpg") = True Then

				GUISetImage($art_gui, $art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-5.jpg")
			Else

				GUISetImage($art_gui, $art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-5.png")
			EndIf

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui



		Case $scrape_manual_join_down_button

			if GUICtrlRead($art_4_front) = $GUI_CHECKED Then

				GUICtrlSetState($art_5_front, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_3_front) = $GUI_CHECKED Then

				GUICtrlSetState($art_4_front, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_2_front) = $GUI_CHECKED Then

				GUICtrlSetState($art_3_front, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_1_front) = $GUI_CHECKED Then

				GUICtrlSetState($art_2_front, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_4_back) = $GUI_CHECKED Then

				GUICtrlSetState($art_5_back, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_3_back) = $GUI_CHECKED Then

				GUICtrlSetState($art_4_back, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_2_back) = $GUI_CHECKED Then

				GUICtrlSetState($art_3_back, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_1_back) = $GUI_CHECKED Then

				GUICtrlSetState($art_2_back, $GUI_CHECKED)
			EndIf

		Case $scrape_manual_join_up_button

			if GUICtrlRead($art_2_front) = $GUI_CHECKED Then

				GUICtrlSetState($art_1_front, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_3_front) = $GUI_CHECKED Then

				GUICtrlSetState($art_2_front, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_4_front) = $GUI_CHECKED Then

				GUICtrlSetState($art_3_front, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_5_front) = $GUI_CHECKED Then

				GUICtrlSetState($art_4_front, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_2_back) = $GUI_CHECKED Then

				GUICtrlSetState($art_1_back, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_3_back) = $GUI_CHECKED Then

				GUICtrlSetState($art_2_back, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_4_back) = $GUI_CHECKED Then

				GUICtrlSetState($art_3_back, $GUI_CHECKED)
			EndIf

			if GUICtrlRead($art_5_back) = $GUI_CHECKED Then

				GUICtrlSetState($art_4_back, $GUI_CHECKED)
			EndIf


		Case $art_1_front, $art_2_front, $art_3_front, $art_4_front, $art_5_front, $art_1_back, $art_2_back, $art_3_back, $art_4_back, $art_5_back

			GUICtrlSetState($scrape_manual_join_art_list, $GUI_FOCUS)


		Case $art_dummy

			GUISetState(@SW_ENABLE, $main_gui)
			GUISetState(@SW_HIDE, $current_gui)
			$current_gui = $main_gui



	EndSwitch

EndFunc


Func Scrape_Images_with_Manual_Join_tab_WM_COMMAND_handler($hWndFrom, $iCode)


    Switch $hWndFrom




        Case GUICtrlGetHandle($scrape_manual_join_art_list)

			Switch $iCode

                Case $LBN_SELCHANGE ; Sent when the user cancels the selection in a list box

					Local $art_name = _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list))
					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $art_name = ' & $art_name & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

					if GUICtrlRead($scrape_manual_join_match_art_to_roms_radio) = $GUI_CHECKED Then

						Local $selected_index = 0
						GUICtrlUnselect($scrape_manual_join_rom_list)

						for $i = 1 to StringLen($art_name)

							Local $rom_name_search_text = StringLeft($art_name, $i)
							$result = _GUICtrlListBox_FindString($scrape_manual_join_rom_list, $rom_name_search_text)
;							Local $result = _GUICtrlListBox_SelectString($scrape_manual_join_rom_list, $rom_name_search_text)

							if $result < 0 Then

								ExitLoop
							EndIf

							$selected_index = $result
						Next

;						_GUICtrlListBox_SelItemRange($scrape_manual_join_rom_list, $selected_index, $selected_index)
						_GUICtrlListBox_SetCurSel($scrape_manual_join_rom_list, $selected_index)
						_GUICtrlListBox_SetTopIndex($scrape_manual_join_rom_list, $selected_index - 11)
						GUICtrlSetState($scrape_manual_join_down_button, $GUI_SHOW)
						GUICtrlSetState($scrape_manual_join_up_button, $GUI_SHOW)
						GUICtrlSetState($scrape_manual_join_upload_button, $GUI_SHOW)
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.*") = True Then

						GUICtrlSetState($scrape_manual_join_art_1_pic, $GUI_SHOW)
						GUICtrlSetState($art_1_front, $GUI_SHOW)
						GUICtrlSetState($art_1_front, $GUI_CHECKED)
						GUICtrlSetState($art_1_back, $GUI_SHOW)

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.*") = True Then

							GUICtrlSetState($art_1_back, $GUI_UNCHECKED)
						Else

							GUICtrlSetState($art_1_back, $GUI_CHECKED)
						EndIf

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.jpg") = True Then

							GUICtrlSetImage($scrape_manual_join_art_1_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.jpg")
						Else

							GUICtrlSetImagePNG($scrape_manual_join_art_1_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.png")
						EndIf
					Else

						GUICtrlSetState($scrape_manual_join_art_1_pic, $GUI_HIDE)
						GUICtrlSetState($art_1_front, $GUI_HIDE)
						GUICtrlSetState($art_1_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_1_back, $GUI_HIDE)
						GUICtrlSetState($art_1_back, $GUI_UNCHECKED)
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.*") = True Then

						GUICtrlSetState($scrape_manual_join_art_2_pic, $GUI_SHOW)
						GUICtrlSetState($art_2_front, $GUI_SHOW)
						GUICtrlSetState($art_2_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_2_back, $GUI_SHOW)
						GUICtrlSetState($art_2_back, $GUI_CHECKED)

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.jpg") = True Then

							GUICtrlSetImage($scrape_manual_join_art_2_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.jpg")
						Else

							GUICtrlSetImagePNG($scrape_manual_join_art_2_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.png")
						EndIf
					Else

						GUICtrlSetState($scrape_manual_join_art_2_pic, $GUI_HIDE)
						GUICtrlSetState($art_2_front, $GUI_HIDE)
						GUICtrlSetState($art_2_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_2_back, $GUI_HIDE)
						GUICtrlSetState($art_2_back, $GUI_UNCHECKED)
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.*") = True Then

						GUICtrlSetState($scrape_manual_join_art_3_pic, $GUI_SHOW)
						GUICtrlSetState($art_3_front, $GUI_SHOW)
						GUICtrlSetState($art_3_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_3_back, $GUI_SHOW)
						GUICtrlSetState($art_3_back, $GUI_UNCHECKED)

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.jpg") = True Then

							GUICtrlSetImage($scrape_manual_join_art_3_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.jpg")
						Else

							GUICtrlSetImagePNG($scrape_manual_join_art_3_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.png")
						EndIf
					Else

						GUICtrlSetState($scrape_manual_join_art_3_pic, $GUI_HIDE)
						GUICtrlSetState($art_3_front, $GUI_HIDE)
						GUICtrlSetState($art_3_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_3_back, $GUI_HIDE)
						GUICtrlSetState($art_3_back, $GUI_UNCHECKED)
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.*") = True Then

						GUICtrlSetState($scrape_manual_join_art_4_pic, $GUI_SHOW)
						GUICtrlSetState($art_4_front, $GUI_SHOW)
						GUICtrlSetState($art_4_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_4_back, $GUI_SHOW)
						GUICtrlSetState($art_4_back, $GUI_UNCHECKED)

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.jpg") = True Then

							GUICtrlSetImage($scrape_manual_join_art_4_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.jpg")
						Else

							GUICtrlSetImagePNG($scrape_manual_join_art_4_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.png")
						EndIf
					Else

						GUICtrlSetState($scrape_manual_join_art_4_pic, $GUI_HIDE)
						GUICtrlSetState($art_4_front, $GUI_HIDE)
						GUICtrlSetState($art_4_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_4_back, $GUI_HIDE)
						GUICtrlSetState($art_4_back, $GUI_UNCHECKED)
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.*") = True Then

						GUICtrlSetState($scrape_manual_join_art_5_pic, $GUI_SHOW)
						GUICtrlSetState($art_5_front, $GUI_SHOW)
						GUICtrlSetState($art_5_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_5_back, $GUI_SHOW)
						GUICtrlSetState($art_5_back, $GUI_UNCHECKED)

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.jpg") = True Then

							GUICtrlSetImage($scrape_manual_join_art_5_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.jpg")
						Else

							GUICtrlSetImagePNG($scrape_manual_join_art_5_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.png")
						EndIf
					Else

						GUICtrlSetState($scrape_manual_join_art_5_pic, $GUI_HIDE)
						GUICtrlSetState($art_5_front, $GUI_HIDE)
						GUICtrlSetState($art_5_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_5_back, $GUI_HIDE)
						GUICtrlSetState($art_5_back, $GUI_UNCHECKED)
					EndIf


			EndSwitch


        Case GUICtrlGetHandle($scrape_manual_join_rom_list)

			Switch $iCode

                Case $LBN_SELCHANGE ; Sent when the user cancels the selection in a list box
					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $LBN_SELCHANGE = ' & $LBN_SELCHANGE & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

					if GUICtrlRead($scrape_manual_join_match_roms_to_art_radio) = $GUI_CHECKED Then

						Local $rom_name = _GUICtrlListBox_GetText($scrape_manual_join_rom_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_rom_list))
						Local $selected_index = 0

						for $i = 1 to StringLen($rom_name)

							Local $art_name_search_text = StringLeft($rom_name, $i)
							$result = _GUICtrlListBox_SelectString($scrape_manual_join_art_list, $art_name_search_text)

							if $result < 0 Then

								ExitLoop
							EndIf

							$selected_index = $result
						Next

						_GUICtrlListBox_SetCurSel($scrape_manual_join_art_list, $selected_index)
						_GUICtrlListBox_SetTopIndex($scrape_manual_join_art_list, $selected_index - 11)
						Local $art_name = _GUICtrlListBox_GetText($scrape_manual_join_art_list, $selected_index)
						GUICtrlSetState($scrape_manual_join_down_button, $GUI_SHOW)
						GUICtrlSetState($scrape_manual_join_up_button, $GUI_SHOW)
						GUICtrlSetState($scrape_manual_join_upload_button, $GUI_SHOW)

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.*") = True Then

							GUICtrlSetState($scrape_manual_join_art_1_pic, $GUI_SHOW)
							GUICtrlSetState($art_1_front, $GUI_SHOW)
							GUICtrlSetState($art_1_front, $GUI_CHECKED)
							GUICtrlSetState($art_1_back, $GUI_SHOW)

							if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.*") = True Then

								GUICtrlSetState($art_1_back, $GUI_UNCHECKED)
							Else

								GUICtrlSetState($art_1_back, $GUI_CHECKED)
							EndIf

							if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.jpg") = True Then

								GUICtrlSetImage($scrape_manual_join_art_1_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.jpg")
							Else

								GUICtrlSetImagePNG($scrape_manual_join_art_1_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.png")
							EndIf
						Else

							GUICtrlSetState($scrape_manual_join_art_1_pic, $GUI_HIDE)
							GUICtrlSetState($art_1_front, $GUI_HIDE)
							GUICtrlSetState($art_1_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_1_back, $GUI_HIDE)
							GUICtrlSetState($art_1_back, $GUI_UNCHECKED)
						EndIf

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.*") = True Then

							GUICtrlSetState($scrape_manual_join_art_2_pic, $GUI_SHOW)
							GUICtrlSetState($art_2_front, $GUI_SHOW)
							GUICtrlSetState($art_2_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_2_back, $GUI_SHOW)
							GUICtrlSetState($art_2_back, $GUI_CHECKED)

							if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.jpg") = True Then

								GUICtrlSetImage($scrape_manual_join_art_2_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.jpg")
							Else

								GUICtrlSetImagePNG($scrape_manual_join_art_2_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.png")
							EndIf
						Else

							GUICtrlSetState($scrape_manual_join_art_2_pic, $GUI_HIDE)
							GUICtrlSetState($art_2_front, $GUI_HIDE)
							GUICtrlSetState($art_2_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_2_back, $GUI_HIDE)
							GUICtrlSetState($art_2_back, $GUI_UNCHECKED)
						EndIf

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.*") = True Then

							GUICtrlSetState($scrape_manual_join_art_3_pic, $GUI_SHOW)
							GUICtrlSetState($art_3_front, $GUI_SHOW)
							GUICtrlSetState($art_3_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_3_back, $GUI_SHOW)
							GUICtrlSetState($art_3_back, $GUI_UNCHECKED)

							if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.jpg") = True Then

								GUICtrlSetImage($scrape_manual_join_art_3_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.jpg")
							Else

								GUICtrlSetImagePNG($scrape_manual_join_art_3_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.png")
							EndIf
						Else

							GUICtrlSetState($scrape_manual_join_art_3_pic, $GUI_HIDE)
							GUICtrlSetState($art_3_front, $GUI_HIDE)
							GUICtrlSetState($art_3_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_3_back, $GUI_HIDE)
							GUICtrlSetState($art_3_back, $GUI_UNCHECKED)
						EndIf

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.*") = True Then

							GUICtrlSetState($scrape_manual_join_art_4_pic, $GUI_SHOW)
							GUICtrlSetState($art_4_front, $GUI_SHOW)
							GUICtrlSetState($art_4_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_4_back, $GUI_SHOW)
							GUICtrlSetState($art_4_back, $GUI_UNCHECKED)

							if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.jpg") = True Then

								GUICtrlSetImage($scrape_manual_join_art_4_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.jpg")
							Else

								GUICtrlSetImagePNG($scrape_manual_join_art_4_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.png")
							EndIf
						Else

							GUICtrlSetState($scrape_manual_join_art_4_pic, $GUI_HIDE)
							GUICtrlSetState($art_4_front, $GUI_HIDE)
							GUICtrlSetState($art_4_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_4_back, $GUI_HIDE)
							GUICtrlSetState($art_4_back, $GUI_UNCHECKED)
						EndIf

						if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.*") = True Then

							GUICtrlSetState($scrape_manual_join_art_5_pic, $GUI_SHOW)
							GUICtrlSetState($art_5_front, $GUI_SHOW)
							GUICtrlSetState($art_5_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_5_back, $GUI_SHOW)
							GUICtrlSetState($art_5_back, $GUI_UNCHECKED)

							if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.jpg") = True Then

								GUICtrlSetImage($scrape_manual_join_art_5_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.jpg")
							Else

								GUICtrlSetImagePNG($scrape_manual_join_art_5_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.png")
							EndIf
						Else

							GUICtrlSetState($scrape_manual_join_art_5_pic, $GUI_HIDE)
							GUICtrlSetState($art_5_front, $GUI_HIDE)
							GUICtrlSetState($art_5_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_5_back, $GUI_HIDE)
							GUICtrlSetState($art_5_back, $GUI_UNCHECKED)
						EndIf



					EndIf
			EndSwitch



	EndSwitch

EndFunc

