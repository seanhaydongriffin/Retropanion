#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <AutoItConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <File.au3>

Local $app_name = "Seans Atarimania Scraper"

Local $ImageMagick_path = "C:\Program Files\ImageMagick-7.0.11-Q16-HDRI"
Local $sDrive = "", $sDir = "", $sFileName = "", $sExtension = ""
Local $sDrive1 = "", $sDir1 = "", $sFileName1 = "", $sExtension1 = ""
Local $sDrive2 = "", $sDir2 = "", $sFileName2 = "", $sExtension2 = ""

Global $page_letter[27] = ["1", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
Global $page_id[27] = ["62", "791", "699", "897", "549", "275", "462", "485", "318", "164", "169", "211", "382", "1013", "222", "178", "617", "89", "414", "1456", "656", "85", "120", "333", "18", "27", "88"]
Global $system_dict = ObjCreate("Scripting.Dictionary")
$system_dict.Add("3DO", "1")
$system_dict.Add("Acorn Archimedes", "74")
$system_dict.Add("Acorn Electron", "65")
$system_dict.Add("Amstrad CPC 464", "3")
$system_dict.Add("APF M1000 / MP1000", "68")
$system_dict.Add("Apple II / Apple III", "111")
$system_dict.Add("Apple IIGS", "112")
$system_dict.Add("Apple Macintosh", "17")
$system_dict.Add("Arcade", "5")
$system_dict.Add("Atari 2600", "6")
$system_dict.Add("Atari 5200", "7")
$system_dict.Add("Atari 7800", "8")
$system_dict.Add("Atari 8-bit Family", "102")
$system_dict.Add("Atari Jaguar", "9")
$system_dict.Add("Atari Jaguar CD", "10")
$system_dict.Add("Atari Lynx", "11")
$system_dict.Add("Atari ST / TT / Falcon", "76")
$system_dict.Add("Bally Professional Arcade / Astrocade", "77")
;$system_dict.Add("Bandai Datach Joint ROM System", "220")
;$system_dict.Add("Bandai Pippin ATMARK / @WORLD", "065")
;$system_dict.Add("Bandai Playdia", "098")
;$system_dict.Add("Bandai RX-78 Gundam", "241")
;$system_dict.Add("Bandai SuFami Turbo", "099")
;$system_dict.Add("Bandai Super Vision 8000", "112")
$system_dict.Add("Bandai WonderSwan", "55")
$system_dict.Add("Bandai WonderSwan Color / SwanCrystal", "56")
;$system_dict.Add("BBC Bridge Companion", "225")
$system_dict.Add("BBC Micro", "59")
;$system_dict.Add("Betamax / VHS", "VHS")
;$system_dict.Add("BIT Gamate", "101")
;$system_dict.Add("Blaze Evercade", "238")
;$system_dict.Add("Bright Things Bubble", "230")
;$system_dict.Add("Buzztime Home Trivia System", "164")
;$system_dict.Add("Camerica Aladdin", "080")
;$system_dict.Add("Capcom CPS Changer", "137")
;$system_dict.Add("Casio Loopy", "138")
$system_dict.Add("Casio PV-1000", "115")
;$system_dict.Add("Casio PV-2000", "146")
$system_dict.Add("Coleco / CBS ColecoVision", "13")
$system_dict.Add("Coleco ADAM", "117")
;$system_dict.Add("Coleco Telstar Arcade", "007")
;$system_dict.Add("Commodore 16 / Plus 4 / 116", "140")
$system_dict.Add("Commodore 64 / 128", "14")
$system_dict.Add("Commodore Amiga", "2")
$system_dict.Add("Commodore Amiga CD32", "119")
$system_dict.Add("Commodore Amiga CDTV", "120")
$system_dict.Add("Commodore PET", "181")
$system_dict.Add("Commodore VIC-20", "122")
;$system_dict.Add("Cougar Boy / MegaDuck", "090")
;$system_dict.Add("Cybiko Classic / Extreme", "162")
$system_dict.Add("Dragon 32 / 64", "66")
;$system_dict.Add("DVD", "00D")
;$system_dict.Add("EACA EG2000 Colour Genie", "108")
$system_dict.Add("Emerson Arcadia 2001 / MPT-03 / Palladium", "79")
$system_dict.Add("Enterprise 64 / 128", "72")
$system_dict.Add("Entex Adventure Vision", "67")
;$system_dict.Add("Entex Select-A-Game Machine", "113")
;$system_dict.Add("EPOCH Cassette Vision", "110")
$system_dict.Add("EPOCH Game Pocket Computer", "132")
$system_dict.Add("EPOCH Super Cassette Vision / Yeno Super Cassette Vision", "81")
$system_dict.Add("Exidy Sorcerer", "184")
$system_dict.Add("Fairchild Channel F", "58")
;$system_dict.Add("Fisher Price Pixter", "155")
;$system_dict.Add("Fisher-Price Smart Cycle Racer", "211")
$system_dict.Add("Fujitsu FM Towns / Marty", "124")
$system_dict.Add("Fujitsu FM-7 / FM-77", "186")
;$system_dict.Add("Fujitsu FM77AV", "212")
$system_dict.Add("Funtech Super A Can", "133")
;$system_dict.Add("Gakken Compact Vision", "139")
$system_dict.Add("Game Park GP32", "135")
;$system_dict.Add("Game Watches", "125")
;$system_dict.Add("Gamepark Holdings GP2X Caanoo", "206")
;$system_dict.Add("GamePark Holdings GP2X Wiz", "195")
$system_dict.Add("GCE Vectrex / Bandai Kousokusen", "125")
;$system_dict.Add("GOG.com", "217")
;$system_dict.Add("GoGo TV Video Vision", "147")
;$system_dict.Add("Handspring Visor", "198")
$system_dict.Add("Hartung Game Master", "136")
;$system_dict.Add("Hasbro Net Jet", "177")
;$system_dict.Add("IBM PC", "016")
;$system_dict.Add("IBM PC Jr.", "081")
$system_dict.Add("Interton VC 4000", "137")
;$system_dict.Add("Interton Video 2000", "103")
;$system_dict.Add("itch.io", "234")
;$system_dict.Add("Jazwares Disney Dream Sketcher", "158")
;$system_dict.Add("LaserDisc", "221")
;$system_dict.Add("LeapFrog Didj", "157")
;$system_dict.Add("Leapfrog Fly", "119")
;$system_dict.Add("Leapfrog iQuest", "117")
;$system_dict.Add("Leapfrog Leapster", "118")
;$system_dict.Add("LeapFrog LeapTV", "228")
;$system_dict.Add("LJN Video Art", "035")
$system_dict.Add("Magnavox Odyssey", "78")
$system_dict.Add("Magnavox Odyssey^2 / VideoPac", "57")
$system_dict.Add("Mattel Aquarius", "69")
;$system_dict.Add("Mattel Childrens Discovery System", "105")
$system_dict.Add("Mattel Hyperscan", "171")
$system_dict.Add("Mattel Intellivision", "15")
;$system_dict.Add("Memorex VIS", "058")
$system_dict.Add("Memotech MTX", "60")
$system_dict.Add("Microsoft Xbox", "18")
$system_dict.Add("Microsoft Xbox 360", "19")
;$system_dict.Add("Microsoft Xbox Live Arcade", "150")
;$system_dict.Add("Microsoft Xbox LIVE Games on Demand", "207")
;$system_dict.Add("Microsoft Xbox Live Indie Games", "185")
$system_dict.Add("Microsoft Xbox One", "20")
;$system_dict.Add("Microsoft Xbox Series", "64")
;$system_dict.Add("Milton Bradley MicroVision", "011")
;$system_dict.Add("MSX / MSX2 / Zemmix", "122")
;$system_dict.Add("Multiple Consoles", "999")
$system_dict.Add("NEC PC Engine / TurboGrafx-16", "54")
$system_dict.Add("NEC PC Engine CD / TurboGrafx CD", "163")
;$system_dict.Add("NEC PC-8001", "174")
$system_dict.Add("NEC PC-88", "192")
$system_dict.Add("NEC PC-98", "193")
$system_dict.Add("NEC PC-FX", "161")
$system_dict.Add("NEC SuperGrafx", "162")
;$system_dict.Add("NEC Trek / PC-6001", "172")
;$system_dict.Add("Nichibutsu My Vision", "180")
;$system_dict.Add("Nikko digiBlast", "121")
$system_dict.Add("Nintendo 3DS", "24")
;$system_dict.Add("Nintendo 3DS Virtual Console", "210")
$system_dict.Add("Nintendo 64", "25")
$system_dict.Add("Nintendo 64 DD", "194")
$system_dict.Add("Nintendo DS", "26")
;$system_dict.Add("Nintendo DSi", "160")
;$system_dict.Add("Nintendo DSiWare", "161")
;$system_dict.Add("Nintendo e-Reader", "077")
;$system_dict.Add("Nintendo eShop", "188")
$system_dict.Add("Nintendo Famicom Disk System", "157")
$system_dict.Add("Nintendo Game & Watch", "166")
$system_dict.Add("Nintendo Game Boy", "28")
$system_dict.Add("Nintendo Game Boy Advance", "29")
$system_dict.Add("Nintendo Game Boy Color", "30")
$system_dict.Add("Nintendo GameCube", "31")
;$system_dict.Add("Nintendo iQue", "124")
$system_dict.Add("Nintendo NES / Famicom", "27")
;$system_dict.Add("Nintendo New Nintendo 3DS", "222")
$system_dict.Add("Nintendo Pok&eacute;mon Mini", "195")
$system_dict.Add("Nintendo SNES / Super Famicom", "53")
$system_dict.Add("Nintendo Switch", "211")
$system_dict.Add("Nintendo Virtual Boy", "32")
$system_dict.Add("Nintendo Wii", "33")
$system_dict.Add("Nintendo Wii U", "34")
;$system_dict.Add("Nintendo Wii U Virtual Console", "209")
;$system_dict.Add("Nintendo Wii Virtual Console", "152")
;$system_dict.Add("Nintendo WiiWare", "208")
$system_dict.Add("Nokia N-Gage", "213")
$system_dict.Add("Nuon Technology", "126")
;$system_dict.Add("Ohio Arts Etch-A-Sketch Animator 2000", "127")
;$system_dict.Add("OnLive", "201")
$system_dict.Add("Oric-1 / Atmos", "64")
;$system_dict.Add("Origin", "214")
$system_dict.Add("OUYA", "35")
;$system_dict.Add("Palm OS", "141")
;$system_dict.Add("Palmtex Super Micro", "196")
;$system_dict.Add("Panasonic JR", "193")
;$system_dict.Add("PC-50X Family", "149")
$system_dict.Add("Philips CD-i", "37")
;$system_dict.Add("Philips Tele-spiel ES-2201", "104")
$system_dict.Add("Philips VG-5000", "140")
;$system_dict.Add("Pioneer LaserActive", "053")
;$system_dict.Add("Plug & Play TV Games", "00J")
;$system_dict.Add("Pocket PC", "235")
;$system_dict.Add("Pong Consoles", "00P")
;$system_dict.Add("Radio Shack TRS-80 Micro Color Computer", "237")
;$system_dict.Add("Radio Shack TRS-80 Pocket Computer", "229")
;$system_dict.Add("Radio Shack/Tandy TRS-80", "004")
$system_dict.Add("RCA Studio II / MPT-02", "142")
;$system_dict.Add("RDI Halcyon", "028")
;$system_dict.Add("Robotron KC 85", "175")
;$system_dict.Add("Robotron KC 87", "176")
;$system_dict.Add("Romtec ColorVision", "102")
$system_dict.Add("Sammy Atomiswave", "98")
;$system_dict.Add("Sears Talking Computron", "181")
$system_dict.Add("Sega 32X", "38")
;$system_dict.Add("Sega Advanced Pico Beena", "200")
;$system_dict.Add("Sega AI Computer", "223")
$system_dict.Add("Sega CD / Mega CD", "39")
$system_dict.Add("Sega Dreamcast", "40")
$system_dict.Add("Sega Game Gear", "41")
$system_dict.Add("Sega Genesis / Mega Drive", "42")
$system_dict.Add("Sega Master System / Mark III", "43")
$system_dict.Add("Sega Pico", "105")
$system_dict.Add("Sega Saturn", "45")
$system_dict.Add("Sega SG-1000 / SC-3000", "80")
$system_dict.Add("Sharp MZ Family", "205")
$system_dict.Add("Sharp X1", "204")
$system_dict.Add("Sharp X68000", "128")
;$system_dict.Add("Sinclair QL", "233")
$system_dict.Add("Sinclair ZX Spectrum", "46")
;$system_dict.Add("Sinclair ZX Spectrum +3", "226")
$system_dict.Add("Sinclair ZX80 / ZX81 / Timex Sinclair 1000", "147")
;$system_dict.Add("SNK Hyper Neo Geo 64", "168")
$system_dict.Add("SNK Neo Geo AES", "23")
$system_dict.Add("SNK Neo Geo CD", "167")
$system_dict.Add("SNK Neo Geo MVS", "210")
$system_dict.Add("SNK Neo Geo Pocket", "21")
$system_dict.Add("SNK Neo Geo Pocket Color", "22")
;$system_dict.Add("SNK Neo Geo X", "204")
$system_dict.Add("Sony PlayStation", "47")
$system_dict.Add("Sony PlayStation 2", "48")
$system_dict.Add("Sony PlayStation 3", "49")
$system_dict.Add("Sony PlayStation 4", "50")
;$system_dict.Add("Sony PlayStation 5", "63")
;$system_dict.Add("Sony PlayStation Network", "151")
$system_dict.Add("Sony PlayStation Vita", "51")
$system_dict.Add("Sony PSP", "52")
;$system_dict.Add("Sony SMC-70/777", "232")
$system_dict.Add("Sord M5", "148")
;$system_dict.Add("Soundic SD Family", "199")
$system_dict.Add("Spectravideo SV 318/328", "201")
;$system_dict.Add("Stand-Alone Handhelds", "00H")
;$system_dict.Add("Starpath Supercharger", "107")
;$system_dict.Add("Steam", "194")
;$system_dict.Add("Taito Cybercore System / F3 System", "183")
$system_dict.Add("Tandy TRS-80 Color Computer", "129")
$system_dict.Add("Tapwave Zodiac", "75")
;$system_dict.Add("Tec Toy Zeebo", "179")
$system_dict.Add("Texas Instruments TI-99/4A", "149")
;$system_dict.Add("Thomson MO5", "186")
;$system_dict.Add("Tiger / Tec Toy Handhelds", "00T")
$system_dict.Add("Tiger Game.com", "63")
;$system_dict.Add("Tiger R-Zone", "062")
;$system_dict.Add("Tiger Telematics Gizmondo", "089")
;$system_dict.Add("TimeTop GameKing I / II / III", "156")
;$system_dict.Add("Timex Sinclair 2068", "178")
$system_dict.Add("Tomy Pyuuta / Pyuuta Jr / Tutor / Dick Smith Wizzard", "200")
;$system_dict.Add("Toymax Arcadia II", "130")
;$system_dict.Add("VideoBrain Family Computer", "082")
;$system_dict.Add("Videomaster Colour Cartridge", "218")
;$system_dict.Add("View-Master Interactive Vision", "042")
$system_dict.Add("VTech CreatiVision", "152")
;$system_dict.Add("VTech Learning Pad, The", "154")
$system_dict.Add("VTech Socrates / Yeno Prof. Weiss-Alles", "198")
;$system_dict.Add("VTech V.Flash", "153")
;$system_dict.Add("VTech V.Smile", "120")
;$system_dict.Add("VTech V.Smile Baby", "159")
;$system_dict.Add("VTech V.Smile V-Motion Active Learning System", "205")
$system_dict.Add("Watara SuperVision", "153")
$system_dict.Add("Worlds of Wonder Action Max", "154")
$system_dict.Add("XaviX XaviXPORT", "170")
;$system_dict.Add("ZAPiT Game Wave", "144")


if $CmdLine[0] < 1 Then

	ConsoleWrite("usage: " & $app_name & " ""system"" [metadata|images] [page / start_page] [end_page]" & @CRLF)
	ConsoleWrite("  example: """ & $app_name & """ ""Nintendo SNES / Super Famicom""" & @CRLF)
	ConsoleWrite("  example: """ & $app_name & """ ""Nintendo SNES / Super Famicom"" metadata 1" & @CRLF)
	ConsoleWrite("  example: """ & $app_name & """ ""Nintendo SNES / Super Famicom"" images 1 3" & @CRLF)

	Exit
EndIf


; pull all artwork from Atarimania

Local $system = $CmdLine[1]  ;"Nintendo SNES / Super Famicom"

Local $mode

if $CmdLine[0] >= 2 Then

	$mode = $CmdLine[2]
EndIf

Local $page_start_page = 0

if $CmdLine[0] >= 3 Then

	$page_start_page = $CmdLine[3]
EndIf

Local $end_page = 0

if $CmdLine[0] >= 4 Then

	$end_page = $CmdLine[4]
EndIf

Local $emulator_folder = "D:\dwn\" & StringRegExpReplace(StringRegExpReplace($system, '[:"?*\/<>| ]', "_"), '_+', "_")
Local $firstresult = 1
Local $last_page = 1
Local $results_per_page = 25
Local $last_title = ""

if FileExists($emulator_folder) = False Then

	DirCreate($emulator_folder)
EndIf

if FileExists($emulator_folder & "\Box") = False Then

	DirCreate($emulator_folder & "\Box")
EndIf

if FileExists($emulator_folder & "\BoxBack") = False Then

	DirCreate($emulator_folder & "\BoxBack")
EndIf

if FileExists($emulator_folder & "\Box_Full") = False Then

	DirCreate($emulator_folder & "\Box_Full")
EndIf

if FileExists($emulator_folder & "\Metadata") = False Then

	DirCreate($emulator_folder & "\Metadata")
EndIf

; get the number of pages available

if $page_start_page = 0 and $end_page = 0 Then

	Local $iPID = Run('curl.exe -s -k -H "Content-Type: application/x-www-form-urlencoded" https://gamesdb.launchbox-app.com/platforms/games/' & $system_dict.Item($system), @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
	ProcessWaitClose($iPID)
	Local $html = StdoutRead($iPID)
	Local $arr = StringRegExp($html, "        last: ""Last \("" \+ (.*) \+ ""\)"",", 3)
	local $num_pages = $arr[0]
	ConsoleWrite($num_pages)
	Exit 0
EndIf

for $page_num = $page_start_page to $end_page

	Switch $mode

		Case "metadata"

			Local $iPID = Run('curl.exe -s -k https://gamesdb.launchbox-app.com/platforms/games/' & $system_dict.Item($system) & '|' & $page_num, @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
			ProcessWaitClose($iPID)
			Local $html = StdoutRead($iPID)
			Local $url_arr = StringRegExp($html, "        <a class=""list-item"" href=""(?U)(.*)"">", 3)
			Local $name_arr = StringRegExp($html, "                    <h3>(?U)(.*)</h3>", 3)

			if UBound($url_arr) < 1 Then

				ExitLoop
			EndIf

			for $i = 0 to (UBound($url_arr) - 1)

				Local $metadata_xml = "<?xml version=""1.0""?>" & @CRLF & "<gameList>" & @CRLF & "	<game>"

				$name_arr[$i] = StringRegExpReplace($name_arr[$i], '\\|/|:|\*|\?|\"|\<|\>|\|', "")
				$metadata_xml = $metadata_xml & @CRLF & "		<name>" & $name_arr[$i] & "</name>"

				Local $iPID = Run('curl.exe -s -k https://gamesdb.launchbox-app.com/' & $url_arr[$i], @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
				ProcessWaitClose($iPID)
				Local $html = StdoutRead($iPID)

				Local $release_date_arr = StringRegExp($html, "(?s)<td class=""row-header"">Release Date<\/td>.*?<span class=""view"">(.*?)<\/span>", 3)

				if @error = 0 Then

					$release_date_arr[0] = StringRegExpReplace($release_date_arr[0], "</?\w+((\s+\w+(\s*=\s*(?:"""".*?""""|'.*?'|[^'"""">\s]+))?)+\s*|\s*)/?>", "")
					$release_date_arr[0] = StringStripWS($release_date_arr[0], 3)
					$metadata_xml = $metadata_xml & @CRLF & "		<releasedate>" & $release_date_arr[0] & "</releasedate>"
				EndIf

				Local $developers_arr = StringRegExp($html, "(?s)<td class=""row-header"">Developers<\/td>.*?<span class=""view"">(.*?)<\/span>", 3)

				if @error = 0 Then

					$developers_arr[0] = StringRegExpReplace($developers_arr[0], "</?\w+((\s+\w+(\s*=\s*(?:"""".*?""""|'.*?'|[^'"""">\s]+))?)+\s*|\s*)/?>", "")
					$developers_arr[0] = StringStripWS($developers_arr[0], 3)
					$metadata_xml = $metadata_xml & @CRLF & "		<developer>" & $developers_arr[0] & "</developer>"
				EndIf

				Local $publishers_arr = StringRegExp($html, "(?s)<td class=""row-header"">Publishers<\/td>.*?<span class=""view"">(.*?)<\/span>", 3)

				if @error = 0 Then

					$publishers_arr[0] = StringRegExpReplace($publishers_arr[0], "</?\w+((\s+\w+(\s*=\s*(?:"""".*?""""|'.*?'|[^'"""">\s]+))?)+\s*|\s*)/?>", "")
					$publishers_arr[0] = StringStripWS($publishers_arr[0], 3)
					$metadata_xml = $metadata_xml & @CRLF & "		<publisher>" & $publishers_arr[0] & "</publisher>"
				EndIf

				Local $genres_arr = StringRegExp($html, "(?s)<td class=""row-header"">Genres<\/td>.*?<span class=""view"">(.*?)<\/span>", 3)

				if @error = 0 Then

					$genres_arr[0] = StringRegExpReplace($genres_arr[0], "</?\w+((\s+\w+(\s*=\s*(?:"""".*?""""|'.*?'|[^'"""">\s]+))?)+\s*|\s*)/?>", "")
					$genres_arr[0] = StringStripWS($genres_arr[0], 3)
					$metadata_xml = $metadata_xml & @CRLF & "		<genre>" & $genres_arr[0] & "</genre>"
				EndIf

				Local $max_players_arr = StringRegExp($html, "(?s)<td class=""row-header"">Max Players<\/td>.*?<span class=""view"">(.*?)<\/span>", 3)

				if @error = 0 Then

					Local $players = $max_players_arr[0]

					Local $cooperative_arr = StringRegExp($html, "(?s)<td class=""row-header"">Cooperative<\/td>.*?<span class=""view"">(.*?)<\/span>", 3)

					if @error = 0 And StringCompare($cooperative_arr[0], "Yes") = 0 Then

						$players = $players & " co-op"
					EndIf

					$metadata_xml = $metadata_xml & @CRLF & "		<players>" & $players & "</players>"
				EndIf

				$metadata_xml = $metadata_xml & @CRLF & "	</game>" & @CRLF & "</gameList>"

				FileDelete($emulator_folder & "\Metadata\" & $name_arr[$i] & ".xml")
				FileWrite($emulator_folder & "\Metadata\" & $name_arr[$i] & ".xml", $metadata_xml)

				ConsoleWrite("Found """ & $name_arr[$i] & """ metadata" & @CRLF)

			Next

		Case "images"

			Local $iPID = Run('curl.exe -s -k https://gamesdb.launchbox-app.com/platforms/games/' & $system_dict.Item($system) & '|' & $page_num, @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
			ProcessWaitClose($iPID)
			Local $html = StdoutRead($iPID)
			Local $url_arr = StringRegExp($html, "        <a class=""list-item"" href=""(?U)(.*)"">", 3)
			Local $name_arr = StringRegExp($html, "                    <h3>(?U)(.*)</h3>", 3)

			if UBound($url_arr) < 1 Then

				ExitLoop
			EndIf

			for $i = 0 to (UBound($url_arr) - 1)

				$name_arr[$i] = StringRegExpReplace($name_arr[$i], '\\|/|:|\*|\?|\"|\<|\>|\|', "")

				Local $iPID = Run('curl.exe -s -k https://gamesdb.launchbox-app.com/' & StringReplace($url_arr[$i], "/details/", "/images/"), @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
				ProcessWaitClose($iPID)
				Local $html = StdoutRead($iPID)
				Local $arr2 = StringRegExp($html, "            <a style=""text-decoration: none !important;"" href=""(?U)(.*)"" data-gameimagekey=""(?U).*"" data-toggle=""lightbox"" data-gallery=""gallery"" data-title=""(?U)(.*)""", 3)

				for $j = 0 to (UBound($arr2) - 1) Step 2

					if StringInStr($arr2[$j + 1], "Box - Front") > 0 or StringInStr($arr2[$j + 1], "Box - Back") > 0 Then

						ConsoleWrite("Found " & $arr2[$j + 1] & @CRLF)

						; find the next available filename

						Local $game_art_num = 1

						While FileExists($emulator_folder & "\Box\" & $name_arr[$i] & "-" & $game_art_num & ".*") = True

							$game_art_num = $game_art_num + 1
						WEnd

						_PathSplit($arr2[$j + 0], $sDrive1, $sDir1, $sFileName1, $sExtension1)
						InetGet($arr2[$j + 0], $emulator_folder & "\Box\" & $name_arr[$i] & "-" & $game_art_num & $sExtension1)
					EndIf
				Next
			Next
	EndSwitch
Next

