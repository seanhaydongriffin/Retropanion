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

Local $sDrive = "", $sDir = "", $sFileName = "", $sExtension = ""
Local $sDrive1 = "", $sDir1 = "", $sFileName1 = "", $sExtension1 = ""
Local $sDrive2 = "", $sDir2 = "", $sFileName2 = "", $sExtension2 = ""
Local $app_name = "Seans RF Generation Scraper"

Global $system_dict = ObjCreate("Scripting.Dictionary")
$system_dict.Add("3DO", "052")
$system_dict.Add("Acorn Archimedes", "192")
$system_dict.Add("Acorn Electron", "197")
$system_dict.Add("Amstrad CPC 464", "114")
$system_dict.Add("APF M1000 / MP1000", "010")
$system_dict.Add("Apple II / Apple III", "003")
$system_dict.Add("Apple IIGS", "224")
$system_dict.Add("Apple Macintosh", "022")
$system_dict.Add("Atari 2600", "005")
$system_dict.Add("Atari 5200", "023")
$system_dict.Add("Atari 7800", "032")
$system_dict.Add("Atari 8-bit Family", "034")
$system_dict.Add("Atari Jaguar", "051")
$system_dict.Add("Atari Jaguar CD", "056")
$system_dict.Add("Atari Lynx", "038")
$system_dict.Add("Atari ST / TT / Falcon", "029")
$system_dict.Add("Bally Professional Arcade / Astrocade", "008")
$system_dict.Add("Bandai Datach Joint ROM System", "220")
$system_dict.Add("Bandai Pippin ATMARK / @WORLD", "065")
$system_dict.Add("Bandai Playdia", "098")
$system_dict.Add("Bandai RX-78 Gundam", "241")
$system_dict.Add("Bandai SuFami Turbo", "099")
$system_dict.Add("Bandai Super Vision 8000", "112")
$system_dict.Add("Bandai WonderSwan", "091")
$system_dict.Add("Bandai WonderSwan Color / SwanCrystal", "092")
$system_dict.Add("BBC Bridge Companion", "225")
$system_dict.Add("BBC Micro", "133")
$system_dict.Add("Betamax / VHS", "VHS")
$system_dict.Add("BIT Gamate", "101")
$system_dict.Add("Blaze Evercade", "238")
$system_dict.Add("Bright Things Bubble", "230")
$system_dict.Add("Buzztime Home Trivia System", "164")
$system_dict.Add("Camerica Aladdin", "080")
$system_dict.Add("Capcom CPS Changer", "137")
$system_dict.Add("Casio Loopy", "138")
$system_dict.Add("Casio PV-1000", "136")
$system_dict.Add("Casio PV-2000", "146")
$system_dict.Add("Coleco / CBS ColecoVision", "024")
$system_dict.Add("Coleco ADAM", "025")
$system_dict.Add("Coleco Telstar Arcade", "007")
$system_dict.Add("Commodore 16 / Plus 4 / 116", "140")
$system_dict.Add("Commodore 64 / 128", "018")
$system_dict.Add("Commodore Amiga", "030")
$system_dict.Add("Commodore Amiga CD32", "057")
$system_dict.Add("Commodore Amiga CDTV", "046")
$system_dict.Add("Commodore PET", "219")
$system_dict.Add("Commodore VIC-20", "014")
$system_dict.Add("Cougar Boy / MegaDuck", "090")
$system_dict.Add("Cybiko Classic / Extreme", "162")
$system_dict.Add("Dragon 32 / 64", "050")
$system_dict.Add("DVD", "00D")
$system_dict.Add("EACA EG2000 Colour Genie", "108")
$system_dict.Add("Emerson Arcadia 2001 / MPT-03 / Palladium", "026")
$system_dict.Add("Enterprise 64 / 128", "171")
$system_dict.Add("Entex Adventure Vision", "019")
$system_dict.Add("Entex Select-A-Game Machine", "113")
$system_dict.Add("EPOCH Cassette Vision", "110")
$system_dict.Add("EPOCH Game Pocket Computer", "116")
$system_dict.Add("EPOCH Super Cassette Vision / Yeno Super Cassette Vision", "111")
$system_dict.Add("Exidy Sorcerer", "109")
$system_dict.Add("Fairchild Channel F", "002")
$system_dict.Add("Fisher Price Pixter", "155")
$system_dict.Add("Fisher-Price Smart Cycle Racer", "211")
$system_dict.Add("Fujitsu FM Towns / Marty", "134")
$system_dict.Add("Fujitsu FM-7 / FM-77", "170")
$system_dict.Add("Fujitsu FM77AV", "212")
$system_dict.Add("Funtech Super A Can", "142")
$system_dict.Add("Gakken Compact Vision", "139")
$system_dict.Add("Game Park GP32", "126")
$system_dict.Add("Game Watches", "125")
$system_dict.Add("Gamepark Holdings GP2X Caanoo", "206")
$system_dict.Add("GamePark Holdings GP2X Wiz", "195")
$system_dict.Add("GCE Vectrex / Bandai Kousokusen", "017")
$system_dict.Add("GOG.com", "217")
$system_dict.Add("GoGo TV Video Vision", "147")
$system_dict.Add("Handspring Visor", "198")
$system_dict.Add("Hartung Game Master", "096")
$system_dict.Add("Hasbro Net Jet", "177")
$system_dict.Add("IBM PC", "016")
$system_dict.Add("IBM PC Jr.", "081")
$system_dict.Add("Interton VC 4000", "128")
$system_dict.Add("Interton Video 2000", "103")
$system_dict.Add("itch.io", "234")
$system_dict.Add("Jazwares Disney Dream Sketcher", "158")
$system_dict.Add("LaserDisc", "221")
$system_dict.Add("LeapFrog Didj", "157")
$system_dict.Add("Leapfrog Fly", "119")
$system_dict.Add("Leapfrog iQuest", "117")
$system_dict.Add("Leapfrog Leapster", "118")
$system_dict.Add("LeapFrog LeapTV", "228")
$system_dict.Add("LJN Video Art", "035")
$system_dict.Add("Magnavox Odyssey", "001")
$system_dict.Add("Magnavox Odyssey^2 / VideoPac", "009")
$system_dict.Add("Mattel Aquarius", "021")
$system_dict.Add("Mattel Childrens Discovery System", "105")
$system_dict.Add("Mattel Hyperscan", "145")
$system_dict.Add("Mattel Intellivision", "013")
$system_dict.Add("Memorex VIS", "058")
$system_dict.Add("Memotech MTX", "227")
$system_dict.Add("Microsoft Xbox", "075")
$system_dict.Add("Microsoft Xbox 360", "115")
$system_dict.Add("Microsoft Xbox Live Arcade", "150")
$system_dict.Add("Microsoft Xbox LIVE Games on Demand", "207")
$system_dict.Add("Microsoft Xbox Live Indie Games", "185")
$system_dict.Add("Microsoft Xbox One", "216")
$system_dict.Add("Microsoft Xbox Series", "239")
$system_dict.Add("Milton Bradley MicroVision", "011")
$system_dict.Add("MSX / MSX2 / Zemmix", "122")
$system_dict.Add("Multiple Consoles", "999")
$system_dict.Add("NEC PC Engine / TurboGrafx-16", "039")
$system_dict.Add("NEC PC Engine CD / TurboGrafx CD", "041")
$system_dict.Add("NEC PC-8001", "174")
$system_dict.Add("NEC PC-88", "167")
$system_dict.Add("NEC PC-98", "169")
$system_dict.Add("NEC PC-FX", "106")
$system_dict.Add("NEC SuperGrafx", "085")
$system_dict.Add("NEC Trek / PC-6001", "172")
$system_dict.Add("Nichibutsu My Vision", "180")
$system_dict.Add("Nikko digiBlast", "121")
$system_dict.Add("Nintendo 3DS", "182")
$system_dict.Add("Nintendo 3DS Virtual Console", "210")
$system_dict.Add("Nintendo 64", "064")
$system_dict.Add("Nintendo 64 DD", "084")
$system_dict.Add("Nintendo DS", "087")
$system_dict.Add("Nintendo DSi", "160")
$system_dict.Add("Nintendo DSiWare", "161")
$system_dict.Add("Nintendo e-Reader", "077")
$system_dict.Add("Nintendo eShop", "188")
$system_dict.Add("Nintendo Famicom Disk System", "093")
$system_dict.Add("Nintendo Game & Watch", "00G")
$system_dict.Add("Nintendo Game Boy", "037")
$system_dict.Add("Nintendo Game Boy Advance", "074")
$system_dict.Add("Nintendo Game Boy Color", "069")
$system_dict.Add("Nintendo GameCube", "076")
$system_dict.Add("Nintendo iQue", "124")
$system_dict.Add("Nintendo NES / Famicom", "027")
$system_dict.Add("Nintendo New Nintendo 3DS", "222")
$system_dict.Add("Nintendo Pok&eacute;mon Mini", "088")
$system_dict.Add("Nintendo SNES / Super Famicom", "044")
$system_dict.Add("Nintendo Switch", "231")
$system_dict.Add("Nintendo Virtual Boy", "063")
$system_dict.Add("Nintendo Wii", "132")
$system_dict.Add("Nintendo Wii U", "202")
$system_dict.Add("Nintendo Wii U Virtual Console", "209")
$system_dict.Add("Nintendo Wii Virtual Console", "152")
$system_dict.Add("Nintendo WiiWare", "208")
$system_dict.Add("Nokia N-Gage", "078")
$system_dict.Add("Nuon Technology", "073")
$system_dict.Add("Ohio Arts Etch-A-Sketch Animator 2000", "127")
$system_dict.Add("OnLive", "201")
$system_dict.Add("Oric-1 / Atmos", "191")
$system_dict.Add("Origin", "214")
$system_dict.Add("OUYA", "213")
$system_dict.Add("Palm OS", "141")
$system_dict.Add("Palmtex Super Micro", "196")
$system_dict.Add("Panasonic JR", "193")
$system_dict.Add("PC-50X Family", "149")
$system_dict.Add("Philips CD-i", "049")
$system_dict.Add("Philips Tele-spiel ES-2201", "104")
$system_dict.Add("Philips VG-5000", "187")
$system_dict.Add("Pioneer LaserActive", "053")
$system_dict.Add("Plug & Play TV Games", "00J")
$system_dict.Add("Pocket PC", "235")
$system_dict.Add("Pong Consoles", "00P")
$system_dict.Add("Radio Shack TRS-80 Micro Color Computer", "237")
$system_dict.Add("Radio Shack TRS-80 Pocket Computer", "229")
$system_dict.Add("Radio Shack/Tandy TRS-80", "004")
$system_dict.Add("RCA Studio II / MPT-02", "006")
$system_dict.Add("RDI Halcyon", "028")
$system_dict.Add("Robotron KC 85", "175")
$system_dict.Add("Robotron KC 87", "176")
$system_dict.Add("Romtec ColorVision", "102")
$system_dict.Add("Sammy Atomiswave", "184")
$system_dict.Add("Sears Talking Computron", "181")
$system_dict.Add("Sega 32X", "055")
$system_dict.Add("Sega Advanced Pico Beena", "200")
$system_dict.Add("Sega AI Computer", "223")
$system_dict.Add("Sega CD / Mega CD", "048")
$system_dict.Add("Sega Dreamcast", "071")
$system_dict.Add("Sega Game Gear", "045")
$system_dict.Add("Sega Genesis / Mega Drive", "040")
$system_dict.Add("Sega Master System / Mark III", "031")
$system_dict.Add("Sega Pico", "059")
$system_dict.Add("Sega Saturn", "060")
$system_dict.Add("Sega SG-1000 / SC-3000", "143")
$system_dict.Add("Sharp MZ Family", "173")
$system_dict.Add("Sharp X1", "166")
$system_dict.Add("Sharp X68000", "100")
$system_dict.Add("Sinclair QL", "233")
$system_dict.Add("Sinclair ZX Spectrum", "123")
$system_dict.Add("Sinclair ZX Spectrum +3", "226")
$system_dict.Add("Sinclair ZX80 / ZX81 / Timex Sinclair 1000", "020")
$system_dict.Add("SNK Hyper Neo Geo 64", "168")
$system_dict.Add("SNK Neo Geo AES", "043")
$system_dict.Add("SNK Neo Geo CD", "066")
$system_dict.Add("SNK Neo Geo MVS", "097")
$system_dict.Add("SNK Neo Geo Pocket", "086")
$system_dict.Add("SNK Neo Geo Pocket Color", "070")
$system_dict.Add("SNK Neo Geo X", "204")
$system_dict.Add("Sony PlayStation", "061")
$system_dict.Add("Sony PlayStation 2", "072")
$system_dict.Add("Sony PlayStation 3", "131")
$system_dict.Add("Sony PlayStation 4", "215")
$system_dict.Add("Sony PlayStation 5", "240")
$system_dict.Add("Sony PlayStation Network", "151")
$system_dict.Add("Sony PlayStation Vita", "189")
$system_dict.Add("Sony PSP", "095")
$system_dict.Add("Sony SMC-70/777", "232")
$system_dict.Add("Sord M5", "190")
$system_dict.Add("Soundic SD Family", "199")
$system_dict.Add("Spectravideo SV 318/328", "236")
$system_dict.Add("Stand-Alone Handhelds", "00H")
$system_dict.Add("Starpath Supercharger", "107")
$system_dict.Add("Steam", "194")
$system_dict.Add("Taito Cybercore System / F3 System", "183")
$system_dict.Add("Tandy TRS-80 Color Computer", "203")
$system_dict.Add("Tapwave Zodiac", "079")
$system_dict.Add("Tec Toy Zeebo", "179")
$system_dict.Add("Texas Instruments TI-99/4A", "015")
$system_dict.Add("Thomson MO5", "186")
$system_dict.Add("Tiger / Tec Toy Handhelds", "00T")
$system_dict.Add("Tiger Game.com", "067")
$system_dict.Add("Tiger R-Zone", "062")
$system_dict.Add("Tiger Telematics Gizmondo", "089")
$system_dict.Add("TimeTop GameKing I / II / III", "156")
$system_dict.Add("Timex Sinclair 2068", "178")
$system_dict.Add("Tomy Pyuuta / Pyuuta Jr / Tutor / Dick Smith Wizzard", "148")
$system_dict.Add("Toymax Arcadia II", "130")
$system_dict.Add("VideoBrain Family Computer", "082")
$system_dict.Add("Videomaster Colour Cartridge", "218")
$system_dict.Add("View-Master Interactive Vision", "042")
$system_dict.Add("VTech CreatiVision", "163")
$system_dict.Add("VTech Learning Pad, The", "154")
$system_dict.Add("VTech Socrates / Yeno Prof. Weiss-Alles", "094")
$system_dict.Add("VTech V.Flash", "153")
$system_dict.Add("VTech V.Smile", "120")
$system_dict.Add("VTech V.Smile Baby", "159")
$system_dict.Add("VTech V.Smile V-Motion Active Learning System", "205")
$system_dict.Add("Watara SuperVision", "047")
$system_dict.Add("Worlds of Wonder Action Max", "033")
$system_dict.Add("XaviX XaviXPORT", "083")
$system_dict.Add("ZAPiT Game Wave", "144")


if $CmdLine[0] < 1 Then

	ConsoleWrite("usage: " & $app_name & " ""system"" [page / start_page] [end_page]" & @CRLF)
	ConsoleWrite("  example: """ & $app_name & """ ""Nintendo SNES / Super Famicom""" & @CRLF)
	ConsoleWrite("  example: """ & $app_name & """ ""Nintendo SNES / Super Famicom"" 1" & @CRLF)
	ConsoleWrite("  example: """ & $app_name & """ ""Nintendo SNES / Super Famicom"" 1 3" & @CRLF)
	Exit
EndIf


; pull all artwork from RF Generation

Local $system = $CmdLine[1] ;"Nintendo SNES / Super Famicom"
Local $page_start_page = 0

if $CmdLine[0] >= 2 Then

	$page_start_page = $CmdLine[2]
EndIf

Local $end_page = 0

if $CmdLine[0] >= 3 Then

	$end_page = $CmdLine[3]
EndIf

Local $emulator_folder = "D:\dwn\" & StringRegExpReplace(StringRegExpReplace($system, '[:"?*\/<>| ]', "_"), '_+', "_")
Local $firstresult = 1
Local $last_page = 1
Local $results_per_page = 50
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

; get the number of pages available

if $page_start_page = 0 and $end_page = 0 Then

	Local $iPID = Run('curl.exe -s -k -H "Content-Type: application/x-www-form-urlencoded" --data "console=%7C' & $system_dict.Item($system) & '%7C&title=&genre=&year=&company=&ID=&country=&type=&regionwide=Y&imagesearch=Y&front=Y&back=Y&searchtype=AND&firstresult=1&search=+Search+" http://www.rfgeneration.com/cgi-bin/search.pl', @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
	ProcessWaitClose($iPID)
	Local $html = StdoutRead($iPID)
	Local $arr = StringRegExp($html, "Showing results 1 to 50 of (.*) total results", 3)
	local $num_pages = Ceiling(Number($arr[0]) / 50)
	ConsoleWrite($num_pages)
	Exit 0
EndIf

for $page_num = $page_start_page to $end_page

	Local $iPID = Run('curl.exe -s -k -H "Content-Type: application/x-www-form-urlencoded" --data "console=%7C' & $system_dict.Item($system) & '%7C&title=&genre=&year=&company=&ID=&country=&type=&regionwide=Y&imagesearch=Y&front=Y&back=Y&searchtype=AND&firstresult=' & (1 + (($page_num - 1) * $results_per_page)) & '&search=+Search+" http://www.rfgeneration.com/cgi-bin/search.pl', @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
	ProcessWaitClose($iPID)
	Local $html = StdoutRead($iPID)
	;ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $html = ' & $html & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	Local $arr = StringRegExp($html, "<td width=30%><a href='getinfo.pl\?ID=(?U)(.*)'>(?U)(.*)</a>", 3)
	;_ArrayDisplay($arr)


	for $i = 0 to (UBound($arr) - 1) step 2

		$arr[$i + 1] = StringRegExpReplace($arr[$i + 1], '\\|/|:|\*|\?|\"|\<|\>|\|', "")

		;ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $arr[$i + 0] = ' & $arr[$i + 0] & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $arr[$i + 1] = ' & $arr[$i + 1] & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

		if StringCompare($arr[$i + 1], $last_title, 1) <> 0 or (StringCompare($arr[$i + 1], $last_title, 1) = 0 And StringCompare(StringLeft($arr[$i + 0], 1), "U", 1) = 0) Then

			;ConsoleWrite("http://www.rfgeneration.com/images/games/" & StringLeft($arr[$i + 0], 5) & "/bf/" & $arr[$i + 0] & ".jpg => " & $emulator_folder & "\Box\" & $arr[$i + 1] & ".jpg" & @CRLF)
			;ConsoleWrite("http://www.rfgeneration.com/images/games/" & StringLeft($arr[$i + 0], 5) & "/bb/" & $arr[$i + 0] & ".jpg => " & $emulator_folder & "\BoxBack\" & $arr[$i + 1] & ".jpg" & @CRLF)

			InetGet("http://www.rfgeneration.com/images/games/" & StringLeft($arr[$i + 0], 5) & "/bf/" & $arr[$i + 0] & ".jpg", $emulator_folder & "\Box\" & $arr[$i + 1] & ".jpg")
			InetGet("http://www.rfgeneration.com/images/games/" & StringLeft($arr[$i + 0], 5) & "/bb/" & $arr[$i + 0] & ".jpg", $emulator_folder & "\BoxBack\" & $arr[$i + 1] & ".jpg")
		EndIf

		$last_title = $arr[$i + 1]
	Next
Next

