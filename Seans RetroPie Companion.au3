#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
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






_GDIPlus_Startup()


Global $app_name = "Seans RetroPie Companion"

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
$roms_path_dict.Add("3DO", 										"3do")
$roms_path_dict.Add("Amstrad CPC 464", 							"amstradcpc")
$roms_path_dict.Add("Apple II / Apple III", 					"apple2")
$roms_path_dict.Add("Arcade", 									"arcade")
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


; Create the app data folder

Global $app_data_dir = @AppDataDir & "\" & $app_name

if FileExists($app_data_dir) = False Then

	DirCreate($app_data_dir)
EndIf

Global $ini_filename = $app_data_dir & "\" & $app_name & ".ini"
Global $log_filename = $app_data_dir & "\" & $app_name & ".log"

; Erase the log

if FileExists($log_filename) = true Then

	FileDelete($log_filename)
EndIf

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
Global $wiki_emulators_cfg_file_path = $app_data_dir & "\wiki_emulators.cfg"
Global $default_emulator
Global $all_roms_line_arr
Global $gamelist_xml_dom
Global $result = 1

; MAIN GUI


Global $main_gui = GUICreate($app_name, 840, 720, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_MAXIMIZEBOX, $WS_SIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU))
Global $tooltip = _GUIToolTip_Create(0) ; default style tooltip
_GUIToolTip_SetMaxTipWidth($tooltip, 300)

GUICtrlCreateGroup("System", 5, 0, 350, 40)
;Global $system_label = GUICtrlCreateLabel("System", 20, 5, 80, 20)
;GUICtrlSetResizing(-1, $GUI_DOCKALL)
;_GUIToolTip_AddTool($tooltip, 0, "The system to scrape the box art for", GUICtrlGetHandle($system_label))
Global $system_combo = GUICtrlCreateCombo("", 10, 15, 250, 20, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUICtrlComboBox_AddString($system_combo, "3DO")
_GUICtrlComboBox_AddString($system_combo, "Amstrad CPC 464")
_GUICtrlComboBox_AddString($system_combo, "Apple II / Apple III")
_GUICtrlComboBox_AddString($system_combo, "Arcade")
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
Global $system_open_docs_page_button = GUICtrlCreateButton("Open Docs page", 270, 10, 28, 28, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\open docs page.ico")
_GUIToolTip_AddTool($tooltip, 0, "Open the RetroPie Docs page for this system", GUICtrlGetHandle(-1))
Global $system_open_wiki_page_button = GUICtrlCreateButton("Open Wiki page", 300, 10, 28, 28, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\open wiki page.ico")
_GUIToolTip_AddTool($tooltip, 0, "Open the Wiki page for this system", GUICtrlGetHandle(-1))
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Display Device", 360, 0, 200, 40)
Global $display_device_name_combo = GUICtrlCreateCombo("", 370, 15, 150, 20, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("EmulationStation", 580, 0, 100, 40)
Local $config_restart_emulationstation_button = GUICtrlCreateButton("Restart", 590, 15, 28, 28, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\restart.ico")
_GUIToolTip_AddTool($tooltip, 0, "Restart EmulationStation", GUICtrlGetHandle(-1))
;Local $config_shutdown_emulationstation_button = GUICtrlCreateButton("Shutdown", $systems_list_config_x + 20, $systems_list_config_y + 120, 120, 40)
Local $config_quit_emulationstation_button = GUICtrlCreateButton("Quit", 620, 15, 28, 28, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\exit.ico")
_GUIToolTip_AddTool($tooltip, 0, "Quit EmulationStation", GUICtrlGetHandle(-1))
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("RetroPie", 700, 0, 100, 40)
Global $config_reboot_button = GUICtrlCreateButton("Restart", 710, 15, 28, 28, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\restart.ico")
_GUIToolTip_AddTool($tooltip, 0, "Restart RetroPie", GUICtrlGetHandle(-1))
Global $config_shutdown_button = GUICtrlCreateButton("Shutdown", 740, 15, 28, 28, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\shutdown.ico")
_GUIToolTip_AddTool($tooltip, 0, "Shutdown RetroPie", GUICtrlGetHandle(-1))
GUICtrlCreateGroup("", -99, -99, 1, 1)

Global $tab = GUICtrlCreateTab(5, 40, 840-10, 720-30-30)
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

GUICtrlCreateGroup("RetroPie", 20, 80, 380, 160)
Global $retropie_hostname_label = GUICtrlCreateLabel("Hostname", 30, 100, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_hostname_input = GUICtrlCreateInput("retropie", 120, 100, 240, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_username_label = GUICtrlCreateLabel("Username", 30, 120, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_username_input = GUICtrlCreateInput("pi", 120, 120, 240, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_password_label = GUICtrlCreateLabel("Password", 30, 140, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_password_input = GUICtrlCreateInput("raspberry", 120, 140, 240, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_ssh_key_label = GUICtrlCreateLabel("SSH Key", 30, 160, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_ssh_key_input = GUICtrlCreateInput("ssh-ed25519 255 cq4AFscwWDozkpWLAzpJmZak8M7USnljP1lO36e23Co=", 120, 160, 240, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $minimized_scrapers_checkbox = GUICtrlCreateCheckbox("Confirmation Prompts", 420, 180, 200, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("PC", 20, 300, 380, 100)
Global $retropie_download_path_label = GUICtrlCreateLabel("Download Path", 30, 320, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $retropie_download_path_input = GUICtrlCreateInput("D:\dwn", 120, 320, 240, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Display Device", 420, 220, 300, 450)
;Global $display_device_name_label = GUICtrlCreateLabel("Name", 30, 240, 30, 20)
;GUICtrlSetResizing(-1, $GUI_DOCKALL)
;_GUIToolTip_AddTool($tooltip, 0, "The system to scrape the box art for", GUICtrlGetHandle($system_label))
;Global $display_device_name_combo = GUICtrlCreateCombo("", 70, 240, 150, 20, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
;GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $display_device_add_button = GUICtrlCreateButton("Add", 430, 240, 28, 28, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\add.ico")
_GUIToolTip_AddTool($tooltip, 0, "Add a new Display Device", GUICtrlGetHandle(-1))
Global $display_device_delete_button = GUICtrlCreateButton("Del", 460, 240, 28, 28, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\delete.ico")
_GUIToolTip_AddTool($tooltip, 0, "Delete the selected Display Device", GUICtrlGetHandle(-1))
Global $display_device_scan_modes_button = GUICtrlCreateButton("Scan Modes", 490, 240, 28, 28, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\scan video modes.ico")
_GUIToolTip_AddTool($tooltip, 0, "Scan all video modes for the connected Display Device", GUICtrlGetHandle(-1))
Global $display_device_listview = GUICtrlCreateListView("Video Mode|Resolution", 430, 300, 260, 360)
_GUICtrlListView_SetColumnWidth(-1, 0, 90)
_GUICtrlListView_SetColumnWidth(-1, 1, 160)
_GUICtrlListView_SetExtendedListViewStyle($display_device_listview, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
GUICtrlCreateGroup("", -99, -99, 1, 1)

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
EndIf


GUICtrlCreateTabItem("ROMs")

GUICtrlCreateGroup("ROMs", 20, 140, 250, 500)

Global $rebuild_roms_roms_list = GUICtrlCreateList("", 30, 170, 200, 420, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))
GUICtrlSetResizing(-1, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
GUICtrlSetLimit(-1, 500)

Local $rebuild_roms_refresh_button = GUICtrlCreateButton("&Get Data", 30, 590, 36, 36, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\get from retropie.ico")
_GUIToolTip_AddTool($tooltip, 0, "Get the list of roms from the RetroPie", GUICtrlGetHandle(-1))
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

Global $rebuild_roms_rebuild_button = GUICtrlCreateButton("Rebuild / Repair", 120, 590, 36, 36, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\repair.ico")
_GUIToolTip_AddTool($tooltip, 0, "Rebuild / Repair the selected rom", GUICtrlGetHandle(-1))
GUICtrlCreateGroup("", -99, -99, 1, 1)





GUICtrlCreateTabItem("Scrape Metadata")

Global $scrape_metadata_websites_label = GUICtrlCreateLabel("Website(s)", 20, 60, 70, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, "The website(s) to scrape the box art from", GUICtrlGetHandle($scrape_metadata_websites_label))
Global $scrape_metadata_website_combo = GUICtrlCreateCombo("", 90, 60, 150, 20, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUICtrlComboBox_AddString($scrape_metadata_website_combo, "LaunchBox")
_GUICtrlComboBox_SetCurSel($scrape_metadata_website_combo, 0)
Global $scrape_metadata_max_scrapers_label = GUICtrlCreateLabel("Max Scrapers", 250, 60, 80, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, "The maximum number of scrapers that will run in parallel", GUICtrlGetHandle($scrape_metadata_max_scrapers_label))
Global $scrape_metadata_max_scrapers_input = GUICtrlCreateInput("10", 320, 60, 30, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_metadata_max_scrapers_slider = GUICtrlCreateSlider(360, 60, 150, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetLimit(-1, 10, 1)
GUICtrlSetData(-1, 10)
Global $scrape_metadata_minimized_scrapers_checkbox = GUICtrlCreateCheckbox("Minimized Scrapers", 520, 60, 120, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetState(-1, $GUI_CHECKED)
_GUIToolTip_AddTool($tooltip, 0, "If checked then run each scraper in a minimized window", GUICtrlGetHandle($scrape_metadata_minimized_scrapers_checkbox))
Local $scrape_metadata_scrape_button = GUICtrlCreateButton("Scrape", 640, 60, 36, 36, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\scraper.ico")
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, _
	"Scrapes box art according to the selections above." & @CRLF & _
	@CRLF & _
	"Front Covers will be stored in the Box folder." & @CRLF  & _
	"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
	"Full Covers will be stored in the BoxFull folder." & @CRLF _
	, GUICtrlGetHandle(-1))

GUICtrlCreateGroup("", -1, -1, 0, 0)
GUICtrlSetState(-1, $GUI_HIDE)
Global $scrape_metadata_match_scraped_data_to_games_radio = GUICtrlCreateRadio("Match Scraped Data to Games", 30, 140, 180, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $scrape_metadata_match_games_to_scraped_data_radio = GUICtrlCreateRadio("Match Games to Scraped Data", 240, 140, 180, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlCreateGroup("", -99, -99, 1, 1)

Global $scrape_metadata_scraped_data_label = GUICtrlCreateLabel("Scraped Data", 20, 180, 70, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_metadata_scraped_data_files_label = GUICtrlCreateLabel("0 Files", 180, 180, 70, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_metadata_scraped_data_list = GUICtrlCreateList("", 20, 200, 200, 420, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL))
GUICtrlSetResizing(-1, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
GUICtrlSetLimit(-1, 500)
Global $scrape_metadata_games_label = GUICtrlCreateLabel("Games", 240, 180, 100, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_metadata_games_files_label = GUICtrlCreateLabel("0 Files", 400, 180, 70, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Global $scrape_metadata_games_list = GUICtrlCreateList("", 240, 200, 200, 420, BitOR($GUI_SS_DEFAULT_LIST, $WS_HSCROLL)) ;, $LBS_EXTENDEDSEL))
GUICtrlSetResizing(-1, $GUI_DOCKALL + $GUI_DOCKBOTTOM)
;GUICtrlSetLimit(-1, 500)

Local $scrape_metadata_refresh_button = GUICtrlCreateButton("&Get Data", 20, 640, 36, 36, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\get from retropie and scraper.ico")
_GUIToolTip_AddTool($tooltip, 0, "Get data scraped (local PC) plus games list (RetroPie)", GUICtrlGetHandle(-1))
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

GUICtrlCreateGroup("Mismatching Metadata Type", 460, 200, 200, 150)
Global $scrape_metadata_release_date_checkbox = GUICtrlCreateCheckbox("Release Date", 480, 220, 120, 20)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $scrape_metadata_developer_checkbox = GUICtrlCreateCheckbox("Developer", 480, 240, 120, 20)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $scrape_metadata_publisher_checkbox = GUICtrlCreateCheckbox("Publisher", 480, 260, 120, 20)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $scrape_metadata_genre_checkbox = GUICtrlCreateCheckbox("Genre", 480, 280, 120, 20)
GUICtrlSetState(-1, $GUI_UNCHECKED)
Global $scrape_metadata_players_checkbox = GUICtrlCreateCheckbox("Players", 480, 300, 120, 20)
GUICtrlSetState(-1, $GUI_CHECKED)

Global $scrape_metadata_listview = GUICtrlCreateListView("Metadata Name|Scraped|RetroPie", 460, 370, 350, 200)
_GUICtrlListView_SetColumnWidth(-1, 0, 110)
_GUICtrlListView_SetColumnWidth(-1, 1, 100)
_GUICtrlListView_SetColumnWidth(-1, 2, 100)
_GUICtrlListView_AddItem(-1, "Release Date", 0)
_GUICtrlListView_AddItem(-1, "Developer", 0)
_GUICtrlListView_AddItem(-1, "Publisher", 0)
_GUICtrlListView_AddItem(-1, "Genre", 0)
_GUICtrlListView_AddItem(-1, "Players", 0)
Global $scrape_metadata_imagelist = _GUIImageList_Create(16, 16)
_GUIImageList_Add($scrape_metadata_imagelist, _GUICtrlListView_CreateSolidBitMap($scrape_metadata_listview, $COLOR_WHITE, 16, 16))
_GUIImageList_Add($scrape_metadata_imagelist, _GUICtrlListView_CreateSolidBitMap($scrape_metadata_listview, $COLOR_GREEN, 16, 16))
_GUIImageList_Add($scrape_metadata_imagelist, _GUICtrlListView_CreateSolidBitMap($scrape_metadata_listview, $COLOR_RED, 16, 16))
_GUICtrlListView_SetImageList($scrape_metadata_listview, $scrape_metadata_imagelist, 1)

Local $scrape_metadata_update_gamelist_button = GUICtrlCreateButton("&Apply Scraped Data", 460, 580, 120, 20)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $scrape_metadata_upload_gamelist_button = GUICtrlCreateButton("Upload Data to Retro&Pie", 680, 640, 140, 40)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)


GUICtrlCreateTabItem("Scrape Images with Auto Join")

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
Local $scrape_button = GUICtrlCreateButton("Scrape", 640, 60, 36, 36, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\scraper.ico")
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, _
	"Scrapes box art according to the selections above." & @CRLF & _
	@CRLF & _
	"Front Covers will be stored in the Box folder." & @CRLF  & _
	"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
	"Full Covers will be stored in the BoxFull folder." & @CRLF _
	, GUICtrlGetHandle(-1))

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
Local $scrape_auto_join_refresh_button = GUICtrlCreateButton("&Refresh", 20, 480, 36, 36, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\get from retropie and scraper.ico")
_GUIToolTip_AddTool($tooltip, 0, "Get art scraped (local PC) plus games list (RetroPie)", GUICtrlGetHandle(-1))
GUICtrlSetResizing(-1, $GUI_DOCKALL)
Local $scrape_auto_join_upload_button = GUICtrlCreateButton("Upload &Art", 440, 550, 180, 40)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
Local $scrape_auto_join_rotate_art_button = GUICtrlCreateButton("Split Back && Front Art and R&otate", 440, 600, 180, 40)
Local $scrape_auto_join_upload_gamelist_button = GUICtrlCreateButton("Upload &Gamelist ...", 680, 480, 100, 40)
GUICtrlSetResizing(-1, $GUI_DOCKALL)

Global $scrape_auto_join_art_1_pic = GUICtrlCreatePic("", 20, 540, 384, 120)
GUICtrlSetState(-1, $GUI_HIDE)

GUICtrlCreateTabItem("Scrape Images with Manual Join")

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
Local $scrape_manual_join_scrape_button = GUICtrlCreateButton("Scrape", 640, 60, 36, 36, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\scraper.ico")
GUICtrlSetResizing(-1, $GUI_DOCKALL)
_GUIToolTip_AddTool($tooltip, 0, _
	"Scrapes box art according to the selections above." & @CRLF & _
	@CRLF & _
	"Front Covers will be stored in the Box folder." & @CRLF  & _
	"Back Covers will be stored in the BoxBack folder." & @CRLF  & _
	"Full Covers will be stored in the BoxFull folder." & @CRLF _
	, GUICtrlGetHandle(-1))

GUICtrlCreateGroup("", -1, -1, 0, 0)
GUICtrlSetState(-1, $GUI_HIDE)
Global $scrape_manual_join_match_art_to_roms_radio = GUICtrlCreateRadio("Match Art to Roms", 20, 140, 120, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $scrape_manual_join_match_roms_to_art_radio = GUICtrlCreateRadio("Match Roms to Art", 140, 140, 120, 20)
GUICtrlSetResizing(-1, $GUI_DOCKALL)
GUICtrlCreateGroup("", -99, -99, 1, 1)

Global $scrape_manual_join_exclude_uploaded_art_checkbox = GUICtrlCreateCheckbox("Exclude Uploaded Art", 260, 140, 120, 20)
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
;GUICtrlSetLimit(-1, 500)

Local $scrape_manual_join_refresh_button = GUICtrlCreateButton("&Refresh", 20, 640, 36, 36, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\get from retropie and scraper.ico")
_GUIToolTip_AddTool($tooltip, 0, "Get art scraped (local PC) plus games list (RetroPie)", GUICtrlGetHandle(-1))
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $scrape_manual_join_upload_button = GUICtrlCreateButton("Upload &Art", 240, 640, 80, 40)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $scrape_manual_join_upload_gamelist_button = GUICtrlCreateButton("Upload &Gamelist", 330, 640, 100, 40)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $scrape_manual_join_down_button = GUICtrlCreateButton("&Down", 710, 640, 36, 36, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\down.ico")
_GUIToolTip_AddTool($tooltip, 0, "Move selection down", GUICtrlGetHandle(-1))
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $scrape_manual_join_up_button = GUICtrlCreateButton("&Up", 770, 640, 36, 36, $BS_ICON)
GUICtrlSetImage(-1, @ScriptDir & "\up.ico")
_GUIToolTip_AddTool($tooltip, 0, "Move selection up", GUICtrlGetHandle(-1))
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
Local $boot_config_y = 60
Local $systems_list_config_x = 20
Local $systems_list_config_y = $boot_config_y + 200
Local $input_devices_config_x = 20
Local $input_devices_config_y = $systems_list_config_y + 200
Local $system_config_x = 230
Local $system_config_y = 60
Local $game_config_x = 230
Local $game_config_y = $boot_config_y + 210


GUICtrlCreateGroup("RetroPie", $boot_config_x, $boot_config_y, 200, 180)
Local $config_boot_edit_config_button = GUICtrlCreateButton("Edit Boot Config", $boot_config_x + 20, $boot_config_y + 20, 120, 40)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("EmulationStation", $systems_list_config_x, $systems_list_config_y, 200, 180)
Local $config_edit_systems_list_button = GUICtrlCreateButton("Edit Systems List", $systems_list_config_x + 20, $systems_list_config_y + 20, 120, 40)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Input Devices", $input_devices_config_x, $input_devices_config_y, 200, 180)
Local $config_joystick_0_test_button = GUICtrlCreateButton("Joystick 0 test", $input_devices_config_x + 20, $input_devices_config_y + 20, 120, 20)
_GUIToolTip_AddTool($tooltip, 0, "The output of this can be used in the configuration of RetroArch", GUICtrlGetHandle($config_joystick_0_test_button))
Local $config_joystick_1_test_button = GUICtrlCreateButton("Joystick 1 test", $input_devices_config_x + 20, $input_devices_config_y + 50, 120, 20)
_GUIToolTip_AddTool($tooltip, 0, "The output of this can be used in the configuration of RetroArch", GUICtrlGetHandle($config_joystick_1_test_button))
GUICtrlCreateGroup("", -99, -99, 1, 1)

Global $config_emulators_games_group = GUICtrlCreateGroup("Emulators && Games (3DO)", $system_config_x, $system_config_y, 600, 620)
Global $config_display_device_label = GUICtrlCreateLabel("Display Device", $system_config_x + 20, $system_config_y + 20, 80, 20)
Global $config_display_device_combo = GUICtrlCreateCombo("", $system_config_x + 110, $system_config_y + 20, 150, 20, BitOR($CBS_DROPDOWNLIST, $CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL))

for $i = 1 to $display_device_filename_arr[0]

	Local $display_device_filename = $display_device_filename_arr[$i]
	$display_device_filename = StringReplace($display_device_filename, "display device ", "")
	$display_device_filename = StringReplace($display_device_filename, ".txt", "")
	_GUICtrlComboBox_AddString($config_display_device_combo, $display_device_filename)
Next

_GUICtrlComboBox_SetCurSel($config_display_device_combo, 0)

Global $config_emulators_games_reload_button = GUICtrlCreateButton("Reload from RetroPie", $system_config_x + 270, $system_config_y + 20, 180, 20)
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
;Global $art_gui2 = GUICreate($app_name, 1024, 576, -1, -1, BitOr($GUI_SS_DEFAULT_GUI, $WS_SIZEBOX), $WS_EX_MDICHILD, $main_gui)
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



Global $upload_data_to_retropie_gui = GUICreate($app_name & " - Upload Game List to RetroPie", 1024, 480, -1, -1, -1, $WS_EX_MDICHILD, $main_gui)
Global $upload_data_to_retropie_upload_button = GUICtrlCreateButton("Upload game list (left side)", 10, 5, 200, 40)
Global $upload_data_to_retropie_ie = _IECreateEmbedded()
GUICtrlCreateObj($upload_data_to_retropie_ie, 10, 50, 1004, 400)
Global $upload_data_to_retropie_status_input = GUICtrlCreateInput("", 10, 480 - 25, 640 - 20, 20, $ES_READONLY, $WS_EX_STATICEDGE)

Global $upload_data_to_retropie_dummy = GUICtrlCreateDummy()
Local $upload_data_aAccelKeys[1][2] = [["{Esc}", $upload_data_to_retropie_dummy]]
GUISetAccelerators($upload_data_aAccelKeys, $upload_data_to_retropie_gui)


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

_GUICtrlComboBox_SelectString($system_combo, IniRead($ini_filename, "Global", "System", "3DO"))
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
					IniWrite($ini_filename, "Global", "System", GUICtrlRead($system_combo))
					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : GUICtrlRead($system_combo) = ' & GUICtrlRead($system_combo) & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $ini_filename = ' & $ini_filename & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			EndSwitch

        Case GUICtrlGetHandle($display_device_name_combo)

			Switch $iCode

                Case $CBN_SELCHANGE

					RefreshDisplayDeviceVideoModesListView()
			EndSwitch

		case GUICtrlGetHandle($config_display_device_combo)

			Switch $iCode

                Case $CBN_SELCHANGE

					ReloadEmulatorsAndGamesConfig()
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

					IniWrite($ini_filename, "Global", "Tab", _GUICtrlTab_GetCurSel($tab))

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
	GUICtrlSetData($status_input, "Saved emulators.cfg to /opt/retropie/configs/all on the RetroPie. Start the game using the RetroPie to try the emulator.")
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

	_GUICtrlListView_DeleteAllItems($display_device_listview)
	Local $display_device_filename = $app_data_dir & "\display device " & GUICtrlRead($display_device_name_combo) & ".txt"
	Local $display_device_arr
	_FileReadToArray($display_device_filename, $display_device_arr, 0, "|")
	_GUICtrlListView_AddArray($display_device_listview, $display_device_arr)
EndFunc

Func ReloadEmulatorsAndGamesConfig()

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
	Local $videomodes_arr = _StringSplit2d($result, " = ")

	for $i = 0 to (UBound($videomodes_arr) - 1)

		if StringLen($videomodes_arr[$i][0]) = 0 Then

			_ArrayDelete($videomodes_arr, $i)
		EndIf
	Next

	Local $display_device_filename = $app_data_dir & "\display device " & GUICtrlRead($config_display_device_combo) & ".txt"
	Local $display_device_arr
	_FileReadToArray($display_device_filename, $display_device_arr, 0, "|")
;				_ArrayDisplay($video_mode_arr)

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

	Local $g_bSortSense = False
	_GUICtrlListView_SimpleSort($config_game_listview, $g_bSortSense, 0, False)
	_GUICtrlListView_EndUpdate($config_game_listview)
	GUICtrlSetData($config_games_label, "Games (" & _GUICtrlListView_GetItemCount($config_game_listview) & ")")
	Enable_Config($GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE, $GUI_ENABLE)
	GUICtrlSetData($status_input, "Emulators & Games reloaded.")

	; compare the emulators to the wiki page for differences

	GUICtrlSetData($status_input, "Reading https://github.com/seanhaydongriffin/Seans-RetroPie-Companion/wiki/" & $roms_path_dict.Item(GUICtrlRead($system_combo)) & "-Emulator-Game-Compatibility")
	Local $iPID = Run('curl.exe -s -k -H "Content-Type: text/html; charset=utf-8" https://github.com/seanhaydongriffin/Seans-RetroPie-Companion/wiki/' & $roms_path_dict.Item(GUICtrlRead($system_combo)) & '-Emulator-Game-Compatibility', @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
	ProcessWaitClose($iPID)
	GUICtrlSetData($status_input, "")
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

					GUICtrlSetData($status_input, "Erasing videomodes.cfg on the RetroPie ...")
					plink_delete_all_text_in_file("/opt/retropie/configs/all/videomodes.cfg")
					GUICtrlSetData($status_input, "Saving videomodes.cfg to /opt/retropie/configs/all/videomodes.cfg on the RetroPie ...")
					plink_insert_text_in_file("/opt/retropie/configs/all/videomodes.cfg", $videomodes_str)
					GUICtrlSetData($status_input, "Saved videomodes.cfg to /opt/retropie/configs/all on the RetroPie.")

					; reload from RetroPie after above updates
					ReloadEmulatorsAndGamesConfig()

					ExitLoop
				EndIf

				ExitLoop
			EndIf
		EndIf
	Next

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

