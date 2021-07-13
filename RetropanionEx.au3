
; #INCLUDES# =========================================================================================================
#include-once
#include <GUIConstants.au3>
#include <File.au3>
#include <GuiComboBox.au3>
#include <GuiToolTip.au3>
#include <GuiListView.au3>
#include <GuiListBox.au3>
#include <GuiTab.au3>
#include "WinSCP.au3"
#include <GDIPlus.au3>
#Include "_XMLDomWrapper2.au3"
#include <GuiRichEdit.au3>

;#include <AutoItConstants.au3>
;#include <GUIConstantsEx.au3>
;#include <GuiTreeView.au3>
;#include <GuiButton.au3>
;#include <MsgBoxConstants.au3>
;#include <WindowsConstants.au3>
;#include <Array.au3>
;#include <Math.au3>
;#include <IE.au3>
;#include "GUIScrollbars_Ex.au3"



; #GLOBAL VARIABLES# =================================================================================================

Global $app_name = "Retropanion"
Global $app_data_dir = @AppDataDir & "\" & $app_name
Global $ini_filename = $app_data_dir & "\" & $app_name & ".ini"
Global $log_filename = $app_data_dir & "\" & $app_name & ".log"

Global $download_path = "D:\dwn"

Global $download_path_dict = ObjCreate("Scripting.Dictionary")
$download_path_dict.Add("3DO", 										"3DO")
$download_path_dict.Add("Amstrad CPC 464", 							"Amstrad_CPC_464")
$download_path_dict.Add("Apple II / Apple III", 					"")
$download_path_dict.Add("Arcade", 									"Arcade")
$download_path_dict.Add("Atari 2600", 								"Atari_2600")
$download_path_dict.Add("Atari 5200", 								"Atari_5200")
$download_path_dict.Add("Atari 7800", 								"Atari_7800")
$download_path_dict.Add("Atari 8-bit Family", 						"Atari_8-bit_Family")
$download_path_dict.Add("Atari Jaguar", 							"Atari_Jaguar")
$download_path_dict.Add("Atari Lynx", 								"Atari_Lynx")
$download_path_dict.Add("Atari ST / TT / Falcon", 					"")
$download_path_dict.Add("Bandai WonderSwan", 						"Bandai_WonderSwan")
$download_path_dict.Add("Bandai WonderSwan Color / SwanCrystal", 	"Bandai_WonderSwan_Color_SwanCrystal")
$download_path_dict.Add("Coleco / CBS ColecoVision", 				"Coleco_CBS_ColecoVision")
$download_path_dict.Add("Commodore 64 / 128", 						"")
$download_path_dict.Add("Commodore Amiga", 							"Commodore_Amiga")
$download_path_dict.Add("Dragon 32 / 64", 							"")
$download_path_dict.Add("GCE Vectrex / Bandai Kousokusen", 			"")
$download_path_dict.Add("LaserDisc", 								"LaserDisc")
$download_path_dict.Add("Magnavox Odyssey^2 / VideoPac", 			"Magnavox_Odyssey^2_VideoPac")
$download_path_dict.Add("Mattel Intellivision", 					"Mattel_Intellivision")
$download_path_dict.Add("NEC PC Engine / TurboGrafx-16", 			"NEC_PC_Engine_TurboGrafx")
$download_path_dict.Add("Nintendo 64", 								"Nintendo_64")
$download_path_dict.Add("Nintendo DS", 								"Nintendo_DS")
$download_path_dict.Add("Nintendo Famicom Disk System", 			"Nintendo_Famicom_Disk_System")
$download_path_dict.Add("Nintendo Game & Watch", 					"")
$download_path_dict.Add("Nintendo Game Boy", 						"Nintendo_Game_Boy")
$download_path_dict.Add("Nintendo Game Boy Advance", 				"Nintendo_Game_Boy_Advance")
$download_path_dict.Add("Nintendo Game Boy Color", 					"Nintendo_Game_Boy_Color")
$download_path_dict.Add("Nintendo GameCube", 						"Nintendo_GameCube")
$download_path_dict.Add("Nintendo NES / Famicom", 					"Nintendo_NES_Famicom")
$download_path_dict.Add("Nintendo SNES / Super Famicom", 			"Nintendo_SNES_Super_Famicom")
$download_path_dict.Add("Sega 32X", 								"")
$download_path_dict.Add("Sega CD / Mega CD", 						"")
$download_path_dict.Add("Sega Dreamcast", 							"Sega_Dreamcast")
$download_path_dict.Add("Sega Game Gear", 							"Sega_Game_Gear")
$download_path_dict.Add("Sega Genesis / Mega Drive", 				"Sega_Genesis_Mega_Drive")
$download_path_dict.Add("Sega Saturn", 								"Sega_Saturn")
$download_path_dict.Add("Sega SG-1000 / SC-3000",					"")
$download_path_dict.Add("SNK Neo Geo Pocket", 						"SNK_Neo_Geo_Pocket")
$download_path_dict.Add("SNK Neo Geo Pocket Color", 				"SNK_Neo_Geo_Pocket_Color")
$download_path_dict.Add("Sony PlayStation", 						"Sony_PlayStation")
$download_path_dict.Add("Sony PlayStation 2", 						"")
$download_path_dict.Add("Sony PSP", 								"Sony_PSP")

Global $roms_path_dict = ObjCreate("Scripting.Dictionary")
$roms_path_dict.Add("3DO", 											"3do")
$roms_path_dict.Add("Amstrad CPC 464", 								"amstradcpc")
$roms_path_dict.Add("Apple II / Apple III", 						"apple2")
$roms_path_dict.Add("Arcade", 										"arcade")
$roms_path_dict.Add("Atari 2600", 									"atari2600")
$roms_path_dict.Add("Atari 5200", 									"atari5200")
$roms_path_dict.Add("Atari 7800", 									"atari7800")
$roms_path_dict.Add("Atari 8-bit Family", 							"atari800")
$roms_path_dict.Add("Atari Jaguar", 								"atarijaguar")
$roms_path_dict.Add("Atari Lynx", 									"atarilynx")
$roms_path_dict.Add("Atari ST / TT / Falcon", 						"atarist")
$roms_path_dict.Add("Bandai WonderSwan", 							"wonderswan")
$roms_path_dict.Add("Bandai WonderSwan Color / SwanCrystal", 		"wonderswancolor")
$roms_path_dict.Add("Coleco / CBS ColecoVision", 					"coleco")
$roms_path_dict.Add("Commodore 64 / 128", 							"c64")
$roms_path_dict.Add("Commodore Amiga", 								"amiga")
$roms_path_dict.Add("Dragon 32 / 64", 								"dragon32")
$roms_path_dict.Add("GCE Vectrex / Bandai Kousokusen", 				"vectrex")
$roms_path_dict.Add("LaserDisc", 									"daphne")
$roms_path_dict.Add("Magnavox Odyssey^2 / VideoPac", 				"videopac")
$roms_path_dict.Add("Mattel Intellivision", 						"intellivision")
$roms_path_dict.Add("NEC PC Engine / TurboGrafx-16", 				"pcengine")
$roms_path_dict.Add("Nintendo 64", 									"n64")
$roms_path_dict.Add("Nintendo DS", 									"nds")
$roms_path_dict.Add("Nintendo Famicom Disk System", 				"fds")
$roms_path_dict.Add("Nintendo Game & Watch", 						"gameandwatch")
$roms_path_dict.Add("Nintendo Game Boy", 							"gb")
$roms_path_dict.Add("Nintendo Game Boy Advance", 					"gba")
$roms_path_dict.Add("Nintendo Game Boy Color", 						"gbc")
$roms_path_dict.Add("Nintendo GameCube", 							"gc")
$roms_path_dict.Add("Nintendo NES / Famicom", 						"nes")
$roms_path_dict.Add("Nintendo SNES / Super Famicom", 				"snes")
$roms_path_dict.Add("Sega 32X", 									"sega32x")
$roms_path_dict.Add("Sega CD / Mega CD", 							"segacd")
$roms_path_dict.Add("Sega Dreamcast", 								"dreamcast")
$roms_path_dict.Add("Sega Game Gear", 								"gamegear")
$roms_path_dict.Add("Sega Genesis / Mega Drive", 					"megadrive")
$roms_path_dict.Add("Sega Saturn", 									"saturn")
$roms_path_dict.Add("Sega SG-1000 / SC-3000", 						"sg-1000")
$roms_path_dict.Add("SNK Neo Geo Pocket", 							"ngp")
$roms_path_dict.Add("SNK Neo Geo Pocket Color", 					"ngpc")
$roms_path_dict.Add("Sony PlayStation", 							"psx")
$roms_path_dict.Add("Sony PlayStation 2", 							"")
$roms_path_dict.Add("Sony PSP", 									"psp")

Global $local_path = "F:\RetroPie"
Global $ImageMagick_path = "C:\Program Files\ImageMagick-7.0.11-Q16-HDRI"
Global $sDrive = "", $sDir = "", $sFileName = "", $sExtension = ""
Global $sDrive1 = "", $sDir1 = "", $sFileName1 = "", $sExtension1 = ""
Global $sDrive2 = "", $sDir2 = "", $sFileName2 = "", $sExtension2 = ""
Global $alphanumeric_arr[36] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
;Global $alphanumeric_arr[13] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C"]
Global $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
Global $current_gui
Global $downloaded_images_path = "~/.emulationstation/downloaded_images"
Global $wiki_emulators_cfg_file_path = $app_data_dir & "\wiki_emulators.cfg"
Global $default_emulator
Global $all_roms_line_arr
Global $gamelist_xml_dom
Global $result = 1

; GUIs

; Main gui

Global $main_gui_width = 840
Global $main_gui_height = 720

Global $tooltip = _GUIToolTip_Create(0) ; default style tooltip
_GUIToolTip_SetMaxTipWidth($tooltip, 300)

Global $main_gui
Global $main_gui_first_control
Global $main_gui_last_control
Global $system_combo
Global $system_open_docs_page_button
Global $system_open_wiki_page_button

Global $display_device_name_combo

Global $emulationstation_restart_button
Global $emulationstation_quit_button

Global $retropie_reboot_button
Global $retropie_shutdown_button

; Tabs

Global $tab

; Settings tab

Global $image_compression_quality_label
Global $image_compression_quality_input
Global $image_compression_quality_slider

Global $retropie_hostname_label
Global $retropie_hostname_input
Global $retropie_username_label
Global $retropie_username_input
Global $retropie_password_label
Global $retropie_password_input
Global $retropie_ssh_key_label
Global $retropie_ssh_key_input
Global $minimized_scrapers_checkbox

Global $retropie_download_path_label
Global $retropie_download_path_input

; ROMs tab

Global $rebuild_roms_roms_list
Global $rebuild_roms_refresh_button
Global $rebuild_roms_rebuild_button

; Scrape Metadata tab

Global $scrape_metadata_websites_label
Global $scrape_metadata_website_combo
Global $scrape_metadata_minimized_scrapers_checkbox
Global $scrape_metadata_max_scrapers_label
Global $scrape_metadata_max_scrapers_input
Global $scrape_metadata_max_scrapers_slider
Global $scrape_metadata_scrape_button
Global $scrape_metadata_match_scraped_data_to_games_radio
Global $scrape_metadata_match_games_to_scraped_data_radio
Global $scrape_metadata_refresh_button
Global $scrape_metadata_scraped_data_label
Global $scrape_metadata_scraped_data_files_label
Global $scrape_metadata_scraped_data_list
Global $scrape_metadata_games_label
Global $scrape_metadata_games_files_label
Global $scrape_metadata_games_list
Global $scrape_metadata_release_date_checkbox
Global $scrape_metadata_developer_checkbox
Global $scrape_metadata_publisher_checkbox
Global $scrape_metadata_genre_checkbox
Global $scrape_metadata_players_checkbox
Global $scrape_metadata_listview
Global $scrape_metadata_imagelist
Global $scrape_metadata_update_gamelist_button
Global $scrape_metadata_upload_gamelist_button

; Scrape Images with Auto Join tab

Global $websites_label
Global $scrape_auto_join_website_combo
Global $scrape_auto_join_websites_label
Global $max_scrapers_label
Global $max_scrapers_input
Global $max_scrapers_slider
Global $minimized_scrapers_checkbox
Global $scrape_button
Global $scrape_auto_join_match_art_to_roms_radio
Global $scrape_auto_join_match_roms_to_art_radio
Global $scrape_auto_join_exclude_uploaded_art_checkbox
Global $scrape_auto_join_refresh_button
Global $scrape_auto_join_art_label
Global $scrape_auto_join_art_files_label
Global $scrape_auto_join_art_list
Global $scrape_auto_join_rom_label
Global $scrape_auto_join_rom_files_label
Global $scrape_auto_join_rom_list
Global $scrape_auto_join_upload_button
Global $scrape_auto_join_rotate_art_button
Global $scrape_auto_join_upload_gamelist_button
Global $scrape_auto_join_art_1_pic

; Scrape Images with Manual Join tab

Global $scrape_manual_join_websites_label
Global $scrape_manual_join_website_combo
Global $scrape_manual_join_minimized_scrapers_checkbox
Global $scrape_manual_join_max_scrapers_label
Global $scrape_manual_join_max_scrapers_input
Global $scrape_manual_join_max_scrapers_slider
Global $scrape_manual_join_scrape_button
Global $scrape_manual_join_match_art_to_roms_radio
Global $scrape_manual_join_match_roms_to_art_radio
Global $scrape_manual_join_exclude_uploaded_art_checkbox
Global $scrape_manual_join_refresh_button
Global $scrape_manual_join_art_label
Global $scrape_manual_join_art_list
Global $scrape_manual_join_rom_label
Global $scrape_manual_join_rom_list
Global $scrape_manual_join_upload_button
Global $scrape_manual_join_upload_gamelist_button
Global $scrape_manual_join_art_1_pic
Global $scrape_manual_join_art_2_pic
Global $scrape_manual_join_art_3_pic
Global $scrape_manual_join_art_4_pic
Global $scrape_manual_join_art_5_pic
Global $scrape_manual_join_down_button
Global $scrape_manual_join_up_button
Global $art_1_front
Global $art_2_front
Global $art_3_front
Global $art_4_front
Global $art_5_front
Global $art_1_back
Global $art_2_back
Global $art_3_back
Global $art_4_back
Global $art_5_back

; Config tab

Global $boot_config_x
Global $boot_config_y
Global $systems_list_config_x
Global $systems_list_config_y
Global $input_devices_config_x
Global $input_devices_config_y
Global $system_config_x
Global $system_config_y
Global $game_config_x
Global $game_config_y

Global $config_boot_edit_config_button
Global $config_edit_systems_list_button
;Global $display_device_name_label
;Global $display_device_name_combo
Global $display_device_add_button
Global $display_device_delete_button
Global $display_device_scan_modes_button
Global $display_label
Global $display_device_listview
Global $display_device_filename_arr
Global $config_joystick_0_test_button
Global $config_joystick_1_test_button
Global $config_emulators_games_group
;Global $config_display_device_label
;Global $config_display_device_combo
Global $config_emulators_games_reload_button
Global $config_emulators_label
Global $config_system_listview
Global $config_games_label
;Global $config_game_listview
Global $config_game_listview
Global $config_wiki_compare_button
Global $config_games_link_games_to_emulator_and_save_button
Global $config_games_launch_game_button
Global $config_games_update_emulator_and_save_game_before_launch_game_checkbox
Global $config_games_open_button
Global $config_games_save_as_button

; Backup tab

Global $backup_path_1_y
Global $backup_path_1_label
Global $backup_path_1_local_input
Global $backup_path_1_remote_input
Global $backup_path_1_filemask_input
Global $backup_path_1_include_checkbox
Global $backup_path_2_y
Global $backup_path_2_label
Global $backup_path_2_local_input
Global $backup_path_2_remote_input
Global $backup_path_2_filemask_input
Global $backup_path_2_include_checkbox
Global $backup_path_3_y
Global $backup_path_3_label
Global $backup_path_3_local_input
Global $backup_path_3_remote_input
Global $backup_path_3_filemask_input
Global $backup_path_3_include_checkbox
Global $backup_path_4_y
Global $backup_path_4_label
Global $backup_path_4_local_input
Global $backup_path_4_remote_input
Global $backup_path_4_filemask_input
Global $backup_path_4_include_checkbox
Global $backup_path_5_y
Global $backup_path_5_label
Global $backup_path_5_local_input
Global $backup_path_5_remote_input
Global $backup_path_5_filemask_input
Global $backup_path_5_include_checkbox
Global $backup_path_6_y
Global $backup_path_6_label
Global $backup_path_6_local_input
Global $backup_path_6_remote_input
Global $backup_path_6_filemask_input
Global $backup_path_6_include_checkbox
Global $backup_path_7_y
Global $backup_path_7_label
Global $backup_path_7_local_input
Global $backup_path_7_remote_input
Global $backup_path_7_filemask_input
Global $backup_path_7_include_checkbox
Global $backup_mirror_button

Global $status_input
Global $shift_up_dummy
Global $shift_down_dummy
Global $spinner1_gif
Global $spinner2_gif
Global $spinner200_gif_filename = "Spinner200.gif"

; Art gui

Global $art_gui
Global $art_big_pic
Global $art_dummy


; Art2 gui

Global $art_gui2
Global $art_big_pic2
Global $art2_dummy

; Art3 gui

Global $art_gui3
Global $art_big_pic3

; Gameslist gui

Global $gameslist_gui
Global $gameslist_load_button
Global $gameslist_save_button
Global $gameslist_restart_emulationstation_checkbox
Global $gameslist_open_button
Global $gameslist_save_as_button
Global $gameslist_edit
Global $gameslist_status_input

; Boot config gui

Global $boot_config_gui
Global $boot_config_load_button
Global $boot_config_save_button
Global $boot_config_open_button
Global $boot_config_save_as_button
Global $boot_config_edit
Global $boot_config_status_input

; Systems list gui

Global $systems_list_gui
Global $systems_list_load_button
Global $systems_list_save_button
Global $systems_list_open_button
Global $systems_list_save_as_button
Global $systems_list_edit
Global $systems_list_custom_order_list
Global $systems_list_custom_order_reorder_button
Global $systems_list_status_input

; Upload Game List to RetroPie gui

Global $upload_data_to_retropie_gui
Global $upload_data_to_retropie_upload_button
Global $upload_data_to_retropie_ie
Global $upload_data_to_retropie_status_input
Global $upload_data_to_retropie_dummy


; Compare Game List to Wiki page gui

Global $compare_games_to_wiki_gui
Global $compare_games_to_wiki_accept_button
Global $compare_games_to_wiki_ie
Global $compare_games_to_wiki_status_input
Global $compare_games_to_wiki_dummy


Global $art_big_pic3_width
Global $art_big_pic3_height
Global $aFactors



Func Retropanion_Startup()

	_GDIPlus_Startup()


	; Create the app data folder

	if FileExists($app_data_dir) = False Then

		DirCreate($app_data_dir)
	EndIf


	; Erase the log

	if FileExists($log_filename) = true Then

		FileDelete($log_filename)
	EndIf

EndFunc


Func Retropanion_Shutdown()

	_GDIPlus_ShutDown ()
EndFunc



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






Func _TipDisplayLen($time=5000)
    Local $tiphandles, $i
    $tiphandles=WinList('[CLASS:tooltips_class32]')
    for $i=1 to $tiphandles[0][0]
        If WinGetProcess($tiphandles[$i][1]) = @AutoItPID Then _SendMessage($tiphandles[$i][1],0x0403,2,$time)
    Next
EndFunc


Func CleanRomFilename($filename)

	$filename = StringReplace($filename, " [M][!]", "")
	$filename = StringReplace($filename, " [M][f1]", "")
	$filename = StringReplace($filename, " [M][o1]", "")
	$filename = StringReplace($filename, " [M][o1][f1]", "")
	$filename = StringReplace($filename, " [M]", "")

	$filename = StringRegExpReplace($filename, "\(.*" , "")

	$filename = StringReplace($filename, "-full-cover", "")
	$filename = StringStripWS($filename, 3)
	Return $filename


#cs
	$filename = StringReplace($filename, "(World)", "")
	$filename = StringReplace($filename, "(USA)", "")
	$filename = StringReplace($filename, "(USA, Australia)", "")
	$filename = StringReplace($filename, "(USA, Europe)", "")
	$filename = StringReplace($filename, "(Europe)", "")
	$filename = StringReplace($filename, "(Japan)", "")
	$filename = StringReplace($filename, "(Germany)", "")
	$filename = StringReplace($filename, "(Spain)", "")
	$filename = StringReplace($filename, "(Japan, Europe)", "")
	$filename = StringReplace($filename, "(Demo)", "")
	$filename = StringReplace($filename, "(Proto)", "")
	$filename = StringReplace($filename, "(En,De)", "")
	$filename = StringReplace($filename, "(En,Es,It)", "")
	$filename = StringReplace($filename, "(En,Ja)", "")
	$filename = StringReplace($filename, "(En,Fr,De)", "")
	$filename = StringReplace($filename, "(En,Fr,It)", "")
	$filename = StringReplace($filename, "(En,Fr,De,Es,It,Nl)", "")
	$filename = StringReplace($filename, "(En,Fr,De,Es,Nl)", "")
	$filename = StringReplace($filename, "(En,Sv,No,Da,Fi)", "")
	$filename = StringReplace($filename, "(Fr,De,Nl)", "")
	$filename = StringReplace($filename, " (J)", "")
	$filename = StringReplace($filename, " (PD)", "")
	$filename = StringReplace($filename, " (Rev A)", "")
	$filename = StringReplace($filename, " (Rev B)", "")
	$filename = StringReplace($filename, " (Rev 1)", "")
	$filename = StringReplace($filename, " (Rev 2)", "")
	$filename = StringReplace($filename, " (SGB Enhanced)", "")
	$filename = StringReplace($filename, " (Rumble Version)", "")
#ce

EndFunc


Func CleanRomFilename2($filename)

	$filename = StringReplace($filename, " [M][!]", "")
	$filename = StringReplace($filename, " [M][f1]", "")
	$filename = StringReplace($filename, " [M][o1]", "")
	$filename = StringReplace($filename, " [M][o1][f1]", "")
	$filename = StringReplace($filename, " [M]", "")

	$filename = StringRegExpReplace($filename, " - .*" , "")

	$filename = StringReplace($filename, "-full-cover", "")
	$filename = StringStripWS($filename, 3)
	Return $filename
EndFunc



Func CreateGamelist()

	; Create gamelist.xml

	GUICtrlSetData($status_input, "Creating gamelist.xml ...")

	$result = plink("(cd /opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " && ls *-full-cover.jpg)", 2)
	Local $art_filename_arr = StringSplit($result, @LF, 3)
	_ArraySort($art_filename_arr)

	$result = plink("(cd /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " && ls *.{bin,zip,lha,a52,a78,j64,lnx,rom,nes,mgw,gba,love,7z,n64,z64,nds,iso,32x,sfc,smc,vec,ws})", 2)
	Local $rom_filename_arr = StringSplit($result, @LF, 3)
	_ArraySort($rom_filename_arr)

	Local $xml = ""
	$xml = $xml & "<?xml version=""1.0""?>" & @CRLF
	$xml = $xml & "<gameList>" & @CRLF

	for $i = 0 to (UBound($rom_filename_arr) - 1)

		_PathSplit($rom_filename_arr[$i], $sDrive1, $sDir1, $sFileName1, $sExtension1)

		$xml = $xml & "	<game>" & @CRLF
		$xml = $xml & "		<path>./" & $sFileName1 & $sExtension1 & "</path>" & @CRLF
		$xml = $xml & "		<name>" & $sFileName1 & "</name>" & @CRLF
		$xml = $xml & "		<image>" & $downloaded_images_path & "/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $sFileName1 & "-full-cover.jpg</image>" & @CRLF

		if _ArrayBinarySearch($art_filename_arr, $sFileName1 & "-full-cover.jpg") < 0 Then

			$xml = $xml & "		<hidden>true</hidden>" & @CRLF
		EndIf

		$xml = $xml & "	</game>" & @CRLF
	Next

	$xml = $xml & "</gameList>"
	Return $xml

EndFunc

Func CreateGamelistOnRetroPie()

	; Create gamelist.xml

	GUICtrlSetData($status_input, "Creating gamelist.xml ...")

	Local $art_filename_arr = _WinSCP_ListDirectory_Files("/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)), "-full-cover.jpg")
	_ArraySort($art_filename_arr)
	Local $rom_filename_arr = _WinSCP_ListDirectory_Files("/home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)), ".bin|.zip|.lha|.a52|.a78|.j64|.lnx|.rom|.nes|.mgw|.gba|.love|.7z|.n64|.z64|.nds|.iso|.32x|.sfc|.smc|.vec|.ws")
	_ArraySort($rom_filename_arr)

	;Local $arr = _FileListToArray($roms_folder)
	;_ArrayDelete($arr, 0)
	;_ArraySort($arr)

	Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"

	if FileExists($gamelist_filepath) = True Then

		FileDelete($gamelist_filepath)
	EndIf

	Local $hFileOpen = FileOpen($gamelist_filepath, 1)

	Local $xml = ""
	FileWriteLine($hFileOpen, "<?xml version=""1.0""?>")
	FileWriteLine($hFileOpen, "<gameList>")

	for $i = 0 to (UBound($rom_filename_arr) - 1)

		_PathSplit($rom_filename_arr[$i], $sDrive1, $sDir1, $sFileName1, $sExtension1)

		FileWriteLine($hFileOpen, "	<game>")
		FileWriteLine($hFileOpen, "		<path>./" & $sFileName1 & $sExtension1 & "</path>")
		FileWriteLine($hFileOpen, "		<name>" & $sFileName1 & "</name>")
		FileWriteLine($hFileOpen, "		<image>" & $downloaded_images_path & "/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $sFileName1 & "-full-cover.jpg</image>")

		if _ArrayBinarySearch($art_filename_arr, $sFileName1 & "-full-cover.jpg") < 0 Then

			FileWriteLine($hFileOpen, "		<hidden>true</hidden>")
		EndIf

		FileWriteLine($hFileOpen, "	</game>")
	Next

	FileWriteLine($hFileOpen, "</gameList>")
	FileClose($hFileOpen)

	$result = FileRead($gamelist_filepath)
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $result = ' & $result & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

;	FileWrite($gamelist_filepath, $xml)

	ConsoleWrite("Putting """ & $gamelist_filepath & """ to ""/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml""" & @CRLF)
	GUICtrlSetData($status_input, "Putting """ & $gamelist_filepath & """ to ""/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml""")
	_WinSCP_PutFiles($gamelist_filepath, "/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
	GUICtrlSetData($status_input, "")


EndFunc

Func _Get_Factors($Child_GUI)

    Local $aFactors[2]
    Local $tTEXTMETRIC = DllStructCreate($tagTEXTMETRIC)
    ; Determine text size
    Local $hDC = DllCall("user32.dll", "handle", "GetDC", "hwnd", $Child_GUI)
    If Not @error Then
        $hDC = $hDC[0]
        DllCall("gdi32.dll", "bool", "GetTextMetricsW", "handle", $hDC, "ptr", DllStructGetPtr($tTEXTMETRIC))
        If @error Then
            $iError = @error
            $iExtended = @extended
            DllCall("user32.dll", "int", "ReleaseDC", "hwnd", $Child_GUI, "handle", $hDC)
            Return SetError($iError, $iExtended, -2)
        EndIf
        DllCall("user32.dll", "int", "ReleaseDC", "hwnd", $Child_GUI, "handle", $hDC)
    Else
        Return SetError(@error, @extended, -1)
    EndIf
    ; And store the factors
    $aFactors[0] = DllStructGetData($tTEXTMETRIC, "tmAveCharWidth") ; This is the average width of a character
    $aFactors[1] = DllStructGetData($tTEXTMETRIC, "tmHeight") + DllStructGetData($tTEXTMETRIC, "tmExternalLeading") ; This is the height of a line

    Return $aFactors

EndFunc

Func GUICtrlSetImagePNG($ctrl, $png_path)

	Local $hImage = _GDIPlus_ImageLoadFromFile($png_path)
	Local $hCLSID = _GDIPlus_EncodersGetCLSID("BMP")
	_GDIPlus_ImageSaveToFileEx($hImage, @TempDir & "\test.bmp", $hCLSID)
	GUICtrlSetImage($ctrl, @TempDir & "\test.bmp")
	_GDIPlus_ImageDispose($hImage)
EndFunc

Func GUICtrlUnselect($ctrl)

	Local $aSel = _GUICtrlListBox_GetSelItems($ctrl)

	For $i = 1 To $aSel[0]

		_GUICtrlListBox_SetSel($ctrl, $aSel[$i], False)
	Next
EndFunc

Func Listbox_ItemMoveUD($hLB_ID, $iDir = -1)
    ;Listbox_ItemMoveUD - Up/Down  Move Multi/Single item in a ListBox
    ;$iDir: -1 up, 1 down
    ;Return values -1 nothing to do, 0 nothing moved, >0 performed moves
    Local $iCur, $iNxt, $aCou, $aSel, $i, $m = 0, $y, $slb = 0 ;Current, next, Count, Selection, loop , movecount

    $aSel = _GUICtrlListBox_GetSelItems($hLB_ID) ;Put selected items in an array
    $aCou = _GUICtrlListBox_GetCount($hLB_ID) ;Get total item count of the listbox

    If $aSel[0] = 0 Then
        $y = _GUICtrlListBox_GetCurSel($hLB_ID)
        If $y > -1 Then
            _ArrayAdd($aSel, $y)
            $aSel[0] = 1
            $slb = 1
        EndIf
    EndIf

    ;WinSetTitle($hGUI, "", $aSel[0])                   ;Debugging info

    Select
        Case $iDir = -1 ;Move Up
            For $i = 1 To $aSel[0]
                If $aSel[$i] > 0 Then
                    $iNxt = _GUICtrlListBox_GetText($hLB_ID, $aSel[$i] - 1) ;Save the selection index - 1 text
                    _GUICtrlListBox_ReplaceString($hLB_ID, $aSel[$i] - 1, _GUICtrlListBox_GetText($hLB_ID, $aSel[$i])) ;Replace the index-1 text with the index text
                    _GUICtrlListBox_ReplaceString($hLB_ID, $aSel[$i], $iNxt) ;Replace the selection with the saved var
                    $m = $m + 1
                EndIf
            Next
            For $i = 1 To $aSel[0] ;Restore the selections after moving
                If $aSel[$i] > 0 Then
                    If $slb = 0 Then
                        _GUICtrlListBox_SetSel($hLB_ID, $aSel[$i] - 1, 1)
                    Else
                        _GUICtrlListBox_SetCurSel($hLB_ID, $aSel[$i] - 1)
                    EndIf
                EndIf
            Next
            Return $m
        Case $iDir = 1 ;Move Down
            If $aSel[0] > 0 Then
                For $i = $aSel[0] To 1 Step -1
                    If $aSel[$i] < $aCou - 1 Then
                        $iNxt = _GUICtrlListBox_GetText($hLB_ID, $aSel[$i] + 1)
                        _GUICtrlListBox_ReplaceString($hLB_ID, $aSel[$i] + 1, _GUICtrlListBox_GetText($hLB_ID, $aSel[$i]))
                        _GUICtrlListBox_ReplaceString($hLB_ID, $aSel[$i], $iNxt)
                        $m = $m + 1
                    EndIf
                Next
            EndIf
            For $i = $aSel[0] To 1 Step -1 ;Restore the selections after moving
                If $aSel[$i] < $aCou - 1 Then
                    If $slb = 0 Then
                        _GUICtrlListBox_SetSel($hLB_ID, $aSel[$i] + 1, 1)
                    Else
                        _GUICtrlListBox_SetCurSel($hLB_ID, $aSel[$i] + 1)
                    EndIf
                EndIf
            Next
            Return $m
    EndSelect
    Return -1
EndFunc   ;==>Listbox_ItemMoveUD

Func pscp_upload($source_file_path, $target_file_path)

	$cmd = "pscp.exe -l " & GUICtrlRead($retropie_username_input) & " -pw " & GUICtrlRead($retropie_password_input) & " """ & $source_file_path & """ " & GUICtrlRead($retropie_hostname_input) & ":""" & $target_file_path & """"
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $cmd = ' & $cmd & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	Local $iPID = Run($cmd, @ScriptDir, @SW_HIDE, 7)
    ProcessWaitClose($iPID)
    Local $sOutput = StdoutRead($iPID)

EndFunc

Func pscp_download($source_file_path, $target_file_path)

	$cmd = "pscp.exe -l " & GUICtrlRead($retropie_username_input) & " -pw " & GUICtrlRead($retropie_password_input) & " " & GUICtrlRead($retropie_hostname_input) & ":""" & $source_file_path & """ """ & $target_file_path & """"
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $cmd = ' & $cmd & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	Local $iPID = Run($cmd, @ScriptDir, @SW_HIDE, 7)
    ProcessWaitClose($iPID)
    Local $sOutput = StdoutRead($iPID)

EndFunc


Func plink($command, $strip_whitespace_flag = 0)


	$cmd = "plink.exe -ssh " & GUICtrlRead($retropie_hostname_input) & " -l " & GUICtrlRead($retropie_username_input) & " -pw " & GUICtrlRead($retropie_password_input) & " -batch " & $command
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $cmd = ' & $cmd & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	Local $iPID = Run("plink.exe -ssh " & GUICtrlRead($retropie_hostname_input) & " -l " & GUICtrlRead($retropie_username_input) & " -pw " & GUICtrlRead($retropie_password_input) & " -batch " & $command, @ScriptDir, @SW_HIDE,  7)
    ProcessWaitClose($iPID)
    Local $sOutput = StdoutRead($iPID)
    Local $stderr_output = StderrRead($iPID)

	if StringLen($sOutput) = 0 and StringLen($stderr_output) > 0 Then

		return SetError(1, 0, $stderr_output)
	EndIf

	if $strip_whitespace_flag > 0 Then

		$sOutput = StringStripWS($sOutput, $strip_whitespace_flag)
	EndIf

	Return $sOutput

EndFunc

Func plink_delete_all_text_in_file($path)

	Local $command = "sudo ed " & $path & " <<'EOF'" & @LF & _
				"1,$d" & @LF & _
				"w" & @LF & _
				"q" & @LF & _
				"EOF" & @LF

	plink($command)
EndFunc

Func plink_insert_text_in_file($path, $text_to_insert)

	$text_to_insert = StringReplace($text_to_insert, @CRLF, @LF)			; unix end of line characters
	$text_to_insert = StringReplace($text_to_insert, '"', '\"')				; unix double quotes
	$text_to_insert = StringRegExpReplace($text_to_insert, '(.+)', '"\1"')	; wrap each line with double quotes so treated as a string by ed below

	Local $command = "sudo ed " & $path & " <<'EOF'" & @LF & _
				"i" & @LF & _
				$text_to_insert & @LF & _
				"." & @LF & _
				"w" & @LF & _
				"q" & @LF & _
				"EOF" & @LF

	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $command = ' & $command & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	plink($command)
EndFunc


Func DirCreateSafe($path)

	If StringLen($path) > 0 and FileExists($path) = False Then

		$result = DirCreate($path)

		if $result <> 1 Then

			MsgBox(262144, $app_name, "failed to create dir " & $path)
			Exit
		EndIf
	EndIf
EndFunc


Func GUISetImage($gui, $ctrl, $image_filepath)

	Local $pic_size = GetImageSize($image_filepath, True)
	WinMove($gui, "", (@DesktopWidth/2)-$pic_size[0]/2, (@DesktopHeight/2)-$pic_size[1]/2, $pic_size[0], $pic_size[1])
	GUICtrlSetPos($ctrl, 0, 0, $pic_size[0], $pic_size[1])

	if StringInStr($image_filepath, ".png") > 0 Then

		GUICtrlSetImagePNG($ctrl, $image_filepath)
	Else

		GUICtrlSetImage($ctrl, $image_filepath)
	EndIf

EndFunc

Func GetImageSize($image_filepath, $to_fit_desktop = False)

	Local $size[2]

	$hImage =  _GDIPlus_ImageLoadFromFile($image_filepath)
	$size[0] = _GDIPlus_ImageGetWidth($hImage)
	$size[1] = _GDIPlus_ImageGetHeight($hImage)
	_GDIPlus_ImageDispose($hImage)

	if $to_fit_desktop = True Then

		if $size[0] > @DesktopWidth Then

			$size[1] = $size[1] * (@DesktopWidth / $size[0])
			$size[0] = @DesktopWidth
		EndIf

		if $size[1] > @DesktopHeight Then

			$size[0] = $size[0] * (@DesktopHeight / $size[1])
			$size[1] = @DesktopHeight
		EndIf
	EndIf

	Return $size
EndFunc

Func GUICtrlSetSizeAndImage($ctrl, $image_file_path, $ctrl_width = -1, $ctrl_height = -1, $center_position = False, $resize_gui = False)

	Local $hImage =  _GDIPlus_ImageLoadFromFile($image_file_path)
	Local $image_width = _GDIPlus_ImageGetWidth($hImage)
	Local $image_height = _GDIPlus_ImageGetHeight($hImage)
	_GDIPlus_ImageDispose($hImage)

	if $resize_gui = True Then

		Local $gui_width = @DesktopWidth
		Local $gui_height = @DesktopHeight
		if $image_width < @DesktopWidth Then $gui_width = $image_width
		if $image_height < @DesktopHeight Then $gui_height = $image_height

		Local $iGuiXPos = (@DesktopWidth/2)-$gui_width/2
		Local $iGuiYPos = (@DesktopHeight/2)-$gui_height/2

		WinMove(_WinAPI_GetParent(GUICtrlGetHandle($ctrl)), "", $iGuiXPos, $iGuiYPos, $gui_width, $gui_height)
		GUICtrlSetPos($ctrl, 0, 0, $gui_width, $gui_height)

		if $ctrl_width > -1 Then $ctrl_width = $gui_width
		if $ctrl_height > -1 Then $ctrl_height = $gui_height
	EndIf

	Local $new_ctrl_width = $ctrl_width
	Local $new_ctrl_height = $ctrl_height
	$ctrl_pos = ControlGetPos(_WinAPI_GetParent(GUICtrlGetHandle($ctrl)), "", $ctrl)

	if $ctrl_width = -1 Then

		$new_ctrl_width = $ctrl_pos[2]
	EndIf

	if $ctrl_height = -1 Then

		$new_ctrl_height = $ctrl_pos[3]
	EndIf

	;calculate image dimension which fits into defined area ($ctrl_width x $ctrl_height)

	If $image_width < $new_ctrl_width And $image_height < $new_ctrl_height Then

		$image_left = Default
		$image_top = Default

		if $center_position = True Then

			$image_left = $new_ctrl_width / 2 - $image_width / 2
			$image_top = $new_ctrl_height / 2 - $image_height / 2
		endif

		GUICtrlSetPos($ctrl, $image_left, $image_top, $image_width, $image_height)
		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $image_width = ' & $image_width & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $image_height = ' & $image_height & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	Else
;		If $image_width > $image_height Then
		if $ctrl_width > -1 Then
			$f = $image_width / $new_ctrl_width
			$w = $image_width / $f
			$h = $image_height / $f
		EndIf

		if $ctrl_height > -1 Then
		;Else
			$f = $image_height / $new_ctrl_height
			$w = $image_width / $f
			$h = $image_height / $f
		EndIf

		$image_left = Default
		$image_top = Default

		if $center_position = True Then

			$image_left = $new_ctrl_width / 2 - $w / 2
			$image_top = $new_ctrl_height / 2 - $h / 2
		endif

		GUICtrlSetPos($ctrl, $image_left, $image_top, $w, $h)
		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $w = ' & $w & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $h = ' & $h & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	EndIf

	GUICtrlSetImage($ctrl, $image_file_path)

;	$ctrl_pos = ControlGetPos($main_gui, "", $ctrl)
;	_ArrayDisplay($ctrl_pos)

EndFunc


Func _StringSplit2d($str, $delimiter)

    ; #FUNCTION# ======================================================================================
    ; Name ................:    _DBG_StringSplit2D($str,$delimiter)
    ; Description .........:    Create 2d array from delimited string
    ; Syntax ..............:    _DBG_StringSplit2D($str, $delimiter)
    ; Parameters ..........:    $str        - EOL (@CR, @LF or @CRLF) delimited string to split
    ;                           $delimiter  - Delimter for columns
    ;                           $showtiming - Display time to create 2D array to the console
    ; Return values .......:    2D array
    ; Author ..............:    kylomas
    ; =================================================================================================

    Local $a1 = StringRegExp($str, '(.*?)(?:\R|$)', 3)

    ;ReDim $a1[UBound($a1) - 1]

    Local $rows = UBound($a1), $cols = 0

    ; determine max number of columns
    For $i = 0 To UBound($a1) - 1
        StringReplace($a1[$i], $delimiter, '')
        $cols = (@extended > $cols ? @extended : $cols)
    Next

    ; define and populate array
    Local $aRET[$rows][$cols + 1]

    For $i = 0 To UBound($a1) - 1
        $a2 = StringSplit($a1[$i], $delimiter, 3)
        For $j = 0 To UBound($a2) - 1
            $aRET[$i][$j] = $a2[$j]
        Next
    Next

    Return $aRET

EndFunc   ;==>_DBG_StringSplit2d

Func RefreshDisplayDeviceVideoModesListView()

	GUICtrlSetData($display_label, "Video Modes for the """ & GUICtrlRead($display_device_name_combo) & """ display")
	_GUICtrlListView_DeleteAllItems($display_device_listview)
	Local $display_device_filename = $app_data_dir & "\display device " & GUICtrlRead($display_device_name_combo) & ".txt"
	Local $display_device_arr
	_FileReadToArray($display_device_filename, $display_device_arr, 0, "|")
	_GUICtrlListView_AddArray($display_device_listview, $display_device_arr)
EndFunc


Func RefreshMetadataListview($selected_index = -1)

	if $selected_index = -1 Then

		$selected_index = _GUICtrlListBox_GetCurSel($scrape_metadata_games_list)
	EndIf

	Local $game_name = _GUICtrlListBox_GetText($scrape_metadata_games_list, $selected_index)
;	$game_name = StringReplace($game_name, ".zip", "")

	_GUICtrlListView_SetItemText($scrape_metadata_listview, 0, "-", 2)
	_GUICtrlListView_SetItemText($scrape_metadata_listview, 1, "-", 2)
	_GUICtrlListView_SetItemText($scrape_metadata_listview, 2, "-", 2)
	_GUICtrlListView_SetItemText($scrape_metadata_listview, 3, "-", 2)
	_GUICtrlListView_SetItemText($scrape_metadata_listview, 4, "-", 2)

	if GUICtrlRead($scrape_metadata_release_date_checkbox) = $GUI_CHECKED Then

;		_GUICtrlListView_SetItemText($scrape_metadata_listview, 0, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()='" & $game_name & "']/../releasedate"), 2)
		_GUICtrlListView_SetItemText($scrape_metadata_listview, 0, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()=""" & $game_name & """]/../releasedate"), 2)
	EndIf

	if GUICtrlRead($scrape_metadata_developer_checkbox) = $GUI_CHECKED Then

;		_GUICtrlListView_SetItemText($scrape_metadata_listview, 1, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()='" & $game_name & "']/../developer"), 2)
		_GUICtrlListView_SetItemText($scrape_metadata_listview, 1, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()=""" & $game_name & """]/../developer"), 2)
	EndIf

	if GUICtrlRead($scrape_metadata_publisher_checkbox) = $GUI_CHECKED Then

;		_GUICtrlListView_SetItemText($scrape_metadata_listview, 2, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()='" & $game_name & "']/../publisher"), 2)
		_GUICtrlListView_SetItemText($scrape_metadata_listview, 2, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()=""" & $game_name & """]/../publisher"), 2)
	EndIf

	if GUICtrlRead($scrape_metadata_genre_checkbox) = $GUI_CHECKED Then

;		_GUICtrlListView_SetItemText($scrape_metadata_listview, 3, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()='" & $game_name & "']/../genre"), 2)
		_GUICtrlListView_SetItemText($scrape_metadata_listview, 3, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()=""" & $game_name & """]/../genre"), 2)
	EndIf

	if GUICtrlRead($scrape_metadata_players_checkbox) = $GUI_CHECKED Then

;		_GUICtrlListView_SetItemText($scrape_metadata_listview, 4, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()='" & $game_name & "']/../players"), 2)
		_GUICtrlListView_SetItemText($scrape_metadata_listview, 4, _XMLGetValue($gamelist_xml_dom, "/gameList/*/name[text()=""" & $game_name & """]/../players"), 2)
	EndIf

	Local $metadata_name = _GUICtrlListBox_GetText($scrape_metadata_scraped_data_list, _GUICtrlListBox_GetCurSel($scrape_metadata_scraped_data_list))
	Local $metadata_xml_dom = _XMLLoadXML(FileRead($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Metadata\" & $metadata_name & ".xml"), "")

	_GUICtrlListView_SetItemText($scrape_metadata_listview, 0, "-", 1)
	_GUICtrlListView_SetItemText($scrape_metadata_listview, 1, "-", 1)
	_GUICtrlListView_SetItemText($scrape_metadata_listview, 2, "-", 1)
	_GUICtrlListView_SetItemText($scrape_metadata_listview, 3, "-", 1)
	_GUICtrlListView_SetItemText($scrape_metadata_listview, 4, "-", 1)

	if GUICtrlRead($scrape_metadata_release_date_checkbox) = $GUI_CHECKED Then

		_GUICtrlListView_SetItemText($scrape_metadata_listview, 0, _XMLGetValue($metadata_xml_dom, "/gameList/game/releasedate"), 1)

		if StringCompare(_GUICtrlListView_GetItemText($scrape_metadata_listview, 0, 1), _GUICtrlListView_GetItemText($scrape_metadata_listview, 0, 2)) = 0 Then

			_GUICtrlListView_SetItemImage($scrape_metadata_listview, 0, 0)
		Else

			_GUICtrlListView_SetItemImage($scrape_metadata_listview, 0, 2)
		EndIf
	EndIf

	if GUICtrlRead($scrape_metadata_developer_checkbox) = $GUI_CHECKED Then

		_GUICtrlListView_SetItemText($scrape_metadata_listview, 1, _XMLGetValue($metadata_xml_dom, "/gameList/game/developer"), 1)

		if StringCompare(_GUICtrlListView_GetItemText($scrape_metadata_listview, 1, 1), _GUICtrlListView_GetItemText($scrape_metadata_listview, 1, 2)) = 0 Then

			_GUICtrlListView_SetItemImage($scrape_metadata_listview, 1, 0)
		Else

			_GUICtrlListView_SetItemImage($scrape_metadata_listview, 1, 2)
		EndIf
	EndIf

	if GUICtrlRead($scrape_metadata_publisher_checkbox) = $GUI_CHECKED Then

		_GUICtrlListView_SetItemText($scrape_metadata_listview, 2, _XMLGetValue($metadata_xml_dom, "/gameList/game/publisher"), 1)

		if StringCompare(_GUICtrlListView_GetItemText($scrape_metadata_listview, 2, 1), _GUICtrlListView_GetItemText($scrape_metadata_listview, 2, 2)) = 0 Then

			_GUICtrlListView_SetItemImage($scrape_metadata_listview, 2, 0)
		Else

			_GUICtrlListView_SetItemImage($scrape_metadata_listview, 2, 2)
		EndIf
	EndIf

	if GUICtrlRead($scrape_metadata_genre_checkbox) = $GUI_CHECKED Then

		_GUICtrlListView_SetItemText($scrape_metadata_listview, 3, _XMLGetValue($metadata_xml_dom, "/gameList/game/genre"), 1)

		if StringCompare(_GUICtrlListView_GetItemText($scrape_metadata_listview, 3, 1), _GUICtrlListView_GetItemText($scrape_metadata_listview, 3, 2)) = 0 Then

			_GUICtrlListView_SetItemImage($scrape_metadata_listview, 3, 0)
		Else

			_GUICtrlListView_SetItemImage($scrape_metadata_listview, 3, 2)
		EndIf
	EndIf

	if GUICtrlRead($scrape_metadata_players_checkbox) = $GUI_CHECKED Then

		_GUICtrlListView_SetItemText($scrape_metadata_listview, 4, _XMLGetValue($metadata_xml_dom, "/gameList/game/players"), 1)

		if StringCompare(_GUICtrlListView_GetItemText($scrape_metadata_listview, 4, 1), _GUICtrlListView_GetItemText($scrape_metadata_listview, 4, 2)) = 0 Then

			_GUICtrlListView_SetItemImage($scrape_metadata_listview, 4, 0)
		Else

			_GUICtrlListView_SetItemImage($scrape_metadata_listview, 4, 2)
		EndIf
	EndIf



EndFunc

; will update a child node, or if failed create the child node

Func XMLUpdateOrCreateChildNode($xml_dom, $parent_node_xpath, $child_node, $child_node_text)

	Local $result = _XMLUpdateField($xml_dom, $parent_node_xpath & "/" & $child_node, $child_node_text)

	if $result < 0 Then

		_XMLCreateChildNode($gamelist_xml_dom, $parent_node_xpath, $child_node, $child_node_text)
	EndIf

EndFunc

Func msWordXML_Beautify($s)
    Local $iTimer = TimerInit()
    $s = StringReplace($s, @CR, '')
    $s = StringReplace($s, @LF, '')
    Local $a = StringSplit($s, "<")
    Local $b[$a[0] * 2]
    Local $i = 0, $c = ""
    For $x = 1 To $a[0]
        If StringReplace($a[$x], @TAB, "") = "" Then ContinueLoop
        If StringInStr($a[$x], ">") Then $a[$x] = StringReplace($a[$x], @TAB, '')
        $c = StringSplit($a[$x], ">")
        If UBound($c) < 2 Then ContinueLoop
        For $y = 1 To $c[0]
            If $y = 1 Then
                $i += 1
                $b[$i] = "<" & $c[$y] & ">"
            Else
                If $c[$y] = "" Then ContinueLoop
                $i += 1
                $b[$i] = $c[$y]
            EndIf
        Next
    Next
    ReDim $b[$i + 1]
    $b[0] = $i
    For $x = 3 To $b[0]
        If Not StringInStr($b[$x - 1], ">") Then
            $b[$x] = $b[$x - 2] & $b[$x - 1] & $b[$x]
            $b[$x - 2] = "<>"
            $b[$x - 1] = "<>"
        EndIf
    Next
    Dim $c[$b[0] + 1]
    $i = 0
    For $x = 1 To $b[0]
        If $b[$x] = "<>" Then ContinueLoop
        $i += 1
        $c[$i] = $b[$x]
    Next
    $b = $c
    $c = ""
    ReDim $b[$i + 1]
    $b[0] = UBound($b) - 1
    Local $tabs = ""
    For $x = 1 To $b[0]
        $b[$x] = StringStripWS($b[$x], 3)
        If StringLeft($b[$x], 2) = "<!" Then ContinueLoop
        If StringLeft($b[$x], 2) = "<?" Then ContinueLoop
        If StringLeft($b[$x], 1) = "<" And StringRight($b[$x], 2) = "/>" Then
            $b[$x] = $tabs & $b[$x]
            ContinueLoop
        EndIf
        If StringLeft($b[$x], 2) = "</" And StringRight($b[$x], 1) = ">" Then
            $tabs = StringTrimRight($tabs, 1)
            $b[$x] = $tabs & $b[$x]
            ContinueLoop
        EndIf
        If StringLeft($b[$x], 1) = "<" And StringRight($b[$x], 1) = ">" And Not StringInStr($b[$x], '</') Then
            $b[$x] = $tabs & $b[$x]
            $tabs &= @TAB
            ContinueLoop
        EndIf
        $b[$x] = $tabs & $b[$x]
    Next

    Local $sOut = ""

    For $x = 1 To $b[0]
        $sOut &= $b[$x] & @CRLF
    Next

	Return $sOut
EndFunc   ;==>msWordXML_Beautify


Func rebuild_roms($dat_file_path, $dat_file_name, $rom_filename)

	; $dat_file_name = "\FinalBurn Neo (ClrMame Pro XML, Neogeo only).dat"

	Local $dat_file_name_updated = StringReplace($dat_file_name, ".dat", " updated.dat")
	Local $dat_file_path_updated = $dat_file_path & "\" & $dat_file_name_updated
	$dat_file_path = $dat_file_path & "\" & $dat_file_name
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $dat_file_path = ' & $dat_file_path & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	Local $xml_dom = _XMLLoadXML(FileRead($dat_file_path), "", -1, False)
	Local $num_nodes = _XMLGetNodeCount($xml_dom, "/datafile/game")
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $num_nodes = ' & $num_nodes & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	Local $rom_found = False

	for $i = 1 to $num_nodes

		Local $game_name = _XMLGetAttrib($xml_dom, "/datafile/game[" & $i & "]", "name")
		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $game_name = ' & $game_name & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

		;if _ArraySearch($rom_filename_arr, $game_name & ".zip") < 0 Then
		if StringCompare($rom_filename, $game_name & ".zip") = 0 Then

			$rom_found = True
		Else

			_XMLDeleteNode($xml_dom, "/datafile/game[" & $i & "]")
			$i = $i - 1
			$num_nodes = $num_nodes - 1
		EndIf

		if $i > $num_nodes Then

			ExitLoop
		EndIf
	Next

	if $rom_found = False Then

		return False
	EndIf

	Local $clrmamepro_dat_xml = _XMLGetDocXML($xml_dom)
	$clrmamepro_dat_xml = msWordXML_Beautify($clrmamepro_dat_xml)
	FileDelete($dat_file_path_updated)
	FileWrite($dat_file_path_updated, $clrmamepro_dat_xml)


	;_XMLSaveXML($xml_dom, @ScriptDir & "\FinalBurn Neo (ClrMame Pro XML, Neogeo only) updated.dat")
	;_XMLSaveXML($xml_dom, @ScriptDir & "\fred.dat")


	; download roms to rebuild and bios

	GUICtrlSetData($status_input, "Downloading neogeo.zip")
	pscp_download("/home/pi/RetroPie/BIOS/neogeo.zip", @ScriptDir & "\clrmamepro_source\neogeo.zip")
	GUICtrlSetData($status_input, "Downloading " & $rom_filename)
	pscp_download("/home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $rom_filename, @ScriptDir & "\clrmamepro_source\" & $rom_filename)


	Local $clrmamepro_dat_filename = $dat_file_name_updated
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
	Local $clrmamepro_datfile_problem_win_title = "[TITLE:DatFile Problem; CLASS:#32770]"

	GUICtrlSetData($status_input, "Initialising ClrMame Pro")
	FileDelete($clrmamepro_path & "\datfiles\*.dat")
	FileDelete($clrmamepro_path & "\settings\*.cmp")
	FileDelete($clrmamepro_path & "\profiler.cache")
	FileDelete($clrmamepro_path & "\profiler.xml")
	FileDelete($clrmamepro_ini_path)
	IniWrite($clrmamepro_ini_path, "CMPRO SETTINGS", "Dir_ProfilerAddDatFileFolder", $clrmamepro_dat_dirname)
	ProcessClose("cmpro64.exe")

	GUICtrlSetData($status_input, "Automating ClrMame Pro")
	ShellExecute("cmpro64.exe", "", "C:\Program Files\clrmamepro")

	WinWait($clrmamepro_welcome_win_title)
	WinClose($clrmamepro_welcome_win_title)

	WinWait($clrmamepro_profiler_win_title)
	ControlClick($clrmamepro_profiler_win_title, "", "[TEXT:&Add DatFile...]")

	WinWait($clrmamepro_open_win_title)
	Sleep(500)
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

	for $i = 1 to 15

		Sleep(1000)

		if WinExists($clrmamepro_datfile_problem_win_title) = True Then

			ControlClick($clrmamepro_datfile_problem_win_title, "", "[TEXT:OK TO ALL]")
		Else

			ExitLoop
		EndIf
	Next

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

	return True


EndFunc

Func MainGUICreate(ByRef $tab, $tab_left, $tab_top, $tab_width, $tab_height, $tab_resizing)

	Local $gui = GUICreate($app_name & " - Main GUI", $main_gui_width, $main_gui_height, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_MAXIMIZEBOX, $WS_SIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU))
	$main_gui_first_control = GUICtrlCreateDummy()
	$tab = GUICtrlCreateTabEx($tab_left, $tab_top, $tab_width, $tab_height, $tab_resizing)
	$current_gui = $gui

	Return $gui

EndFunc

Func ChildGUICreate($title, $width, $height, $parent_gui)

	Local $gui = GUICreate($title, $width, $height, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_MAXIMIZEBOX, $WS_SIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU), $WS_EX_MDICHILD, $parent_gui)
	$current_gui = $gui
	Return $gui

EndFunc

Func GUICtrlCreateComboFromDict($value_dictionary = Null, $left = -1, $top = -1, $width = 80, $height = 20, $resizing = -1)

	local $ctrl = GUICtrlCreateCombo("", $left, $top, $width, $height, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing(-1, $GUI_DOCKALL)

	if $value_dictionary <> Null Then

		For $vKey In $value_dictionary

		   _GUICtrlComboBox_AddString($ctrl, $vKey)
		Next
	EndIf

	_GUICtrlComboBox_SetCurSel($ctrl, 0)

	if $resizing > -1 Then

		GUICtrlSetResizing($ctrl, $resizing)
	EndIf

	Return $ctrl

EndFunc

Func GUICtrlCreateComboFromDictWithLabel(ByRef $label, $label_text = "", $label_left = -1, $label_top = -1, $label_width = 80, $label_height = 20, $label_tooltip_text = "", $value_dictionary = Null, $left = -1, $top = -1, $width = 80, $height = 20)

	if StringLen($label_text) > 0 Then

		$label = GUICtrlCreateLabel($label_text, $label_left, $label_top, $label_width, $label_height)
		GUICtrlSetResizing(-1, $GUI_DOCKALL)

		if StringLen($label_tooltip_text) > 0 Then

			_GUIToolTip_AddTool($tooltip, 0, $label_tooltip_text, GUICtrlGetHandle($label))
		EndIf
	EndIf

	local $ctrl = GUICtrlCreateCombo("", $left, $top, $width, $height, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing(-1, $GUI_DOCKALL)

	if $value_dictionary <> Null Then

		For $vKey In $value_dictionary

		   _GUICtrlComboBox_AddString($ctrl, $vKey)
		Next
	EndIf

	_GUICtrlComboBox_SetCurSel($ctrl, 0)
	Return $ctrl

EndFunc

Func GUICtrlCreateButtonEx($text, $left, $top, $width, $height, $tooltip_text = "", $resizing = -1)

	local $ctrl = GUICtrlCreateButton($text, $left, $top, $width, $height)

	if StringLen($tooltip_text) > 0 Then

		_GUIToolTip_AddTool($tooltip, 0, $tooltip_text, GUICtrlGetHandle(-1))
	EndIf

	if $resizing > -1 Then

		GUICtrlSetResizing(-1, $resizing)
	EndIf

	Return $ctrl

EndFunc

Func GUICtrlCreateImageButton($ico_filename, $left, $top, $width_height, $tooltip_text, $resizing = -1, $hide = False)

	local $ctrl = GUICtrlCreateButton("", $left, $top, $width_height, $width_height, $BS_ICON)
	GUICtrlSetImage(-1, @ScriptDir & "\" & $ico_filename)
	_GUIToolTip_AddTool($tooltip, 0, $tooltip_text, GUICtrlGetHandle(-1))

	if $resizing > -1 Then

		GUICtrlSetResizing(-1, $resizing)
	EndIf

	if $hide = True Then

		GUICtrlSetState(-1, $GUI_HIDE)
	EndIf

	Return $ctrl

EndFunc




Func GUICtrlCreateTabEx($left, $top, $width, $height, $resizing )

	local $ctrl = GUICtrlCreateTab($left, $top, $width, $height)
	GUICtrlSetResizing(-1, $resizing)
	Return $ctrl

EndFunc

Func GUICtrlCreateInputWithLabel($input_text, $input_left, $input_top, $input_width, $input_height, ByRef $label, $label_text, $label_left, $label_top, $label_width, $label_height, $label_tooltip_text = "", $label2_text = "", $label2_left = -1, $label2_top = -1, $label2_width = -1, $label2_height = -1)

	if StringLen($label_text) > 0 Then

		$label = GUICtrlCreateLabel($label_text, $label_left, $label_top, $label_width, $label_height)
		GUICtrlSetResizing(-1, $GUI_DOCKALL)

		if StringLen($label_tooltip_text) > 0 Then

			_GUIToolTip_AddTool($tooltip, 0, $label_tooltip_text, GUICtrlGetHandle($label))
		EndIf
	EndIf

	local $input = GUICtrlCreateInput($input_text, $input_left, $input_top, $input_width, $input_height)
	GUICtrlSetResizing(-1, $GUI_DOCKALL)

	if StringLen($label2_text) > 0 Then

		GUICtrlCreateLabel($label2_text, $label2_left, $label2_top, $label2_width, $label2_height)
		GUICtrlSetResizing(-1, $GUI_DOCKALL)
	EndIf

	Return $input

EndFunc

Func GUICtrlCreateStatusInput($text, $left, $top, $width, $height)

	Local $status_input_header = "{\rtf1\ansi\deff0\readprot\annotprot{\fonttbl {\f0 Normal;}}\fs18 " ; Courier or New Times New Roman or roman or Times New Roman Greek
	Local $status_input_footer = "\line "

	local $input = _GUICtrlRichEdit_Create($current_gui, $status_input_header & $text & $status_input_footer, $left, $top, $width, $height, $ES_READONLY)
	GUICtrlSetResizing(-1, $GUI_DOCKBOTTOM + $GUI_DOCKHEIGHT + $GUI_DOCKLEFT + $GUI_DOCKRIGHT)
	_GUICtrlRichEdit_SetEventMask($input, $ENM_LINK)
	_GUICtrlRichEdit_AutoDetectURL($input, True)
	Return $input

EndFunc

Func GUICtrlStatusInput_SetText($input, $text)

	Local $status_input_header = "{\rtf1\ansi\deff0\readprot\annotprot{\fonttbl {\f0 Normal;}}\fs18 " ; Courier or New Times New Roman or roman or Times New Roman Greek
	Local $status_input_footer = "\line "
	_GUICtrlRichEdit_SetText($input, $status_input_header & $text & $status_input_footer)
EndFunc


Func GUICtrlCreateSliderEx($left, $top, $width, $height, $resizing, $max, $min, $value)

	local $ctrl = GUICtrlCreateSlider($left, $top, $width, $height)
	GUICtrlSetResizing(-1, $resizing)
	GUICtrlSetLimit(-1, $max, $min)
	GUICtrlSetData(-1, $value)
	Return $ctrl
EndFunc

Func GUICtrlCreateCheckboxEx($text, $left, $top, $width, $height, $checked = False, $tooltip_text = "")

	local $ctrl = GUICtrlCreateCheckbox($text, $left, $top, $width, $height)
	GUICtrlSetResizing(-1, $GUI_DOCKALL)

	if $checked = True Then

		GUICtrlSetState(-1, $GUI_CHECKED)
	Else

		GUICtrlSetState(-1, $GUI_UNCHECKED)
	EndIf

	if StringLen($tooltip_text) > 0 Then

		_GUIToolTip_AddTool($tooltip, 0, $tooltip_text, GUICtrlGetHandle($ctrl))
	EndIf

	Return $ctrl

EndFunc

Func GUICtrlCreateLabelEx($text, $left, $top, $width, $height, $tooltip_text = "")

	local $ctrl = GUICtrlCreateLabel($text, $left, $top, $width, $height)
	GUICtrlSetResizing(-1, $GUI_DOCKALL)

	if StringLen($tooltip_text) > 0 Then

		_GUIToolTip_AddTool($tooltip, 0, $tooltip_text, GUICtrlGetHandle($ctrl))
	EndIf

	Return $ctrl

EndFunc

Func GUICtrlCreateRadioEx($text, $left, $top, $width, $height, $checked = False, $tooltip_text = "", $resizing = -1, $hide = False)

	local $ctrl = GUICtrlCreateRadio($text, $left, $top, $width, $height)

	if $resizing > -1 Then

		GUICtrlSetResizing(-1, $GUI_DOCKALL)
	EndIf

	if $checked = True Then

		GUICtrlSetState(-1, $GUI_CHECKED)
	EndIf

	if StringLen($tooltip_text) > 0 Then

		_GUIToolTip_AddTool($tooltip, 0, $tooltip_text, GUICtrlGetHandle($ctrl))
	EndIf

	if $hide = True Then

		GUICtrlSetState(-1, $GUI_HIDE)
	EndIf

	Return $ctrl

EndFunc


Func GUICtrlCreateSingleSelectList($left, $top, $width, $height, $horizontal_scroll_size = -1, $resizing = -1)

	local $ctrl = GUICtrlCreateList("", $left, $top, $width, $height, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))

	if $resizing > -1 Then

		GUICtrlSetResizing(-1, $resizing)
	EndIf

	if $horizontal_scroll_size > -1 Then

		GUICtrlSetLimit(-1, $horizontal_scroll_size)
	EndIf

	Return $ctrl

EndFunc


Func GUICtrlCreateListViewEx($left, $top, $width, $height, $col_1_name = Null, $col_1_width = Null, $col_2_name = Null, $col_2_width = Null, $col_3_name = Null, $col_3_width = Null, $col_4_name = Null, $col_4_width = Null, $col_5_name = Null, $col_5_width = Null, $row_1_col_1_value = Null, $row_1_col_2_value = Null, $row_1_col_3_value = Null, $row_1_col_4_value = Null, $row_1_col_5_value = Null, $row_2_col_1_value = Null, $row_2_col_2_value = Null, $row_2_col_3_value = Null, $row_2_col_4_value = Null, $row_2_col_5_value = Null, $row_3_col_1_value = Null, $row_3_col_2_value = Null, $row_3_col_3_value = Null, $row_3_col_4_value = Null, $row_3_col_5_value = Null, $row_4_col_1_value = Null, $row_4_col_2_value = Null, $row_4_col_3_value = Null, $row_4_col_4_value = Null, $row_4_col_5_value = Null, $row_5_col_1_value = Null, $row_5_col_2_value = Null, $row_5_col_3_value = Null, $row_5_col_4_value = Null, $row_5_col_5_value = Null)

	Local $col_heading_definition = ""

	if $col_1_name <> Null Then $col_heading_definition = $col_1_name
	if $col_2_name <> Null Then $col_heading_definition = $col_heading_definition & "|" & $col_2_name
	if $col_3_name <> Null Then $col_heading_definition = $col_heading_definition & "|" & $col_3_name
	if $col_4_name <> Null Then $col_heading_definition = $col_heading_definition & "|" & $col_4_name
	if $col_5_name <> Null Then $col_heading_definition = $col_heading_definition & "|" & $col_5_name

	local $ctrl = GUICtrlCreateListView($col_heading_definition, $left, $top, $width, $height)

	if $col_1_width <> Null Then _GUICtrlListView_SetColumnWidth(-1, 0, $col_1_width)
	if $col_2_width <> Null Then _GUICtrlListView_SetColumnWidth(-1, 1, $col_2_width)
	if $col_3_width <> Null Then _GUICtrlListView_SetColumnWidth(-1, 2, $col_3_width)
	if $col_4_width <> Null Then _GUICtrlListView_SetColumnWidth(-1, 3, $col_4_width)
	if $col_5_width <> Null Then _GUICtrlListView_SetColumnWidth(-1, 4, $col_5_width)

	Local $i

	if $row_1_col_1_value <> Null Then $i = _GUICtrlListView_AddItem(-1, $row_1_col_1_value, 0)
	if $row_1_col_2_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_1_col_2_value, 1, 0)
	if $row_1_col_3_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_1_col_3_value, 2, 0)
	if $row_1_col_4_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_1_col_4_value, 3, 0)
	if $row_1_col_5_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_1_col_5_value, 4, 0)
	if $row_2_col_1_value <> Null Then $i = _GUICtrlListView_AddItem(-1, $row_2_col_1_value, 0)
	if $row_2_col_2_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_2_col_2_value, 1, 0)
	if $row_2_col_3_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_2_col_3_value, 2, 0)
	if $row_2_col_4_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_2_col_4_value, 3, 0)
	if $row_2_col_5_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_2_col_5_value, 4, 0)
	if $row_3_col_1_value <> Null Then $i = _GUICtrlListView_AddItem(-1, $row_3_col_1_value, 0)
	if $row_3_col_2_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_3_col_2_value, 1, 0)
	if $row_3_col_3_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_3_col_3_value, 2, 0)
	if $row_3_col_4_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_3_col_4_value, 3, 0)
	if $row_3_col_5_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_3_col_5_value, 4, 0)
	if $row_4_col_1_value <> Null Then $i = _GUICtrlListView_AddItem(-1, $row_4_col_1_value, 0)
	if $row_4_col_2_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_4_col_2_value, 1, 0)
	if $row_4_col_3_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_4_col_3_value, 2, 0)
	if $row_4_col_4_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_4_col_4_value, 3, 0)
	if $row_4_col_5_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_4_col_5_value, 4, 0)
	if $row_5_col_1_value <> Null Then $i = _GUICtrlListView_AddItem(-1, $row_5_col_1_value, 0)
	if $row_5_col_2_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_5_col_2_value, 1, 0)
	if $row_5_col_3_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_5_col_3_value, 2, 0)
	if $row_5_col_4_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_5_col_4_value, 3, 0)
	if $row_5_col_5_value <> Null Then _GUICtrlListView_AddSubItem(-1, $i, $row_5_col_5_value, 4, 0)

	_GUICtrlListView_SetExtendedListViewStyle(-1, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))

	Return $ctrl

EndFunc

Func GUICtrlCreatePicEx($left, $top, $width, $height, $tooltip_text = "", $resizing = -1, $hide = False)

	Local $ctrl = GUICtrlCreatePic("", $left, $top, $width, $height)

	if StringLen($tooltip_text) > 0 Then

		_GUIToolTip_AddTool($tooltip, 0, $tooltip_text, GUICtrlGetHandle($ctrl))
	EndIf

	if $resizing > -1 Then

		GUICtrlSetResizing(-1, $resizing)
	EndIf

	if $hide = True Then

		GUICtrlSetState(-1, $GUI_HIDE)
	EndIf

	Return $ctrl
EndFunc

Func GUICtrlCreateTabItemEx($text)

	$text = StringReplace($text, "=", "")
	$text = StringReplace($text, ">", "")
	$text = StringStripWS($text, 3)
	Local $ctrl = GUICtrlCreateTabItem($text)
	Return $ctrl

EndFunc

Func GUICtrlCreateGroupEx($text, $left, $top, $width, $height)

	$text = StringReplace($text, "-", "")
	$text = StringReplace($text, ">", "")
	$text = StringStripWS($text, 3)
	Local $ctrl = GUICtrlCreateGroup($text, $left, $top, $width, $height)
	Return $ctrl

EndFunc

Func disable_main_gui()

	For $i = $main_gui_first_control To $main_gui_last_control

		GUICtrlSetState($i, $GUI_DISABLE)
	Next
EndFunc


Func enable_main_gui()

	For $i = $main_gui_first_control To $main_gui_last_control

		GUICtrlSetState($i, $GUI_ENABLE)
	Next
EndFunc
