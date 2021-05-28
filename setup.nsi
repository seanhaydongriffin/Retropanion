;!include nsDialogs.nsh
;!include LogicLib.nsh


; example1.nsi
;
; This script is perhaps one of the simplest NSIs you can make. All of the
; optional settings are left to their default settings. The installer simply 
; prompts the user asking them where to install, and drops a copy of example1.nsi
; there. 

XPStyle on

;--------------------------------

; The name of the installer
Name "Sean's RetroPie Tools"

; The file to write
OutFile "setup.exe"

; The default installation directory
InstallDir "$PROGRAMFILES32\Seans RetroPie Tools"

;--------------------------------


; Pages

Page directory
Page instfiles


;--------------------------------


; The stuff to install
Section "" ;No components page, name is not important

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File "Seans RetroPie Tools.exe"
  File "Seans RetroPie Tools.chm"
  File "Seans RetroPie Tools Systems Custom Order.cfg"
  File "Seans Cover Project Scraper.exe"
  File "Seans LaunchBox Scraper.exe"
  File "Seans Moby Games Scraper.exe"
  File "Seans RF Generation Scraper.exe"
  File "plink.exe"

  CreateDirectory "$SMPROGRAMS\Seans RetroPie Tools"
  CreateShortCut "$SMPROGRAMS\Seans RetroPie Tools\Seans RetroPie Tools.lnk" "$INSTDIR\Seans RetroPie Tools.exe"

SectionEnd ; end the section
