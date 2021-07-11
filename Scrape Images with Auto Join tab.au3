#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
#include-once
#Include "RetropanionEx.au3"
#include "GUIScrollbars_Ex.au3"
#include <Math.au3>


Func Scrape_Images_with_Auto_Join_tab_setup()

	GUICtrlCreateTabItemEx("===> Scrape Images with Auto Join")
	$scrape_auto_join_website_combo = 											GUICtrlCreateComboFromDictWithLabel($scrape_auto_join_websites_label, "Website(s)", 20, 60, 70, 20, "The website(s) to scrape the box art from", Null, 90, 60, 150, 20)
	_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "RF Generation")
	_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "Moby Games")
	_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "The Cover Project")
	_GUICtrlComboBox_SetCurSel($scrape_auto_join_website_combo, 0)
	$max_scrapers_input = 														GUICtrlCreateInputWithLabel("10", 320, 60, 30, 20, $max_scrapers_label, "Max Scrapers", 250, 60, 80, 20, "The maximum number of scrapers that will run in parallel")
	$max_scrapers_slider = 														GUICtrlCreateSliderEx(360, 60, 150, 20, $GUI_DOCKALL, 10, 1, 10)
	$minimized_scrapers_checkbox = 												GUICtrlCreateCheckboxEx("Minimized Scrapers", 520, 60, 120, 20, True, "If checked then run each scraper in a minimized window")
	$scrape_button = 															GUICtrlCreateImageButton("scrape art.ico", 640, 60, 36, _
		"Scrapes game metadata according to the selections above." & @CRLF & _
		@CRLF & _
		"Front Covers will be stored in the Box folder." & @CRLF  & _
		"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
		"Full Covers will be stored in the BoxFull folder." & @CRLF, $GUI_DOCKALL)
	$scrape_auto_join_match_art_to_roms_radio = 								GUICtrlCreateRadioEx("Match Art to Roms", 650, 120, 120, 20, True, "", $GUI_DOCKALL)
	$scrape_auto_join_match_roms_to_art_radio = 								GUICtrlCreateRadioEx("Match Roms to Art", 650, 140, 120, 20, False, "", $GUI_DOCKALL)
	$scrape_auto_join_exclude_uploaded_art_checkbox = 							GUICtrlCreateRadioEx("Exclude Uploaded Art", 650, 160, 120, 20, True, "", $GUI_DOCKALL)
	$scrape_auto_join_refresh_button = 											GUICtrlCreateImageButton("get games art.ico", 650, 190, 36, "Get scraped art plus game names (from the RetroPie)", $GUI_DOCKALL)
	$scrape_auto_join_art_label = 												GUICtrlCreateLabelEx("Art", 20, 100, 100, 20)
	$scrape_auto_join_art_files_label = 										GUICtrlCreateLabelEx("0 Files", 180, 100, 70, 20)
	$scrape_auto_join_art_list = 												GUICtrlCreateSingleSelectList(20, 120, 200, 350, 500, $GUI_DOCKALL)
	$scrape_auto_join_rom_label = 												GUICtrlCreateLabelEx("Roms without Art", 240, 100, 100, 20)
	$scrape_auto_join_rom_files_label = 										GUICtrlCreateLabelEx("0 Files", 400, 100, 70, 20)
	$scrape_auto_join_rom_list = 												GUICtrlCreateSingleSelectList(240, 120, 200, 350, 500, $GUI_DOCKALL)
	$scrape_auto_join_upload_button = 											GUICtrlCreateImageButton("upload art.ico", 450, 120, 36, "Upload selected art with game name (to the RetroPie)")
	GUICtrlSetState(-1, $GUI_DEFBUTTON)
	$scrape_auto_join_rotate_art_button = 										GUICtrlCreateButtonEx("Split Back && Front Art and R&otate", 440, 600, 180, 40)
	$scrape_auto_join_upload_gamelist_button = 									GUICtrlCreateImageButton("update list.ico", 450, 430, 36, "Update games list (on the RetroPie) with all art uploaded", $GUI_DOCKALL)
	$scrape_auto_join_art_1_pic = 												GUICtrlCreatePicEx(20, 540, 384, 120, -1, True)


EndFunc

Func Scrape_Images_with_Auto_Join_tab_child_gui_setup()

	$art_gui2 = 																ChildGUICreate($app_name, 1024, 576, $main_gui)
	$art_big_pic2 = 															GUICtrlCreatePic("", 0, 0, 1024, 576)

	$art_gui3 = 																ChildGUICreate("Child", 1024, 576, $main_gui)
	$art_big_pic3 = 															GUICtrlCreatePic("", 0, 0, 1024, 576) ;, 0, 0)


	$gameslist_gui = 															ChildGUICreate($app_name, 640, 480, $main_gui)
	GUICtrlCreateGroupEx  ("----> RetroPie (/opt/retropie/configs/all/emulationstation/gamelists/n64/gamelist.xml)", 5, 5, 430, 40)
	$gameslist_load_button = 													GUICtrlCreateButton("Load", 10, 20, 80, 20)
	$gameslist_save_button = 													GUICtrlCreateButton("Save", 100, 20, 80, 20)
	$gameslist_restart_emulationstation_checkbox = 								GUICtrlCreateCheckboxEx("Restart EmulationStation after Save", 190, 20, 200, 20, True)
	GUICtrlCreateGroupEx  ("----> PC", 450, 5, 180, 40)
	$gameslist_open_button = 													GUICtrlCreateButton("Open", 455, 20, 80, 20)
	$gameslist_save_as_button = 												GUICtrlCreateButton("Save As", 545, 20, 80, 20)
	$gameslist_edit = 															GUICtrlCreateEdit("", 10, 50, 620, 400)
	$gameslist_status_input = 													GUICtrlCreateStatusInput("", 10, 480 - 25, 640 - 20, 20)

EndFunc


Func Scrape_Images_with_Auto_Join_tab_event_handler($msg)

	Switch $msg

		Case $scrape_button

			Local $system_name
			Local $scraper_exe

			if StringCompare(GUICtrlRead($scrape_auto_join_website_combo), "RF Generation") = 0 Then

				$system_name = "RF Generation"
				$scraper_exe = $app_name & " RF Generation Scraper.exe"
			endif

			if StringCompare(GUICtrlRead($scrape_auto_join_website_combo), "Moby Games") = 0 Then

				$system_name = "Moby Games"
				$scraper_exe = $app_name & " Moby Games Scraper.exe"
			endif

			if StringCompare(GUICtrlRead($scrape_auto_join_website_combo), "The Cover Project") = 0 Then

				$system_name = "The Cover Project"
				$scraper_exe = $app_name & " Cover Project Scraper.exe"
			endif

			GUICtrlSetData($status_input, "Getting number of pages from " & $system_name & " ...")
			Local $iPID = Run($scraper_exe & " """ & GUICtrlRead($system_combo) & """", @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
			ProcessWaitClose($iPID)
			Local $num_pages = StdoutRead($iPID)
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $num_pages = ' & $num_pages & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			GUICtrlSetData($status_input, "")

			Local $pages_per_scraper = Ceiling(Number($num_pages) / Number(GUICtrlRead($max_scrapers_input)))
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $pages_per_scraper = ' & $pages_per_scraper & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

			Local $showflag = @SW_SHOW

			if GUICtrlRead($minimized_scrapers_checkbox) = $GUI_CHECKED Then

				$showflag = @SW_MINIMIZE
			EndIf

			for $page_num = 1 to $num_pages step $pages_per_scraper

				Local $start_page_num = $page_num
				Local $end_page_num = _Min(Number($page_num + ($pages_per_scraper - 1)), Number($num_pages))
				ConsoleWrite("Executing " & $scraper_exe & " " & """" & GUICtrlRead($system_combo) & """ " & $start_page_num & " " & $end_page_num & @CRLF)
				ShellExecute($scraper_exe, """" & GUICtrlRead($system_combo) & """ " & $start_page_num & " " & $end_page_num, @ScriptDir, "", $showflag)
			Next

#cs
			Local $num_scrapers_running = ""

			Do

				Local $arr = ProcessList($scraper_exe)
				$num_scrapers_running = Number($arr[0][0])

				if $num_scrapers_running <= 0 Then

					ExitLoop
				EndIf

				GUICtrlSetData($status_input, "Waiting for " & $num_scrapers_running & " scrapers to complete ...")
				Sleep(5000)
			Until $num_scrapers_running <= 0

			GUICtrlSetData($status_input, "")
#ce


		case $scrape_auto_join_match_art_to_roms_radio

			GUICtrlSetPos($scrape_auto_join_art_label, 20, 100, 100, 20)
			GUICtrlSetPos($scrape_auto_join_art_files_label, 180, 100, 70, 20)
			GUICtrlSetPos($scrape_auto_join_art_list, 20, 120, 200, 350)
			GUICtrlSetPos($scrape_auto_join_rom_label, 240, 100, 100, 20)
			GUICtrlSetPos($scrape_auto_join_rom_files_label, 400, 100, 70, 20)
			GUICtrlSetPos($scrape_auto_join_rom_list, 240, 120, 200, 350)


		case $scrape_auto_join_match_roms_to_art_radio

			GUICtrlSetPos($scrape_auto_join_rom_label, 20, 100, 100, 20)
			GUICtrlSetPos($scrape_auto_join_rom_files_label, 180, 100, 70, 20)
			GUICtrlSetPos($scrape_auto_join_rom_list, 20, 120, 200, 350)
			GUICtrlSetPos($scrape_auto_join_art_label, 240, 100, 100, 20)
			GUICtrlSetPos($scrape_auto_join_art_files_label, 400, 100, 70, 20)
			GUICtrlSetPos($scrape_auto_join_art_list, 240, 120, 200, 350)


		Case $scrape_auto_join_refresh_button

			_GUICtrlListBox_ResetContent($scrape_auto_join_art_list)
			_GUICtrlListBox_ResetContent($scrape_auto_join_rom_list)

			Local $arr = _FileListToArrayRec($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full", "*-full-cover.jpg", 1, 0, 1)
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full" = ' & $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full" & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			;_ArrayDisplay($arr)

			if UBound($arr) < 1 Then

				GUICtrlSetData($status_input, "No art found in " & $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full")
			Else

				Local $num_files = 0

				for $i = 1 to $arr[0]

					Local $art_name = StringReplace($arr[$i], "-full-cover.jpg", "")
					_GUICtrlListBox_InsertString($scrape_auto_join_art_list, $art_name)
					$num_files = $num_files + 1
					GUICtrlSetData($scrape_auto_join_art_files_label, $num_files & " Files")
				Next
			EndIf

			GUICtrlSetData($status_input, "Connecting to the RetroPie ...")

			$result = _WinSCP_Open()

			if $result = False Then

				GUICtrlSetData($status_input, $_WinSCP_COM_error_description)
			Else

				GUICtrlSetData($status_input, "")

				Local $art_filename_arr = _WinSCP_ListDirectory_Files("/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)), "-full-cover.jpg")
				_ArraySort($art_filename_arr)
				;_ArrayDisplay($art_filename_arr)
				Local $rom_filename_arr = _WinSCP_ListDirectory_Files("/home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)), ".bin|.zip|.lha|.a52|.a78|.j64|.lnx|.rom|.nes|.mgw|.gba|.love|.7z|.n64|.z64|.nds|.iso|.32x|.sfc|.smc|.vec|.ws")
				_ArraySort($rom_filename_arr)
				;_ArrayDisplay($rom_filename_arr)

				_GUICtrlListBox_BeginUpdate($scrape_auto_join_rom_list)

				Local $num_roms_without_art = 0

				for $i = 0 to (UBound($rom_filename_arr) - 1)
;					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $i = ' & $i & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

					_PathSplit($rom_filename_arr[$i], $sDrive1, $sDir1, $sFileName1, $sExtension1)

					if _ArrayBinarySearch($art_filename_arr, $sFileName1 & "-full-cover.jpg") < 0 Then

						_GUICtrlListBox_InsertString($scrape_auto_join_rom_list, $rom_filename_arr[$i])
						$num_roms_without_art = $num_roms_without_art + 1
						GUICtrlSetData($scrape_auto_join_rom_files_label, $num_roms_without_art & " Files")
					EndIf
				Next

				_GUICtrlListBox_EndUpdate($scrape_auto_join_rom_list)
			EndIf

		Case $scrape_auto_join_upload_button

			GUICtrlSetState($scrape_auto_join_art_list, $GUI_DISABLE)
			GUICtrlSetState($scrape_auto_join_rom_list, $GUI_DISABLE)
			GUICtrlSetState($scrape_auto_join_upload_button, $GUI_DISABLE)

			Local $art_name = _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list))
			Local $rom_name = _GUICtrlListBox_GetText($scrape_auto_join_rom_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_rom_list))
			_PathSplit($rom_name, $sDrive1, $sDir1, $sFileName1, $sExtension1)
			Local $old_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $art_name & "-full-cover.jpg"
			Local $new_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $sFileName1 & "-full-cover.jpg"
			Local $new_art_compressed_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $sFileName1 & "-full-cover-compressed.jpg"

			; rename the art filename to match the rom filename

			if StringCompare($art_name, $sFileName1) <> 0 Then

				Local $curr_index = _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)
				_GUICtrlListBox_ReplaceString($scrape_auto_join_art_list, $curr_index, $sFileName1)
				_GUICtrlListBox_SetCurSel($scrape_auto_join_art_list, $curr_index)
				FileMove($old_art_path, $new_art_path, 1)
			EndIf

			; compress
			ShellExecuteWait("magick.exe", "-quality 80% """ & $new_art_path & """ -resize ""1920x1080>"" """ & $new_art_compressed_path & """", $ImageMagick_path, "", @SW_HIDE)

			Local $filesize = FileGetSize($new_art_path)
			Local $filesize_compressed = FileGetSize($new_art_compressed_path)
			local $compression_ratio = int(($filesize_compressed / $filesize) * 100)

			if $compression_ratio >= 80 Then

				FileDelete($new_art_compressed_path)
			Else

				FileMove($new_art_compressed_path, $new_art_path, 1)
			EndIf

			; upload the joined art to the RetroPie
			;	it's assumed the WinSCP connection is still open from the Refresh button above

			Local $msg2 = "Copying to the RetroPie - " & $sFileName1 & "-full-cover.jpg ..."
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $msg2 = ' & $msg2 & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			GUICtrlSetData($status_input, $msg2)
			ConsoleWrite("Putting file """ & $new_art_path & """ to ""/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $sFileName1 & "-full-cover.jpg""" & @CRLF)
			$result = _WinSCP_PutFiles($new_art_path, "/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $sFileName1 & "-full-cover.jpg")

			if $result = False Then

				GUICtrlSetData($status_input, $_WinSCP_COM_error_description)
			Else

				Local $art_list_selected_index = _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)
				Local $rom_list_selected_index = _GUICtrlListBox_GetCurSel($scrape_auto_join_rom_list)

				if GUICtrlRead($scrape_auto_join_exclude_uploaded_art_checkbox) = $GUI_CHECKED Then

					_GUICtrlListBox_DeleteString($scrape_auto_join_art_list, $art_list_selected_index)
				EndIf

				_GUICtrlListBox_DeleteString($scrape_auto_join_rom_list, $rom_list_selected_index)
				_GUICtrlListBox_ClickItem($scrape_auto_join_art_list, $art_list_selected_index)

				if GUICtrlRead($scrape_auto_join_match_roms_to_art_radio) = $GUI_CHECKED Then

					GUICtrlSetState($scrape_auto_join_rom_list, $GUI_ENABLE)
					_GUICtrlListBox_ClickItem($scrape_auto_join_rom_list, $rom_list_selected_index)
				EndIf


			EndIf

			GUICtrlSetData($status_input, "")
			GUICtrlSetState($scrape_auto_join_art_list, $GUI_ENABLE)
			GUICtrlSetState($scrape_auto_join_rom_list, $GUI_ENABLE)
			GUICtrlSetState($scrape_auto_join_upload_button, $GUI_ENABLE)


		Case $scrape_auto_join_upload_gamelist_button

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $gameslist_gui)
			$current_gui = $gameslist_gui

			$result = CreateGamelist()

			GUICtrlSetData($gameslist_edit, $result)
			GUICtrlSetData($gameslist_status_input, "")


		case $scrape_auto_join_rotate_art_button

			GUISetState(@SW_DISABLE, $main_gui)

			; recreate the GUI so scrollbars can be recreated to suit the size of the image

			GUICtrlDelete($art_big_pic3)
			GUIDelete($art_gui3)
			$art_gui3 = GUICreate("Child", 1024, 576, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
			$art_big_pic3 = GUICtrlCreatePic("", 0, 0, 1024, 576) ;, 0, 0)

			$hImage =  _GDIPlus_ImageLoadFromFile($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)) & "-full-cover.jpg")
			$art_big_pic3_width = _GDIPlus_ImageGetWidth($hImage)
			$art_big_pic3_height = _GDIPlus_ImageGetHeight($hImage)
			_GDIPlus_ImageDispose($hImage)

			GUICtrlSetPos($art_big_pic3, 0, 0, $art_big_pic3_width, $art_big_pic3_height)
			GUICtrlSetImage($art_big_pic3, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)) & "-full-cover.jpg")
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)) & "-full-cover.jpg" = ' & $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)) & "-full-cover.jpg" & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			GUISetState(@SW_SHOW, $art_gui3)
			$current_gui = $art_gui3

			; reset scrollbars in GUIScrollBars_Ex

			ReDim $__g_aSB_WindowInfo[1][10]
			$__g_aSB_WindowInfo[0][0] = 0
			$__g_aSB_WindowInfo[0][1] = 0
			$__g_aSB_WindowInfo[0][2] = 0
			$__g_aSB_WindowInfo[0][3] = 0
			$__g_aSB_WindowInfo[0][4] = -1
			$__g_aSB_WindowInfo[0][5] = 0
			$__g_aSB_WindowInfo[0][6] = 0
			$__g_aSB_WindowInfo[0][7] = 0
			$__g_aSB_WindowInfo[0][8] = 0
			$__g_aSB_WindowInfo[0][9] = 0

			redim $__g_aSB_WindowInfoEx[1][9]
			$__g_aSB_WindowInfoEx[0][0] = 0
			$__g_aSB_WindowInfoEx[0][1] = 0
			$__g_aSB_WindowInfoEx[0][2] = 0
			$__g_aSB_WindowInfoEx[0][3] = 0
			$__g_aSB_WindowInfoEx[0][4] = 0
			$__g_aSB_WindowInfoEx[0][5] = 0
			$__g_aSB_WindowInfoEx[0][6] = 0
			$__g_aSB_WindowInfoEx[0][7] = 0
			$__g_aSB_WindowInfoEx[0][8] = 0

			; Create the scrollbars in the child
			_GUIScrollbars_Generate($art_gui3, $art_big_pic3_width, $art_big_pic3_height)

			; Now we get the scrollbar factors to determine how each of them moves
			$aFactors = _Get_Factors($art_gui3)

			; calculate the number of pages (additional to the first) that it will take to scroll to the halfway point
			Local $pcnt_of_image_visible = 1024 / $art_big_pic3_width
			Local $pcnt_of_image_not_visible = 1 - $pcnt_of_image_visible
			Local $pcnt_to_scroll_to_halfway = $pcnt_of_image_not_visible / 2
			Local $additional_pages_to_scroll_to_halfway = $pcnt_to_scroll_to_halfway / $pcnt_of_image_visible

			; scroll to the halfway point
			_GUIScrollbars_Scroll_Page($art_gui3, 1 + $additional_pages_to_scroll_to_halfway, 0)

		case $scrape_auto_join_art_1_pic



			GUICtrlSetSizeAndImage($art_big_pic2, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)) & "-full-cover.jpg", 1024, -1, True, True)
			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui2)
			$current_gui = $art_gui2


		Case $gameslist_save_button

			Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"

			if FileExists($gamelist_filepath) = True Then

				FileDelete($gamelist_filepath)
			EndIf

			$xml = StringReplace(GUICtrlRead($gameslist_edit), @CRLF, @LF)			; unix end of line characters
			FileWrite($gamelist_filepath, $xml)

			Local $msg2 = "Saving """ & $gamelist_filepath & """ to ""/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml"""
			ConsoleWrite($msg2 & @CRLF)
			GUICtrlSetData($gameslist_status_input, $msg2)
			pscp_upload($gamelist_filepath, "/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
			GUICtrlSetData($gameslist_status_input, "Saved """ & $gamelist_filepath & """ to the RetroPie")

			if GUICtrlRead($gameslist_restart_emulationstation_checkbox) = $GUI_CHECKED Then

				GUICtrlSetData($gameslist_status_input, "Restarting EmulationStation ...")
				plink("sudo touch /tmp/es-restart")
				plink("sudo pkill -f \""/opt/retropie/supplementary/.*/emulationstation([^.]|$)\""")
				GUICtrlSetData($gameslist_status_input, "")
			EndIf

			GUISetState(@SW_ENABLE, $main_gui)
			GUISetState(@SW_HIDE, $current_gui)
			$current_gui = $main_gui



		case $art_big_pic3

			; Where is the cursor on the child?
			Local $a = GUIGetCursorInfo($art_gui3)

			; Add the amount the image has been scrolled (pixels = scroll units * relevant factor)
			$iX = $a[0] + _GUIScrollBars_GetScrollInfoPos($art_gui3, $SB_HORZ) * $aFactors[0]
			;$iY = $a[1] + _GUIScrollBars_GetScrollInfoPos($art_gui3, $SB_VERT) * $aFactors[1]

			$new_art_max_height = _Max($iX, $art_big_pic3_width - $iX)

			Local $art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)) & "-full-cover.jpg"
			Local $left_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)) & "-full-cover-left.jpg"
			Local $right_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)) & "-full-cover-right.jpg"
			Local $original_art_path = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)) & "-full-cover-orig.jpg"

			; backup the original
			FileCopy($art_path, $original_art_path, 1)

			; extract the left (back) art and rotate clockwise 90 degrees
			ShellExecuteWait("magick.exe", " -extract " & $iX & "x+0 """ & $art_path & """ -rotate 90 """ & $left_art_path & """", $ImageMagick_path, "", @SW_HIDE)

			; extract the right (front) art and rotate anti-clockwise 90 degress
			ShellExecuteWait("magick.exe", " -extract 0x+" & $iX & " """ & $art_path & """ -rotate -90 """ & $right_art_path & """", $ImageMagick_path, "", @SW_HIDE)

			; join together
			ShellExecuteWait("magick.exe", """" & $left_art_path & """ """ & $right_art_path & """ -resize x" & $new_art_max_height & " +append """ & $art_path & """", $ImageMagick_path, "", @SW_HIDE)

			FileDelete($left_art_path)
			FileDelete($right_art_path)

			GUICtrlSetImage($scrape_auto_join_art_1_pic, $art_path)

			GUISetState(@SW_HIDE, $current_gui)
			GUISetState(@SW_ENABLE, $main_gui)
			GUISetState(@SW_SHOWNORMAL, $main_gui)
			$current_gui = $main_gui

			if _GUICtrlTab_GetCurSel($tab) = 0 Then

				_GUICtrlListBox_ClickItem($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list))
			EndIf




	EndSwitch

EndFunc



Func Scrape_Images_with_Auto_Join_tab_WM_NOTIFY_handler($hWndFrom, $iCode)

	Switch $hWndFrom


		Case GUICtrlGetHandle($max_scrapers_slider)

			Switch $iCode
				Case $NM_RELEASEDCAPTURE ; The control is releasing mouse capture


					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $NM_RELEASEDCAPTURE = ' & $NM_RELEASEDCAPTURE & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			EndSwitch


	EndSwitch

EndFunc

Func Scrape_Images_with_Auto_Join_tab_WM_COMMAND_handler($hWndFrom, $iCode)


    Switch $hWndFrom

        Case GUICtrlGetHandle($scrape_auto_join_art_list)

			Switch $iCode

                Case $LBN_SELCHANGE ; Sent when the user cancels the selection in a list box

					Local $art_name = _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list))

					if GUICtrlRead($scrape_auto_join_match_art_to_roms_radio) = $GUI_CHECKED Then

						Local $selected_index = 0

						for $i = 1 to StringLen($art_name)

							Local $rom_name_search_text = StringLeft($art_name, $i)
							$result = _GUICtrlListBox_SelectString($scrape_auto_join_rom_list, $rom_name_search_text)

							if $result < 0 Then

								ExitLoop
							EndIf

							$selected_index = $result
						Next

						_GUICtrlListBox_SetTopIndex($scrape_auto_join_rom_list, $selected_index - 11)
					EndIf

					if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $art_name & "-full-cover.jpg") = True Then

						GUICtrlSetState($scrape_auto_join_art_1_pic, $GUI_SHOW)
						GUICtrlSetSizeAndImage($scrape_auto_join_art_1_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $art_name & "-full-cover.jpg", -1, 120)
					Else

						GUICtrlSetState($scrape_auto_join_art_1_pic, $GUI_HIDE)
					EndIf
			EndSwitch



        Case GUICtrlGetHandle($scrape_auto_join_rom_list)

			Switch $iCode

                Case $LBN_SELCHANGE ; Sent when the user cancels the selection in a list box

					if GUICtrlRead($scrape_auto_join_match_roms_to_art_radio) = $GUI_CHECKED Then

						Local $rom_name = _GUICtrlListBox_GetText($scrape_auto_join_rom_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_rom_list))
						Local $selected_index = 0

						for $i = 1 to StringLen($rom_name)

							Local $art_name_search_text = StringLeft($rom_name, $i)
							$result = _GUICtrlListBox_SelectString($scrape_auto_join_art_list, $art_name_search_text)

							if $result < 0 Then

								ExitLoop
							EndIf

							$selected_index = $result
						Next

						_GUICtrlListBox_SetTopIndex($scrape_auto_join_art_list, $selected_index - 11)

						if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, $selected_index) & "-full-cover.jpg") = True Then

							GUICtrlSetState($scrape_auto_join_art_1_pic, $GUI_SHOW)
							GUICtrlSetImage($scrape_auto_join_art_1_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, $selected_index) & "-full-cover.jpg")
						Else

							GUICtrlSetState($scrape_auto_join_art_1_pic, $GUI_HIDE)
						EndIf
					EndIf
			EndSwitch





	EndSwitch

EndFunc


