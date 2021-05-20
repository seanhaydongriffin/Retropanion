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
#include "WinSCP.au3"
#include <GDIPlus.au3>
#include "GUIScrollbars_Ex.au3"



_GDIPlus_Startup()

Local $app_name = "Seans Scraper"

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




Local $ImageMagick_path = "C:\Program Files\ImageMagick-7.0.11-Q16-HDRI"
Local $sDrive = "", $sDir = "", $sFileName = "", $sExtension = ""
Local $sDrive1 = "", $sDir1 = "", $sFileName1 = "", $sExtension1 = ""
Local $sDrive2 = "", $sDir2 = "", $sFileName2 = "", $sExtension2 = ""
Local $alphanumeric_arr[36] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
;Local $alphanumeric_arr[13] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C"]
Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
Global $current_gui
Global $downloaded_images_path = "~/.emulationstation/downloaded_images"

; MAIN GUI


Global $main_gui = GUICreate($app_name, 800, 800)
Global $tooltip = _GUIToolTip_Create(0) ; default style tooltip
_GUIToolTip_SetMaxTipWidth($tooltip, 300)

Global $system_label = GUICtrlCreateLabel("System", 20, 5, 80, 20)
_GUIToolTip_AddTool($tooltip, 0, "The system to scrape the box art for", GUICtrlGetHandle($system_label))
Global $system_combo = GUICtrlCreateCombo("", 90, 5, 250, 20, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
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

Global $tab = GUICtrlCreateTab(5, 30, 790, 740)

Global $settings_tabitem = GUICtrlCreateTabItem("Settings")

Global $image_compression_quality_label = GUICtrlCreateLabel("Image Compression / Quality", 20, 60, 160, 20)
_GUIToolTip_AddTool($tooltip, 0, "The maximum level of compression / quality required", GUICtrlGetHandle($image_compression_quality_label))
Global $image_compression_quality_input = GUICtrlCreateInput("80", 190, 60, 30, 20)
GUICtrlCreateLabel("%", 225, 60, 20, 20)
Global $image_compression_quality_slider = GUICtrlCreateSlider(260, 60, 200, 20)
GUICtrlSetLimit(-1, 10, 1)
GUICtrlSetData(-1, 10)

Global $retropie_hostname_label = GUICtrlCreateLabel("RetroPie Hostname", 20, 80, 100, 20)
Global $retropie_hostname_input = GUICtrlCreateInput("retropie", 130, 80, 240, 20)
Global $retropie_username_label = GUICtrlCreateLabel("RetroPie Username", 20, 100, 100, 20)
Global $retropie_username_input = GUICtrlCreateInput("pi", 130, 100, 240, 20)
Global $retropie_password_label = GUICtrlCreateLabel("RetroPie Password", 20, 120, 100, 20)
Global $retropie_password_input = GUICtrlCreateInput("raspberry", 130, 120, 240, 20)
Global $retropie_ssh_key_label = GUICtrlCreateLabel("RetroPie SSH Key", 20, 140, 100, 20)
Global $retropie_ssh_key_input = GUICtrlCreateInput("ssh-ed25519 255 cq4AFscwWDozkpWLAzpJmZak8M7USnljP1lO36e23Co=", 130, 140, 240, 20)
Global $retropie_download_path_label = GUICtrlCreateLabel("Download Path", 20, 160, 100, 20)
Global $retropie_download_path_input = GUICtrlCreateInput("D:\dwn", 130, 160, 240, 20)


Global $scrape_tabitem = GUICtrlCreateTabItem("Scrape + Auto Join")

;_GUIToolTip_AddTool($tooltip, 0, "Clears the list", GUICtrlGetHandle($scrape_tabitem))
Global $websites_label = GUICtrlCreateLabel("Website(s)", 20, 60, 70, 20)
_GUIToolTip_AddTool($tooltip, 0, "The website(s) to scrape the box art from", GUICtrlGetHandle($websites_label))

Global $scrape_auto_join_website_combo = GUICtrlCreateCombo("", 90, 60, 150, 20, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "RF Generation")
_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "Moby Games")
_GUICtrlComboBox_AddString($scrape_auto_join_website_combo, "The Cover Project")
_GUICtrlComboBox_SetCurSel($scrape_auto_join_website_combo, 0)

Global $max_scrapers_label = GUICtrlCreateLabel("Max Scrapers", 250, 60, 80, 20)
_GUIToolTip_AddTool($tooltip, 0, "The maximum number of scrapers that will run in parallel", GUICtrlGetHandle($max_scrapers_label))
Global $max_scrapers_input = GUICtrlCreateInput("10", 320, 60, 30, 20)
Global $max_scrapers_slider = GUICtrlCreateSlider(360, 60, 150, 20)
GUICtrlSetLimit(-1, 10, 1)
GUICtrlSetData(-1, 10)
Global $minimized_scrapers_checkbox = GUICtrlCreateCheckbox("Minimized Scrapers", 520, 60, 120, 20)
_GUIToolTip_AddTool($tooltip, 0, "If checked then run each scraper in a minimized window", GUICtrlGetHandle($minimized_scrapers_checkbox))
GUICtrlSetState(-1, $GUI_CHECKED)
Local $scrape_button = GUICtrlCreateButton("Scrape", 640, 60, 80, 20)
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
Global $scrape_auto_join_art_files_label = GUICtrlCreateLabel("0 Files", 180, 100, 70, 20)
Global $scrape_auto_join_art_list = GUICtrlCreateList("", 20, 120, 200, 350, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))
;Global $scrape_auto_join_art_list = _GUICtrlListBox_Create($main_gui, "", 20, 120, 200, 350, BitOR($WS_HSCROLL, $WS_VSCROLL, $WS_BORDER, $LBS_HASSTRINGS, $LBS_MULTIPLESEL))
;Global $scrape_auto_join_art_list = _GUICtrlListBox_Create($main_gui, "", 20, 120, 200, 350, BitOR($WS_HSCROLL, $WS_VSCROLL, $WS_BORDER, $LBS_HASSTRINGS, $LBS_MULTIPLESEL))
;Global $scrape_auto_join_art_list2 = _GUICtrlListBox_Create($main_gui, 20, 120, 200, 350) ;, 0x00B00002, $WS_HSCROLL)

GUICtrlSetLimit(-1, 500)
Global $scrape_auto_join_rom_label = GUICtrlCreateLabel("Roms without Art", 240, 100, 100, 20)
Global $scrape_auto_join_rom_files_label = GUICtrlCreateLabel("0 Files", 400, 100, 70, 20)
Global $scrape_auto_join_rom_list = GUICtrlCreateList("", 240, 120, 200, 350, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))
GUICtrlSetLimit(-1, 500)
Local $scrape_auto_join_refresh_button = GUICtrlCreateButton("&Refresh", 20, 480, 80, 40)
Local $scrape_auto_join_upload_button = GUICtrlCreateButton("Upload &Art", 440, 550, 180, 40)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
Local $scrape_auto_join_rotate_art_button = GUICtrlCreateButton("Split Back && Front Art and R&otate", 440, 600, 180, 40)
Local $scrape_auto_join_upload_gamelist_button = GUICtrlCreateButton("Upload &Gamelist", 680, 480, 100, 40)

Global $scrape_auto_join_art_1_pic = GUICtrlCreatePic("", 20, 540, 384, 216)
GUICtrlSetState(-1, $GUI_HIDE)

GUICtrlCreateTabItem("Scrape + Manual Join")

Global $scrape_manual_join_websites_label = GUICtrlCreateLabel("Website(s)", 20, 60, 70, 20)
_GUIToolTip_AddTool($tooltip, 0, "The website(s) to scrape the box art from", GUICtrlGetHandle($scrape_manual_join_websites_label))

Global $scrape_manual_join_website_combo = GUICtrlCreateCombo("", 90, 60, 150, 20, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
_GUICtrlComboBox_AddString($scrape_manual_join_website_combo, "Atarimania")
_GUICtrlComboBox_AddString($scrape_manual_join_website_combo, "LaunchBox")
_GUICtrlComboBox_SetCurSel($scrape_manual_join_website_combo, 0)

;_GUIToolTip_AddTool($tooltip, 0, "If checked then box art will be scraped from the RF Generation website", GUICtrlGetHandle($rf_generation_radio))
Global $scrape_manual_join_max_scrapers_label = GUICtrlCreateLabel("Max Scrapers", 20, 100, 80, 20)
_GUIToolTip_AddTool($tooltip, 0, "The maximum number of scrapers that will run in parallel", GUICtrlGetHandle($scrape_manual_join_max_scrapers_label))
Global $scrape_manual_join_max_scrapers_input = GUICtrlCreateInput("10", 90, 100, 30, 20)
Global $scrape_manual_join_max_scrapers_slider = GUICtrlCreateSlider(130, 100, 200, 20)
GUICtrlSetLimit(-1, 10, 1)
GUICtrlSetData(-1, 10)
Global $scrape_manual_join_minimized_scrapers_checkbox = GUICtrlCreateCheckbox("Minimized Scrapers", 20, 130, 120, 20)
_GUIToolTip_AddTool($tooltip, 0, "If checked then run each scraper in a minimized window", GUICtrlGetHandle($scrape_manual_join_minimized_scrapers_checkbox))
GUICtrlSetState(-1, $GUI_CHECKED)
Local $scrape_manual_join_scrape_button = GUICtrlCreateButton("Scrape", 20, 160, 80, 20)
_GUIToolTip_AddTool($tooltip, 0, _
	"Scrapes box art according to the selections above." & @CRLF & _
	@CRLF & _
	"Front Covers will be stored in the Box folder." & @CRLF  & _
	"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
	"Full Covers will be stored in the BoxFull folder." & @CRLF _
	, GUICtrlGetHandle($scrape_manual_join_scrape_button))

Global $scrape_manual_join_match_art_to_roms_radio = GUICtrlCreateRadio("Match Art to Roms", 340, 100, 120, 20)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $scrape_manual_join_match_roms_to_art_radio = GUICtrlCreateRadio("Match Roms to Art", 340, 120, 120, 20)
Global $scrape_manual_join_exclude_uploaded_art_checkbox = GUICtrlCreateCheckbox("Exclude Uploaded Art", 340, 140, 120, 20)
GUICtrlSetState(-1, $GUI_CHECKED)

Global $scrape_manual_join_art_label = GUICtrlCreateLabel("Art", 20, 180, 70, 20)
Global $scrape_manual_join_art_files_label = GUICtrlCreateLabel("0 Files", 180, 180, 70, 20)
Global $scrape_manual_join_art_list = GUICtrlCreateList("", 20, 200, 200, 500, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))
GUICtrlSetLimit(-1, 500)
Global $scrape_manual_join_rom_label = GUICtrlCreateLabel("Roms without Art", 240, 180, 100, 20)
Global $scrape_manual_join_rom_files_label = GUICtrlCreateLabel("0 Files", 400, 180, 70, 20)
Global $scrape_manual_join_rom_list = GUICtrlCreateList("", 240, 200, 200, 500, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))
GUICtrlSetLimit(-1, 500)
Local $scrape_manual_join_refresh_button = GUICtrlCreateButton("&Refresh", 20, 720, 80, 40)
Local $scrape_manual_join_upload_button = GUICtrlCreateButton("Upload &Art", 240, 720, 80, 40)
Local $scrape_manual_join_down_button = GUICtrlCreateButton("&Down", 480, 720, 50, 40)
Local $scrape_manual_join_up_button = GUICtrlCreateButton("&Up", 540, 720, 50, 40)
Local $scrape_manual_join_upload_gamelist_button = GUICtrlCreateButton("Upload &Gamelist", 680, 720, 100, 40)

Global $scrape_manual_join_art_1_pic = GUICtrlCreatePic("", 480, 60, 160, 120)
GUICtrlSetState(-1, $GUI_HIDE)
Global $scrape_manual_join_art_2_pic = GUICtrlCreatePic("", 480, 190, 160, 120)
GUICtrlSetState(-1, $GUI_HIDE)
Global $scrape_manual_join_art_3_pic = GUICtrlCreatePic("", 480, 320, 160, 120)
GUICtrlSetState(-1, $GUI_HIDE)
Global $scrape_manual_join_art_4_pic = GUICtrlCreatePic("", 480, 450, 160, 120)
GUICtrlSetState(-1, $GUI_HIDE)
Global $scrape_manual_join_art_5_pic = GUICtrlCreatePic("", 480, 580, 160, 120)
GUICtrlSetState(-1, $GUI_HIDE)

GUIStartGroup()
Global $art_1_front = GUICtrlCreateRadio("Front", 645, 110, 60, 20)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_2_front = GUICtrlCreateRadio("Front", 645, 240, 60, 20)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_3_front = GUICtrlCreateRadio("Front", 645, 370, 60, 20)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_4_front = GUICtrlCreateRadio("Front", 645, 500, 60, 20)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_5_front = GUICtrlCreateRadio("Front", 645, 630, 60, 20)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUIStartGroup()
Global $art_1_back = GUICtrlCreateRadio("Back", 705, 110, 60, 20)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_2_back = GUICtrlCreateRadio("Back", 705, 240, 60, 20)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_3_back = GUICtrlCreateRadio("Back", 705, 370, 60, 20)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_4_back = GUICtrlCreateRadio("Back", 705, 500, 60, 20)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $art_5_back = GUICtrlCreateRadio("Back", 705, 630, 60, 20)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetState(-1, $GUI_UNCHECKED)

GUICtrlCreateTabItem("") ; end tabitem definition

Global $status_input = GUICtrlCreateInput("Hint - hover mouse over controls for help", 10, 800 - 25, 800 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)


Global $art_gui = GUICreate($app_name, 640, 480, -1, -1, -1, -1, $main_gui)
Global $art_big_pic = GUICtrlCreatePic("", 0, 0, 640, 480)
Global $art_gui2 = GUICreate($app_name, 1024, 576, -1, -1, -1, -1, $main_gui)
Global $art_big_pic2 = GUICtrlCreatePic("", 0, 0, 1024, 576)
Global $art_gui3 = GUICreate("Child", 1024, 576, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
Global $art_big_pic3 = GUICtrlCreatePic("", 0, 0, 1024, 576) ;, 0, 0)
Global $art_big_pic3_width
Global $art_big_pic3_height
Global $aFactors

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

			GUISetState(@SW_HIDE, $current_gui)
			GUISetState(@SW_ENABLE, $main_gui)
			GUISetState(@SW_SHOWNORMAL, $main_gui)

			if $current_gui = $main_gui Then

				GUIDelete($current_gui)
				ExitLoop
			Else

				$current_gui = $main_gui
			EndIf

			if _GUICtrlTab_GetCurSel($tab) = 1 Then

				_GUICtrlListBox_ClickItem($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list))
			EndIf


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

			GUICtrlSetImage($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-1.jpg")
			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_2_pic

			GUICtrlSetImage($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-2.jpg")
			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_3_pic

			GUICtrlSetImage($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-3.jpg")
			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_4_pic

			GUICtrlSetImage($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-4.jpg")
			GUISetState(@SW_DISABLE, $main_gui)
			GUISetState(@SW_SHOW, $art_gui)
			$current_gui = $art_gui

		case $scrape_manual_join_art_5_pic

			GUICtrlSetImage($art_big_pic, $download_path & "\" & $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box\" & _GUICtrlListBox_GetText($scrape_manual_join_art_list, _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)) & "-5.jpg")
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

			Local $result = _WinSCP_Open()

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

			Local $result = _WinSCP_Open()

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
			Local $result = _WinSCP_PutFiles($new_art_path, "/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $sFileName1 & "-full-cover.jpg")

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
			Local $result = _WinSCP_PutFiles($new_art_path, "/opt/retropie/configs/all/emulationstation/downloaded_images/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "/" & $sFileName1 & "-full-cover.jpg")

			if $result = False Then

				GUICtrlSetData($status_input, $_WinSCP_COM_error_description)
			Else

				Local $num_art_files = Number(StringReplace(GUICtrlRead($scrape_manual_join_art_files_label), " Files", ""))
				Local $num_rom_files = Number(StringReplace(GUICtrlRead($scrape_manual_join_rom_files_label), " Files", ""))

				Local $art_list_selected_index = _GUICtrlListBox_GetCurSel($scrape_manual_join_art_list)
				Local $rom_list_selected_index = _GUICtrlListBox_GetCurSel($scrape_manual_join_rom_list)

				if GUICtrlRead($scrape_manual_join_exclude_uploaded_art_checkbox) = $GUI_CHECKED Then

					_GUICtrlListBox_DeleteString($scrape_manual_join_art_list, $art_list_selected_index)
					$num_art_files = $num_art_files - 1
				EndIf

				_GUICtrlListBox_DeleteString($scrape_manual_join_rom_list, $rom_list_selected_index)
				$num_rom_files = $num_rom_files - 1
				GUICtrlSetData($scrape_manual_join_art_files_label, $num_art_files & " Files")
				GUICtrlSetData($scrape_manual_join_rom_files_label, $num_rom_files & " Files")

				if GUICtrlRead($scrape_manual_join_match_art_to_roms_radio) = $GUI_CHECKED Then

					GUICtrlSetState($scrape_manual_join_art_list, $GUI_ENABLE)
					_GUICtrlListBox_ClickItem($scrape_manual_join_art_list, $art_list_selected_index)
				EndIf

				if GUICtrlRead($scrape_manual_join_match_roms_to_art_radio) = $GUI_CHECKED Then

					GUICtrlSetState($scrape_manual_join_rom_list, $GUI_ENABLE)
					_GUICtrlListBox_ClickItem($scrape_manual_join_rom_list, $rom_list_selected_index)
				EndIf


			EndIf

			GUICtrlSetData($status_input, "")
			GUICtrlSetState($scrape_manual_join_art_list, $GUI_ENABLE)
			GUICtrlSetState($scrape_manual_join_rom_list, $GUI_ENABLE)
			GUICtrlSetState($scrape_manual_join_upload_button, $GUI_ENABLE)


		Case $scrape_auto_join_upload_gamelist_button

			GUICtrlSetData($status_input, "Connecting to the RetroPie ...")

			Local $result = _WinSCP_Open()

			if $result = False Then

				GUICtrlSetData($status_input, $_WinSCP_COM_error_description)
			Else

				; Refresh gamelist.xml on RetroPie
				CreateGamelistOnRetroPie()
			EndIf

			GUICtrlSetData($status_input, "")

		Case $scrape_manual_join_upload_gamelist_button

			GUICtrlSetData($status_input, "Connecting to the RetroPie ...")

			Local $result = _WinSCP_Open()

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

        Case GUICtrlGetHandle($scrape_auto_join_art_list)

			Switch $iCode

                Case $LBN_SELCHANGE ; Sent when the user cancels the selection in a list box

					Local $art_name = _GUICtrlListBox_GetText($scrape_auto_join_art_list, _GUICtrlListBox_GetCurSel($scrape_auto_join_art_list))

					if GUICtrlRead($scrape_auto_join_match_art_to_roms_radio) = $GUI_CHECKED Then

						Local $selected_index = 0

						for $i = 1 to StringLen($art_name)

							Local $rom_name_search_text = StringLeft($art_name, $i)
							Local $result = _GUICtrlListBox_SelectString($scrape_auto_join_rom_list, $rom_name_search_text)

							if $result < 0 Then

								ExitLoop
							EndIf

							$selected_index = $result
						Next

						_GUICtrlListBox_SetTopIndex($scrape_auto_join_rom_list, $selected_index - 11)
					EndIf

					if FileExists($download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $art_name & "-full-cover.jpg") = True Then

						GUICtrlSetState($scrape_auto_join_art_1_pic, $GUI_SHOW)
						GUICtrlSetImage($scrape_auto_join_art_1_pic, $download_path_dict.Item(GUICtrlRead($system_combo)) & "\Box_Full\" & $art_name & "-full-cover.jpg")
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
							Local $result = _GUICtrlListBox_SelectString($scrape_auto_join_art_list, $art_name_search_text)

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

						for $i = 1 to StringLen($art_name)

							Local $rom_name_search_text = StringLeft($art_name, $i)
							Local $result = _GUICtrlListBox_SelectString($scrape_manual_join_rom_list, $rom_name_search_text)

							if $result < 0 Then

								ExitLoop
							EndIf

							$selected_index = $result
						Next

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
							Local $result = _GUICtrlListBox_SelectString($scrape_manual_join_art_list, $art_name_search_text)

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

