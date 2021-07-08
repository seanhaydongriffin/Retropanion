#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
#include-once
#Include "Seans RetroPie Companion UDF.au3"

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


Func Settings_tab_setup()

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

EndFunc




Func Settings_tab_event_handler($msg)

;	Switch $msg

;	EndSwitch

EndFunc


