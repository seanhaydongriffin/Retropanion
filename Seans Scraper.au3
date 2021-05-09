#include <AutoItConstants.au3>
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <File.au3>
#include <GuiComboBox.au3>
#include <Math.au3>
#include <GuiToolTip.au3>
#include <GuiListView.au3>

; Fuzzy match rom filenames to artwork from RF Generation

Local $app_name = "Seans Scraper"
;Local $emulator_folder_name = "snes"
;Local $download_path = "D:\dwn\Nintendo_SNES"
;Local $emulator_folder_name = "wonderswan"
;Local $download_path = "D:\dwn\Bandai_WonderSwan"
;Local $emulator_folder_name = "wonderswancolor"
;Local $download_path = "D:\dwn\Bandai_WonderSwan_Color_SwanCrystal"
;Local $emulator_folder_name = "ngpc"
;Local $download_path = "D:\dwn\SNK_Neo_Geo_Pocket_Color"
;Local $emulator_folder_name = "ngp"
;Local $download_path = "D:\dwn\SNK_Neo_Geo_Pocket"
;Local $emulator_folder_name = "gbc"
;Local $download_path = "D:\dwn\Nintendo_Game_Boy_Color"
;Local $emulator_folder_name = "n64"
;Local $download_path = "D:\dwn\Nintendo_64"
;Local $emulator_folder_name = "snes"
;Local $download_path = "D:\dwn\Nintendo_SNES_Super_Famicom"
;Local $emulator_folder_name = "gamegear"
;Local $download_path = "D:\dwn\Sega_Game_Gear"
;Local $emulator_folder_name = "atarilynx"
;Local $download_path = "D:\dwn\Atari_Lynx"
;Local $emulator_folder_name = "gb"
;Local $download_path = "D:\dwn\Nintendo_Game_Boy"
;Local $emulator_folder_name = "pcengine"
;Local $download_path = "D:\dwn\NEC_PC_Engine_TurboGrafx-16"
;Local $emulator_folder_name = "atari2600"
;Local $download_path = "D:\dwn\Atari_2600"

Global $download_path = "D:\dwn"

Global $download_path_dict = ObjCreate("Scripting.Dictionary")
$download_path_dict.Add("3DO", "3DO")
$download_path_dict.Add("Amstrad CPC 464", "")
$download_path_dict.Add("Apple II / Apple III", "")
$download_path_dict.Add("Atari 2600", "")
$download_path_dict.Add("Atari 5200", "")
$download_path_dict.Add("Atari 7800", "")
$download_path_dict.Add("Atari 8-bit Family", "")
$download_path_dict.Add("Atari Jaguar", "")
$download_path_dict.Add("Atari Lynx", "Atari_Lynx")
$download_path_dict.Add("Atari ST / TT / Falcon", "")
$download_path_dict.Add("Bandai WonderSwan", "Bandai_WonderSwan")
$download_path_dict.Add("Bandai WonderSwan Color / SwanCrystal", "Bandai_WonderSwan_Color_SwanCrystal")
$download_path_dict.Add("Coleco / CBS ColecoVision", "")
$download_path_dict.Add("Commodore 64 / 128", "")
$download_path_dict.Add("Commodore Amiga", "")
$download_path_dict.Add("Dragon 32 / 64", "")
$download_path_dict.Add("GCE Vectrex / Bandai Kousokusen", "")
$download_path_dict.Add("LaserDisc", "")
$download_path_dict.Add("Magnavox Odyssey^2 / VideoPac", "")
$download_path_dict.Add("Mattel Intellivision", "")
$download_path_dict.Add("NEC PC Engine / TurboGrafx-16", "NEC_PC_Engine_TurboGrafx")
$download_path_dict.Add("Nintendo 64", "Nintendo_64")
$download_path_dict.Add("Nintendo DS", "")
$download_path_dict.Add("Nintendo Famicom Disk System", "")
$download_path_dict.Add("Nintendo Game & Watch", "")
$download_path_dict.Add("Nintendo Game Boy", "Nintendo_Game_Boy")
$download_path_dict.Add("Nintendo Game Boy Advance", "")
$download_path_dict.Add("Nintendo Game Boy Color", "Nintendo_Game_Boy_Color")
$download_path_dict.Add("Nintendo GameCube", "")
$download_path_dict.Add("Nintendo NES / Famicom", "")
$download_path_dict.Add("Nintendo SNES / Super Famicom", "Nintendo_SNES_Super_Famicom")
$download_path_dict.Add("Sega 32X", "")
$download_path_dict.Add("Sega CD / Mega CD", "")
$download_path_dict.Add("Sega Dreamcast", "")
$download_path_dict.Add("Sega Game Gear", "Sega_Game_Gear")
$download_path_dict.Add("Sega Genesis / Mega Drive", "")
$download_path_dict.Add("Sega Saturn", "")
$download_path_dict.Add("Sega SG-1000 / SC-3000", "")
$download_path_dict.Add("SNK Neo Geo Pocket", "SNK_Neo_Geo_Pocket")
$download_path_dict.Add("SNK Neo Geo Pocket Color", "SNK_Neo_Geo_Pocket_Color")
$download_path_dict.Add("Sony PlayStation", "")
$download_path_dict.Add("Sony PlayStation 2", "")
$download_path_dict.Add("Sony PSP", "")




Local $ImageMagick_path = "C:\Program Files\ImageMagick-7.0.11-Q16-HDRI"
Local $sDrive = "", $sDir = "", $sFileName = "", $sExtension = ""
Local $sDrive1 = "", $sDir1 = "", $sFileName1 = "", $sExtension1 = ""
Local $sDrive2 = "", $sDir2 = "", $sFileName2 = "", $sExtension2 = ""
Local $alphanumeric_arr[36] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
;Local $alphanumeric_arr[13] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C"]
Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
Local $downloaded_images_path = "~/.emulationstation/downloaded_images/" ; & $emulator_folder_name
Local $roms_folder = "F:\RetroPie\home\pi\RetroPie\roms\" ; & $emulator_folder_name

; MAIN GUI

Local $main_gui = GUICreate($app_name, 800, 600)

Global $tooltip = _GUIToolTip_Create(0) ; default style tooltip
_GUIToolTip_SetMaxTipWidth($tooltip, 300)

GUICtrlCreateTab(5, 5, 790, 570)

Global $scrape_tabitem = GUICtrlCreateTabItem("Scrape")
;_GUIToolTip_AddTool($tooltip, 0, "Clears the list", GUICtrlGetHandle($scrape_tabitem))


;GUICtrlCreateGroup("Scraper", 10, 10, 300, 300)

Global $websites_label = GUICtrlCreateLabel("Website(s)", 20, 40, 70, 20)
_GUIToolTip_AddTool($tooltip, 0, "The website(s) to scrape the box art from", GUICtrlGetHandle($websites_label))
Global $rf_generation_checkbox = GUICtrlCreateCheckbox("RF Generation", 90, 40, 85, 20)
_GUIToolTip_AddTool($tooltip, 0, "If checked then box art will be scraped from the RF Generation website", GUICtrlGetHandle($rf_generation_checkbox))
Global $moby_games_checkbox = GUICtrlCreateCheckbox("Moby Games", 180, 40, 80, 20)
_GUIToolTip_AddTool($tooltip, 0, "If checked then box art will be scraped from the Moby Games website", GUICtrlGetHandle($moby_games_checkbox))
Global $cover_project_checkbox = GUICtrlCreateCheckbox("Cover Project", 270, 40, 80, 20)
GUICtrlSetState(-1, $GUI_CHECKED)
_GUIToolTip_AddTool($tooltip, 0, "If checked then box art will be scraped from the Cover Project website", GUICtrlGetHandle($cover_project_checkbox))

Global $system_label = GUICtrlCreateLabel("System", 20, 70, 80, 20)
_GUIToolTip_AddTool($tooltip, 0, "The system to scrape the box art for", GUICtrlGetHandle($system_label))
Local $system_combo = GUICtrlCreateCombo("", 90, 70, 250, 20, $CBS_DROPDOWNLIST)
_GUICtrlComboBox_AddString($system_combo, "3DO")
_GUICtrlComboBox_AddString($system_combo, "Amstrad CPC 464")
_GUICtrlComboBox_AddString($system_combo, "Apple II / Apple III")
_GUICtrlComboBox_AddString($system_combo, "Atari 2600")
_GUICtrlComboBox_AddString($system_combo, "Atari 5200")
_GUICtrlComboBox_AddString($system_combo, "Atari 7800")
_GUICtrlComboBox_AddString($system_combo, "Atari 8-bit Family")
_GUICtrlComboBox_AddString($system_combo, "Atari Jaguar")
_GUICtrlComboBox_AddString($system_combo, "Atari Lynx")
_GUICtrlComboBox_AddString($system_combo, "Atari ST / TT / Falcon")
_GUICtrlComboBox_AddString($system_combo, "Bandai WonderSwan")
_GUICtrlComboBox_AddString($system_combo, "Bandai WonderSwan Color / SwanCrystal")
_GUICtrlComboBox_AddString($system_combo, "Coleco / CBS ColecoVision")
_GUICtrlComboBox_AddString($system_combo, "Commodore 64 / 128")
_GUICtrlComboBox_AddString($system_combo, "Commodore Amiga")
_GUICtrlComboBox_AddString($system_combo, "Dragon 32 / 64")
_GUICtrlComboBox_AddString($system_combo, "GCE Vectrex / Bandai Kousokusen")
_GUICtrlComboBox_AddString($system_combo, "LaserDisc")
_GUICtrlComboBox_AddString($system_combo, "Magnavox Odyssey^2 / VideoPac")
_GUICtrlComboBox_AddString($system_combo, "Mattel Intellivision")
_GUICtrlComboBox_AddString($system_combo, "NEC PC Engine / TurboGrafx-16")
_GUICtrlComboBox_AddString($system_combo, "Nintendo 64")
_GUICtrlComboBox_AddString($system_combo, "Nintendo DS")
_GUICtrlComboBox_AddString($system_combo, "Nintendo Famicom Disk System")
_GUICtrlComboBox_AddString($system_combo, "Nintendo Game & Watch")
_GUICtrlComboBox_AddString($system_combo, "Nintendo Game Boy")
_GUICtrlComboBox_AddString($system_combo, "Nintendo Game Boy Advance")
_GUICtrlComboBox_AddString($system_combo, "Nintendo Game Boy Color")
_GUICtrlComboBox_AddString($system_combo, "Nintendo GameCube")
_GUICtrlComboBox_AddString($system_combo, "Nintendo NES / Famicom")
_GUICtrlComboBox_AddString($system_combo, "Nintendo SNES / Super Famicom")
_GUICtrlComboBox_AddString($system_combo, "Sega 32X")
_GUICtrlComboBox_AddString($system_combo, "Sega CD / Mega CD")
_GUICtrlComboBox_AddString($system_combo, "Sega Dreamcast")
_GUICtrlComboBox_AddString($system_combo, "Sega Game Gear")
_GUICtrlComboBox_AddString($system_combo, "Sega Genesis / Mega Drive")
_GUICtrlComboBox_AddString($system_combo, "Sega Saturn")
_GUICtrlComboBox_AddString($system_combo, "Sega SG-1000 / SC-3000")
_GUICtrlComboBox_AddString($system_combo, "SNK Neo Geo Pocket")
_GUICtrlComboBox_AddString($system_combo, "SNK Neo Geo Pocket Color")
_GUICtrlComboBox_AddString($system_combo, "Sony PlayStation")
_GUICtrlComboBox_AddString($system_combo, "Sony PlayStation 2")
_GUICtrlComboBox_AddString($system_combo, "Sony PSP")
_GUICtrlComboBox_SetCurSel($system_combo, 0)

Global $max_scrapers_label = GUICtrlCreateLabel("Max Scrapers", 20, 100, 80, 20)
_GUIToolTip_AddTool($tooltip, 0, "The maximum number of scrapers that will run in parallel", GUICtrlGetHandle($max_scrapers_label))
Global $max_scrapers_input = GUICtrlCreateInput("10", 90, 100, 30, 20)
Global $max_scrapers_slider = GUICtrlCreateSlider(130, 100, 200, 20)
GUICtrlSetLimit(-1, 10, 1)
GUICtrlSetData(-1, 10)
Global $minimized_scrapers_checkbox = GUICtrlCreateCheckbox("Minimized Scrapers", 20, 130, 120, 20)
_GUIToolTip_AddTool($tooltip, 0, "If checked then run each scraper in a minimized window", GUICtrlGetHandle($minimized_scrapers_checkbox))
GUICtrlSetState(-1, $GUI_CHECKED)

Local $scrape_button = GUICtrlCreateButton("Scrape", 20, 160, 80, 20)
_GUIToolTip_AddTool($tooltip, 0, _
	"Scrapes box art according to the selections above." & @CRLF & _
	@CRLF & _
	"Front Covers will be stored in the Box folder." & @CRLF  & _
	"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
	"Full Covers will be stored in the BoxFull folder." & @CRLF _
	, GUICtrlGetHandle($scrape_button))
;GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("Shrink")
Global $image_compression_quality_label = GUICtrlCreateLabel("Image Compression / Quality", 20, 40, 160, 20)
_GUIToolTip_AddTool($tooltip, 0, "The maximum level of compression / quality required", GUICtrlGetHandle($image_compression_quality_label))
Global $image_compression_quality_input = GUICtrlCreateInput("80", 190, 40, 30, 20)
GUICtrlCreateLabel("%", 225, 40, 20, 20)
Global $image_compression_quality_slider = GUICtrlCreateSlider(260, 40, 200, 20)
GUICtrlSetLimit(-1, 10, 1)
GUICtrlSetData(-1, 10)

Global $image_compression_listview = GUICtrlCreateListView("Filename|Original Size (KB)|Compressed Size (KB)|Ratio (%)", 20, 80, 760, 460)
_GUICtrlListView_SetColumnWidth(-1, 0, 300)
_GUICtrlListView_SetColumnWidth(-1, 1, 120)
_GUICtrlListView_SetColumnWidth(-1, 2, 120)
_GUICtrlListView_SetColumnWidth(-1, 2, 60)


;GUICtrlCreateGroup("Merger", 400, 5, 660, 560)
;$idTreeView = GUICtrlCreateTreeView(410, 20, 360, 540, $iStyle, $WS_EX_CLIENTEDGE)
Local $calculate_button = GUICtrlCreateButton("Calculate", 200, 540, 80, 20)
Local $proceed_button = GUICtrlCreateButton("Proceed", 300, 540, 80, 20)
Global $total_image_compression_files_label = GUICtrlCreateLabel("0 of 0 files", 650, 540, 120, 20)



;_GUIToolTip_AddTool($tooltip, 0, "Merges all scraped art into the Box_Full folder with -full-cover filename suffix.  Art in the Box and BoxBack folders will be merged into Box_Full.  Art in Box_Full will be renamed with a -full-cover filename suffix and optionally compressed.", GUICtrlGetHandle($merge_button))
;GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("Match")
$idTreeView = GUICtrlCreateTreeView(410, 20, 360, 540, $iStyle, $WS_EX_CLIENTEDGE)
Local $match_button = GUICtrlCreateButton("Match", 90, 570, 80, 20)


GUICtrlCreateTabItem("") ; end tabitem definition

Global $status_input = GUICtrlCreateInput("Hint - hover mouse over controls for help", 10, 600 - 25, 800 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)


GUISetState(@SW_SHOW)
GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
_TipDisplayLen(30000)


#cs
if FileExists($download_path & "\Box_Full") = False Then

	DirCreate($download_path & "\Box_Full")
EndIf


if FileExists(@ScriptDir & "\" & $app_name & ".txt") = True Then

	; load the tree

	Local $tree_file_arr
	_FileReadToArray(@ScriptDir & "\" & $app_name & ".txt", $tree_file_arr, 0)
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

	Switch $msg

		Case $GUI_EVENT_CLOSE

			; save the tree

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

			FileDelete(@ScriptDir & "\" & $app_name & ".txt")
			FileWrite(@ScriptDir & "\" & $app_name & ".txt", $tree_file_str)

			GUIDelete($main_gui)
			ExitLoop

		Case $scrape_button

			Local $system_name
			Local $scraper_exe

			if GUICtrlRead($rf_generation_checkbox) = $GUI_CHECKED Then

				$system_name = "RF Generation"
				$scraper_exe = "Seans RF Generation Scraper.exe"
			endif

			if GUICtrlRead($moby_games_checkbox) = $GUI_CHECKED Then

				$system_name = "Moby Games"
				$scraper_exe = "Seans Moby Games Scraper.exe"
			endif

			if GUICtrlRead($cover_project_checkbox) = $GUI_CHECKED Then

				$system_name = "The Cover Project"
				$scraper_exe = "Seans Cover Project Scraper.exe"
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


		Case $match_button

			; scrape the tree

			_GUICtrlTreeView_DeleteAll($idTreeView)

			for $k = 0 to (UBound($alphanumeric_arr) - 1)

				Local $roms_arr = _FileListToArrayRec($roms_folder, $alphanumeric_arr[$k] & "*.*", 1, 0, 1)
				_ArrayDelete($roms_arr, 0)
				Local $art_arr = _FileListToArrayRec($download_path & "\Box", $alphanumeric_arr[$k] & "*", 1, 0, 1)
				_ArrayDelete($art_arr, 0)

				Local $tree_first_item = Null

				for $i = 0 to (UBound($roms_arr) - 1)

					_PathSplit($roms_arr[$i], $sDrive1, $sDir1, $sFileName1, $sExtension1)

					if StringCompare($sExtension1, ".state") <> 0 Then

						Local $sFileName1_cleaned = $sFileName1
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(World)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(USA)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(USA, Australia)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(USA, Europe)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(Europe)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(Japan)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(Germany)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(Spain)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(Japan, Europe)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(Demo)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(Proto)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(En,De)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(En,Es,It)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(En,Ja)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(En,Fr,De)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(En,Fr,It)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(En,Fr,De,Es,It,Nl)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(En,Fr,De,Es,Nl)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(En,Sv,No,Da,Fi)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, "(Fr,De,Nl)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " (J)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " [M][!]", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " [M][f1]", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " [M][o1]", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " [M][o1][f1]", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " [M]", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " (PD)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " (Rev A)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " (Rev B)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " (Rev 1)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " (Rev 2)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " (SGB Enhanced)", "")
						$sFileName1_cleaned = StringReplace($sFileName1_cleaned, " (Rumble Version)", "")
						$sFileName1_cleaned = StringStripWS($sFileName1_cleaned, 3)

						ConsoleWrite("rom " & $sFileName1_cleaned & @CRLF)
						Local $tree_parent_item = _GUICtrlTreeView_Add($idTreeView, 0, $sFileName1)
				;		$tree_file_str = $tree_file_str & $sFileName1 & @CRLF

						if $tree_first_item = Null Then

							$tree_first_item = $tree_parent_item
						EndIf

						Local $similarity_arr[0]

						for $j = 0 to (UBound($art_arr) - 1)

							_PathSplit($art_arr[$j], $sDrive2, $sDir2, $sFileName2, $sExtension2)

							Local $similarity = _Typos($sFileName1_cleaned, $sFileName2)
							;ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $sFileName1_cleaned = ' & $sFileName1_cleaned & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
							;ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $sFileName2 = ' & $sFileName2 & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
							;ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $similarity = ' & $similarity & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

							if $similarity <= 0 Then

								ReDim $similarity_arr[0]
								_ArrayAdd($similarity_arr, StringFormat("%.2d", $similarity) & "|" & $sFileName2, 0, chr(28))
								ExitLoop
							EndIf

							if $similarity <= 10 Then

								_ArrayAdd($similarity_arr, StringFormat ( "%.2d" , $similarity ) & "|" & $sFileName2, 0, chr(28))
								;_ArrayDisplay($similarity_arr)

								;ConsoleWrite("   " & $similarity & "|" & $sFileName2 & @CRLF)
							EndIf

						Next

						_ArraySort($similarity_arr)
						;_ArrayDisplay($similarity_arr)

						for $j = 0 to (UBound($similarity_arr) - 1)

							Local $similarity_part = StringSplit($similarity_arr[$j], "|", 2)
							;ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $similarity_arr[$j] = ' & $similarity_arr[$j] & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
							Local $treeview_child_item = _GUICtrlTreeView_AddChild($idTreeView, $tree_parent_item, $similarity_part[1])
				;			$tree_file_str = $tree_file_str & "	" & $similarity_part[1]

							if Number($similarity_part[0]) = 0 Then

								_GUICtrlTreeView_SetChecked($idTreeView, $treeview_child_item)
				;				$tree_file_str = $tree_file_str & "	GUI_CHECKED"
				;			Else

				;				$tree_file_str = $tree_file_str & "	GUI_UNCHECKED"
							EndIf

				;			$tree_file_str = $tree_file_str & @CRLF

						Next

						_GUICtrlTreeView_Expand($idTreeView, $tree_parent_item)
					EndIf
				Next
			Next



		Case $proceed_button

			for $i = 0 to (_GUICtrlListView_GetItemCount ($image_compression_listview) - 1)

				Local $compressed_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full_Compressed\" & _GUICtrlListView_GetItemText($image_compression_listview, $i)
				Local $original_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListView_GetItemText($image_compression_listview, $i)

				local $result = FileCopy($compressed_filepath, $original_filepath, 9)

				if $result = 1 Then

					FileDelete($compressed_filepath)
				EndIf

			Next

			_GUICtrlListView_BeginUpdate($image_compression_listview)
			_GUICtrlListView_DeleteAllItems($image_compression_listview)
			_GUICtrlListView_EndUpdate($image_compression_listview)




		Case $calculate_button


			if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full_Compressed") = False Then

				DirCreate($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full_Compressed")
			EndIf

			Local $arr = _FileListToArrayRec($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full", "*.jpg", 1, 0, 1)

			_GUICtrlListView_BeginUpdate($image_compression_listview)
			_GUICtrlListView_DeleteAllItems($image_compression_listview)
			_GUICtrlListView_EndUpdate($image_compression_listview)

			GUICtrlSetData($total_image_compression_files_label, "0 of " & $arr[0] & " files")
			FileDelete($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full_Compressed\*.*")

			for $i = 1 to $arr[0]

;				$rr = "-quality 80% """ & $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $arr[$i] & """ """ & $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full_Compressed\" & $arr[$i] & """"
;				ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $rr = ' & $rr & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console


				ShellExecuteWait("magick.exe", "-quality 80% """ & $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $arr[$i] & """ """ & $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full_Compressed\" & $arr[$i] & """", $ImageMagick_path, "", @SW_HIDE)

				Local $filesize = FileGetSize($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $arr[$i])
				Local $filesize_compressed = FileGetSize($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full_Compressed\" & $arr[$i])
				local $compression_ratio = int(($filesize_compressed / $filesize) * 100)

				if $compression_ratio >= 80 Then

					FileDelete($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full_Compressed\" & $arr[$i])
				Else

					GUICtrlCreateListViewItem($arr[$i] & "|" & int($filesize / 1024) & "|" & int($filesize_compressed / 1024) & "|" & $compression_ratio, $image_compression_listview)
				EndIf

				GUICtrlSetData($total_image_compression_files_label, $i & " of " & $arr[0] & " files")


			Next

;			_GUICtrlListView_EndUpdate($image_compression_listview)



#cs


			Exit


			Local $tree_item = _GUICtrlTreeView_GetFirstItem($idTreeView)

			While $tree_item <> 0

				if _GUICtrlTreeView_Level($idTreeView, $tree_item) > 0 and _GUICtrlTreeView_GetChecked($idTreeView, $tree_item) = True Then

					local $scraped_name = _GUICtrlTreeView_GetText($idTreeView, $tree_item)
					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $scraped_name = ' & $scraped_name & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
					local $rom_name = _GUICtrlTreeView_GetText($idTreeView, _GUICtrlTreeView_GetParentHandle($idTreeView, $tree_item))
					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $rom_name = ' & $rom_name & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

					ShellExecuteWait("magick.exe", """" & $download_path & "\BoxBack\" & $scraped_name & ".jpg"" """ & $download_path & "\Box\" & $scraped_name & ".jpg"" +append """ & $download_path & "\Box_Full\" & $rom_name & "-full-cover.jpg""", $ImageMagick_path, "", @SW_HIDE)

				EndIf

				$tree_item = _GUICtrlTreeView_GetNext($idTreeView, $tree_item)

			WEnd


			; Create gamelist.xml


			Local $arr = _FileListToArray($roms_folder)
			_ArrayDelete($arr, 0)
			_ArraySort($arr)

			Local $xml = ""
			$xml = $xml & "<?xml version=""1.0""?>" & @CRLF
			$xml = $xml & "<gameList>" & @CRLF

			for $i = 0 to (UBound($arr) - 1)

				_PathSplit($arr[$i], $sDrive, $sDir, $sFileName, $sExtension)

				if StringCompare($sExtension, ".state") <> 0 Then

			;		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $arr[$i] = ' & $arr[$i] & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

					$xml = $xml & "	<game>" & @CRLF
					$xml = $xml & "		<path>./" & $sFileName & $sExtension & "</path>" & @CRLF
					$xml = $xml & "		<name>" & $sFileName & "</name>" & @CRLF
					$xml = $xml & "		<image>" & $downloaded_images_path & "/" & $sFileName & "-full-cover.jpg</image>" & @CRLF
					$xml = $xml & "	</game>" & @CRLF
				EndIf
			Next

			$xml = $xml & "</gameList>" & @CRLF

			if FileExists($download_path & "\gamelist.xml") = True Then

				FileDelete($download_path & "\gamelist.xml")
			EndIf

			FileWrite($download_path & "\gamelist.xml", $xml)

;			ConsoleWrite("Manually copy " & $download_path & "\Box_Full\*.jpg to /opt/retropie/configs/all/emulationstation/downloaded_images/" & $emulator_folder_name & @CRLF)
;			ConsoleWrite("Manually copy " & $download_path & "\gamelist.xml to /opt/retropie/configs/all/emulationstation/gamelists/" & $emulator_folder_name & @CRLF)



			Exit
			#ce

	EndSwitch
WEnd







; Computes the number of typos (Damerau-Levenshtein distance) between two short strings.
; Four types of differences are counted:
;       insertion of a character,     abcd     ab#cd
;       deletion of a character,      abcd     acd
;       exchange of a character       abcd     ab$d
;       inversion of adjacent chars   abcd     acbd
;
; This function does NOT satisfy the so-called "triangle inequality", which means
; more simply that it makes NO attempt to compute the MINIMUM edit distance in all
; cases.  If you need that, you should use more complex algorithms.
;
; This simple function allows a fuzzy compare for e.g. recovering from typical
; human typos in short strings like names, address, cities... while getting rid of
; minor scripting differences.
;
; Strings are lowercased.
; String $st2 can be used as a pattern similar to the SQL 'LIKE' operator:
; '_' and trailing '%' act as in LIKE. These wildcards can be passed as parameters
; but these should contain exactly one character for the function to work properly.
;
; Complexity is in O(n^2) so don't use with long strings!
;
Func _Typos(Const $st1, Const $st2, $anychar = '_', $anytail = '%')
	Local $s1, $s2, $pen, $del, $ins, $subst
	If Not IsString($st1) Then Return SetError(-1, -1, -1)
	If Not IsString($st2) Then Return SetError(-2, -2, -1)
	If $st2 = '' Then Return StringLen($st1)
	If $st2 == $anytail Then Return 0
	If $st1 = '' Then
		Return(StringInStr($st2 & $anytail, $anytail, 1) - 1)
	EndIf
;~ 	$s1 = StringSplit(_LowerUnaccent($st1)), "", 2)		;; _LowerUnaccent() addon function not available here
;~ 	$s2 = StringSplit(_LowerUnaccent($st2)), "", 2)		;; _LowerUnaccent() addon function not available here
	$s1 = StringSplit(StringLower($st1), "", 2)
	$s2 = StringSplit(StringLower($st2), "", 2)
	Local $l1 = UBound($s1), $l2 = UBound($s2)
	Local $r[$l1 + 1][$l2 + 1]
	For $x = 0 To $l2 - 1
		Switch $s2[$x]
			Case $anychar
				If $x < $l1 Then
					$s2[$x] = $s1[$x]
				EndIf
			Case $anytail
				$l2 = $x
				If $l1 > $l2 Then
					$l1 = $l2
				EndIf
				ExitLoop
		EndSwitch
		$r[0][$x] = $x
	Next
	$r[0][$l2] = $l2
	For $x = 0 To $l1
		$r[$x][0] = $x
	Next
    For $x = 1 To $l1
        For $y = 1 To $l2
			$pen = Not ($s1[$x - 1] == $s2[$y - 1])
			$del = $r[$x-1][$y] + 1
			$ins = $r[$x][$y-1] + 1
			$subst = $r[$x-1][$y-1] + $pen
			If $del > $ins Then $del = $ins
			If $del > $subst Then $del = $subst
			$r[$x][$y] = $del
			If ($pen And $x > 1 And $y > 1 And $s1[$x-1] == $s2[$y-2] And $s1[$x-2] == $s2[$y-1]) Then
				If $r[$x][$y] >= $r[$x-2][$y-2] Then $r[$x][$y] = $r[$x-2][$y-2] + 1
				$r[$x-1][$y-1] = $r[$x][$y]
			EndIf
		Next
	Next
    Return ($r[$l1][$l2])
EndFunc


Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndSlider1, $hWndSlider2

	$hWndSlider1 = $max_scrapers_slider
	If Not IsHWnd($max_scrapers_slider) Then $hWndSlider1 = GUICtrlGetHandle($max_scrapers_slider)
	$hWndSlider2 = $image_compression_quality_slider
	If Not IsHWnd($image_compression_quality_slider) Then $hWndSlider2 = GUICtrlGetHandle($image_compression_quality_slider)

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom

		Case $hWndSlider1
			Switch $iCode
				Case $NM_RELEASEDCAPTURE ; The control is releasing mouse capture


					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $NM_RELEASEDCAPTURE = ' & $NM_RELEASEDCAPTURE & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			EndSwitch

		Case $hWndSlider2
			Switch $iCode
				Case $NM_RELEASEDCAPTURE ; The control is releasing mouse capture


					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $NM_RELEASEDCAPTURE = ' & $NM_RELEASEDCAPTURE & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console




			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _TipDisplayLen($time=5000)
    Local $tiphandles, $i
    $tiphandles=WinList('[CLASS:tooltips_class32]')
    for $i=1 to $tiphandles[0][0]
        If WinGetProcess($tiphandles[$i][1]) = @AutoItPID Then _SendMessage($tiphandles[$i][1],0x0403,2,$time)
    Next
EndFunc

