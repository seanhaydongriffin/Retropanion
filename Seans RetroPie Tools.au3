;#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
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
#include <GuiListBox.au3>
#include <GuiTab.au3>
#include <IE.au3>
#include "WinSCP.au3"
#include <GDIPlus.au3>
#include "GUIScrollbars_Ex.au3"
#Include "_XMLDomWrapper2.au3"



_GDIPlus_Startup()

Local $app_name = "Seans RetroPie Tools"

; Fuzzy match rom filenames to artwork from RF Generation

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
$download_path_dict.Add("3DO", 										"3DO")
$download_path_dict.Add("Amstrad CPC 464", 							"Amstrad_CPC_464")
$download_path_dict.Add("Apple II / Apple III", 					"")
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
$roms_path_dict.Add("3DO", 										"3do")
$roms_path_dict.Add("Amstrad CPC 464", 							"amstradcpc")
$roms_path_dict.Add("Apple II / Apple III", 					"apple2")
$roms_path_dict.Add("Atari 2600", 								"atari2600")
$roms_path_dict.Add("Atari 5200", 								"atari5200")
$roms_path_dict.Add("Atari 7800", 								"atari7800")
$roms_path_dict.Add("Atari 8-bit Family", 						"atari800")
$roms_path_dict.Add("Atari Jaguar", 							"atarijaguar")
$roms_path_dict.Add("Atari Lynx", 								"atarilynx")
$roms_path_dict.Add("Atari ST / TT / Falcon", 					"atarist")
$roms_path_dict.Add("Bandai WonderSwan", 						"wonderswan")
$roms_path_dict.Add("Bandai WonderSwan Color / SwanCrystal", 	"wonderswancolor")
$roms_path_dict.Add("Coleco / CBS ColecoVision", 				"coleco")
$roms_path_dict.Add("Commodore 64 / 128", 						"c64")
$roms_path_dict.Add("Commodore Amiga", 							"amiga")
$roms_path_dict.Add("Dragon 32 / 64", 							"dragon32")
$roms_path_dict.Add("GCE Vectrex / Bandai Kousokusen", 			"vectrex")
$roms_path_dict.Add("LaserDisc", 								"daphne")
$roms_path_dict.Add("Magnavox Odyssey^2 / VideoPac", 			"videopac")
$roms_path_dict.Add("Mattel Intellivision", 					"intellivision")
$roms_path_dict.Add("NEC PC Engine / TurboGrafx-16", 			"pcengine")
$roms_path_dict.Add("Nintendo 64", 								"n64")
$roms_path_dict.Add("Nintendo DS", 								"nds")
$roms_path_dict.Add("Nintendo Famicom Disk System", 			"fds")
$roms_path_dict.Add("Nintendo Game & Watch", 					"gameandwatch")
$roms_path_dict.Add("Nintendo Game Boy", 						"gb")
$roms_path_dict.Add("Nintendo Game Boy Advance", 				"gba")
$roms_path_dict.Add("Nintendo Game Boy Color", 					"gbc")
$roms_path_dict.Add("Nintendo GameCube", 						"gc")
$roms_path_dict.Add("Nintendo NES / Famicom", 					"nes")
$roms_path_dict.Add("Nintendo SNES / Super Famicom", 			"snes")
$roms_path_dict.Add("Sega 32X", 								"sega32x")
$roms_path_dict.Add("Sega CD / Mega CD", 						"segacd")
$roms_path_dict.Add("Sega Dreamcast", 							"dreamcast")
$roms_path_dict.Add("Sega Game Gear", 							"gamegear")
$roms_path_dict.Add("Sega Genesis / Mega Drive", 				"megadrive")
$roms_path_dict.Add("Sega Saturn", 								"saturn")
$roms_path_dict.Add("Sega SG-1000 / SC-3000", 					"sg-1000")
$roms_path_dict.Add("SNK Neo Geo Pocket", 						"ngp")
$roms_path_dict.Add("SNK Neo Geo Pocket Color", 				"ngpc")
$roms_path_dict.Add("Sony PlayStation", 						"psx")
$roms_path_dict.Add("Sony PlayStation 2", 						"")
$roms_path_dict.Add("Sony PSP", 								"psp")



Local $local_path = "F:\RetroPie"
Local $ImageMagick_path = "C:\Program Files\ImageMagick-7.0.11-Q16-HDRI"
Local $sDrive = "", $sDir = "", $sFileName = "", $sExtension = ""
Local $sDrive1 = "", $sDir1 = "", $sFileName1 = "", $sExtension1 = ""
Local $sDrive2 = "", $sDir2 = "", $sFileName2 = "", $sExtension2 = ""
Local $alphanumeric_arr[36] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
;Local $alphanumeric_arr[13] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C"]
Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
Global $current_gui
Global $downloaded_images_path = "~/.emulationstation/downloaded_images"
Global $wiki_emulators_cfg_file_path = @ScriptDir & "\wiki_emulators.cfg"
Global $default_emulator
Global $all_roms_line_arr
Global $result = 1

; MAIN GUI


Global $main_gui = GUICreate($app_name, 840, 720, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_MAXIMIZEBOX, $WS_SIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU))
Global $tooltip = _GUIToolTip_Create(0) ; default style tooltip
_GUIToolTip_SetMaxTipWidth($tooltip, 300)

Global $system_label = GUICtrlCreateLabel("System", 20, 5, 80, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, "The system to scrape the box art for", GUICtrlGetHandle($system_label))
Global $system_combo = GUICtrlCreateCombo("", 90, 5, 250, 20, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
GUICtrlSetResizing(-1, $GUI_DOCKALL)
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

Global $tab = GUICtrlCreateTab(5, 30, 840-10, 720-30-30)
GUICtrlSetResizing(-1, $GUI_DOCKVCENTER + $GUI_DOCKBORDERS)

Global $settings_tabitem = GUICtrlCreateTabItem("Settings")

Global $image_compression_quality_label = GUICtrlCreateLabel("Image Compression / Quality", 20, 60, 160, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, "The maximum level of compression / quality required", GUICtrlGetHandle($image_compression_quality_label))
Global $image_compression_quality_input = GUICtrlCreateInput("80", 190, 60, 30, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlCreateLabel("%", 225, 60, 20, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $image_compression_quality_slider = GUICtrlCreateSlider(260, 60, 200, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetLimit(-1, 10, 1)
GUICtrlSetData(-1, 10)
Global $retropie_hostname_label = GUICtrlCreateLabel("RetroPie Hostname", 20, 80, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_hostname_input = GUICtrlCreateInput("retropie", 130, 80, 240, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_username_label = GUICtrlCreateLabel("RetroPie Username", 20, 100, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_username_input = GUICtrlCreateInput("pi", 130, 100, 240, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_password_label = GUICtrlCreateLabel("RetroPie Password", 20, 120, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_password_input = GUICtrlCreateInput("raspberry", 130, 120, 240, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_ssh_key_label = GUICtrlCreateLabel("RetroPie SSH Key", 20, 140, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_ssh_key_input = GUICtrlCreateInput("ssh-ed25519 255 cq4AFscwWDozkpWLAzpJmZak8M7USnljP1lO36e23Co=", 130, 140, 240, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_download_path_label = GUICtrlCreateLabel("Download Path", 20, 160, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_download_path_input = GUICtrlCreateInput("D:\dwn", 130, 160, 240, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $minimized_scrapers_checkbox = GUICtrlCreateCheckbox("Confirmation Prompts", 20, 180, 200, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)


Global $scrape_tabitem = GUICtrlCreateTabItem("Scrape + Auto Join")

;_GUIToolTip_AddTool($tooltip, 0, "Clears the list", GUICtrlGetHandle($scrape_tabitem))
Global $websites_label = GUICtrlCreateLabel("Website(s)", 20, 60, 70, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, "The website(s) to scrape the box art from", GUICtrlGetHandle($websites_label))
Global $scrape_auto_join_website_combo = GUICtrlCreateCombo("", 90, 60, 150, 20, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "RF Generation")
_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "Moby Games")
_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "The Cover Project")
_GUICtrlComboBox_SetCurSel($scrape_auto_join_website_combo, 0)
Global $max_scrapers_label = GUICtrlCreateLabel("Max Scrapers", 250, 60, 80, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, "The maximum number of scrapers that will run in parallel", GUICtrlGetHandle($max_scrapers_label))
Global $max_scrapers_input = GUICtrlCreateInput("10", 320, 60, 30, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $max_scrapers_slider = GUICtrlCreateSlider(360, 60, 150, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetLimit(-1, 10, 1)
GUICtrlSetData(-1, 10)
Global $minimized_scrapers_checkbox = GUICtrlCreateCheckbox("Minimized Scrapers", 520, 60, 120, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetState(-1, $GUI_CHECKED)
_GUIToolTip_AddTool($tooltip, 0, "If checked then run each scraper in a minimized window", GUICtrlGetHandle($minimized_scrapers_checkbox))
Local $scrape_button = GUICtrlCreateButton("Scrape", 640, 60, 80, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, _
	"Scrapes box art according to the selections above." & @CRLF & _
	@CRLF & _
	"Front Covers will be stored in the Box folder." & @CRLF  & _
	"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
	"Full Covers will be stored in the BoxFull folder." & @CRLF _
	, GUICtrlGetHandle($scrape_button))

Global $scrape_auto_join_match_art_to_roms_radio = GUICtrlCreateRadio("Match Art to Roms", 650, 120, 120, 20)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $scrape_auto_join_match_roms_to_art_radio = GUICtrlCreateRadio("Match Roms to Art", 650, 140, 120, 20)
Global $scrape_auto_join_exclude_uploaded_art_checkbox = GUICtrlCreateCheckbox("Exclude Uploaded Art", 650, 160, 120, 20)
GUICtrlSetState(-1, $GUI_CHECKED)

Global $scrape_auto_join_art_label = GUICtrlCreateLabel("Art", 20, 100, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_auto_join_art_files_label = GUICtrlCreateLabel("0 Files", 180, 100, 70, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_auto_join_art_list = GUICtrlCreateList("", 20, 120, 200, 350, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetLimit(-1, 500)
Global $scrape_auto_join_rom_label = GUICtrlCreateLabel("Roms without Art", 240, 100, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_auto_join_rom_files_label = GUICtrlCreateLabel("0 Files", 400, 100, 70, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_auto_join_rom_list = GUICtrlCreateList("", 240, 120, 200, 350, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetLimit(-1, 500)
Local $scrape_auto_join_refresh_button = GUICtrlCreateButton("&Refresh", 20, 480, 80, 40)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Local $scrape_auto_join_upload_button = GUICtrlCreateButton("Upload &Art", 440, 550, 180, 40)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
Local $scrape_auto_join_rotate_art_button = GUICtrlCreateButton("Split Back && Front Art and R&otate", 440, 600, 180, 40)
Local $scrape_auto_join_upload_gamelist_button = GUICtrlCreateButton("Upload &Gamelist ...", 680, 480, 100, 40)
GUICtrlSetResizing(-1, $GUI_DOCKALL)

Global $scrape_auto_join_art_1_pic = GUICtrlCreatePic("", 20, 540, 384, 216)
GUICtrlSetState(-1, $GUI_HIDE)

GUICtrlCreateTabItem("Scrape + Manual Join")

Global $scrape_manual_join_websites_label = GUICtrlCreateLabel("Website(s)", 20, 60, 70, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, "The website(s) to scrape the box art from", GUICtrlGetHandle($scrape_manual_join_websites_label))
Global $scrape_manual_join_website_combo = GUICtrlCreateCombo("", 90, 60, 150, 20, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUICtrlComboBox_AddString($scrape_manual_join_website_combo, "Atarimania")
_GUICtrlComboBox_AddString($scrape_manual_join_website_combo, "LaunchBox")
_GUICtrlComboBox_SetCurSel($scrape_manual_join_website_combo, 0)
;_GUIToolTip_AddTool($tooltip, 0, "If checked then box art will be scraped from the RF Generation website", GUICtrlGetHandle($rf_generation_radio))
Global $scrape_manual_join_max_scrapers_label = GUICtrlCreateLabel("Max Scrapers", 250, 60, 80, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, "The maximum number of scrapers that will run in parallel", GUICtrlGetHandle($scrape_manual_join_max_scrapers_label))
Global $scrape_manual_join_max_scrapers_input = GUICtrlCreateInput("10", 320, 60, 30, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_manual_join_max_scrapers_slider = GUICtrlCreateSlider(360, 60, 150, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetLimit(-1, 10, 1)
GUICtrlSetData(-1, 10)
Global $scrape_manual_join_minimized_scrapers_checkbox = GUICtrlCreateCheckbox("Minimized Scrapers", 520, 60, 120, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetState(-1, $GUI_CHECKED)
_GUIToolTip_AddTool($tooltip, 0, "If checked then run each scraper in a minimized window", GUICtrlGetHandle($scrape_manual_join_minimized_scrapers_checkbox))
Local $scrape_manual_join_scrape_button = GUICtrlCreateButton("Scrape", 640, 60, 80, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, _
	"Scrapes box art according to the selections above." & @CRLF & _
	@CRLF & _
	"Front Covers will be stored in the Box folder." & @CRLF  & _
	"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
	"Full Covers will be stored in the BoxFull folder." & @CRLF _
	, GUICtrlGetHandle($scrape_manual_join_scrape_button))

Global $scrape_manual_join_match_art_to_roms_radio = GUICtrlCreateRadio("Match Art to Roms", 20, 90, 120, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $scrape_manual_join_match_roms_to_art_radio = GUICtrlCreateRadio("Match Roms to Art", 140, 90, 120, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_manual_join_exclude_uploaded_art_checkbox = GUICtrlCreateCheckbox("Exclude Uploaded Art", 260, 90, 120, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetState(-1, $GUI_CHECKED)

Global $scrape_manual_join_art_label = GUICtrlCreateLabel("Art", 20, 180, 70, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_manual_join_art_files_label = GUICtrlCreateLabel("0 Files", 180, 180, 70, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_manual_join_art_list = GUICtrlCreateList("", 20, 200, 200, 420, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))
GUICtrlSetResizing(-1, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
GUICtrlSetLimit(-1, 500)
Global $scrape_manual_join_rom_label = GUICtrlCreateLabel("Roms without Art", 240, 180, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_manual_join_rom_files_label = GUICtrlCreateLabel("0 Files", 400, 180, 70, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_manual_join_rom_list = GUICtrlCreateList("", 240, 200, 200, 420, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL, $LBS_EXTENDEDSEL))
GUICtrlSetResizing(-1, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
GUICtrlSetLimit(-1, 500)

Local $scrape_manual_join_refresh_button = GUICtrlCreateButton("&Refresh", 20, 640, 80, 40)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $scrape_manual_join_upload_button = GUICtrlCreateButton("Upload &Art", 240, 640, 80, 40)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $scrape_manual_join_upload_gamelist_button = GUICtrlCreateButton("Upload &Gamelist", 330, 640, 100, 40)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $scrape_manual_join_down_button = GUICtrlCreateButton("&Down", 710, 640, 50, 40)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $scrape_manual_join_up_button = GUICtrlCreateButton("&Up", 770, 640, 50, 40)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

Global $scrape_manual_join_art_1_pic = GUICtrlCreatePic("", 480, 80, 220, 110)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKTOP + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
Global $scrape_manual_join_art_2_pic = GUICtrlCreatePic("", 480, 200, 220, 110)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
Global $scrape_manual_join_art_3_pic = GUICtrlCreatePic("", 480, 320, 220, 110)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
Global $scrape_manual_join_art_4_pic = GUICtrlCreatePic("", 480, 440, 220, 110)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
Global $scrape_manual_join_art_5_pic = GUICtrlCreatePic("", 480, 560, 220, 110)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKBOTTOM)
GUICtrlSetState(-1, $GUI_HIDE)

GUIStartGroup()
Global $art_1_front = GUICtrlCreateRadio("Front", 705, 120, 60, 20)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_2_front = GUICtrlCreateRadio("Front", 705, 240, 60, 20)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_3_front = GUICtrlCreateRadio("Front", 705, 360, 60, 20)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_4_front = GUICtrlCreateRadio("Front", 705, 480, 60, 20)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_5_front = GUICtrlCreateRadio("Front", 705, 600, 60, 20)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUIStartGroup()
Global $art_1_back = GUICtrlCreateRadio("Back", 765, 120, 60, 20)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_2_back = GUICtrlCreateRadio("Back", 765, 240, 60, 20)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_3_back = GUICtrlCreateRadio("Back", 765, 360, 60, 20)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_4_back = GUICtrlCreateRadio("Back", 765, 480, 60, 20)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_5_back = GUICtrlCreateRadio("Back", 765, 600, 60, 20)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT + $GUI_DOCKAUTO)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)




GUICtrlCreateTabItem("Config")
Local $boot_config_x = 20
Local $boot_config_y = 100
Local $systems_list_config_x = 20
Local $systems_list_config_y = $boot_config_y + 280
Local $system_config_x = 230
Local $system_config_y = 60
Local $game_config_x = 230
Local $game_config_y = $boot_config_y + 210


GUICtrlCreateGroup("RetroPie", $boot_config_x, $boot_config_y, 200, 260)
Local $config_boot_edit_config_button = GUICtrlCreateButton("Edit Boot Config", $boot_config_x + 20, $boot_config_y + 20, 120, 40)
Local $config_reboot_button = GUICtrlCreateButton("Restart", $boot_config_x + 20, $boot_config_y + 70, 120, 40)
Local $config_shutdown_button = GUICtrlCreateButton("Shutdown", $boot_config_x + 20, $boot_config_y + 120, 120, 40)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("EmulationStation", $systems_list_config_x, $systems_list_config_y, 200, 300)
Local $config_edit_systems_list_button = GUICtrlCreateButton("Edit Systems List", $systems_list_config_x + 20, $systems_list_config_y + 20, 120, 40)
Local $config_restart_emulationstation_button = GUICtrlCreateButton("Restart", $systems_list_config_x + 20, $systems_list_config_y + 70, 120, 40)
;Local $config_shutdown_emulationstation_button = GUICtrlCreateButton("Shutdown", $systems_list_config_x + 20, $systems_list_config_y + 120, 120, 40)
Local $config_quit_emulationstation_button = GUICtrlCreateButton("Quit", $systems_list_config_x + 20, $systems_list_config_y + 120, 120, 40)
GUICtrlCreateGroup("", -99, -99, 1, 1)

Global $config_emulators_games_group = GUICtrlCreateGroup("Emulators && Games (3DO)", $system_config_x, $system_config_y, 600, 620)
Global $config_emulators_games_reload_button = GUICtrlCreateButton("Reload from RetroPie", $system_config_x + 20, $system_config_y + 20, 180, 20)
Global $config_emulators_games_open_wiki_page_button = GUICtrlCreateButton("Open Wiki page", $system_config_x + 210, $system_config_y + 20, 100, 20)
Global $config_emulators_label = GUICtrlCreateLabel("Emulators", $system_config_x + 10, $system_config_y + 50, 100, 20)
_GUIToolTip_AddTool($tooltip, 0, "/opt/retropie/configs/all/videomodes.cfg", GUICtrlGetHandle($config_emulators_label))
;Global $config_system_listview = GUICtrlCreateListView("Emulator Name|Video Mode|Default Emulator", $system_config_x + 10, $system_config_y + 40, 580, 240, $LVS_SHOWSELALWAYS)
Global $config_system_listview = GUICtrlCreateListView("Emulator Name|Video Mode|Default Emulator", $system_config_x + 10, $system_config_y + 70, 580, 190)
_GUICtrlListView_SetColumnWidth(-1, 0, 200)
_GUICtrlListView_SetColumnWidth(-1, 1, 150)
_GUICtrlListView_SetColumnWidth(-1, 2, 120)
_GUICtrlListView_SetExtendedListViewStyle($config_system_listview, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
Global $config_games_label = GUICtrlCreateLabel("Games", $game_config_x + 10, $game_config_y + 20, 100, 20)
_GUIToolTip_AddTool($tooltip, 0, "/opt/retropie/configs/all/emulators.cfg", GUICtrlGetHandle($config_games_label))
;Global $config_game_listview = GUICtrlCreateListView("Game Name|Emulator Name", $game_config_x + 10, $game_config_y + 40, 580, 240, $LVS_SHOWSELALWAYS)
Global $config_game_listview = GUICtrlCreateListView("Game Name|Emulator Name", $game_config_x + 10, $game_config_y + 40, 580, 240, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS))
_GUICtrlListView_SetColumnWidth(-1, 0, 200)
_GUICtrlListView_SetColumnWidth(-1, 1, 200)
_GUICtrlListView_SetExtendedListViewStyle($config_game_listview, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
GUICtrlCreateGroup("Wiki", $game_config_x + 10, $game_config_y + 290, 110, 75)
Global $config_wiki_compare_button = GUICtrlCreateButton("Compare...", $game_config_x + 20, $game_config_y + 305, 80, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("RetroPie", $game_config_x + 130, $game_config_y + 290, 290, 75)
Global $config_games_link_games_to_emulator_and_save_button = GUICtrlCreateButton("Link Games to Emulator and Save", $game_config_x + 140, $game_config_y + 305, 180, 20)
Global $config_games_launch_game_button = GUICtrlCreateButton("Launch Game", $game_config_x + 330, $game_config_y + 305, 80, 20)
_GUIToolTip_AddTool($tooltip, 0, "Only works if EmulationStation has been Quit", GUICtrlGetHandle($config_games_launch_game_button))
Global $config_games_update_emulator_and_save_game_before_launch_game_checkbox = GUICtrlCreateCheckbox("Update Emulator to Game and Save before Launch", $game_config_x + 140, $game_config_y + 330, 260, 20)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("PC", $game_config_x + 430, $game_config_y + 290, 150, 45)
Global $config_games_open_button = GUICtrlCreateButton("Open", $game_config_x + 430 + 20, $game_config_y + 305, 50, 20)
Global $config_games_save_as_button = GUICtrlCreateButton("Save As", $game_config_x + 490 + 20, $game_config_y + 305, 60, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)


GUICtrlCreateTabItem("Backup")
GUICtrlCreateLabel("Local Path", 70, 150, 80)
GUICtrlCreateLabel("Remote Path", 360, 150, 80)
GUICtrlCreateLabel("File Mask", 540, 150, 80)
GUICtrlCreateLabel("Include", 700, 150, 40)
Local $backup_path_1_y = 170
GUICtrlCreateLabel("Pair #1", 20, $backup_path_1_y, 80)
Global $backup_path_1_local_input = GUICtrlCreateInput($local_path & "\boot", 70, $backup_path_1_y, 250)
Global $backup_path_1_remote_input = GUICtrlCreateInput("/boot", 360, $backup_path_1_y, 140)
Global $backup_path_1_filemask_input = GUICtrlCreateInput("config.txt", 540, $backup_path_1_y, 140)
Global $backup_path_1_include_checkbox = GUICtrlCreateCheckbox("", 700, $backup_path_1_y, 20, 20)
GUICtrlSetState($backup_path_1_include_checkbox, $GUI_CHECKED)
Local $backup_path_2_y = $backup_path_1_y + 20
GUICtrlCreateLabel("Pair #2", 20, $backup_path_2_y, 80)
Global $backup_path_2_local_input = GUICtrlCreateInput($local_path & "\home\pi\GPIOnext", 70, $backup_path_2_y, 250)
Global $backup_path_2_remote_input = GUICtrlCreateInput("/home/pi/GPIOnext", 360, $backup_path_2_y, 140)
Global $backup_path_2_filemask_input = GUICtrlCreateInput("", 540, $backup_path_2_y, 140)
Global $backup_path_2_include_checkbox = GUICtrlCreateCheckbox("", 700, $backup_path_2_y, 20, 20)
GUICtrlSetState($backup_path_2_include_checkbox, $GUI_CHECKED)
Local $backup_path_3_y = $backup_path_2_y + 20
GUICtrlCreateLabel("Pair #3", 20, $backup_path_3_y, 80)
Global $backup_path_3_local_input = GUICtrlCreateInput($local_path & "\home\pi\RetroPie\BIOS", 70, $backup_path_3_y, 250)
Global $backup_path_3_remote_input = GUICtrlCreateInput("/home/pi/RetroPie/BIOS", 360, $backup_path_3_y, 140)
Global $backup_path_3_filemask_input = GUICtrlCreateInput("", 540, $backup_path_3_y, 140)
Global $backup_path_3_include_checkbox = GUICtrlCreateCheckbox("", 700, $backup_path_3_y, 20, 20)
GUICtrlSetState($backup_path_3_include_checkbox, $GUI_CHECKED)
Local $backup_path_4_y = $backup_path_3_y + 20
GUICtrlCreateLabel("Pair #4", 20, $backup_path_4_y, 80)
Global $backup_path_4_local_input = GUICtrlCreateInput($local_path & "\opt\retropie\configs", 70, $backup_path_4_y, 250)
Global $backup_path_4_remote_input = GUICtrlCreateInput("/opt/retropie/configs", 360, $backup_path_4_y, 140)
Global $backup_path_4_filemask_input = GUICtrlCreateInput("|*.iso", 540, $backup_path_4_y, 140)
Global $backup_path_4_include_checkbox = GUICtrlCreateCheckbox("", 700, $backup_path_4_y, 20, 20)
GUICtrlSetState($backup_path_4_include_checkbox, $GUI_CHECKED)
Local $backup_path_5_y = $backup_path_4_y + 20
GUICtrlCreateLabel("Pair #5", 20, $backup_path_5_y, 80)
Global $backup_path_5_local_input = GUICtrlCreateInput($local_path & "\home\pi\RetroPie\roms", 70, $backup_path_5_y, 250)
Global $backup_path_5_remote_input = GUICtrlCreateInput("/home/pi/RetroPie/roms", 360, $backup_path_5_y, 140)
Global $backup_path_5_filemask_input = GUICtrlCreateInput("", 540, $backup_path_5_y, 140)
Global $backup_path_5_include_checkbox = GUICtrlCreateCheckbox("", 700, $backup_path_5_y, 20, 20)
GUICtrlSetState($backup_path_5_include_checkbox, $GUI_CHECKED)
Local $backup_path_6_y = $backup_path_5_y + 20
GUICtrlCreateLabel("Pair #6", 20, $backup_path_6_y, 80)
Global $backup_path_6_local_input = GUICtrlCreateInput($local_path & "\etc\emulationstation", 70, $backup_path_6_y, 250)
Global $backup_path_6_remote_input = GUICtrlCreateInput("/etc/emulationstation", 360, $backup_path_6_y, 140)
Global $backup_path_6_filemask_input = GUICtrlCreateInput("es_systems.cfg", 540, $backup_path_6_y, 140)
Global $backup_path_6_include_checkbox = GUICtrlCreateCheckbox("", 700, $backup_path_6_y, 20, 20)
GUICtrlSetState($backup_path_6_include_checkbox, $GUI_CHECKED)
Local $backup_path_7_y = $backup_path_6_y + 20
GUICtrlCreateLabel("Pair #7", 20, $backup_path_7_y, 80)
Global $backup_path_7_local_input = GUICtrlCreateInput($local_path & "\etc\emulationstation\themes", 70, $backup_path_7_y, 250)
Global $backup_path_7_remote_input = GUICtrlCreateInput("/etc/emulationstation/themes", 360, $backup_path_7_y, 140)
Global $backup_path_7_filemask_input = GUICtrlCreateInput("", 540, $backup_path_7_y, 140)
Global $backup_path_7_include_checkbox = GUICtrlCreateCheckbox("", 700, $backup_path_7_y, 20, 20)
GUICtrlSetState($backup_path_7_include_checkbox, $GUI_CHECKED)
Global $backup_mirror_button = GUICtrlCreateButton("WinSCP Mirror", 20, 325, 180)
GUICtrlCreateTabItem("") ; end tabitem definition

Global $status_input = GUICtrlCreateInput("Hint - hover mouse over controls for help", 10, 720 - 25, 800 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)
GUICtrlSetResizing(-1, $GUI_DOCKBOTTOM + $GUI_DOCKHEIGHT + $GUI_DOCKLEFT + $GUI_DOCKRIGHT)

Global $shift_up_dummy = GUICtrlCreateDummy()
Global $shift_down_dummy = GUICtrlCreateDummy()
Local $main_aAccelKeys[2][2] = [["+{UP}", $shift_up_dummy], ["+{DOWN}", $shift_down_dummy]]
GUISetAccelerators($main_aAccelKeys, $main_gui)


Global $art_gui = GUICreate($app_name, 640, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
Global $art_big_pic = GUICtrlCreatePic("", 0, 0, 640, 480)
Global $art_gui2 = GUICreate($app_name, 1024, 576, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
Global $art_big_pic2 = GUICtrlCreatePic("", 0, 0, 1024, 576)
Global $art_gui3 = GUICreate("Child", 1024, 576, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
Global $art_big_pic3 = GUICtrlCreatePic("", 0, 0, 1024, 576) ;, 0, 0)

Global $gameslist_gui = GUICreate($app_name, 640, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
GUICtrlCreateGroup("RetroPie (/opt/retropie/configs/all/emulationstation/gamelists/n64/gamelist.xml)", 5, 5, 430, 40)
Global $gameslist_load_button = GUICtrlCreateButton("Load", 10, 20, 80, 20)
Global $gameslist_save_button = GUICtrlCreateButton("Save", 100, 20, 80, 20)
Global $gameslist_restart_emulationstation_checkbox = GUICtrlCreateCheckbox("Restart EmulationStation after Save", 190, 20, 200, 20)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("PC", 450, 5, 180, 40)
Global $gameslist_open_button = GUICtrlCreateButton("Open", 455, 20, 80, 20)
Global $gameslist_save_as_button = GUICtrlCreateButton("Save As", 545, 20, 80, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $gameslist_edit = GUICtrlCreateEdit("", 10, 50, 620, 400)
Global $gameslist_status_input = GUICtrlCreateInput("", 10, 480 - 25, 640 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)

Global $boot_config_gui = GUICreate($app_name, 640, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
GUICtrlCreateGroup("RetroPie (/boot/config.txt)", 5, 5, 180, 40)
Global $boot_config_load_button = GUICtrlCreateButton("Load", 10, 20, 80, 20)
Global $boot_config_save_button = GUICtrlCreateButton("Save", 100, 20, 80, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("PC", 200, 5, 180, 40)
Global $boot_config_open_button = GUICtrlCreateButton("Open", 205, 20, 80, 20)
Global $boot_config_save_as_button = GUICtrlCreateButton("Save As", 295, 20, 80, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $boot_config_edit = GUICtrlCreateEdit("", 10, 50, 620, 400)
Global $boot_config_status_input = GUICtrlCreateInput("", 10, 480 - 25, 640 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)

Global $systems_list_gui = GUICreate($app_name, 800, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
GUICtrlCreateGroup("RetroPie (/etc/emulationstation/es_systems.cfg)", 5, 5, 250, 40)
Global $systems_list_load_button = GUICtrlCreateButton("Load", 10, 20, 80, 20)
Global $systems_list_save_button = GUICtrlCreateButton("Save", 100, 20, 80, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("PC", 270, 5, 180, 40)
Global $systems_list_open_button = GUICtrlCreateButton("Open", 275, 20, 80, 20)
Global $systems_list_save_as_button = GUICtrlCreateButton("Save As", 365, 20, 80, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $systems_list_edit = GUICtrlCreateEdit("", 10, 50, 620, 400)
GUICtrlCreateGroup("Custom Order", 650, 5, 140, 400)
Global $systems_list_custom_order_list = GUICtrlCreateList("", 660, 20, 120, 350, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))
Global $systems_list_custom_order_reorder_button = GUICtrlCreateButton("ReOrder", 660, 360, 80, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $systems_list_status_input = GUICtrlCreateInput("", 10, 480 - 25, 640 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)

Global $compare_games_to_wiki_gui = GUICreate($app_name & " - Compare Game List to Wiki page", 1024, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
Global $compare_games_to_wiki_accept_button = GUICtrlCreateButton("Accept Wiki page game list (left side)", 10, 5, 200, 40)
Global $compare_games_to_wiki_ie = _IECreateEmbedded()
GUICtrlCreateObj($compare_games_to_wiki_ie, 10, 50, 1004, 400)
Global $compare_games_to_wiki_status_input = GUICtrlCreateInput("", 10, 480 - 25, 640 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)

Global $compare_games_to_wiki_dummy = GUICtrlCreateDummy()
Local $compare_aAccelKeys[1][2] = [["{Esc}", $compare_games_to_wiki_dummy]]
GUISetAccelerators($compare_aAccelKeys, $compare_games_to_wiki_gui)

Global $art_big_pic3_width
Global $art_big_pic3_height
Global $aFactors

Enable_Emulators_and_Games($GUI_ENABLE)

GUISetState(@SW_SHOW, $main_gui)
$current_gui = $main_gui
GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
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


			FileDelete(@ScriptDir & "\" & $app_name & ".txt")
			FileWrite(@ScriptDir & "\" & $app_name & ".txt", $tree_file_str)
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

			GUICtrlSetData($compare_games_to_wiki_status_input, "Reading https://github.com/seanhaydongriffin/Seans-RetroPie-Tools/wiki/N64-Emulator-Game-Compatibility")
			Local $iPID = Run('curl.exe -s -k -H "Content-Type: text/html; charset=utf-8" https://github.com/seanhaydongriffin/Seans-RetroPie-Tools/wiki/N64-Emulator-Game-Compatibility', @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
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

			Local $gameslist_emulators_cfg_file_path = @ScriptDir & "\gameslist_emulators.cfg"

			if FileExists($gameslist_emulators_cfg_file_path) = True Then

				FileDelete($gameslist_emulators_cfg_file_path)
			EndIf

			FileWrite($gameslist_emulators_cfg_file_path, $gameslist_emulators_str)

			Local $winmerge_output_file_path = @ScriptDir & "\emulators_cfg_diff.html"

			$cmd = "WinMergeU.exe"
			$cmd_params = """" & $wiki_emulators_cfg_file_path & """ """ & $gameslist_emulators_cfg_file_path & """ -minimize -noninteractive -u -or """ & $winmerge_output_file_path & """"
			$full_cmd = $cmd & " " & $cmd_params
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $full_cmd = ' & $full_cmd & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

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

			$result = FileOpenDialog($app_name, @ScriptDir, "Text files (*.txt)")


		Case $boot_config_save_as_button

			$result = FileSaveDialog($app_name, @ScriptDir, "Text files (*.txt)")


		Case $config_emulators_games_reload_button

			Enable_Config()
			GUICtrlSetData($config_emulators_label, "Emulators")
			GUICtrlSetData($config_games_label, "Games")
			_GUICtrlListView_DeleteAllItems($config_system_listview)
			_GUICtrlListView_DeleteAllItems($config_game_listview)

			GUICtrlSetData($status_input, "Reading directory from /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " on the RetroPie ...")
			$result = plink("ls /home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/*.{bin,zip,lha,a52,a78,j64,lnx,rom,nes,mgw,gba,love,7z,n64,z64,nds,iso,32x,sfc,smc,vec,ws}", 2)
			$all_roms_line_arr = StringSplit($result, @LF, 3)

			GUICtrlSetData($status_input, "Reading emulators.cfg from /opt/retropie/configs/all on the RetroPie ...")
			$result = plink("cat /opt/retropie/configs/all/emulators.cfg", 2)
			Local $all_emulators_line_arr = StringSplit($result, @LF, 3)

			GUICtrlSetData($status_input, "Reading emulators.cfg from /opt/retropie/configs/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & " on the RetroPie ...")
			$result = plink("cat /opt/retropie/configs/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/emulators.cfg", 2)
			Local $system_emulators_line_arr = StringSplit($result, @LF, 3)

			GUICtrlSetData($status_input, "Reading videomodes.cfg from /opt/retropie/configs/all on the RetroPie ...")
			$result = plink("cat /opt/retropie/configs/all/videomodes.cfg", 2)
			Local $videomodes_line_arr = StringSplit($result, @LF, 3)

			GUICtrlSetData($status_input, "Executing ""/opt/retropie/supplementary/mesa-drm/modetest -c"" on the RetroPie ...")
			$result = plink("/opt/retropie/supplementary/mesa-drm/modetest -c", 2)
			Local $modetest_line_arr = StringSplit($result, @LF, 3)
			Local $modes_header_num = 99999
			Local $video_mode_arr[0]

			for $each_modetest_line in $modetest_line_arr

				if StringCompare($each_modetest_line, "  modes:") = 0 Then

					$modes_header_num = 1
				EndIf

				if $modes_header_num < 0 Then

					Local $modetest_part_arr = StringSplit($each_modetest_line, " ", 3)

					if StringRegExp($modetest_part_arr[2], "[a-z]+:") = 1 Then

						ExitLoop
					EndIf

					_ArrayAdd($video_mode_arr, $modetest_part_arr[2] & " @ " & $modetest_part_arr[3] & " Hz")
				EndIf

				$modes_header_num = $modes_header_num - 1
			Next

			if UBound($video_mode_arr) < 1 Then

				GUICtrlSetData($status_input, "No video modes detected. RetroPie must be active on your display, then try again.")
			else

				GUICtrlSetData($status_input, "Updating Emulators ...")
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

				for $each_videomode_line in $videomodes_line_arr

					Local $videomode_part_arr = StringSplit($each_videomode_line, " = ", 3)
					$videomode_part_arr[1] = StringReplace($videomode_part_arr[1], """", "")
					$videomode_part_arr[1] = StringReplace($videomode_part_arr[1], "87-", "")
					Local $videomode_res = $video_mode_arr[Number($videomode_part_arr[1])]
					_GUICtrlListView_SetItemText($config_system_listview, _GUICtrlListView_FindText($config_system_listview, $videomode_part_arr[0], -1, False), $videomode_res, 1)
				Next

				Local $g_bSortSense = False
				_GUICtrlListView_SimpleSort($config_system_listview, $g_bSortSense, 0, False)
				_GUICtrlListView_EndUpdate($config_system_listview)
				GUICtrlSetData($config_emulators_label, "Emulators (" & _GUICtrlListView_GetItemCount($config_system_listview) & ")")

				GUICtrlSetData($status_input, "Updating Games ...")

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

				_GUICtrlListView_SimpleSort($config_game_listview, $g_bSortSense, 0, False)
				_GUICtrlListView_EndUpdate($config_game_listview)
				GUICtrlSetData($config_games_label, "Games (" & _GUICtrlListView_GetItemCount($config_game_listview) & ")")
				Enable_Config($GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE)
				GUICtrlSetData($status_input, "Emulators & Games updated.")
			EndIf

		Case $config_emulators_games_open_wiki_page_button

			ShellExecute("https://github.com/seanhaydongriffin/Seans-RetroPie-Tools/wiki/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "-Emulator-Game-Compatibility")

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

			$result = FileOpenDialog($app_name, @ScriptDir, "Config files (*.cfg)", 0, "Seans RetroPie Tools n64 emulators.cfg", $main_gui)

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

				_GUICtrlListView_SimpleSort($config_game_listview, $g_bSortSense, 0, False)
				_GUICtrlListView_EndUpdate($config_game_listview)
				Enable_Config($GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE)
				GUICtrlSetData($config_games_label, "Games (" & _GUICtrlListView_GetItemCount($config_game_listview) & ")")
				GUICtrlSetData($status_input, "Games updated.")

			EndIf

		Case $config_games_save_as_button

			$result = FileSaveDialog($app_name, @ScriptDir, "Config files (*.cfg)", 0, "Seans RetroPie Tools n64 emulators.cfg", $main_gui)

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

			; load the Seans RetroPie Tools Systems Custom Order.cfg if that exists

			if FileExists(@ScriptDir & "\Seans RetroPie Tools Systems Custom Order.cfg") = True Then

				Local $custom_order_arr
				_FileReadToArray(@ScriptDir & "\Seans RetroPie Tools Systems Custom Order.cfg", $custom_order_arr, 0)

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
			GUICtrlSetPos($scrape_manual_join_art_list, 20, 200, 200, 500)
			GUICtrlSetPos($scrape_manual_join_rom_label, 240, 180, 100, 20)
			GUICtrlSetPos($scrape_manual_join_rom_files_label, 400, 180, 70, 20)
			GUICtrlSetPos($scrape_manual_join_rom_list, 240, 200, 200, 500)


		case $scrape_manual_join_match_roms_to_art_radio

			GUICtrlSetPos($scrape_manual_join_rom_label, 20, 180, 100, 20)
			GUICtrlSetPos($scrape_manual_join_rom_files_label, 180, 180, 70, 20)
			GUICtrlSetPos($scrape_manual_join_rom_list, 20, 200, 200, 500)
			GUICtrlSetPos($scrape_manual_join_art_label, 240, 180, 100, 20)
			GUICtrlSetPos($scrape_manual_join_art_files_label, 400, 180, 70, 20)
			GUICtrlSetPos($scrape_manual_join_art_list, 240, 200, 200, 500)





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

			GUICtrlSetImage($art_big_pic2, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list)) & "-full-cover.jpg")
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

			Local $arr = _FileListToArrayRec($download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box", "*.jpg;*.png", 1, 0, 1)
			;_ArrayDisplay($arr)
			;Exit
			Local $num_files = 0

			for $i = 1 to $arr[0]

				Local $art_name = StringRegExpReplace($arr[$i], "-[0-9]*.(?:jpg|png)", "")

				; if there are at least 2 images for this artwork

				if $i < $arr[0] And (StringInStr($arr[$i + 1], "-2.jpg") > 0 or StringInStr($arr[$i + 1], "-2.png") > 0) Then

					if _GUICtrlListBox_FindString($scrape_manual_join_art_list, $art_name, True) < 0 Then

						_GUICtrlListBox_InsertString($scrape_manual_join_art_list, $art_name)
						$num_files = $num_files + 1
						GUICtrlSetData($scrape_manual_join_art_files_label, $num_files & " Files")
					EndIf
				EndIf

			Next

			GUICtrlSetData($status_input, "Connecting to the RetroPie ...")

			$result = _WinSCP_Open()

			if $result = False Then

				GUICtrlSetData($status_input, $_WinSCP_COM_error_description)
			Else

				GUICtrlSetData($status_input, "")

				Local $art_filename_arr = _WinSCP_ListDirectory_Files("/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)), "-full-cover.jpg")
				_ArraySort($art_filename_arr)
				Local $rom_filename_arr = _WinSCP_ListDirectory_Files("/home/pi/RetroPie/roms/" & $roms_path_dict.Item(GUICtrlRead($system_combo)), ".bin|.zip|.lha|.a52|.a78|.j64|.lnx|.rom|.nes|.mgw|.gba|.love|.7z|.n64|.z64|.nds|.iso|.32x|.sfc|.smc|.vec|.ws")
				_ArraySort($rom_filename_arr)
				;_ArrayDisplay($rom_filename_arr)

				_GUICtrlListBox_BeginUpdate($scrape_manual_join_rom_list)

				Local $num_roms_without_art = 0

				for $i = 0 to (UBound($rom_filename_arr) - 1)
;					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $i = ' & $i & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

					_PathSplit($rom_filename_arr[$i], $sDrive1, $sDir1, $sFileName1, $sExtension1)

					if _ArrayBinarySearch($art_filename_arr, $sFileName1 & "-full-cover.jpg") < 0 Then

						_GUICtrlListBox_InsertString($scrape_manual_join_rom_list, $rom_filename_arr[$i])
						$num_roms_without_art = $num_roms_without_art + 1
						GUICtrlSetData($scrape_manual_join_rom_files_label, $num_roms_without_art & " Files")
					EndIf
				Next

				_GUICtrlListBox_EndUpdate($scrape_manual_join_rom_list)
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

					for $i = 1 to 5

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
				ShellExecuteWait("magick.exe", """" & $left_art_path & """ """ & $right_art_path & """ -resize ""1920x1080"" +append -resize ""1920x1080>"" -quality 80% """ & $new_art_path & """", $ImageMagick_path, "", @SW_HIDE)



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
				$result = _WinSCP_PutFiles($new_art_path, "/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $sFileName1 & "-full-cover.jpg")

				if $result = False Then

					GUICtrlSetData($status_input, $_WinSCP_COM_error_description)
				Else

					Local $num_rom_files = Number(StringReplace(GUICtrlRead($scrape_manual_join_rom_files_label), " Files", ""))
					;Local $rom_list_selected_index = _GUICtrlListBox_GetCurSel($scrape_manual_join_rom_list)

					_GUICtrlListBox_DeleteString($scrape_manual_join_rom_list, $selected_indices[$index_num])
					$num_rom_files = $num_rom_files - 1
					GUICtrlSetData($scrape_manual_join_rom_files_label, $num_rom_files & " Files")
				EndIf
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

			if GUICtrlRead($scrape_manual_join_match_roms_to_art_radio) = $GUI_CHECKED Then

				GUICtrlSetState($scrape_manual_join_rom_list, $GUI_ENABLE)
				;_GUICtrlListBox_ClickItem($scrape_manual_join_rom_list, $rom_list_selected_index)
			EndIf

			GUICtrlSetData($status_input, "")
			GUICtrlSetState($scrape_manual_join_art_list, $GUI_ENABLE)
			GUICtrlSetState($scrape_manual_join_rom_list, $GUI_ENABLE)
			GUICtrlSetState($scrape_manual_join_upload_button, $GUI_ENABLE)


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
			pscp($gamelist_filepath, "/opt/retropie/configs/all/emulationstation/gamelists/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/gamelist.xml")
			GUICtrlSetData($gameslist_status_input, "Saved """ & $gamelist_filepath & """ to the RetroPie")

			if GUICtrlRead($gameslist_restart_emulationstation_checkbox) = $GUI_CHECKED Then

				GUICtrlSetData($gameslist_status_input, "Restarting EmulationStation ...")
				plink("sudo touch /tmp/es-restart")
				plink("sudo pkill -f \""/opt/retropie/supplementary/.*/emulationstation([^.]|$)\""")
				GUICtrlSetData($gameslist_status_input, "")
			EndIf

		Case $scrape_manual_join_upload_gamelist_button

			GUICtrlSetData($status_input, "Connecting to the RetroPie ...")

			$result = _WinSCP_Open()

			if $result = False Then

				GUICtrlSetData($status_input, $_WinSCP_COM_error_description)
			Else

				; Refresh gamelist.xml on RetroPie
				CreateGamelistOnRetroPie()
			EndIf

			GUICtrlSetData($status_input, "")


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

			FileDelete(@ScriptDir & "\" & $app_name & ".log")
			FileDelete(@ScriptDir & "\" & $app_name & ".log.1")
			FileDelete(@ScriptDir & "\" & $app_name & ".txt")
			FileWrite(@ScriptDir & "\" & $app_name & ".txt", $winscp_script)

			; run the winscp backup script
;			ShellExecuteWait("C:\Program Files (x86)\WinSCP\WinSCP.exe", "/console /logsize=1*1M /log=""" & @ScriptDir & "\" & $app_name & ".log"" /ini=nul /script=""" & @ScriptDir & "\" & $app_name & ".txt""", @ScriptDir)
;			ShellExecuteWait("C:\Program Files (x86)\WinSCP\WinSCP.com", "/logsize=1*1M /log=""" & @ScriptDir & "\" & $app_name & ".log"" /ini=nul /script=""" & @ScriptDir & "\" & $app_name & ".txt""", @ScriptDir)
			Run(@ComSpec & ' /k ""C:\Program Files (x86)\WinSCP\WinSCP.com" /log="' & @ScriptDir & '\' & $app_name & '.log" /loglevel=2 /ini=nul /script="' & @ScriptDir & '\' & $app_name & '.txt""', @ScriptDir)




	EndSwitch
WEnd

_GDIPlus_ShutDown ()





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



Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
    #forceref $hWnd, $iMsg
    Local $hWndFrom, $iIDFrom, $iCode
    $hWndFrom = $lParam
    $iIDFrom = BitAND($wParam, 0xFFFF) ; Low Word
    $iCode = BitShift($wParam, 16) ; Hi Word

    Switch $hWndFrom

        Case GUICtrlGetHandle($system_combo)

			Switch $iCode

                Case $CBN_SELCHANGE

					GUICtrlSetData($config_emulators_games_group, "Emulators && Games (" & GUICtrlRead($system_combo) & ")")
			EndSwitch

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
						GUICtrlSetImage($scrape_auto_join_art_1_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $art_name & "-full-cover.jpg")
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



        Case GUICtrlGetHandle($scrape_manual_join_art_list)

			Switch $iCode

                Case $LBN_SELCHANGE ; Sent when the user cancels the selection in a list box

					Local $art_name = _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list))

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

						_GUICtrlListBox_SelItemRange($scrape_manual_join_rom_list, $selected_index, $selected_index)
						_GUICtrlListBox_SetTopIndex($scrape_manual_join_rom_list, $selected_index - 11)
					EndIf

					if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.*") = True Then

						GUICtrlSetState($scrape_manual_join_art_1_pic, $GUI_SHOW)
						GUICtrlSetState($art_1_front, $GUI_SHOW)
						GUICtrlSetState($art_1_front, $GUI_CHECKED)
						GUICtrlSetState($art_1_back, $GUI_SHOW)
						GUICtrlSetState($art_1_back, $GUI_UNCHECKED)

						if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.jpg") = True Then

							GUICtrlSetImage($scrape_manual_join_art_1_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.jpg")
						Else

							GUICtrlSetImagePNG($scrape_manual_join_art_1_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.png")
						EndIf
					Else

						GUICtrlSetState($scrape_manual_join_art_1_pic, $GUI_HIDE)
						GUICtrlSetState($art_1_front, $GUI_HIDE)
						GUICtrlSetState($art_1_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_1_back, $GUI_HIDE)
						GUICtrlSetState($art_1_back, $GUI_UNCHECKED)
					EndIf

					if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.*") = True Then

						GUICtrlSetState($scrape_manual_join_art_2_pic, $GUI_SHOW)
						GUICtrlSetState($art_2_front, $GUI_SHOW)
						GUICtrlSetState($art_2_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_2_back, $GUI_SHOW)
						GUICtrlSetState($art_2_back, $GUI_CHECKED)

						if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.jpg") = True Then

							GUICtrlSetImage($scrape_manual_join_art_2_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.jpg")
						Else

							GUICtrlSetImagePNG($scrape_manual_join_art_2_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.png")
						EndIf
					Else

						GUICtrlSetState($scrape_manual_join_art_2_pic, $GUI_HIDE)
						GUICtrlSetState($art_2_front, $GUI_HIDE)
						GUICtrlSetState($art_2_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_2_back, $GUI_HIDE)
						GUICtrlSetState($art_2_back, $GUI_UNCHECKED)
					EndIf

					if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.*") = True Then

						GUICtrlSetState($scrape_manual_join_art_3_pic, $GUI_SHOW)
						GUICtrlSetState($art_3_front, $GUI_SHOW)
						GUICtrlSetState($art_3_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_3_back, $GUI_SHOW)
						GUICtrlSetState($art_3_back, $GUI_UNCHECKED)

						if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.jpg") = True Then

							GUICtrlSetImage($scrape_manual_join_art_3_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.jpg")
						Else

							GUICtrlSetImagePNG($scrape_manual_join_art_3_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.png")
						EndIf
					Else

						GUICtrlSetState($scrape_manual_join_art_3_pic, $GUI_HIDE)
						GUICtrlSetState($art_3_front, $GUI_HIDE)
						GUICtrlSetState($art_3_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_3_back, $GUI_HIDE)
						GUICtrlSetState($art_3_back, $GUI_UNCHECKED)
					EndIf

					if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.*") = True Then

						GUICtrlSetState($scrape_manual_join_art_4_pic, $GUI_SHOW)
						GUICtrlSetState($art_4_front, $GUI_SHOW)
						GUICtrlSetState($art_4_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_4_back, $GUI_SHOW)
						GUICtrlSetState($art_4_back, $GUI_UNCHECKED)

						if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.jpg") = True Then

							GUICtrlSetImage($scrape_manual_join_art_4_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.jpg")
						Else

							GUICtrlSetImagePNG($scrape_manual_join_art_4_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.png")
						EndIf
					Else

						GUICtrlSetState($scrape_manual_join_art_4_pic, $GUI_HIDE)
						GUICtrlSetState($art_4_front, $GUI_HIDE)
						GUICtrlSetState($art_4_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_4_back, $GUI_HIDE)
						GUICtrlSetState($art_4_back, $GUI_UNCHECKED)
					EndIf

					if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.*") = True Then

						GUICtrlSetState($scrape_manual_join_art_5_pic, $GUI_SHOW)
						GUICtrlSetState($art_5_front, $GUI_SHOW)
						GUICtrlSetState($art_5_front, $GUI_UNCHECKED)
						GUICtrlSetState($art_5_back, $GUI_SHOW)
						GUICtrlSetState($art_5_back, $GUI_UNCHECKED)

						if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.jpg") = True Then

							GUICtrlSetImage($scrape_manual_join_art_5_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.jpg")
						Else

							GUICtrlSetImagePNG($scrape_manual_join_art_5_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.png")
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

						if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.*") = True Then

							GUICtrlSetState($scrape_manual_join_art_1_pic, $GUI_SHOW)
							GUICtrlSetState($art_1_front, $GUI_SHOW)
							GUICtrlSetState($art_1_front, $GUI_CHECKED)
							GUICtrlSetState($art_1_back, $GUI_SHOW)
							GUICtrlSetState($art_1_back, $GUI_UNCHECKED)

							if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.jpg") = True Then

								GUICtrlSetImage($scrape_manual_join_art_1_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.jpg")
							Else

								GUICtrlSetImagePNG($scrape_manual_join_art_1_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-1.png")
							EndIf
						Else

							GUICtrlSetState($scrape_manual_join_art_1_pic, $GUI_HIDE)
							GUICtrlSetState($art_1_front, $GUI_HIDE)
							GUICtrlSetState($art_1_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_1_back, $GUI_HIDE)
							GUICtrlSetState($art_1_back, $GUI_UNCHECKED)
						EndIf

						if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.*") = True Then

							GUICtrlSetState($scrape_manual_join_art_2_pic, $GUI_SHOW)
							GUICtrlSetState($art_2_front, $GUI_SHOW)
							GUICtrlSetState($art_2_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_2_back, $GUI_SHOW)
							GUICtrlSetState($art_2_back, $GUI_CHECKED)

							if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.jpg") = True Then

								GUICtrlSetImage($scrape_manual_join_art_2_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.jpg")
							Else

								GUICtrlSetImagePNG($scrape_manual_join_art_2_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-2.png")
							EndIf
						Else

							GUICtrlSetState($scrape_manual_join_art_2_pic, $GUI_HIDE)
							GUICtrlSetState($art_2_front, $GUI_HIDE)
							GUICtrlSetState($art_2_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_2_back, $GUI_HIDE)
							GUICtrlSetState($art_2_back, $GUI_UNCHECKED)
						EndIf

						if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.*") = True Then

							GUICtrlSetState($scrape_manual_join_art_3_pic, $GUI_SHOW)
							GUICtrlSetState($art_3_front, $GUI_SHOW)
							GUICtrlSetState($art_3_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_3_back, $GUI_SHOW)
							GUICtrlSetState($art_3_back, $GUI_UNCHECKED)

							if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.jpg") = True Then

								GUICtrlSetImage($scrape_manual_join_art_3_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.jpg")
							Else

								GUICtrlSetImagePNG($scrape_manual_join_art_3_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-3.png")
							EndIf
						Else

							GUICtrlSetState($scrape_manual_join_art_3_pic, $GUI_HIDE)
							GUICtrlSetState($art_3_front, $GUI_HIDE)
							GUICtrlSetState($art_3_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_3_back, $GUI_HIDE)
							GUICtrlSetState($art_3_back, $GUI_UNCHECKED)
						EndIf

						if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.*") = True Then

							GUICtrlSetState($scrape_manual_join_art_4_pic, $GUI_SHOW)
							GUICtrlSetState($art_4_front, $GUI_SHOW)
							GUICtrlSetState($art_4_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_4_back, $GUI_SHOW)
							GUICtrlSetState($art_4_back, $GUI_UNCHECKED)

							if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.jpg") = True Then

								GUICtrlSetImage($scrape_manual_join_art_4_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.jpg")
							Else

								GUICtrlSetImagePNG($scrape_manual_join_art_4_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-4.png")
							EndIf
						Else

							GUICtrlSetState($scrape_manual_join_art_4_pic, $GUI_HIDE)
							GUICtrlSetState($art_4_front, $GUI_HIDE)
							GUICtrlSetState($art_4_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_4_back, $GUI_HIDE)
							GUICtrlSetState($art_4_back, $GUI_UNCHECKED)
						EndIf

						if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.*") = True Then

							GUICtrlSetState($scrape_manual_join_art_5_pic, $GUI_SHOW)
							GUICtrlSetState($art_5_front, $GUI_SHOW)
							GUICtrlSetState($art_5_front, $GUI_UNCHECKED)
							GUICtrlSetState($art_5_back, $GUI_SHOW)
							GUICtrlSetState($art_5_back, $GUI_UNCHECKED)

							if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.jpg") = True Then

								GUICtrlSetImage($scrape_manual_join_art_5_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.jpg")
							Else

								GUICtrlSetImagePNG($scrape_manual_join_art_5_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & $art_name & "-5.png")
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
    ; Proceed the default AutoIt3 internal message commands.
    ; You also can complete let the line out.
    ; !!! But only 'Return' (without any value) will not proceed
    ; the default AutoIt3-message in the future !!!
    Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND




Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")

	Switch $hWndFrom

		Case GUICtrlGetHandle($max_scrapers_slider)

			Switch $iCode
				Case $NM_RELEASEDCAPTURE ; The control is releasing mouse capture


					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $NM_RELEASEDCAPTURE = ' & $NM_RELEASEDCAPTURE & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			EndSwitch

		Case GUICtrlGetHandle($image_compression_quality_slider)

			Switch $iCode
				Case $NM_RELEASEDCAPTURE ; The control is releasing mouse capture


					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $NM_RELEASEDCAPTURE = ' & $NM_RELEASEDCAPTURE & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			EndSwitch


		Case GUICtrlGetHandle($tab)

			Switch $iCode

				Case $NM_CLICK

					if _GUICtrlTab_GetCurSel($tab) = 1 Then

						GUICtrlSetState($scrape_auto_join_upload_button, $GUI_DEFBUTTON)
					EndIf

					if _GUICtrlTab_GetCurSel($tab) = 2 Then

						GUICtrlSetState($scrape_manual_join_upload_button, $GUI_DEFBUTTON)
					EndIf


			EndSwitch


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
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

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

Func pscp($source_file_path, $target_file_path)

	$cmd = "pscp.exe -l " & GUICtrlRead($retropie_username_input) & " -pw " & GUICtrlRead($retropie_password_input) & " """ & $source_file_path & """ " & GUICtrlRead($retropie_hostname_input) & ":""" & $target_file_path & """"
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $cmd = ' & $cmd & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	Local $iPID = Run($cmd, @ScriptDir, @SW_HIDE, 7)
    ProcessWaitClose($iPID)
    Local $sOutput = StdoutRead($iPID)

EndFunc


Func plink($command, $strip_whitespace_flag = 0)


	$cmd = "plink.exe -ssh " & GUICtrlRead($retropie_hostname_input) & " -l " & GUICtrlRead($retropie_username_input) & " -pw " & GUICtrlRead($retropie_password_input) & " -batch " & $command
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $cmd = ' & $cmd & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	Local $iPID = Run("plink.exe -ssh " & GUICtrlRead($retropie_hostname_input) & " -l " & GUICtrlRead($retropie_username_input) & " -pw " & GUICtrlRead($retropie_password_input) & " -batch " & $command, @ScriptDir, @SW_HIDE, 7)
    ProcessWaitClose($iPID)
    Local $sOutput = StdoutRead($iPID)

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

Func Enable_Config($retropie_edit_boot_config_button = $GUI_DISABLE, $retropie_restart_button = $GUI_DISABLE, $retropie_shutdown_button = $GUI_DISABLE, $emulationstation_edit_systems_list_button = $GUI_DISABLE, $emulationstation_restart_button = $GUI_DISABLE, $reload_button = $GUI_DISABLE, $system_listview = $GUI_DISABLE, $game_listview = $GUI_DISABLE, $update_games_emulator_button = $GUI_DISABLE, $save_games_button = $GUI_DISABLE, $open_button = $GUI_DISABLE, $save_as_button = $GUI_DISABLE)

	GUICtrlSetState($config_boot_edit_config_button, $retropie_edit_boot_config_button)
	GUICtrlSetState($config_reboot_button, $retropie_restart_button)
	GUICtrlSetState($config_shutdown_button, $retropie_shutdown_button)
	GUICtrlSetState($config_edit_systems_list_button, $emulationstation_edit_systems_list_button)
	GUICtrlSetState($config_restart_emulationstation_button, $emulationstation_restart_button)

	Enable_Emulators_and_Games($reload_button, $system_listview, $game_listview, $update_games_emulator_button, $save_games_button, $open_button, $save_as_button)
EndFunc

Func Enable_Emulators_and_Games($reload_button = $GUI_DISABLE, $system_listview = $GUI_DISABLE, $game_listview = $GUI_DISABLE, $update_games_emulator_button = $GUI_DISABLE, $save_games_button = $GUI_DISABLE, $open_button = $GUI_DISABLE, $save_as_button = $GUI_DISABLE)

	GUICtrlSetState($config_emulators_games_reload_button, $reload_button)
	GUICtrlSetState($config_system_listview, $system_listview)
	GUICtrlSetState($config_game_listview, $game_listview)
	GUICtrlSetState($config_games_link_games_to_emulator_and_save_button, $update_games_emulator_button)
	GUICtrlSetState($config_games_open_button, $open_button)
	GUICtrlSetState($config_games_save_as_button, $save_as_button)
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

	GUICtrlSetData($status_input, "Erasing emulators.cfg on the RetroPie ...")
	plink_delete_all_text_in_file("/opt/retropie/configs/all/emulators.cfg")
	GUICtrlSetData($status_input, "Saving emulators.cfg to /opt/retropie/configs/all on the RetroPie ...")
	plink_insert_text_in_file("/opt/retropie/configs/all/emulators.cfg", $emulators_cfg_str)
	GUICtrlSetData($status_input, "Saved emulators.cfg to /opt/retropie/configs/all on the RetroPie.")
	Enable_Config($GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE)

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

