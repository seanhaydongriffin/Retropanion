#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
#include-once
#include <AutoItConstants.au3>
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <GuiButton.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <File.au3>
#include <GuiComboBox.au3>
#include <Math.au3>
#include <GuiToolTip.au3>
#include <GuiListView.au3>
#include <GuiListBox.au3>
#include <GuiTab.au3>
#include <IE.au3>
#include "WinSCP.au3"
#include <GDIPlus.au3>
#include "GUIScrollbars_Ex.au3"
#Include "_XMLDomWrapper2.au3"
#Include "Seans RetroPie Companion UDF.au3"


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

$main_gui = MainGUICreate($tab, 5, 40, 840-10, 720-30-30, $GUI_DOCKVCENTER + $GUI_DOCKBORDERS)

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

; Settings tab

GUICtrlCreateTabItemEx("===> Settings")
$image_compression_quality_label = 						GUICtrlCreateInputWithLabel("80", 190, 100, 30, 20, $image_compression_quality_label, "Image Compression / Quality", 20, 100, 160, 20, "The maximum level of compression / quality required", "%", 225, 100, 20, 20)
$image_compression_quality_slider = 					GUICtrlCreateSliderEx(260, 100, 200, 20, $GUI_DOCKALL, 10, 1, 10)
GUICtrlCreateGroupEx  ("----> RetroPie", 20, 300, 380, 160)
$retropie_hostname_input = 								GUICtrlCreateInputWithLabel("retropie", 120, 320, 240, 20, $retropie_hostname_label, "Hostname", 30, 320, 100, 20)
$retropie_username_input = 								GUICtrlCreateInputWithLabel("pi", 120, 340, 240, 20, $retropie_username_label, "Username", 30, 340, 100, 20)
$retropie_password_input = 								GUICtrlCreateInputWithLabel("raspberry", 120, 360, 240, 20, $retropie_password_label, "Password", 30, 360, 100, 20)
$retropie_ssh_key_input = 								GUICtrlCreateInputWithLabel("ssh-ed25519 255 cq4AFscwWDozkpWLAzpJmZak8M7USnljP1lO36e23Co=", 120, 380, 240, 20, $retropie_ssh_key_label, "SSH Key", 30, 380, 100, 20)
$confirmation_prompts_checkbox = 						GUICtrlCreateCheckboxEx("Confirmation Prompts", 420, 180, 200, 20)
GUICtrlCreateGroupEx  ("----> PC", 420, 300, 380, 100)
$retropie_download_path_input = 						GUICtrlCreateInputWithLabel("D:\dwn", 520, 320, 240, 20, $retropie_download_path_label, "Download Path", 430, 320, 100, 20)

; ROMs tab

GUICtrlCreateTabItemEx("===> ROMs")
GUICtrlCreateGroupEx  ("----> ROMs", 20, 140, 250, 500)
$rebuild_roms_roms_list = 								GUICtrlCreateSingleSelectList(30, 170, 200, 420, 500, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
$rebuild_roms_refresh_button = 							GUICtrlCreateImageButton("get games list.ico", 30, 590, 36, "Get the list of games (from the RetroPie)", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
$rebuild_roms_rebuild_button = 							GUICtrlCreateImageButton("repair.ico", 120, 590, 36, "Rebuild / Repair the selected rom")

; Scrape Metadata tab

GUICtrlCreateTabItemEx("===> Scrape Metadata")
GUICtrlCreateGroupEx  ("----> Scraping Metadata", 20, 70, 680, 55)
$scrape_metadata_website_combo = 						GUICtrlCreateComboFromDictWithLabel($scrape_metadata_websites_label, "Website(s)", 30, 90, 70, 20, "The website(s) to scrape the box art from", Null, 90, 90, 150, 20)
_GUICtrlComboBox_AddString($scrape_metadata_website_combo, "LaunchBox")
_GUICtrlComboBox_SetCurSel($scrape_metadata_website_combo, 0)
$scrape_metadata_minimized_scrapers_checkbox = 			GUICtrlCreateCheckboxEx("Minimized Scrapers", 250, 90, 120, 20, True, "If checked then run each scraper in a minimized window")
$scrape_metadata_max_scrapers_input = 					GUICtrlCreateInputWithLabel("10", 450, 90, 30, 20, $scrape_metadata_max_scrapers_label, "Max Scrapers", 380, 90, 80, 20, "The maximum number of scrapers that will run in parallel")
$scrape_metadata_max_scrapers_slider = 					GUICtrlCreateSliderEx(490, 90, 150, 20, $GUI_DOCKALL, 10, 1, 10)
$scrape_metadata_scrape_button = 						GUICtrlCreateImageButton("scrape metadata.ico", 650, 80, 36, _
	"Scrapes game metadata according to the selections above." & @CRLF & _
	@CRLF & _
	"Front Covers will be stored in the Box folder." & @CRLF  & _
	"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
	"Full Covers will be stored in the BoxFull folder." & @CRLF, $GUI_DOCKALL)
$scrape_metadata_match_scraped_data_to_games_radio = 	GUICtrlCreateRadioEx("Match Scraped Data to Games", 30, 140, 180, 20, True, "", $GUI_DOCKALL)
$scrape_metadata_match_games_to_scraped_data_radio = 	GUICtrlCreateRadioEx("Match Games to Scraped Data", 220, 140, 180, 20, False, "", $GUI_DOCKALL)
$scrape_metadata_refresh_button = 						GUICtrlCreateImageButton("get games metadata.ico", 400, 140, 36, "Get scraped metadata plus game names (from the RetroPie)", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
$scrape_metadata_scraped_data_label = 					GUICtrlCreateLabelEx("Scraped Data", 20, 180, 70, 20)
$scrape_metadata_scraped_data_files_label = 			GUICtrlCreateLabelEx("0 Files", 180, 180, 70, 20)
$scrape_metadata_scraped_data_list = 					GUICtrlCreateSingleSelectList(20, 200, 200, 420, 500, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
$scrape_metadata_games_label = 							GUICtrlCreateLabelEx("Games", 240, 180, 100, 20)
$scrape_metadata_games_files_label = 					GUICtrlCreateLabelEx("0 Files", 400, 180, 70, 20)
$scrape_metadata_games_list = 							GUICtrlCreateSingleSelectList(240, 200, 200, 420, -1, $GUI_DOCKALL + $GUI_DOCKBOTTOM) ; BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL)) ;, $LBS_EXTENDEDSEL))
GUICtrlCreateGroupEx  ("----> Mismatching Metadata Type", 460, 200, 200, 150)
$scrape_metadata_release_date_checkbox = 				GUICtrlCreateCheckboxEx("Release Date", 480, 220, 120, 20)
$scrape_metadata_developer_checkbox = 					GUICtrlCreateCheckboxEx("Developer", 480, 240, 120, 20)
$scrape_metadata_publisher_checkbox = 					GUICtrlCreateCheckboxEx("Publisher", 480, 260, 120, 20)
$scrape_metadata_genre_checkbox = 						GUICtrlCreateCheckboxEx("Genre", 480, 280, 120, 20)
$scrape_metadata_players_checkbox = 					GUICtrlCreateCheckboxEx("Players", 480, 300, 120, 20, True)
$scrape_metadata_listview = 							GUICtrlCreateListViewEx(460, 370, 350, 200, "Metadata Name", 110, "Scraped", 100, "RetroPie", 100, Null, Null, Null, Null, "Release Date", Null, Null, Null, Null, "Developer", Null, Null, Null, Null, "Publisher", Null, Null, Null, Null, "Genre", Null, Null, Null, Null, "Players", Null, Null, Null, Null)
$scrape_metadata_imagelist = _GUIImageList_Create(16, 16)
_GUIImageList_Add($scrape_metadata_imagelist, _GUICtrlListView_CreateSolidBitMap($scrape_metadata_listview, $COLOR_WHITE, 16, 16))
_GUIImageList_Add($scrape_metadata_imagelist, _GUICtrlListView_CreateSolidBitMap($scrape_metadata_listview, $COLOR_GREEN, 16, 16))
_GUIImageList_Add($scrape_metadata_imagelist, _GUICtrlListView_CreateSolidBitMap($scrape_metadata_listview, $COLOR_RED, 16, 16))
_GUICtrlListView_SetImageList($scrape_metadata_listview, $scrape_metadata_imagelist, 1)
$scrape_metadata_update_gamelist_button = 				GUICtrlCreateButtonEx("&Apply Scraped Data", 460, 580, 120, 20, "", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
$scrape_metadata_upload_gamelist_button = 				GUICtrlCreateButtonEx("Upload Data to Retro&Pie", 680, 640, 140, 40, "", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

; Scrape Images with Auto Join tab

GUICtrlCreateTabItemEx("===> Scrape Images with Auto Join")
$scrape_auto_join_website_combo = 						GUICtrlCreateComboFromDictWithLabel($scrape_auto_join_websites_label, "Website(s)", 20, 60, 70, 20, "The website(s) to scrape the box art from", Null, 90, 60, 150, 20)
_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "RF Generation")
_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "Moby Games")
_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "The Cover Project")
_GUICtrlComboBox_SetCurSel($scrape_auto_join_website_combo, 0)
$max_scrapers_input = 									GUICtrlCreateInputWithLabel("10", 320, 60, 30, 20, $max_scrapers_label, "Max Scrapers", 250, 60, 80, 20, "The maximum number of scrapers that will run in parallel")
$max_scrapers_slider = 									GUICtrlCreateSliderEx(360, 60, 150, 20, $GUI_DOCKALL, 10, 1, 10)
$minimized_scrapers_checkbox = 							GUICtrlCreateCheckboxEx("Minimized Scrapers", 520, 60, 120, 20, True, "If checked then run each scraper in a minimized window")
$scrape_button = 										GUICtrlCreateImageButton("scrape art.ico", 640, 60, 36, _
	"Scrapes game metadata according to the selections above." & @CRLF & _
	@CRLF & _
	"Front Covers will be stored in the Box folder." & @CRLF  & _
	"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
	"Full Covers will be stored in the BoxFull folder." & @CRLF, $GUI_DOCKALL)
$scrape_auto_join_match_art_to_roms_radio = 			GUICtrlCreateRadioEx("Match Art to Roms", 650, 120, 120, 20, True, "", $GUI_DOCKALL)
$scrape_auto_join_match_roms_to_art_radio = 			GUICtrlCreateRadioEx("Match Roms to Art", 650, 140, 120, 20, False, "", $GUI_DOCKALL)
$scrape_auto_join_exclude_uploaded_art_checkbox = 		GUICtrlCreateRadioEx("Exclude Uploaded Art", 650, 160, 120, 20, True, "", $GUI_DOCKALL)
$scrape_auto_join_refresh_button = 						GUICtrlCreateImageButton("get games art.ico", 650, 190, 36, "Get scraped art plus game names (from the RetroPie)", $GUI_DOCKALL)
$scrape_auto_join_art_label = 							GUICtrlCreateLabelEx("Art", 20, 100, 100, 20)
$scrape_auto_join_art_files_label = 					GUICtrlCreateLabelEx("0 Files", 180, 100, 70, 20)
$scrape_auto_join_art_list = 							GUICtrlCreateSingleSelectList(20, 120, 200, 350, 500, $GUI_DOCKALL)
$scrape_auto_join_rom_label = 							GUICtrlCreateLabelEx("Roms without Art", 240, 100, 100, 20)
$scrape_auto_join_rom_files_label = 					GUICtrlCreateLabelEx("0 Files", 400, 100, 70, 20)
$scrape_auto_join_rom_list = 							GUICtrlCreateSingleSelectList(240, 120, 200, 350, 500, $GUI_DOCKALL)
$scrape_auto_join_upload_button = 						GUICtrlCreateImageButton("upload art.ico", 450, 120, 36, "Upload selected art with game name (to the RetroPie)")
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$scrape_auto_join_rotate_art_button = 					GUICtrlCreateButtonEx("Split Back && Front Art and R&otate", 440, 600, 180, 40)
$scrape_auto_join_upload_gamelist_button = 				GUICtrlCreateImageButton("update list.ico", 450, 430, 36, "Update games list (on the RetroPie) with all art uploaded", $GUI_DOCKALL)
$scrape_auto_join_art_1_pic = 							GUICtrlCreatePicEx(20, 540, 384, 120, -1, True)

; Scrape Images with Manual Join tab

GUICtrlCreateTabItemEx("===> Scrape Images with Manual Join")
GUICtrlCreateGroupEx  ("----> Scraping Images", 20, 70, 410, 80)
$scrape_manual_join_website_combo = 					GUICtrlCreateComboFromDictWithLabel($scrape_manual_join_websites_label, "Website(s)", 30, 90, 70, 20, "The website(s) to scrape the box art from", Null, 90, 90, 150, 20)
_GUICtrlComboBox_AddString($scrape_manual_join_website_combo, "Atarimania")
_GUICtrlComboBox_AddString($scrape_manual_join_website_combo, "LaunchBox")
_GUICtrlComboBox_SetCurSel($scrape_manual_join_website_combo, 0)
$scrape_manual_join_minimized_scrapers_checkbox = 		GUICtrlCreateCheckboxEx("Minimized Scrapers", 250, 90, 120, 20, True, "If checked then run each scraper in a minimized window")
$scrape_manual_join_max_scrapers_input = 				GUICtrlCreateInputWithLabel("10", 100, 120, 30, 20, $scrape_manual_join_max_scrapers_label, "Max Scrapers", 30, 120, 80, 20, "The maximum number of scrapers that will run in parallel")
$scrape_manual_join_max_scrapers_slider = 				GUICtrlCreateSliderEx(140, 120, 150, 20, $GUI_DOCKALL, 10, 1, 10)
$scrape_manual_join_scrape_button = 					GUICtrlCreateImageButton("scrape art.ico", 370, 90, 36, _
	"Scrapes game metadata according to the selections above." & @CRLF & _
	@CRLF & _
	"Front Covers will be stored in the Box folder." & @CRLF  & _
	"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
	"Full Covers will be stored in the BoxFull folder." & @CRLF, $GUI_DOCKALL)
$scrape_manual_join_match_art_to_roms_radio = 			GUICtrlCreateRadioEx("Match Art to Roms", 20, 190, 120, 20, True, "", $GUI_DOCKALL)
$scrape_manual_join_match_roms_to_art_radio = 			GUICtrlCreateRadioEx("Match Roms to Art", 140, 190, 120, 20, False, "", $GUI_DOCKALL)
$scrape_manual_join_exclude_uploaded_art_checkbox = 	GUICtrlCreateCheckbox("Exclude Uploaded Art", 260, 190, 120, 20, True)
$scrape_manual_join_refresh_button = 					GUICtrlCreateImageButton("get games art.ico", 400, 190, 36, "Get scraped art plus game names (from the RetroPie) - Alt+R", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
$scrape_manual_join_art_label = 						GUICtrlCreateLabelEx("Art", 20, 230, 70, 20)
$scrape_manual_join_art_files_label = 					GUICtrlCreateLabelEx("0 Files", 180, 230, 70, 20)
$scrape_manual_join_art_list = 							GUICtrlCreateSingleSelectList(20, 250, 200, 420, 500, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
$scrape_manual_join_rom_label = 						GUICtrlCreateLabelEx("Roms without Art", 240, 230, 100, 20)
$scrape_manual_join_rom_files_label = 					GUICtrlCreateLabelEx("0 Files", 400, 230, 70, 20)
$scrape_manual_join_rom_list = 							GUICtrlCreateSingleSelectList(240, 250, 200, 420, -1, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
$scrape_manual_join_upload_button = 					GUICtrlCreateImageButton("upload art.ico", 450, 250, 36, "Upload selected art with game name (to the RetroPie) - Alt+A", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
$scrape_manual_join_upload_gamelist_button = 			GUICtrlCreateImageButton("update list.ico", 450, 625, 36, "Update games list (on the RetroPie) with all art uploaded - Alt+G", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
$scrape_manual_join_art_1_pic = 						GUICtrlCreatePicEx(500, 80, 220, 110, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKTOP + $GUI_DOCKAUTO, True)
$scrape_manual_join_art_2_pic = 						GUICtrlCreatePicEx(500, 200, 220, 110, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKAUTO, True)
$scrape_manual_join_art_3_pic = 						GUICtrlCreatePicEx(500, 320, 220, 110, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKAUTO, True)
$scrape_manual_join_art_4_pic = 						GUICtrlCreatePicEx(500, 440, 220, 110, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKAUTO, True)
$scrape_manual_join_art_5_pic = 						GUICtrlCreatePicEx(500, 560, 220, 110, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKBOTTOM, True)
$scrape_manual_join_down_button = 						GUICtrlCreateImageButton("down.ico", 730, 640, 36, "Move selection down", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
$scrape_manual_join_up_button = 						GUICtrlCreateImageButton("up.ico", 780, 640, 36, "Move selection up", $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUIStartGroup()
$art_1_front = 											GUICtrlCreateRadioEx("Front", 725, 120, 60, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
$art_2_front = 											GUICtrlCreateRadioEx("Front", 725, 240, 60, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
$art_3_front = 											GUICtrlCreateRadioEx("Front", 725, 360, 60, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
$art_4_front = 											GUICtrlCreateRadioEx("Front", 725, 480, 60, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
$art_5_front = 											GUICtrlCreateRadioEx("Front", 725, 600, 60, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
GUIStartGroup()
$art_1_back = 											GUICtrlCreateRadioEx("Back", 785, 120, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
$art_2_back = 											GUICtrlCreateRadioEx("Back", 785, 240, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
$art_3_back = 											GUICtrlCreateRadioEx("Back", 785, 360, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
$art_4_back = 											GUICtrlCreateRadioEx("Back", 785, 480, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)
$art_5_back = 											GUICtrlCreateRadioEx("Back", 785, 600, 40, 20, False, "", $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO, True)

; Config tab

GUICtrlCreateTabItemEx("===> Config")
$boot_config_x = 20
$boot_config_y = 70
$systems_list_config_x = 90
$systems_list_config_y = $boot_config_y
$input_devices_config_x = 20
$input_devices_config_y = 610
$system_config_x = 300
$system_config_y = 70
$game_config_x = 310
$game_config_y = $boot_config_y + 210


GUICtrlCreateGroupEx  ("----> RetroPie", $boot_config_x, $boot_config_y, 60, 70)
$config_boot_edit_config_button = 						GUICtrlCreateImageButton("edit startup.ico", $boot_config_x + 10, $boot_config_y + 20, 36, "Edit the Boot Config of the RetroPie")

GUICtrlCreateGroupEx  ("----> EmulationStation", $systems_list_config_x, $systems_list_config_y, 100, 70)
$config_edit_systems_list_button = 						GUICtrlCreateImageButton("edit consoles.ico", $systems_list_config_x + 10, $systems_list_config_y + 20, 36, "Edit the Systems List of the RetroPie")

GUICtrlCreateGroupEx  ("----> Display", 20, 150, 260, 450)
$display_device_add_button = 							GUICtrlCreateImageButton("add.ico", 30, 170, 28, "Add a new Display Device")
$display_device_delete_button = 						GUICtrlCreateImageButton("delete.ico", 60, 170, 28, "Delete the selected Display Device")
$display_device_scan_modes_button = 					GUICtrlCreateImageButton("scan video modes.ico", 90, 170, 28, "Scan all video modes for the connected Display Device")
$display_label = 										GUICtrlCreateLabel("Video Modes for the ""..."" display", 30, 210, 200, 20)
$display_device_listview = 								GUICtrlCreateListViewEx(30, 230, 240, 360, "Video Mode", 90, "Resolution", 160)

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

GUICtrlCreateGroupEx  ("----> Input", $input_devices_config_x, $input_devices_config_y, 200, 70)
$config_joystick_0_test_button = 											GUICtrlCreateImageButton("joystick0.ico", $input_devices_config_x + 10, $input_devices_config_y + 20, 36, "Joystick 0 test")
;_GUIToolTip_AddTool($tooltip, 0, "The output of this can be used in the configuration of RetroArch", GUICtrlGetHandle($config_joystick_0_test_button))
$config_joystick_1_test_button = 											GUICtrlCreateImageButton("joystick1.ico", $input_devices_config_x + 50, $input_devices_config_y + 20, 36, "Joystick 1 test")
;_GUIToolTip_AddTool($tooltip, 0, "The output of this can be used in the configuration of RetroArch", GUICtrlGetHandle($config_joystick_1_test_button))

GUICtrlCreateGroupEx  ("----> Emulators && Games (3DO)", $system_config_x, $system_config_y, 520, 610)

$config_emulators_games_reload_button = 									GUICtrlCreateButton("Reload from RetroPie", $system_config_x + 270, $system_config_y + 20, 180, 20)
$config_emulators_label = 													GUICtrlCreateLabelEx("Emulators", $system_config_x + 10, $system_config_y + 50, 100, 20, "/opt/retropie/configs/all/videomodes.cfg")
$config_system_listview = 													GUICtrlCreateListViewEx($system_config_x + 10, $system_config_y + 70, 500, 190, "Emulator Name", 200, "Video Mode", 150, "Default Emulator", 120)
$config_games_label = 														GUICtrlCreateLabelEx("Games", $game_config_x + 10, $game_config_y + 20, 100, 20, "/opt/retropie/configs/all/emulators.cfg")
$config_game_listview = 													GUICtrlCreateListViewEx($system_config_x + 10, $game_config_y + 40, 500, 240, "Game Name", 200, "Emulator Name", 200)

GUICtrlCreateGroupEx  ("----> Wiki", $system_config_x + 10, $game_config_y + 290, 110, 75)
$config_wiki_compare_button = 												GUICtrlCreateButton("Compare...", $system_config_x + 20, $game_config_y + 305, 80, 20)
GUICtrlCreateGroupEx  ("----> RetroPie", $system_config_x + 130, $game_config_y + 290, 290, 75)
$config_games_link_games_to_emulator_and_save_button = 						GUICtrlCreateButton("Link Games to Emulator and Save", $system_config_x + 140, $game_config_y + 305, 180, 20)
$config_games_launch_game_button = 											GUICtrlCreateButtonEx("Launch Game", $system_config_x + 330, $game_config_y + 305, 80, 20, "Only works if EmulationStation has been Quit")
$config_games_update_emulator_and_save_game_before_launch_game_checkbox = 	GUICtrlCreateCheckboxEx("Update Emulator to Game and Save before Launch", $game_config_x + 140, $game_config_y + 330, 260, 20, True)
GUICtrlCreateGroupEx  ("----> PC", $system_config_x + 430, $game_config_y + 290, 80, 70)
$config_games_open_button = 												GUICtrlCreateButton("Open", $system_config_x + 430 + 10, $game_config_y + 305, 50, 20)
$config_games_save_as_button = 												GUICtrlCreateButton("Save As", $system_config_x + 430 + 10, $game_config_y + 335, 60, 20)

; Backup tab

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

GUICtrlCreateTabItemEx("") ; end tabitem definition

$status_input = 															GUICtrlCreateStatusInput("Hint - hover mouse over controls for help", 10, 720 - 25, 800 - 20, 20)

$shift_up_dummy = GUICtrlCreateDummy()
$shift_down_dummy = GUICtrlCreateDummy()
GUISetAccelerators($main_aAccelKeys, $main_gui)


$art_gui = 																	GUICreate($app_name, 640, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
$art_big_pic = 																GUICtrlCreatePic("", 0, 0, 640, 480)
$art_gui2 = 																GUICreate($app_name, 1024, 576, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
$art_big_pic2 = 															GUICtrlCreatePic("", 0, 0, 1024, 576)
$art_gui3 = 																GUICreate("Child", 1024, 576, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
$art_big_pic3 = 															GUICtrlCreatePic("", 0, 0, 1024, 576) ;, 0, 0)

$gameslist_gui = 															GUICreate($app_name, 640, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
GUICtrlCreateGroupEx  ("----> RetroPie (/opt/retropie/configs/all/emulationstation/gamelists/n64/gamelist.xml)", 5, 5, 430, 40)
$gameslist_load_button = 													GUICtrlCreateButton("Load", 10, 20, 80, 20)
$gameslist_save_button = 													GUICtrlCreateButton("Save", 100, 20, 80, 20)
$gameslist_restart_emulationstation_checkbox = 								GUICtrlCreateCheckboxEx("Restart EmulationStation after Save", 190, 20, 200, 20, True)
GUICtrlCreateGroupEx  ("----> PC", 450, 5, 180, 40)
$gameslist_open_button = 													GUICtrlCreateButton("Open", 455, 20, 80, 20)
$gameslist_save_as_button = 												GUICtrlCreateButton("Save As", 545, 20, 80, 20)
$gameslist_edit = 															GUICtrlCreateEdit("", 10, 50, 620, 400)
$gameslist_status_input = 													GUICtrlCreateStatusInput("", 10, 480 - 25, 640 - 20, 20)

$boot_config_gui = 															GUICreate($app_name, 640, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
GUICtrlCreateGroupEx  ("----> RetroPie (/boot/config.txt)", 5, 5, 180, 40)
$boot_config_load_button = 													GUICtrlCreateButton("Load", 10, 20, 80, 20)
$boot_config_save_button = 													GUICtrlCreateButton("Save", 100, 20, 80, 20)
GUICtrlCreateGroupEx  ("----> PC", 200, 5, 180, 40)
$boot_config_open_button = 													GUICtrlCreateButton("Open", 205, 20, 80, 20)
$boot_config_save_as_button = 												GUICtrlCreateButton("Save As", 295, 20, 80, 20)
$boot_config_edit = 														GUICtrlCreateEdit("", 10, 50, 620, 400)
$boot_config_status_input = 												GUICtrlCreateInput("", 10, 480 - 25, 640 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)

$systems_list_gui = 														GUICreate($app_name, 800, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
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



$upload_data_to_retropie_gui = 												GUICreate($app_name & " - Upload Game List to RetroPie", 1024, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
$upload_data_to_retropie_upload_button = 									GUICtrlCreateButton("Upload game list (left side)", 10, 5, 200, 40)
$upload_data_to_retropie_ie = _IECreateEmbedded()
GUICtrlCreateObj($upload_data_to_retropie_ie, 10, 50, 1004, 400)
$upload_data_to_retropie_status_input = 									GUICtrlCreateStatusInput("", 10, 480 - 25, 640 - 20, 20)

$upload_data_to_retropie_dummy = 											GUICtrlCreateDummy()
GUISetAccelerators($upload_data_aAccelKeys, $upload_data_to_retropie_gui)


$compare_games_to_wiki_gui = 												GUICreate($app_name & " - Compare Game List to Wiki page", 1024, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
$compare_games_to_wiki_accept_button = 										GUICtrlCreateButton("Accept Wiki page game list (left side)", 10, 5, 200, 40)
$compare_games_to_wiki_ie = _IECreateEmbedded()
GUICtrlCreateObj($compare_games_to_wiki_ie, 10, 50, 1004, 400)
$compare_games_to_wiki_status_input = GUICtrlCreateInput("", 10, 480 - 25, 640 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)

$compare_games_to_wiki_dummy = 												GUICtrlCreateDummy()
GUISetAccelerators($compare_aAccelKeys, $compare_games_to_wiki_gui)


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


		Case $display_device_add_button

			$result = InputBox($app_name, "Enter a name to identify the device", "", "", 240, 140, Default, Default, 0, $main_gui)

			if StringLen($result) > 0 Then

				Local $display_device_filename = $app_data_dir & "\display device " & $result & ".txt"
				FileWrite($display_device_filename, "")
				_GUICtrlComboBox_AddString($display_device_name_combo, $result)
				_GUICtrlComboBox_SelectString($display_device_name_combo, $result)
			EndIf


		Case $display_device_delete_button

			Local $display_device_filename = $app_data_dir & "\display device " & GUICtrlRead($display_device_name_combo) & ".txt"

			if FileExists($display_device_filename) Then

				FileDelete($display_device_filename)
			EndIf

			_GUICtrlComboBox_DeleteString($display_device_name_combo, _GUICtrlComboBox_GetCurSel($display_device_name_combo))
			_GUICtrlComboBox_SetCurSel($display_device_name_combo, 0)

		Case $display_device_scan_modes_button

			_GUICtrlListView_DeleteAllItems($display_device_listview)
			GUICtrlSetData($status_input, "Executing ""/opt/retropie/supplementary/mesa-drm/modetest -c"" on the RetroPie ...")
			$result = plink("/opt/retropie/supplementary/mesa-drm/modetest -c", 2)
			GUICtrlSetData($status_input, "")
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

				GUICtrlSetData($status_input, "No video modes detected. RetroPie must be active on your display, then try again.")
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


		Case $config_wiki_compare_button

			GUISetState(@SW_DISABLE, $main_gui)
			_IENavigate($compare_games_to_wiki_ie, "about:blank")
			GUISetState(@SW_SHOW, $compare_games_to_wiki_gui)
			$current_gui = $compare_games_to_wiki_gui

			; convert the wiki games data into a RetroPie emulator.cfg formatted file

			GUICtrlSetData($compare_games_to_wiki_status_input, "Reading https://github.com/seanhaydongriffin/Seans-RetroPie-Companion/wiki/N64-Emulator-Game-Compatibility")
			Local $iPID = Run('curl.exe -s -k -H "Content-Type: text/html; charset=utf-8" https://github.com/seanhaydongriffin/Seans-RetroPie-Companion/wiki/N64-Emulator-Game-Compatibility', @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
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
			Local $wiki_game_emulator_arr[0]
			Local $game_name = ""
			Local $emulator_name = ""

			for $i = 0 to (UBound($html_arr) - 1)

				if StringCompare($html_arr[$i], "<th>Game</th>") = 0 Then

					$found_game_table = True
				EndIf

				if $found_game_table = True Then

					if StringCompare($html_arr[$i], "<tr>") = 0 Then

						if $searching_for_game_emulator = True Then

							_ArrayAdd($wiki_game_emulator_arr, $game_name & " = """ & $default_emulator & """")
						EndIf

						$searching_for_game_emulator = False
						$searching_for_game_name = True
					EndIf

					Local $arr = StringRegExp($html_arr[$i], "<td>(?U)(.+?)</td>", 3)

					if $searching_for_game_name = True and UBound($arr) > 0 Then

						$searching_for_game_name = False
						$game_name = $arr[0]
						$searching_for_game_emulator = True
						$emulator_index = -2

						; convert game name (from the Wiki) to a short rom name

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

						for $j = StringLen($game_name) to 1 Step -1

							Local $rom_name_search_text = StringLeft($game_name, $j)
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

							; if only a single game name from the Wiki is matching

							if UBound($game_name_match) = 1 Then

								$game_name = $game_name_match[0]
								ExitLoop
							EndIf

							; if multiple game names from the Wiki are matching

							if UBound($game_name_match) > 1 Then

								; find the game name that is the closest match (lowest number of differences)

								Local $least_num_diffs = 9999

								for $k = 0 to (UBound($game_name_match) - 1)

									$num_diffs = _Typos($rom_name_search_text, $game_name_match[$k])

									if $num_diffs < $least_num_diffs Then

										$least_num_diffs = $num_diffs
										$game_name = $game_name_match[$k]
										ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $game_name = ' & $game_name & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
									EndIf
								Next

								ExitLoop
							EndIf
						Next
					EndIf

					if $searching_for_game_emulator = True Then

						$emulator_index = $emulator_index + 1

						if StringCompare($html_arr[$i], "<td><strong>best</strong></td>") = 0 Then

							_ArrayAdd($wiki_game_emulator_arr, $game_name & " = """ & $wiki_emulator[$emulator_index] & """")
							$searching_for_game_emulator = False
						EndIf
					EndIf
				EndIf
			Next

			if FileExists($wiki_emulators_cfg_file_path) = True Then

				FileDelete($wiki_emulators_cfg_file_path)
			EndIf

			_ArraySort($wiki_game_emulator_arr)
			FileWrite($wiki_emulators_cfg_file_path, StringStripWS(_ArrayToString($wiki_game_emulator_arr, @CRLF), 3))

			; convert the games list into a RetroPie emulator.cfg formatted file

			$gameslist_emulators_str = ""

			for $i = 0 to (_GUICtrlListView_GetItemCount($config_game_listview) - 1)

				Local $game_name = _GUICtrlListView_GetItemText($config_game_listview, $i, 0)
				Local $emulator_name = _GUICtrlListView_GetItemText($config_game_listview, $i, 1)

				if StringLen($gameslist_emulators_str) > 0 Then

					$gameslist_emulators_str = $gameslist_emulators_str & @CRLF
				EndIf

				$gameslist_emulators_str = $gameslist_emulators_str & $game_name & " = """ & $emulator_name & """"
			Next

			Local $gameslist_emulators_cfg_file_path = $app_data_dir & "\gameslist_emulators.cfg"

			if FileExists($gameslist_emulators_cfg_file_path) = True Then

				FileDelete($gameslist_emulators_cfg_file_path)
			EndIf

			FileWrite($gameslist_emulators_cfg_file_path, $gameslist_emulators_str)

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









		Case $config_boot_edit_config_button

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


		Case $config_reboot_button

			GUICtrlSetData($status_input, "Restarting the RetroPie ...")
			plink("sudo reboot")
			GUICtrlSetData($status_input, "")

		Case $config_shutdown_button

			GUICtrlSetData($status_input, "Shutting down the RetroPie ...")
			plink("sudo shutdown -h now")
			GUICtrlSetData($status_input, "")

		Case $config_restart_emulationstation_button

			GUICtrlSetData($status_input, "Restarting EmulationStation ...")
			plink("sudo touch /tmp/es-restart")
			plink("sudo pkill -f \""/opt/retropie/supplementary/.*/emulationstation([^.]|$)\""")
			GUICtrlSetData($status_input, "")

;		Case $config_shutdown_emulationstation_button

;			GUICtrlSetData($status_input, "Shutting down EmulationStation ...")
;			plink("sudo touch /tmp/es-shutdown")
;			plink("sudo pkill -f \""/opt/retropie/supplementary/.*/emulationstation([^.]|$)\""")
;			GUICtrlSetData($status_input, "")

		Case $config_quit_emulationstation_button

			GUICtrlSetData($status_input, "Quitting EmulationStation ...")
			plink("sudo pkill -f \""/opt/retropie/supplementary/.*/emulationstation([^.]|$)\""")
			GUICtrlSetData($status_input, "")

		Case $config_joystick_0_test_button

			Run("plink.exe -ssh " & GUICtrlRead($retropie_hostname_input) & " -l " & GUICtrlRead($retropie_username_input) & " -pw " & GUICtrlRead($retropie_password_input) & " -batch jstest /dev/input/js0", @ScriptDir)

		Case $config_joystick_1_test_button

			Run("plink.exe -ssh " & GUICtrlRead($retropie_hostname_input) & " -l " & GUICtrlRead($retropie_username_input) & " -pw " & GUICtrlRead($retropie_password_input) & " -batch jstest /dev/input/js1", @ScriptDir)


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


		Case $config_emulators_games_reload_button

			ReloadEmulatorsAndGamesConfig()

		Case $system_open_wiki_page_button

			ShellExecute("https://github.com/seanhaydongriffin/Seans-RetroPie-Companion/wiki/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "-Emulator-Game-Compatibility")

		case $config_games_link_games_to_emulator_and_save_button

			update_games_emulator()
			save_games()

		Case $config_games_launch_game_button

			if GUICtrlRead($config_games_update_emulator_and_save_game_before_launch_game_checkbox) = $GUI_CHECKED Then

				update_games_emulator()
				save_games()
			EndIf

			Local $selected_game = _GUICtrlListView_GetItemText($config_game_listview, Number(_GUICtrlListView_GetSelectedIndices($config_game_listview)), 0)
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $selected_game = ' & $selected_game & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

			; find the rom that matches the game name from emulators.cfg

			for $each_all_roms_line in $all_roms_line_arr

				_PathSplit($each_all_roms_line, $sDrive1, $sDir1, $sFileName1, $sExtension1)
				Local $short_rom_name = $roms_path_dict.Item(GUICtrlRead($system_combo)) & "_" & $sFileName1
				$short_rom_name = StringReplace($short_rom_name, " ", "")
				$short_rom_name = StringReplace($short_rom_name, "(", "")
				$short_rom_name = StringReplace($short_rom_name, ")", "")
				$short_rom_name = StringReplace($short_rom_name, ",", "")
				$short_rom_name = StringReplace($short_rom_name, ".", "")
				$short_rom_name = StringReplace($short_rom_name, "[", "")
				$short_rom_name = StringReplace($short_rom_name, "]", "")
				$short_rom_name = StringReplace($short_rom_name, "!", "")
				$short_rom_name = StringReplace($short_rom_name, "'", "")

				if StringCompare($short_rom_name, $selected_game) = 0 Then

					Local $rom_name_for_runcommand = $each_all_roms_line
					$rom_name_for_runcommand = StringReplace($rom_name_for_runcommand, " ", "\ ")
					$rom_name_for_runcommand = StringReplace($rom_name_for_runcommand, "(", "\(")
					$rom_name_for_runcommand = StringReplace($rom_name_for_runcommand, ")", "\)")

					; quitting emulationstation (otherwise the game runs underneath emulationstation) and launching the rom

					GUICtrlSetData($status_input, "Quitting EmulationStation and Launching """ & $sFileName1 & $sExtension1 & """ ... (to restart EmulationStation click RetroPie Restart)")
					plink("sudo pkill -f \""/opt/retropie/supplementary/.*/emulationstation([^.]|$)\""")

					Local $plink_cmd = "sudo /opt/retropie/supplementary/runcommand/runcommand2.sh 0 _SYS_ n64 """ & $rom_name_for_runcommand & """"
					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $plink_cmd = ' & $plink_cmd & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
					$result = plink($plink_cmd, 2)

				EndIf

			Next




		Case $config_games_open_button

			$result = FileOpenDialog($app_name, $app_data_dir, "Config files (*.cfg)", 0, "Seans RetroPie Companion n64 emulators.cfg", $main_gui)

			if @error = 0 Then

				Enable_Config()
				GUICtrlSetData($config_games_label, "Games")
				_GUICtrlListView_DeleteAllItems($config_game_listview)

				Local $emulators_cfg_arr
				_FileReadToArray($result, $emulators_cfg_arr, 0, "=")

				for $i = 0 to (UBound($emulators_cfg_arr) - 1)

					$emulators_cfg_arr[$i][0] = StringStripWS($emulators_cfg_arr[$i][0], 3)
					$emulators_cfg_arr[$i][1] = StringReplace($emulators_cfg_arr[$i][1], """", "")
					$emulators_cfg_arr[$i][1] = StringStripWS($emulators_cfg_arr[$i][1], 3)
				Next

				_GUICtrlListView_BeginUpdate($config_game_listview)
				_GUICtrlListView_AddArray($config_game_listview, $emulators_cfg_arr)

				GUICtrlSetData($status_input, "Reading directory from /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " on the RetroPie ...")
				$result = plink("ls /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/*.{bin,zip,lha,a52,a78,j64,lnx,rom,nes,mgw,gba,love,7z,n64,z64,nds,iso,32x,sfc,smc,vec,ws}", 2)
				Local $all_roms_line_arr = StringSplit($result, @LF, 3)

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
				Enable_Config($GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE)
				GUICtrlSetData($config_games_label, "Games (" & _GUICtrlListView_GetItemCount($config_game_listview) & ")")
				GUICtrlSetData($status_input, "Games updated.")

			EndIf

		Case $config_games_save_as_button

			$result = FileSaveDialog($app_name, $app_data_dir, "Config files (*.cfg)", 0, "Seans RetroPie Companion n64 emulators.cfg", $main_gui)

			if @error = 0 Then

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

				GUICtrlSetData($status_input, "Erasing " & $result & " ...")
				FileDelete($result)
				GUICtrlSetData($status_input, "Saving " & $result & " ...")
				FileWrite($result, $emulators_cfg_str)
				GUICtrlSetData($status_input, "Saved " & $result & ".")
				Enable_Config($GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE)
			EndIf

		case $config_edit_systems_list_button

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

			; load the Seans RetroPie Companion Systems Custom Order.cfg if that exists

			if FileExists(@ScriptDir & "\Seans RetroPie Companion Systems Custom Order.cfg") = True Then

				Local $custom_order_arr
				_FileReadToArray(@ScriptDir & "\Seans RetroPie Companion Systems Custom Order.cfg", $custom_order_arr, 0)

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





		case $scrape_metadata_scrape_button

			Local $system_name
			Local $scraper_exe

			if StringCompare(GUICtrlRead($scrape_metadata_website_combo), "Atarimania") = 0 Then

				$system_name = "Atarimania"
				$scraper_exe = "Seans Atarimania Scraper.exe"
			endif

			if StringCompare(GUICtrlRead($scrape_metadata_website_combo), "LaunchBox") = 0 Then

				$system_name = "LaunchBox"
				$scraper_exe = "Seans LaunchBox Scraper.exe"
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
				Local $game_path_value = _XMLGetValue($gamelist_xml_dom, "/gameList/*/path[text()='./" & $rom_filename_arr[$i] & "']")
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

		case $shift_up_dummy

			Local $arr = _GUICtrlListBox_GetSelItems($scrape_manual_join_rom_list)
			_GUICtrlListBox_SelItemRange($scrape_manual_join_rom_list, $arr[UBound($arr)-1], $arr[UBound($arr)-1], False)

		case $shift_down_dummy

			Local $arr = _GUICtrlListBox_GetSelItems($scrape_manual_join_rom_list)
			_GUICtrlListBox_SelItemRange($scrape_manual_join_rom_list, $arr[UBound($arr)-1]+1, $arr[UBound($arr)-1]+1)



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

		case $scrape_manual_join_match_art_to_roms_radio

			GUICtrlSetPos($scrape_manual_join_art_label, 20, 180, 100, 20)
			GUICtrlSetPos($scrape_manual_join_art_files_label, 180, 180, 70, 20)
			GUICtrlSetPos($scrape_manual_join_art_list, 20, 200, 200, 420)
			GUICtrlSetPos($scrape_manual_join_rom_label, 240, 180, 100, 20)
			GUICtrlSetPos($scrape_manual_join_rom_files_label, 400, 180, 70, 20)
			GUICtrlSetPos($scrape_manual_join_rom_list, 240, 200, 200, 420)


		case $scrape_manual_join_match_roms_to_art_radio

			GUICtrlSetPos($scrape_manual_join_rom_label, 20, 180, 100, 20)
			GUICtrlSetPos($scrape_manual_join_rom_files_label, 180, 180, 70, 20)
			GUICtrlSetPos($scrape_manual_join_rom_list, 20, 200, 200, 420)
			GUICtrlSetPos($scrape_manual_join_art_label, 240, 180, 100, 20)
			GUICtrlSetPos($scrape_manual_join_art_files_label, 400, 180, 70, 20)
			GUICtrlSetPos($scrape_manual_join_art_list, 240, 200, 200, 420)





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

		case $scrape_manual_join_art_1_pic

			if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-1.jpg") = True Then

				GUICtrlSetImage($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-1.jpg")
			Else

				GUICtrlSetImagePNG($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-1.png")
			EndIf

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_2_pic

			if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-2.jpg") = True Then

				GUICtrlSetImage($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-2.jpg")
			Else

				GUICtrlSetImagePNG($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-2.png")
			EndIf

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_3_pic

			if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-3.jpg") = True Then

				GUICtrlSetImage($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-3.jpg")
			Else

				GUICtrlSetImagePNG($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-3.png")
			EndIf

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_4_pic

			if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-4.jpg") = True Then

				GUICtrlSetImage($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-4.jpg")
			Else

				GUICtrlSetImagePNG($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-4.png")
			EndIf

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_5_pic

			if FileExists($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-5.jpg") = True Then

				GUICtrlSetImage($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-5.jpg")
			Else

				GUICtrlSetImagePNG($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-5.png")
			EndIf

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui


		Case $scrape_button

			Local $system_name
			Local $scraper_exe

			if StringCompare(GUICtrlRead($scrape_auto_join_website_combo), "RF Generation") = 0 Then

				$system_name = "RF Generation"
				$scraper_exe = "Seans RF Generation Scraper.exe"
			endif

			if StringCompare(GUICtrlRead($scrape_auto_join_website_combo), "Moby Games") = 0 Then

				$system_name = "Moby Games"
				$scraper_exe = "Seans Moby Games Scraper.exe"
			endif

			if StringCompare(GUICtrlRead($scrape_auto_join_website_combo), "The Cover Project") = 0 Then

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


		case $scrape_manual_join_scrape_button

			Local $system_name
			Local $scraper_exe

			if StringCompare(GUICtrlRead($scrape_manual_join_website_combo), "Atarimania") = 0 Then

				$system_name = "Atarimania"
				$scraper_exe = "Seans Atarimania Scraper.exe"
			endif

			if StringCompare(GUICtrlRead($scrape_manual_join_website_combo), "LaunchBox") = 0 Then

				$system_name = "LaunchBox"
				$scraper_exe = "Seans LaunchBox Scraper.exe"
			endif

			GUICtrlSetData($status_input, "Getting number of pages from " & $system_name & " ...")
			Local $iPID = Run($scraper_exe & " """ & GUICtrlRead($system_combo) & """", @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
			ProcessWaitClose($iPID)
			Local $num_pages = StdoutRead($iPID)
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $num_pages = ' & $num_pages & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			GUICtrlSetData($status_input, "")

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

				GUICtrlSetData($status_input, "Waiting for " & $num_scrapers_running & " scrapers to complete ...")
				Sleep(5000)
			Until $num_scrapers_running <= 0

			GUICtrlSetData($status_input, "")
#ce


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

		Case $scrape_manual_join_refresh_button


			_GUICtrlListBox_ResetContent($scrape_manual_join_art_list)
			_GUICtrlListBox_ResetContent($scrape_manual_join_rom_list)
;			Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"

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

;			Local $mismatched_rom_filename_arr[0][11]

;			$gamelist_xml_dom = _XMLLoadXML(FileRead($gamelist_filepath), "")

			; find roms that aren't in gamelist.xml

;			for $i = 0 to (UBound($rom_filename_arr) - 1)

;				ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $rom_filename_arr[$i] = ' & $rom_filename_arr[$i] & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
;				Local $game_path_value = _XMLGetValue($gamelist_xml_dom, "/gameList/*/path[text()='./" & $rom_filename_arr[$i] & "']")
;				ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $game_path_value = ' & $game_path_value & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

;				if StringLen($game_path_value) = 0 Then

;					_ArrayAdd($mismatched_rom_filename_arr, "./" & $rom_filename_arr[$i] & "|" & $rom_filename_arr[$i] & "|||||||||")
;				EndIf
;			Next

;_ArrayDisplay($mismatched_rom_filename_arr)

			; find metadata in gamelist.xml games that mismatches the scraped metadata

			; populate the roms list

;			Local $tmp_roms_list_arr[0]
;			Local $gamelist_num_nodes = _XMLGetNodeCount($gamelist_xml_dom, "/gameList/game")
;			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $gamelist_num_nodes = ' & $gamelist_num_nodes & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

;			for $i = 0 to (UBound($mismatched_rom_filename_arr) - 1)

;				_ArrayAdd($tmp_roms_list_arr, $mismatched_rom_filename_arr[$i][1])
;			Next

;			for $i = 1 to $gamelist_num_nodes

;				Local $game_name = _XMLGetValue($gamelist_xml_dom, "/gameList/game[" & $i & "]/name")
;				_ArrayAdd($tmp_roms_list_arr, $game_name)

;			Next

;			_ArraySort($tmp_roms_list_arr)

			_GUICtrlListBox_BeginUpdate($scrape_manual_join_rom_list)

;			for $i = 0 to (UBound($tmp_roms_list_arr) - 1)
			for $i = 0 to (UBound($rom_filename_arr) - 1)

				_GUICtrlListBox_InsertString($scrape_manual_join_rom_list, $rom_filename_arr[$i])
			Next

			_GUICtrlListBox_EndUpdate($scrape_manual_join_rom_list)

;			Local $arr = _FileListToArrayRec($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Metadata", "*.xml", 1, 0, 1)
			;_ArrayDisplay($arr)
			;Exit
;			Local $num_files = 0

;			for $i = 1 to $arr[0]

;				Local $metadata_name = StringReplace($arr[$i], ".xml", "")
;				_GUICtrlListBox_InsertString($scrape_metadata_scraped_data_list, $metadata_name)
;			Next

;			_GUICtrlListBox_SetCurSel($scrape_metadata_scraped_data_list, 0)
;			GUICtrlSetState($scrape_metadata_scraped_data_list, $GUI_FOCUS)
















;			_GUICtrlListBox_ResetContent($scrape_manual_join_art_list)
;			_GUICtrlListBox_ResetContent($scrape_manual_join_rom_list)
;			Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"

			Local $arr = _FileListToArrayRec($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box", "*.jpg;*.png", 1, 0, 1)
			;_ArrayDisplay($arr)
			;Exit
			Local $num_files = 0

			_GUICtrlListBox_BeginUpdate($scrape_manual_join_art_list)

			for $i = 1 to $arr[0]

				Local $art_name = StringRegExpReplace($arr[$i], "-[0-9]*.(?:jpg|png)", "")

				; if there are at least 2 images for this artwork

				;if $i < $arr[0] And (StringInStr($arr[$i + 1], "-2.jpg") > 0 or StringInStr($arr[$i + 1], "-2.png") > 0) Then

					if _GUICtrlListBox_FindString($scrape_manual_join_art_list, $art_name, True) < 0 Then

						_GUICtrlListBox_InsertString($scrape_manual_join_art_list, $art_name)
						$num_files = $num_files + 1
						GUICtrlSetData($scrape_manual_join_art_files_label, $num_files & " Files")
					EndIf
				;EndIf

			Next

			_GUICtrlListBox_EndUpdate($scrape_manual_join_art_list)

;			GUICtrlSetData($status_input, "Connecting to the RetroPie ...")

;			$result = _WinSCP_Open()

;			if $result = False Then

;				GUICtrlSetData($status_input, $_WinSCP_COM_error_description)
;			Else

;				GUICtrlSetData($status_input, "")

;				Local $art_filename_arr = _WinSCP_ListDirectory_Files("/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)), "-full-cover.jpg")
;				_ArraySort($art_filename_arr)
;				Local $rom_filename_arr = _WinSCP_ListDirectory_Files("/home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)), ".bin|.zip|.lha|.a52|.a78|.j64|.lnx|.rom|.nes|.mgw|.gba|.love|.7z|.n64|.z64|.nds|.iso|.32x|.sfc|.smc|.vec|.ws")
;				_ArraySort($rom_filename_arr)
				;_ArrayDisplay($rom_filename_arr)

;				_GUICtrlListBox_BeginUpdate($scrape_manual_join_rom_list)

;				Local $num_roms_without_art = 0

;				for $i = 0 to (UBound($rom_filename_arr) - 1)
;					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $i = ' & $i & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

;					_PathSplit($rom_filename_arr[$i], $sDrive1, $sDir1, $sFileName1, $sExtension1)

;					if _ArrayBinarySearch($art_filename_arr, $sFileName1 & "-full-cover.jpg") < 0 Then

;						_GUICtrlListBox_InsertString($scrape_manual_join_rom_list, $rom_filename_arr[$i])
;						$num_roms_without_art = $num_roms_without_art + 1
;						GUICtrlSetData($scrape_manual_join_rom_files_label, $num_roms_without_art & " Files")
;					EndIf
;				Next

;				_GUICtrlListBox_EndUpdate($scrape_manual_join_rom_list)
;			EndIf


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

			Local $msg = "Copying to the RetroPie - " & $sFileName1 & "-full-cover.jpg ..."
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $msg = ' & $msg & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			GUICtrlSetData($status_input, $msg)
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
				;	it's assumed the WinSCP connection is still open from the Refresh button above

				Local $msg = "Saving to the RetroPie - " & $sFileName1 & "-full-cover.jpg ..."
				ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $msg = ' & $msg & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
				GUICtrlSetData($status_input, $msg)
				;$result = _WinSCP_PutFiles($new_art_path, "/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $sFileName1 & "-full-cover.jpg")
				pscp_upload($new_art_path, "/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $sFileName1 & "-full-cover.jpg")
				GUICtrlSetData($status_input, "Saved """ & $sFileName1 & "-full-cover.jpg"" to the RetroPie")

;				if $result = False Then

;					GUICtrlSetData($status_input, $_WinSCP_COM_error_description)
;				Else

					Local $num_rom_files = Number(StringReplace(GUICtrlRead($scrape_manual_join_rom_files_label), " Files", ""))
					;Local $rom_list_selected_index = _GUICtrlListBox_GetCurSel($scrape_manual_join_rom_list)

					_GUICtrlListBox_DeleteString($scrape_manual_join_rom_list, $selected_indices[$index_num])
					$num_rom_files = $num_rom_files - 1
					GUICtrlSetData($scrape_manual_join_rom_files_label, $num_rom_files & " Files")
;				EndIf
			Next

			Local $num_art_files = Number(StringReplace(GUICtrlRead($scrape_manual_join_art_files_label), " Files", ""))
			Local $art_list_selected_index = _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)

			if GUICtrlRead($scrape_manual_join_exclude_uploaded_art_checkbox) = $GUI_CHECKED Then

				_GUICtrlListBox_DeleteString($scrape_manual_join_art_list, $art_list_selected_index)
				$num_art_files = $num_art_files - 1
			EndIf

			GUICtrlSetData($scrape_manual_join_art_files_label, $num_art_files & " Files")

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

			GUICtrlSetData($status_input, "")
			GUICtrlSetState($scrape_manual_join_art_list, $GUI_ENABLE)
			GUICtrlSetState($scrape_manual_join_rom_list, $GUI_ENABLE)
			GUICtrlSetState($scrape_manual_join_upload_button, $GUI_ENABLE)

			if GUICtrlRead($scrape_manual_join_match_roms_to_art_radio) = $GUI_CHECKED Then

				;GUICtrlSetState($scrape_manual_join_rom_list, $GUI_ENABLE)
				GUICtrlSetState($scrape_manual_join_rom_list, $GUI_FOCUS)
				_GUICtrlListBox_SetCaretIndex($scrape_manual_join_rom_list, $selected_indices[1])
				_GUICtrlListBox_ClickItem($scrape_manual_join_rom_list, $selected_indices[1])
			EndIf


		Case $scrape_auto_join_upload_gamelist_button

			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $gameslist_gui)
			$current_gui = $gameslist_gui

			$result = CreateGamelist()

			GUICtrlSetData($gameslist_edit, $result)
			GUICtrlSetData($gameslist_status_input, "")

		Case $gameslist_save_button

			Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"

			if FileExists($gamelist_filepath) = True Then

				FileDelete($gamelist_filepath)
			EndIf

			$xml = StringReplace(GUICtrlRead($gameslist_edit), @CRLF, @LF)			; unix end of line characters
			FileWrite($gamelist_filepath, $xml)

			Local $msg = "Saving """ & $gamelist_filepath & """ to ""/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml"""
			ConsoleWrite($msg & @CRLF)
			GUICtrlSetData($gameslist_status_input, $msg)
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


		Case $scrape_manual_join_upload_gamelist_button


			Local $gamelist_filepath = $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\gamelist.xml"

			GUICtrlSetData($status_input, "Downloading /opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
			pscp_download("/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml", $gamelist_filepath)
			GUICtrlSetData($status_input, "Downloaded " & $gamelist_filepath)

			GUICtrlSetData($status_input, "Updating gamelist.xml ...")

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

			GUICtrlSetData($status_input, "Uploading " & $gamelist_filepath)
			pscp_upload($gamelist_filepath, "/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
			GUICtrlSetData($status_input, "Uploaded " & $gamelist_filepath)



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
WEnd

_GDIPlus_ShutDown ()


