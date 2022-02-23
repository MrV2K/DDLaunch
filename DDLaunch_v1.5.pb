;- **** DDLaunch ****
;
; Version 1.4
;
; © 2021 Paul Vince (MrV2k)
;
; https://easymame.mameworld.info
;
; [ PB v5.7x/v6.x / 32Bit & 64Bit / Windows / DPI ]
;
; A launcher for DamienD's Commodore Amiga Software Collection
;
;- **** Version History ****
;
; v0.1 
; ----
; Initial Release
;
; v0.2
; ----
; 1. Removed graphics options from process procedure.
; 2. Switched to BriefLZ packer.
; 3. Compressed Config Files Into .dat file (saved 25MB).
; 4. Removed console.
; 5. Fixed image drawing with no list entries.
; 6. Updated filter (Reflection Keen).
; 
; v0.3
; ----
; 1. Added support for text & pdf files via popup menu.
; 2. Reduced window size.
; 3. Added slider for floppy speed.
; 4. Updated filters (D1X Rebirth, Apple IIGS, MSX, Exult, OCS/ECS).
; 5. Added show WinUAE gui button.
; 6. Window will stretch to screen height.
; 7. Window Title shows how many game are in the main list.
;
; v0.4
; ----
; 1. Added tabs to media panel.
; 2. Supports Box Art images.
; 3. Support for JPEG images.
; 4. Support for text based info files (___Info.txt).
; 5. Added prefs file for saving options.
; 6. Fixed bug in popup menu.
; 7. Fixed bug in config creation.
;
; v0.5
; ----
; 1. Added Wide Layout.
;
; v0.6
; ----
; 1. Added scaling to box art gadget to show the correct aspect ratio of images.
; 2. Reworked main screen scaling to go as low as 720p.
; 3. Popup Image corrects aspect ratio of images.
; 4. Removed Image labels and added to About window.
; 5. Updated the icon!
; 6. Tweaked the sort which is now based on config names
; 7. Had a play with the processing window
; 8. Refresh database clears the images and info text
;
; v0.7
; ----
; 1. Changed sort to match WinUAE
;
; v0.8
; ----
; 1. Added full window support
; 2. Fixed aspect of game cover image
; 3. Fixed compact mode DPI scaling
; 4. Fixed stretch vertical window scaling
; 5. Fixed a crash when starting outside of the DD WinUAE folder
; 6. Added save settings to menu
; 7. Added load game splash screen
; 8. Fixed bug in floppy speed slider
; 9. Added floppy speed to prefs file
; 10. Removed game info box and support
; 11. Added quit confirmation to close window button
; 12. Added menu item to switch off close confirmation and added to prefs
; 
; v0.9
; ----
; 1. Added cover image outline
; 2. Added menu option to select cover image outline colour
; 3. Cover image outline colour saved in prefs
; 4. Added menu option to open game folder
; 5. Added icon to cover art panel to show if documents are present
; 6. Added built in PDF viewer
; 7. Added built in text viewer
; 8. Added windowed mode to WinUAE settings which is saved in prefs
; 9. Restructured menus
; 10. Fixed outline box drawing (DPI issue) on zoom window
; 11. Fixed aspect ratio and scanlines on full window screens
; 
; v0.91
; -----
; 1. Added MSX2 conversion to filter
; 2. Fixed PDFViewer Window resize
; 3. Fixed screen offset on full window screens
; 
; v0.92
; -----
; 1. Fixed RTG scaling on full window mode
; 2. Fixed bug in text viewer with non ascii characters
; 3. Added resize to text viewer and increased it's default width.
;
; v1.0
; -----
; 1. Removed program wait on procedure Run_Game And added threaded cleanup process.
; 2. Added check to prevent starting two WinUAE processes.
;
; v1.1
; -----
; 1. Tweaked list sorting.
; 2. Added menu item to select between original names or new names. Saves in prefs.
; 3. Added a few more filters.
;
; v1.2
; -----
; 1. Close confirm defaults to false
; 2. Tweaked the sort... again...
; 3. Media panels centre vertically on stretch
; 4. Stretch GUI now gives a buffer of 5 pixels top and bottom.
; 5. Cover images maintain aspect ratios and now reduce width if necessary.
; 6. Cover image popup window scales to images and maintains aspect ratio.
; 7. Combined the text & pdf viewers to a single window using a browser based gadget.
; 8. DDLaunch allows 10 file view windows at any one time. A check prevents more to be opened.
; 9. Converted DDLaunch.txt to be 80 columns.
; 10. Added support for png and jpg images to the file viewer and popup menu.
; 11. Popup menu now supports up to 30 files
; 12. Moved configuration folder check to prevent any files being created if there was an error.
;
; v1.3
; -----
; 1. Main window is no longer disabled when running a game.
; 2. Replaced protected gadget variables.
; 3. Removed SmartWindowRefresh as it corrupts gadgets on Windows 11.
; 4. Tweaked gadget drawing.
; 5. Removed unnecessary font load.
; 6. Removed AmiDuke from filter
; 7. Added JFDuke3d, Sharp X6800 conversion and PET version to the filter.
; 8. Fixed a bug that prevents the GUI redrawing when resized.
;
; v1.4
; -----
; 1. Added menu switch to turn scanlines on or off. Saved in prefs.
; 2. Added menu switch to turn the in-game LEDs on or off. Saved in prefs.
; 3. Fixed box art border colour loading from the prefs file.
; 4. Removed compact mode
; 5. Stretch window now automatically resizes to your desktop size. If your monitor aspect is over 16:9 the window ratio is limited to 16:9.
; 6. All gadgets automatically resize to the window.
; 7. Fixed floppy speed frame showing the wrong percentage when starting the program.
; 8. Added Wii and Megadrive conversion to the filter.
; 9. Renamed and removed a couple of filters on DD's request.
; 10. Slightly sped up config scrape procedure.
; 11. Config list automatically resizes if there is a vertical scrollbar.
; 12. Fixed bug in config list drawing that stopped alternate line backgrounds if the filter was used.
; 13. Added default window width and height to prefs. Change these settings to change the default window size. Minimum is 1280 wide x 720 high. 
;
; v1.5
; -----
; 1. Fixed image gadget scaling.
; 2. Full window image scaling now changeable between default and stretched.
; 3. Full window image width scales to the desktop resolution.
; 4. Scanline width adapts to vertical desktop resolution.
; 5. Added icon to border colour menu entry
; 6. Fixed JFDuke3D error in scrape procedure

EnableExplicit

;- **** Enumerations ****

Enumeration
  
  #MAIN_WINDOW
  #MAIN_FILTER
  #MAIN_LIST
  #MAIN_FLOPPY
  #MAIN_PANEL
  #FLOPPY_FRAME
  #FILTER_FRAME
  #TITLE_GADGET
  #SCREEN_GADGET
  #BOXART_GADGET
  
  #MEDIA_CONTAINER
  #POPUP_WINDOW
  #PROGRESS_WINDOW
  #FILE_WINDOW_01
  #FILE_WINDOW_02
  #FILE_WINDOW_03
  #FILE_WINDOW_04
  #FILE_WINDOW_05
  #FILE_WINDOW_06
  #FILE_WINDOW_07
  #FILE_WINDOW_08
  #FILE_WINDOW_09
  #FILE_WINDOW_10
  #FILE_WEBGADGET_01
  #FILE_WEBGADGET_02
  #FILE_WEBGADGET_03
  #FILE_WEBGADGET_04
  #FILE_WEBGADGET_05
  #FILE_WEBGADGET_06
  #FILE_WEBGADGET_07
  #FILE_WEBGADGET_08
  #FILE_WEBGADGET_09
  #FILE_WEBGADGET_10
  #RUN_WINDOW
  #IFF_IMAGE
  #IFF_BLANK
  #IFF_POPUP
  
  #PDF_IMAGE
  #TEXT_IMAGE
  #BUB_IMAGE
  #PLAY_IMAGE
  #DOC_IMAGE
  #FOLDER_IMAGE
  #SEARCH_IMAGE
  #REFRESH_IMAGE  
  #INFO_IMAGE
  #HELP_IMAGE
  #CLOSE_IMAGE
  #IMAGE_IMAGE
  #BORDER_IMAGE
  
  #MAIN_MENU
  #POPUP_MENU
  #DUMMY_MENU
  
EndEnumeration

Enumeration FormMenu
  #MenuItem_1
  #MenuItem_2
  #MenuItem_3
  #MenuItem_4
  #MenuItem_5
  #MenuItem_6
  #MenuItem_7
  #MenuItem_8
  #MenuItem_9
  #MenuItem_10
  #MenuItem_11
  #MenuItem_12
  #MenuItem_13
  #MenuItem_14
  #MenuItem_15
  #MenuItem_16
  #MenuItem_17
  #MenuItem_18
  #MenuItem_19
  #MenuItem_20
  #MenuItem_21
  #MenuItem_22
  #Menu_01=900
  #Menu_02
  #Menu_03
  #Menu_04
  #Menu_05
  #Menu_06
  #Menu_07
  #Menu_08
  #Menu_09
  #Menu_10
  #Menu_11
  #Menu_12
  #Menu_13
  #Menu_14
  #Menu_15
  #Menu_16
  #Menu_17
  #Menu_18
  #Menu_19
  #Menu_20
  #Menu_21
  #Menu_22
  #Menu_23
  #Menu_24
  #Menu_25
  #Menu_26
  #Menu_27
  #Menu_28
  #Menu_29
  #Menu_30
  
EndEnumeration

;- **** Global Variables ****

Global Version.s="v1.5"
Global W_Title.s="DDLaunch "+Version
Global event.i, count.i, i.i, path.s, Window_Type.b, Program.i
Global Docs_Text.i, Docs_Text2.i

Global Home_Path.s=GetCurrentDirectory()
Global WinUAE_Path.s=Home_Path+"winuae.exe"
Global Config_Path.s=Home_Path+"Configurations\"
Global Game_Path.s=Home_Path+"Games\"
Global UnRAR_Path.s=Home_Path+"UnRAR.exe"

Global Window_Type=1
Global Search_Name.s=""
Global Floppy_Speed.i=2
Global Show_GUI.b=#False
Global Close_Confirm.b=#False
Global Box_Colour=$0000FF
Global Original_Names.b=#True
Global Use_Scanlines.b=#True
Global Show_Leds.b=#True
Global Stretch_Window.b=#True
Global FW_Scaling.b=#False
Global WinW=1366
Global WinH=768

;- **** Structures ****

Structure DD_Data
  DD_Name.s
  DD_Config.s
  DD_Sort.s
  DD_Folder.s
  DD_FullGame.b
  DD_Shapeshifter.b
  DD_RTG.b
  DD_AGA.b
  DD_OCSECS.b
  DD_CD32.b 
  DD_CDTV.b
  DD_AmigaCD.b
  DD_Arcadia.b
  DD_Cubo.b
  DD_Unreleased.b
  DD_PreRelease.b
  DD_Preview.b
  DD_Beta.b
  DD_Demo.b
  DD_Hack.b
  DD_Alpha.b
  DD_Keen.b
  DD_HDD.b
  DD_Mod.b
  DD_Intro1.b
  DD_Intro3.b
  DD_Intro4.b
  DD_NES.b
  DD_MSDOS.b
  DD_Windows.b
  DD_Mac.b
  DD_Atari.b
  DD_C64.b
  DD_3DS.b
  DD_PDA.b
  DD_MSX.b
  DD_MSX2.b
  DD_Exult.b
  DD_AppleII.b
  DD_SegaCD.b
  DD_ZDoom.b
  DD_CDoom.b
  DD_JFSW.b
  DD_Build.b
  DD_JFDuke.b
  DD_AmiSpear.b
  DD_AmiWolf.b
  DD_Tyrian.b
  DD_D1X.b
  DD_ScummVM.b
  DD_American.b
  DD_Laser.b
  DD_Arcade.b
  DD_Arcade_Conv.b
  DD_Prototype.b
  DD_2MB.b
  DD_4MB.b
  DD_Filtered.b
  DD_X360.b
  DD_X68k.b
  DD_Pet.b
  DD_Nova.b
  DD_Megadrive.b
  DD_Wii.b
EndStructure

Structure UData
  List Update_Config.s()
  List Update_Folder.s()
EndStructure

Global NewList DD_List.DD_Data()
Global NewList List_Numbers.i()

;- **** Macros ****

Macro Window_Update()
  While WindowEvent() : Wend
EndMacro

Macro DpiX(value)
  DesktopScaledX(value)
EndMacro

Macro DpiY(value)
  DesktopScaledY(value)
EndMacro

Macro Pause_Window(window)
  SendMessage_(WindowID(window),#WM_SETREDRAW,0,0)
EndMacro

Macro Resume_Window(window)
  SendMessage_(WindowID(window),#WM_SETREDRAW,1,0)
  InvalidateRect_(WindowID(window),0,1)
  UpdateWindow_(WindowID(window))
EndMacro

Macro Get_Game_Number()
  
  If GetGadgetState(#MAIN_LIST)>-1
    SelectElement(List_Numbers(),GetGadgetState(#MAIN_LIST))
    SelectElement(DD_List(),List_Numbers())
  EndIf
  
EndMacro

Macro Pause_Gadget(gadget)
  SendMessage_(GadgetID(gadget),#WM_SETREDRAW,#False,0)
EndMacro

Macro Resume_Gadget(gadget)
  SendMessage_(GadgetID(gadget),#WM_SETREDRAW,#True,0)
  RedrawWindow_(GadgetID(gadget),#Null,#Null,#RDW_INVALIDATE)
EndMacro

Procedure Max(a, b)
  If a > b
    ProcedureReturn a
  Else
    ProcedureReturn b
  EndIf
EndProcedure

;- **** Procedures ****

Procedure GetRequiredSize(Gadget, *Width.LONG, *Height.LONG, Flags = 0)
  
  Protected DC = GetDC_(GadgetID(Gadget))
  Protected oldFont = SelectObject_(DC, GetGadgetFont(Gadget)) 
  Protected Size.SIZE, index, Line$, LineSize.SIZE
  
  Select GadgetType(Gadget)
      
    Case #PB_GadgetType_Text
      Protected Text$ = RemoveString(GetGadgetText(Gadget), Chr(10))
      Protected count = CountString(Text$, Chr(13)) + 1
      Protected empty = 0
      Protected maxheight = 0 
      For index = 1 To count 
        Line$ = StringField(Text$, index, Chr(13))
        If Line$ = ""
          empty + 1
        Else 
          GetTextExtentPoint32_(DC, @Line$, Len(Line$), @LineSize.SIZE)
          Size\cx = Max(Size\cx, LineSize\cx)
          Size\cy + LineSize\cy
          maxheight = Max(maxheight, LineSize\cy)
        EndIf
      Next index            
      Size\cy + empty * maxheight  
      
      If Flags & #PB_Text_Border
        Size\cx + GetSystemMetrics_(#SM_CXEDGE) * 2
        Size\cy + GetSystemMetrics_(#SM_CYEDGE) * 2
      Else           
        Size\cx + 2
        Size\cy + 2
      EndIf
      
  EndSelect
  
  SelectObject_(DC, oldFont)
  ReleaseDC_(GadgetID(Gadget), DC)
  *Width\l  = Size\cx
  *Height\l = Size\cy
  
EndProcedure

Procedure GetRequiredWidth(Gadget, Flags = 0)
  Protected Width.l, Height.l
  GetRequiredSize(Gadget, @Width, @Height, Flags)
  ProcedureReturn Width
EndProcedure 

Procedure GetRequiredHeight(Gadget, Flags = 0)
  Protected Width.l, Height.l
  GetRequiredSize(Gadget, @Width, @Height, Flags)
  ProcedureReturn Height
EndProcedure 

Procedure GetMaxWindowHeight()
  
  Protected DesktopRect.RECT
  Protected DesktopX, DesktopY, DesktopWidth, DesktopHeight
  
  SystemParametersInfo_(#SPI_GETWORKAREA, 0, @DesktopRect.RECT, 0)
  DesktopX = DesktopRect\left
  DesktopY = DesktopRect\top
  DesktopWidth = DesktopRect\right - DesktopRect\left
  DesktopHeight = DesktopRect\bottom - DesktopRect\top
  DesktopWidth-GetSystemMetrics_(#SM_CXFIXEDFRAME)*2
  DesktopHeight-(GetSystemMetrics_(#SM_CYCAPTION)+GetSystemMetrics_(#SM_CYFIXEDFRAME)*2)
  
  ProcedureReturn DesktopHeight
  
EndProcedure

Procedure.s Title_Extras()
  
  Protected extras.s=""
  
  If DD_List()\DD_AGA
    extras+" [AGA]"
  EndIf 
  
  If DD_List()\DD_RTG
    extras+" [RTG]"
  EndIf 
  
  If DD_List()\DD_Nova
    extras+" [Nova]"
  EndIf
  
  If DD_List()\DD_FullGame
    extras+" [Full Game]"
  EndIf
  
  If DD_List()\DD_Shapeshifter
    extras+" [ShapeShifter]"
  EndIf  
  
  If DD_List()\DD_CD32
    extras+" [CD32]"
  EndIf
  
  If DD_List()\DD_CDTV
    extras+" [CDTV]"
  EndIf
  
  If DD_List()\DD_Exult
    extras+" [Exult]"
  EndIf
  
  If DD_List()\DD_AmigaCD
    extras+" [AmigaCD]"
  EndIf
  
  If DD_List()\DD_HDD
    extras+" [Hard Disk]"
  EndIf
  
  If DD_List()\DD_Arcadia
    extras+" [Arcadia]"
  EndIf 
  
  If DD_List()\DD_Arcade
    extras+" [Arcade]"
  EndIf 
  
  If DD_List()\DD_Cubo
    extras+" [Cubo CD32]"
  EndIf  
  
  If DD_List()\DD_Unreleased
    extras+" [Unreleased]"
  EndIf
  
  If DD_List()\DD_PreRelease
    extras+" [Pre Release]"
  EndIf
  
  If DD_List()\DD_Preview
    extras+" [Preview]"
  EndIf
  
  If DD_List()\DD_Intro1
    extras+" [Intro On Disk 1]"
  EndIf
  
  If DD_List()\DD_Intro3
    extras+" [Intro On Disk 3]"
  EndIf
  
  If DD_List()\DD_Intro4
    extras+" [Intro On Disk 4]"
  EndIf
  
  If DD_List()\DD_NES
    extras+" [NES Conversion]"
  EndIf
  
  If DD_List()\DD_MSDOS
    extras+" [MS-DOS Conversion]"
  EndIf
  
  If DD_List()\DD_MSX
    extras+" [MSX Conversion]"
  EndIf
  
  If DD_List()\DD_MSX2
    extras+" [MSX2 Conversion]"
  EndIf
  
  If DD_List()\DD_AppleII
    extras+" [Apple IIGS Conversion]"
  EndIf
  
  If DD_List()\DD_Windows
    extras+" [Windows Conversion]"
  EndIf
  
  If DD_List()\DD_Mac
    extras+" [Macintosh Conversion]"
  EndIf
  
  If DD_List()\DD_Atari
    extras+" [Atari ST Conversion]"
  EndIf
  
  If DD_List()\DD_C64
    extras+" [C64 Conversion]"
  EndIf
  
  If DD_List()\DD_3DS
    extras+" [3DS Conversion]"
  EndIf
  
  If DD_List()\DD_PDA
    extras+" [PDA Conversion]"
  EndIf
  
  If DD_List()\DD_SegaCD
    extras+" [SegaCD Conversion]"
  EndIf
  
  If DD_List()\DD_ZDoom
    extras+" [ZDoom]"
  EndIf
  
  If DD_List()\DD_D1X
    extras+" [D1X_Rebirth]"
  EndIf
  
  If DD_List()\DD_CDoom
    extras+" [Chocolate Doom]"
  EndIf
  
  If DD_List()\DD_Keen
    extras+" [Reflection Keen]"
  EndIf
  
  If DD_List()\DD_Tyrian
    extras+" [OpenTyrian]"
  EndIf
  
  If DD_List()\DD_AmiSpear
    extras+" [AmiSpear]"
  EndIf
  
  If DD_List()\DD_AmiWolf
    extras+" [AmiWolf]"
  EndIf
  
  If DD_List()\DD_JFSW
    extras+" [JFSW]"
  EndIf
  
  If DD_List()\DD_Build
    extras+" [Build Game]"
  EndIf
  
  If DD_List()\DD_ScummVM
    extras+" [ScummVM]"
  EndIf
  
  If DD_List()\DD_American And Not DD_List()\DD_Nova
    extras+" [American Laser Games]"
  EndIf
  
  If DD_List()\DD_Laser
    extras+" [LaserDisc Conversion]"
  EndIf
  
  If DD_List()\DD_Arcade
    extras+" [Arcade Conversion]"
  EndIf
  
  If DD_List()\DD_X360
    extras+" [XBox 360 Controllers]"
  EndIf 
  
  If DD_List()\DD_2MB
    extras+" [2MB RAM]"
  EndIf
  
  If DD_List()\DD_4MB
    extras+" [4MB RAM]"
  EndIf
  
  If DD_List()\DD_Beta
    extras+" [Beta]"
  EndIf    
  
  If DD_List()\DD_Demo
    extras+" [Demo]"
  EndIf
  
  If DD_List()\DD_Hack
    extras+" [Hack]"
  EndIf
  
  If DD_List()\DD_Alpha
    extras+" [Alpha]"
  EndIf
  
  If DD_List()\DD_Mod
    extras+" [Modification]"
  EndIf
  
  If DD_List()\DD_Prototype
    extras+" [Prototype]"
  EndIf
  
  If DD_List()\DD_X68k
    extras+" [Sharp X68000 Conversion]"
  EndIf
  
  If DD_List()\DD_JFDuke
    extras+" [JFDuke3D]"
  EndIf
  
  If DD_List()\DD_Pet
    extras+" [PET Version]"
  EndIf
  
  ProcedureReturn extras
  
EndProcedure

Procedure Filter_List()
  
  Protected filter.s
  
  filter=GetGadgetItemText(#MAIN_FILTER,GetGadgetState(#MAIN_FILTER))
  
  ForEach DD_List() 
    
    DD_List()\DD_Filtered=#True
    
    Select filter
      Case "None" : DD_List()\DD_Filtered=#True
      Case "Full Game" : DD_List()\DD_Filtered=DD_List()\DD_FullGame
      Case "ShapeShifter" : DD_List()\DD_Filtered=DD_List()\DD_Shapeshifter
      Case "RTG" : DD_List()\DD_Filtered=DD_List()\DD_RTG
      Case "AGA" : DD_List()\DD_Filtered=DD_List()\DD_AGA
      Case "OCS/ECS" : DD_List()\DD_Filtered=DD_List()\DD_OCSECS
      Case "CD32" : DD_List()\DD_Filtered=DD_List()\DD_CD32
      Case "CDTV" : DD_List()\DD_Filtered=DD_List()\DD_CDTV
      Case "AmigaCD" : DD_List()\DD_Filtered=DD_List()\DD_AmigaCD
      Case "Hard Disk" : DD_List()\DD_Filtered=DD_List()\DD_HDD
      Case "Arcadia" : DD_List()\DD_Filtered=DD_List()\DD_Arcadia
      Case "Arcade" : DD_List()\DD_Filtered=DD_List()\DD_Arcade
      Case "Cubo CD32" : DD_List()\DD_Filtered=DD_List()\DD_Cubo
      Case "Unreleased" : DD_List()\DD_Filtered=DD_List()\DD_Unreleased
      Case "Pre-Release" : DD_List()\DD_Filtered=DD_List()\DD_PreRelease
      Case "Preview" : DD_List()\DD_Filtered=DD_List()\DD_Preview
      Case "Beta" : DD_List()\DD_Filtered=DD_List()\DD_Beta
      Case "Demo" : DD_List()\DD_Filtered=DD_List()\DD_Demo
      Case "Hack" : DD_List()\DD_Filtered=DD_List()\DD_Hack
      Case "Alpha" : DD_List()\DD_Filtered=DD_List()\DD_Alpha
      Case "Modification" : DD_List()\DD_Filtered=DD_List()\DD_Mod
      Case "Conversion (Arcade)" : DD_List()\DD_Filtered=DD_List()\DD_Arcade_Conv
      Case "Conversion (NES)" : DD_List()\DD_Filtered=DD_List()\DD_NES
      Case "Conversion (MS-DOS)" : DD_List()\DD_Filtered=DD_List()\DD_MSDOS
      Case "Conversion (Windows)" : DD_List()\DD_Filtered=DD_List()\DD_Windows
      Case "Conversion (Macintosh)" : DD_List()\DD_Filtered=DD_List()\DD_Mac
      Case "Conversion (Atari ST)" : DD_List()\DD_Filtered=DD_List()\DD_Atari
      Case "Conversion (C64)" : DD_List()\DD_Filtered=DD_List()\DD_C64
      Case "Conversion (3DS)" : DD_List()\DD_Filtered=DD_List()\DD_3DS
      Case "Conversion (PDA)" : DD_List()\DD_Filtered=DD_List()\DD_PDA
      Case "Conversion (MSX)" : DD_List()\DD_Filtered=DD_List()\DD_MSX
      Case "Conversion (MSX2)" : DD_List()\DD_Filtered=DD_List()\DD_MSX2
      Case "Conversion (Apple IIGS)" : DD_List()\DD_Filtered=DD_List()\DD_AppleII
      Case "Conversion (Sega CD)" : DD_List()\DD_Filtered=DD_List()\DD_SegaCD
      Case "Conversion (Sega MegaDrive)" : DD_List()\DD_Filtered=DD_List()\DD_Megadrive
      Case "Conversion (Wii)" : DD_List()\DD_Filtered=DD_List()\DD_Wii
      Case "Conversion (Sharp X68000)" : DD_List()\DD_Filtered=DD_List()\DD_X68k
      Case "ZDoom" : DD_List()\DD_Filtered=DD_List()\DD_ZDoom
      Case "Chocolate Doom" : DD_List()\DD_Filtered=DD_List()\DD_CDoom
      Case "Reflection Keen" : DD_List()\DD_Filtered=DD_List()\DD_Keen
      Case "AmiSpear" : DD_List()\DD_Filtered=DD_List()\DD_AmiSpear
      Case "AmiWolf" : DD_List()\DD_Filtered=DD_List()\DD_AmiWolf
      Case "Exult" : DD_List()\DD_Filtered=DD_List()\DD_Exult
      Case "JFSW" : DD_List()\DD_Filtered=DD_List()\DD_JFSW
      Case "JFDuke3D" : DD_List()\DD_Filtered=DD_List()\DD_JFDuke
      Case "Build Game" : DD_List()\DD_Filtered=DD_List()\DD_Build
      Case "OpenTyrian" : DD_List()\DD_Filtered=DD_List()\DD_Tyrian
      Case "D1X_Rebirth" : DD_List()\DD_Filtered=DD_List()\DD_D1X
      Case "ScummVM" : DD_List()\DD_Filtered=DD_List()\DD_ScummVM
      Case "American Laser Games / Nova" : DD_List()\DD_Filtered=DD_List()\DD_American
      Case "Conversion (LaserDisc)" : DD_List()\DD_Filtered=DD_List()\DD_Laser
      Case "Conversion (Arcade)" : DD_List()\DD_Filtered=DD_List()\DD_Arcade
      Case "Prototype" : DD_List()\DD_Filtered=DD_List()\DD_Prototype
      Case "PET Version" : DD_List()\DD_Filtered=DD_List()\DD_Pet
    EndSelect
    
    If search_name<>""
      If FindString(LCase(DD_List()\DD_Name),LCase(search_name),#PB_String_NoCase)=0 : DD_List()\DD_Filtered=#False : EndIf
    EndIf
    
  Next
  
EndProcedure

Procedure ResizeImgAR(ImgID.l,width.l,height.l) 
  
  Define.l OriW, OriH, x, w, h, oriAR, newAR
  Define.f fw, fh
  
  OriW=ImageWidth(ImgID)
  OriH=ImageHeight(ImgID)
  
  If (OriH > OriW And height < width) Or (OriH < OriW And height > width)
    Swap width, height
  EndIf
  
  ; Calc Factor
  fw = width/OriW
  fh = height/OriH
  
  ; Calc AspectRatio
  oriAR = Round((OriW / OriH) * 10,0)
  newAR = Round((width / height) * 10,0)
  
  ; AspectRatio already correct?
  If oriAR = newAR 
    w = width
    h = height
  ElseIf OriW * fh <= width
    w = OriW * fh
    h = OriH * fh
  ElseIf OriH * fw <= height
    w = OriW * fw
    h = OriH * fw  
  EndIf
  
  ResizeImage(ImgID,w,h,#PB_Image_Smooth) 
  
EndProcedure  

Procedure Draw_Info()
  
  Protected Info_Dir.i, Output$, docs_path.s, sshot_path.s, title_path.s, boxart_path.s,x,y
  Protected NewList Doc_List.s()
  
  Get_Game_Number()
  
  If IsGadget(#MAIN_PANEL) : Pause_Gadget(#MAIN_PANEL) : EndIf
  
  If IsImage(#IFF_IMAGE) : FreeImage(#IFF_IMAGE) : EndIf
  
  If IsMenu(#POPUP_MENU) : FreeMenu(#POPUP_MENU) : EndIf  
  
  docs_path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"
  
  Info_Dir=ExamineDirectory(#PB_Any,docs_path,"*.*")
  
  While NextDirectoryEntry(Info_Dir)
    If DirectoryEntryType(Info_Dir)=#PB_DirectoryEntry_File
      If GetExtensionPart(DirectoryEntryName(Info_Dir))="pdf" Or GetExtensionPart(DirectoryEntryName(Info_Dir))="txt" Or GetExtensionPart(DirectoryEntryName(Info_Dir))="gif" Or GetExtensionPart(DirectoryEntryName(Info_Dir))="png"  Or GetExtensionPart(DirectoryEntryName(Info_Dir))="jpg"
        If Not FindString(DirectoryEntryName(Info_Dir),"___")
          AddElement(Doc_List())
          Doc_List()=DirectoryEntryName(Info_Dir)
        EndIf
      EndIf
    EndIf
  Wend 
  
  FinishDirectory(Info_Dir)
  
  CreatePopupImageMenu(#POPUP_MENU)
  MenuItem(#MenuItem_1,"Play Game",ImageID(#PLAY_IMAGE))
  MenuItem(#MenuItem_13,"Open Game Folder",ImageID(#FOLDER_IMAGE))
  
  If ListSize(Doc_List())>0
    MenuBar()
    ForEach Doc_List()
      If GetExtensionPart(Doc_List())="pdf" : MenuItem(900+ListIndex(Doc_List()),Doc_List(),ImageID(#PDF_IMAGE)) : EndIf
      If GetExtensionPart(Doc_List())="txt" : MenuItem(900+ListIndex(Doc_List()),Doc_List(),ImageID(#TEXT_IMAGE)) : EndIf
      If GetExtensionPart(Doc_List())="gif" : MenuItem(900+ListIndex(Doc_List()),Doc_List(),ImageID(#IMAGE_IMAGE)) : EndIf
      If GetExtensionPart(Doc_List())="png" : MenuItem(900+ListIndex(Doc_List()),Doc_List(),ImageID(#IMAGE_IMAGE)) : EndIf
      If GetExtensionPart(Doc_List())="jpg" : MenuItem(900+ListIndex(Doc_List()),Doc_List(),ImageID(#IMAGE_IMAGE)) : EndIf
    Next  
  EndIf
  
  If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Title.png")>0
    title_path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Title.png"
  EndIf
  
  If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Title.jpg")>0
    title_path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Title.jpg"
  EndIf
  
  If FileSize(title_path)>-1 And ListSize(List_Numbers())>0
    LoadImage(#IFF_IMAGE,title_path)      
  Else
    CopyImage(#IFF_BLANK,#IFF_IMAGE)
  EndIf
  
  If IsImage(#IFF_IMAGE)
    ResizeImage(#IFF_IMAGE,DpiX(GadgetWidth(#TITLE_GADGET)), DpiY(GadgetHeight(#TITLE_GADGET)),#PB_Image_Smooth)
    StartDrawing(CanvasOutput(#TITLE_GADGET))
    DrawImage(ImageID(#IFF_IMAGE),0,0,DpiX(GadgetWidth(#TITLE_GADGET)), DpiY(GadgetHeight(#TITLE_GADGET)))
    StopDrawing()
  EndIf
  
  If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___SShot.png")>0
    sshot_path.s=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___SShot.png"
  EndIf
  
  If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___SShot.jpg")>0
    sshot_path.s=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___SShot.jpg"
  EndIf
  
  If FileSize(sshot_path.s)>-1 And ListSize(List_Numbers())>0
    LoadImage(#IFF_IMAGE,sshot_path.s)      
  Else
    CopyImage(#IFF_BLANK,#IFF_IMAGE)
  EndIf
  
  If IsImage(#IFF_IMAGE)
    ResizeImage(#IFF_IMAGE,DpiX(GadgetWidth(#SCREEN_GADGET)), DpiY(GadgetHeight(#SCREEN_GADGET)),#PB_Image_Raw)
    StartDrawing(CanvasOutput(#SCREEN_GADGET))
    DrawImage(ImageID(#IFF_IMAGE),0,0,DpiX(GadgetWidth(#SCREEN_GADGET)), DpiY(GadgetHeight(#SCREEN_GADGET)))
    StopDrawing()
  EndIf
  
  If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Boxart.png")>0
    boxart_path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Boxart.png"
  EndIf
  
  If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Boxart.jpg")>0
    boxart_path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Boxart.jpg"
  EndIf
  
  If FileSize(boxart_path)>-1 And ListSize(List_Numbers())>0
    LoadImage(#IFF_IMAGE,boxart_path)      
  Else
    CopyImage(#IFF_BLANK,#IFF_IMAGE)
  EndIf
  
  Protected scale.f, offset.i, box_x.i, box_w.i, img_width.i, img_height.i, x_size.i
  
  box_x=GadgetHeight(#BOXART_GADGET)
  box_w=GadgetWidth(#BOXART_GADGET)
  scale=box_w/ImageWidth(#IFF_IMAGE)
  x_size=GadgetHeight(#BOXART_GADGET)
  If Int(ImageHeight(#IFF_IMAGE)*scale)>550
    offset=(x_size-Int(ImageHeight(#IFF_IMAGE)*scale))/2
    img_height=x_size
  Else 
    offset=(x_size-Int(ImageHeight(#IFF_IMAGE)*scale))/2
    img_height=Int(ImageHeight(#IFF_IMAGE)*scale)
  EndIf
  
  If IsImage(#IFF_IMAGE)
    img_height=(DpiY(ImageHeight(#IFF_IMAGE))-4)*scale
    img_width=DpiX(GadgetWidth(#BOXART_GADGET)-4)
    If img_height>DpiY(GadgetHeight(#BOXART_GADGET))
      ResizeImgAR(#IFF_IMAGE,DpiX(GadgetWidth(#BOXART_GADGET))-4,DpiY(GadgetHeight(#BOXART_GADGET)-6))
      y=0
      x=(DpiY(GadgetWidth(#BOXART_GADGET))-ImageWidth(#IFF_IMAGE))/2
    Else
      ResizeImage(#IFF_IMAGE,img_width, img_height,#PB_Image_Smooth)
      x=0
      y=(DpiY(GadgetHeight(#BOXART_GADGET))-ImageHeight(#IFF_IMAGE))/2
    EndIf
    StartDrawing(CanvasOutput(#BOXART_GADGET))
    Box(0,0,DpiX(GadgetWidth(#BOXART_GADGET)),DpiY(GadgetHeight(#BOXART_GADGET)),#Black)
    
    
    If x<0 : x=0 : EndIf
    DrawImage(ImageID(#IFF_IMAGE),x,y)
    DrawingMode(#PB_2DDrawing_Outlined)
    Box(x,y,ImageWidth(#IFF_IMAGE),ImageHeight(#IFF_IMAGE),Box_Colour)
    DrawingMode(#PB_2DDrawing_AlphaBlend)
    If ListSize(Doc_List())>0
      DrawImage(ImageID(#DOC_IMAGE),ImageWidth(#IFF_IMAGE)-35,3)
    EndIf
    StopDrawing()
  EndIf
  
  CreateImage(#IFF_BLANK,DpiX(360), DpiY(450),32,#Black)
  StartDrawing(ImageOutput(#IFF_BLANK))
  FrontColor(#Red)
  DrawText(0,0,"No Image")
  StopDrawing()
  
  If IsGadget(#MAIN_PANEL) : Resume_Gadget(#MAIN_PANEL) : EndIf
  
  SetWindowTitle(#MAIN_WINDOW,W_Title+" - Showing ("+Str(ListSize(List_Numbers()))+" of "+Str(ListSize(DD_List()))+" Games)")
  
  FreeList(Doc_List())
  
EndProcedure

Procedure Cleanup(nul)
  
  While ProgramRunning(Program)
  Wend
  
  CloseWindow(#RUN_WINDOW)
  
  DeleteFile(GetTemporaryDirectory()+DD_List()\DD_Config)
  
  CloseProgram(Program)
  
EndProcedure

Procedure Run_Game()
  
  Protected old_pos.i, floppy.s, gui.s, config.s, full_path.s, params.s, DRes.s, Width_Scale.s, Scanline_Ratio.s
  
  old_pos=GetGadgetState(#MAIN_LIST)
  
  OpenWindow(#RUN_WINDOW,0,0,360,60,"Starting WinUAE. Please Wait...",#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
  TextGadget(#PB_Any,70,15,280,50,"Loading: "+DD_List()\DD_Name,#PB_Text_Center)
  ImageGadget(#PB_Any,10,5,50,50,ImageID(#BUB_IMAGE))
  
  Get_Game_Number()
  
  If OpenPack(0,Home_Path+"DD_CONFIGS.dat",#PB_PackerPlugin_BriefLZ)
    UncompressPackFile(0,GetTemporaryDirectory()+DD_List()\DD_Config+".uae", DD_List()\DD_Config+".uae") 
  EndIf
  
  DRes=Str(DesktopWidth(0))+"x"+Str(DesktopHeight(0))
  
  Select DRes
      
    Case "5120x1440" : width_scale="1.000000"
    Case "3840x2160" : width_scale="1.500000"
    Case "3840x1080" : width_scale="0.750000"
    Case "2560x1440" : width_scale="2.000000"
    Case "2560x1080" : width_scale="1.125000"
    Case "1920x1440" : width_scale="2.500000"
    Case "1920x1200" : width_scale="1.750000"
    Case "1920x1080" : width_scale="1.500000"
    Case "1680x1050" : width_scale="1.500000"
    Case "1600x1200" : width_scale="2.000000"
    Case "1600x1024" : width_scale="1.500000"
    Case "1600x900"  : width_scale="1.125000"
    Case "1440x900"  : width_scale="1.250000"
    Case "1366x768"  : width_scale="1.000000"
    Case "1280x720"  : width_scale="0.875000"
      
  EndSelect

  Select Floppy_Speed
    Case 1 : floppy=" -s floppy_speed=0"
    Case 2 : floppy=""
    Case 3 : floppy=" -s floppy_speed=200"
    Case 4 : floppy=" -s floppy_speed=400"
    Case 5 : floppy=" -s floppy_speed=800"
  EndSelect
  
  If Show_GUI : gui=" -cfgparam use_gui=yes" : Else  : gui="" : EndIf
  
  params=""
  
  Select Window_Type
            
    Case 2
      params+" -cfgparam gfx_fullscreen_amiga=fullwindow"
      params+" -cfgparam gfx_fullscreen_picasso=fullwindow"
      params+" -cfgparam win32.rtg_scale_aspect_ratio="
      params+" -cfgparam win32.rtg_scale_small=true"
      
      If FW_Scaling
        params+" -cfgparam gfx_filter_autoscale=scale"
      Else
        params+" -cfgparam gfx_filter_vert_zoom_multf=0.000000"
        params+" -cfgparam gfx_filter_horiz_zoom_multf="+width_scale
      EndIf
      
      params+" -cfgparam gfx_filter_aspect_ratio=-1:-1"
      
      If Use_Scanlines
        params+" -cfgparam gfx_filter_scanlines=50"
        If DesktopHeight(0)>1200
          params+" -cfgparam gfx_filter_scanlineratio=49"
        EndIf
        params+" -cfgparam gfx_filter_scanlines_rtg=50"
        params+" -cfgparam gfx_filter_scanlineratio_rtg=34"
        params+" -cfgparam gfx_filter_scanlineoffset_rtg=2"
      EndIf
      
      params+" -cfgparam gfx_filter_vert_offsetf=0"
      
    Case 3
      params+" -cfgparam win32.statusbar=none"
      params+" -cfgparam gfx_fullscreen_amiga=false"
      params+" -cfgparam gfx_fullscreen_picasso=false"
      params+" -cfgparam gfx_filter_aspect_ratio=-1:-1"
      params+" -cfgparam gfx_width_windowed=720"
      params+" -cfgparam gfx_height_windowed=568"
      
      If FW_Scaling
        params+" -cfgparam gfx_filter_autoscale=scale"
      Else
        params+" -cfgparam gfx_filter_vert_zoom_multf=0.000000"
      EndIf
      
  EndSelect 
  
  If Not Use_Scanlines
    params+" -cfgparam gfx_filter_scanlines=0"
    params+" -cfgparam gfx_filter_scanlines_rtg=0"
  EndIf
  
  If Not Show_Leds
    params+" -cfgparam show_leds=0"
    params+" -cfgparam show_leds_rtg=0"
  EndIf
  
  full_path="-f "+#DOUBLEQUOTE$+GetTemporaryDirectory()+DD_List()\DD_Config+".uae"+#DOUBLEQUOTE$+floppy+gui+params
  
  program=RunProgram(WinUAE_Path, full_path ,"",#PB_Program_Open)
  
  CreateThread(@Cleanup(),0)
  
  Delay(1500)
  
  HideWindow(#RUN_WINDOW,#True)
  
  SetGadgetState(#MAIN_LIST,old_pos)
  
  Get_Game_Number()
  
EndProcedure

Procedure Image_Popup(type.i)
  
  Protected popup_imagegadget, pevent, popup_image, ww.i, wh.i
  
  Get_Game_Number()
  
  DisableWindow(#MAIN_WINDOW,#True)
  
  path=""
  
  If type=1
    If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Title.png")>0
      path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Title.png"
    EndIf
    If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Title.jpg")>0
      path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Title.jpg"
    EndIf
    ww=720 : wh=568
  EndIf
  
  If type=2
    If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___SShot.png")>0
      path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___SShot.png"
    EndIf
    If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___SShot.jpg")>0
      path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___SShot.jpg"
    EndIf
    ww=720 : wh=568
  EndIf
  
  If type=3
    If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Boxart.png")>0
      path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Boxart.png"
    EndIf
    If FileSize(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Boxart.jpg")>0
      path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"+"___Boxart.jpg"
    EndIf
    ww=550
    wh=700
  EndIf
  
  Protected scale.f, backg, x
  
  If path="" : CopyImage(#IFF_BLANK, #IFF_POPUP) : EndIf
  LoadImage(#IFF_POPUP,path)  
  If IsImage(#IFF_POPUP)
    ResizeImgAR(#IFF_POPUP,DpiX(ww), DpiY(wh))
    backg=CreateImage(#PB_Any,ImageWidth(#IFF_POPUP), ImageHeight(#IFF_POPUP),32,#Black)
    StartDrawing(ImageOutput(backg))
    DrawImage(ImageID(#IFF_POPUP),0,0)
    StopDrawing()
    ww=ImageWidth(backg)
    wh=ImageHeight(backg)
    If OpenWindow(#POPUP_WINDOW,0,0,DesktopUnscaledX(ww),DesktopUnscaledY(wh),"",#PB_Window_BorderLess|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
      StickyWindow(#POPUP_WINDOW,#True)
      SetClassLongPtr_(WindowID(#POPUP_WINDOW),#GCL_STYLE,$00020000) ; Add Drop Shadow
      ImageGadget(popup_imagegadget,0,0,ww,wh,ImageID(backg))
      
      Repeat 
        pevent=WaitWindowEvent()
        
        If pevent=#WM_KEYUP
          If EventwParam() = #VK_ESCAPE
            Break
          EndIf
        EndIf
        
        If EventGadget() = popup_imagegadget
          If EventType()=#PB_EventType_LeftDoubleClick
            Break
          EndIf
        EndIf
      ForEver
      
      CloseWindow(#POPUP_WINDOW)
      FreeImage(#IFF_POPUP)
      DisableWindow(#MAIN_WINDOW,#False)
      SetActiveGadget(#MAIN_LIST)
      
    EndIf
  EndIf
  
EndProcedure

Procedure Load_DB()
  
  Protected lFileSize, lFile, lUncompressedSize, lJSON, *lJSONBufferCompressed, *lJSONBuffer
  
  lFile=ReadFile(#PB_Any, Home_Path+"DD_DB.dat")
  If lFile>0
    lFileSize=FileSize(Home_Path+"DD_DB.dat")
    *lJSONBufferCompressed = AllocateMemory(lFileSize)
    *lJSONBuffer = AllocateMemory(lFileSize*60)       
    ReadData(lFile, *lJSONBufferCompressed, lFileSize)
    lUncompressedSize = UncompressMemory(*lJSONBufferCompressed, lFileSize, *lJSONBuffer, lFileSize*60,#PB_PackerPlugin_BriefLZ)
    lJSON = CatchJSON(#PB_Any, *lJSONBuffer, lUncompressedSize)
    FreeMemory(*lJSONBuffer)
    FreeMemory(*lJSONBufferCompressed)
    CloseFile(lFile)
    ExtractJSONList(JSONValue(lJSON), DD_List()) 
  Else
    MessageRequester("Error","Cannot Open Database!",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
    End
    
  EndIf
  
  ForEach DD_List()
    DD_List()\DD_Filtered=#True
  Next
  
EndProcedure

Procedure Save_DB()
  
  Protected lFileSize, lFile, lJSONCompressedSize, lFileJSON, lJSON, lJSONSize, *lJSONBufferCompressed, *lJSONBuffer
  
  lJSON = CreateJSON(#PB_Any)
  
  If lJSON
    InsertJSONList(JSONValue(lJSON), DD_List())
    lJSONSize = ExportJSONSize(lJSON)
    *lJSONBuffer = AllocateMemory(lJSONSize)
    *lJSONBufferCompressed = AllocateMemory(lJSONSize)
    ExportJSON(lJSON, *lJSONBuffer, lJSONSize)
    lJSONCompressedSize = CompressMemory(*lJSONBuffer, lJSONSize, *lJSONBufferCompressed, lJSONSize,#PB_PackerPlugin_BriefLZ)
    lFileJSON = CreateFile(#PB_Any,Home_Path+"DD_DB.dat")
    WriteData(lFileJSON, *lJSONBufferCompressed, lJSONCompressedSize)
    CloseFile(lFileJSON)
    FreeJSON(lJSON)
    FreeMemory(*lJSONBuffer)
    FreeMemory(*lJSONBufferCompressed )
  EndIf 
  
EndProcedure

Procedure Save_Prefs()
  If FileSize(Home_Path+"DD_LAUNCH.prefs")>0 : DeleteFile(Home_Path+"DD_LAUNCH.prefs") : EndIf
  If CreateFile(0,Home_Path+"DD_LAUNCH.prefs")
    WriteStringN(0,"*** The minimum GUI resolution is 1280x720. Anything less will be ignored. ***")
    WriteStringN(0,"Show_GUI="+Show_GUI)
    WriteStringN(0,"Window_Type="+Window_Type)
    WriteStringN(0,"Floppy_Speed="+Floppy_Speed)
    WriteStringN(0,"Close_Confirm="+Close_Confirm)
    WriteStringN(0,"Cover_Colour="+Box_Colour)
    WriteStringN(0,"Original_Names="+Original_Names)
    WriteStringN(0,"Use_Scanlines="+Use_Scanlines)
    WriteStringN(0,"Show_Leds="+Show_Leds)
    WriteStringN(0,"Stretch_Window="+Stretch_Window)
    WriteStringN(0,"Window_Width="+WinW)
    WriteStringN(0,"Window_Height="+WinH)
    WriteStringN(0,"FW_Scaling="+FW_Scaling)
    CloseFile(0)
  EndIf 
EndProcedure

Procedure Load_Prefs()
  
  Protected input$
  
  If OpenFile(0,Home_Path+"DD_LAUNCH.prefs")
    While Not Eof(0)
      input$=ReadString(0)
      If FindString(input$,"Show_GUI=") : Show_GUI=Val(StringField(input$,2,Chr(61))) : EndIf
      If FindString(input$,"Window_Type=") : Window_Type=Val(StringField(input$,2,Chr(61))) : EndIf
      If FindString(input$,"Floppy_Speed=") : Floppy_Speed=Val(StringField(input$,2,Chr(61))) : EndIf
      If FindString(input$,"Close_Confirm=") : Close_Confirm=Val(StringField(input$,2,Chr(61))) : EndIf
      If FindString(input$,"Cover_Colour=") : Box_Colour=Val(StringField(input$,2,Chr(61))) : EndIf
      If FindString(input$,"Original_Names=") : Original_Names=Val(StringField(input$,2,Chr(61))) : EndIf
      If FindString(input$,"Use_Scanlines=") : Use_Scanlines=Val(StringField(input$,2,Chr(61))) : EndIf
      If FindString(input$,"Show_Leds=") : Show_Leds=Val(StringField(input$,2,Chr(61))) : EndIf
      If FindString(input$,"Stretch_Window=") : Stretch_Window=Val(StringField(input$,2,Chr(61))) : EndIf
      If FindString(input$,"Window_Width=") : WinW=Val(StringField(input$,2,Chr(61))) : EndIf
      If FindString(input$,"Window_Height=") : WinH=Val(StringField(input$,2,Chr(61))) : EndIf
      If FindString(input$,"FW_Scaling=") : FW_Scaling=Val(StringField(input$,2,Chr(61))) : EndIf
    Wend
    CloseFile(0)
  Else
    Save_Prefs()
  EndIf
  
EndProcedure

Procedure File_Viewer(file.s)
  
  Protected f_window, f_gadget
  
  If IsWindow(#FILE_WINDOW_01) And IsWindow(#FILE_WINDOW_02)  And IsWindow(#FILE_WINDOW_03)  And IsWindow(#FILE_WINDOW_04)  And IsWindow(#FILE_WINDOW_05)  And IsWindow(#FILE_WINDOW_06)  And IsWindow(#FILE_WINDOW_07)  And IsWindow(#FILE_WINDOW_08)  And IsWindow(#FILE_WINDOW_09)  And IsWindow(#FILE_WINDOW_10)
    MessageRequester("Error", "Too many windows open!"+#CRLF$+"Please close one and try again!",#PB_MessageRequester_Error|#PB_MessageRequester_Ok)
    Goto proc_exit
  EndIf
  
  If IsWindow(#FILE_WINDOW_01)
    f_window=#FILE_WINDOW_02
    f_gadget=#FILE_WEBGADGET_02
  Else
    f_window=#FILE_WINDOW_01
    f_gadget=#FILE_WEBGADGET_01
  EndIf
  
  If IsWindow(#FILE_WINDOW_02)
    f_window=#FILE_WINDOW_03
    f_gadget=#FILE_WEBGADGET_03
  EndIf
  
  If IsWindow(#FILE_WINDOW_03)
    f_window=#FILE_WINDOW_04
    f_gadget=#FILE_WEBGADGET_04
  EndIf
  
  If IsWindow(#FILE_WINDOW_04)
    f_window=#FILE_WINDOW_05
    f_gadget=#FILE_WEBGADGET_05
  EndIf
  
  If IsWindow(#FILE_WINDOW_05)
    f_window=#FILE_WINDOW_06
    f_gadget=#FILE_WEBGADGET_06
  EndIf
  
  If IsWindow(#FILE_WINDOW_06)
    f_window=#FILE_WINDOW_07
    f_gadget=#FILE_WEBGADGET_07
  EndIf
  
  If IsWindow(#FILE_WINDOW_07)
    f_window=#FILE_WINDOW_08
    f_gadget=#FILE_WEBGADGET_08
  EndIf
  
  If IsWindow(#FILE_WINDOW_08)
    f_window=#FILE_WINDOW_09
    f_gadget=#FILE_WEBGADGET_09
  EndIf
  
  If IsWindow(#FILE_WINDOW_09)
    f_window=#FILE_WINDOW_10
    f_gadget=#FILE_WEBGADGET_10
  EndIf
  
  OpenWindow(f_window,0,0,700,600,"File Viewer ("+GetFilePart(file)+")",#PB_Window_SystemMenu|#PB_Window_SizeGadget|#PB_Window_MinimizeGadget|#PB_Window_MaximizeGadget|#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
  Pause_Window(f_window)
  WebGadget(f_gadget,0,0,700,600,"file://"+file)
  Resume_Window(f_window)
  
  SetGadgetAttribute(f_gadget,#PB_Web_BlockPopupMenu,#True)
  
  proc_exit:
  
EndProcedure 

Procedure Draw_Gadgets()
    
  ListIconGadget(#MAIN_LIST,2,2,410,WindowHeight(#MAIN_WINDOW)-MenuHeight()-59, "", 100, #PB_ListIcon_GridLines | #LVS_NOCOLUMNHEADER | #PB_ListIcon_FullRowSelect)
  
  Protected gw.i, gh.i
  Protected cw.i, ch.i
  
  gh=WindowHeight(#MAIN_WINDOW)-MenuHeight()
  gw=(gh/4)*5
  
  ContainerGadget(#MEDIA_CONTAINER,(WindowWidth(#MAIN_WINDOW)-gw)+46,0,gw-40,gh+2)
  
  cw=GadgetWidth(#MEDIA_CONTAINER)
  ch=GadgetHeight(#MEDIA_CONTAINER)
  
  CanvasGadget(#TITLE_GADGET ,        2,        2, (cw/2)   ,   (ch/2), #PB_Canvas_Border)
  CanvasGadget(#SCREEN_GADGET,        2, (ch/2)+4, (cw/2)   , (ch/2)-8, #PB_Canvas_Border)
  CanvasGadget(#BOXART_GADGET, (cw/2)+4,        2, (cw/2)-12,     ch-6, #PB_Canvas_Border)
  
  CloseGadgetList()
    
  ResizeGadget(#MAIN_LIST,2,2,(WindowWidth(#MAIN_WINDOW)-GadgetWidth(#MEDIA_CONTAINER))+4,#PB_Ignore)
  
  FrameGadget(#FILTER_FRAME,2,WindowHeight(#MAIN_WINDOW)-MenuHeight()-54,(GadgetWidth(#MAIN_LIST)/2)-2,50,"Filter (Press F10 For Search)")
  ComboBoxGadget(#MAIN_FILTER,6,WindowHeight(#MAIN_WINDOW)-MenuHeight()-36,(GadgetWidth(#MAIN_LIST)/2)-10,24)
  
  FrameGadget(#FLOPPY_FRAME,(GadgetWidth(#MAIN_LIST)/2)+2,WindowHeight(#MAIN_WINDOW)-MenuHeight()-54,GadgetWidth(#MAIN_LIST)/2,50,"")
  TrackBarGadget(#MAIN_FLOPPY,(GadgetWidth(#MAIN_LIST)/2)+6,WindowHeight(#MAIN_WINDOW)-MenuHeight()-34,(GadgetWidth(#MAIN_LIST)/2)-10,20,1,5,#PB_TrackBar_Ticks)
  
  SetGadgetState(#MAIN_FLOPPY,Floppy_Speed)
  
  Select Floppy_Speed
    Case 1 : SetGadgetText(#FLOPPY_FRAME,"Floppy Speed (Turbo)")
    Case 2 : SetGadgetText(#FLOPPY_FRAME,"Floppy Speed (100%)")
    Case 3 : SetGadgetText(#FLOPPY_FRAME,"Floppy Speed (200%)")
    Case 4 : SetGadgetText(#FLOPPY_FRAME,"Floppy Speed (400%)")
    Case 5 : SetGadgetText(#FLOPPY_FRAME,"Floppy Speed (800%)")
  EndSelect
  
  AddGadgetItem(#MAIN_FILTER,-1,"None")
  AddGadgetItem(#MAIN_FILTER,-1,"AGA")
  AddGadgetItem(#MAIN_FILTER,-1,"Alpha")
  AddGadgetItem(#MAIN_FILTER,-1,"American Laser Games / Nova")
  AddGadgetItem(#MAIN_FILTER,-1,"AmigaCD")
  AddGadgetItem(#MAIN_FILTER,-1,"AmiSpear")
  AddGadgetItem(#MAIN_FILTER,-1,"AmiWolf")
  AddGadgetItem(#MAIN_FILTER,-1,"Arcade")
  AddGadgetItem(#MAIN_FILTER,-1,"Arcadia")
  AddGadgetItem(#MAIN_FILTER,-1,"Beta")
  AddGadgetItem(#MAIN_FILTER,-1,"Build Game")
  AddGadgetItem(#MAIN_FILTER,-1,"CD32")
  AddGadgetItem(#MAIN_FILTER,-1,"CDTV")
  AddGadgetItem(#MAIN_FILTER,-1,"Chocolate Doom")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (3DS)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (Apple IIGS)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (Arcade)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (Atari ST)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (C64)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (LaserDisc)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (Macintosh)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (MS-DOS)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (MSX)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (MSX2)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (NES)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (PDA)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (Sega CD)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (Sega MegaDrive)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (Sharp X68000)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (Wii)")
  AddGadgetItem(#MAIN_FILTER,-1,"Conversion (Windows)")
  AddGadgetItem(#MAIN_FILTER,-1,"Cubo CD32")
  AddGadgetItem(#MAIN_FILTER,-1,"D1X_Rebirth")
  AddGadgetItem(#MAIN_FILTER,-1,"Demo")
  AddGadgetItem(#MAIN_FILTER,-1,"Exult")
  AddGadgetItem(#MAIN_FILTER,-1,"Hack")
  AddGadgetItem(#MAIN_FILTER,-1,"JFSW")
  AddGadgetItem(#MAIN_FILTER,-1,"JFDuke3D")
  AddGadgetItem(#MAIN_FILTER,-1,"Modification")
  AddGadgetItem(#MAIN_FILTER,-1,"OCS/ECS")
  AddGadgetItem(#MAIN_FILTER,-1,"OpenTyrian")
  AddGadgetItem(#MAIN_FILTER,-1,"PET Version")
  AddGadgetItem(#MAIN_FILTER,-1,"Pre-Release")
  AddGadgetItem(#MAIN_FILTER,-1,"Preview")
  AddGadgetItem(#MAIN_FILTER,-1,"Prototype")
  AddGadgetItem(#MAIN_FILTER,-1,"RTG")
  AddGadgetItem(#MAIN_FILTER,-1,"Reflection Keen")
  AddGadgetItem(#MAIN_FILTER,-1,"ScummVM")
  AddGadgetItem(#MAIN_FILTER,-1,"ShapeShifter")
  AddGadgetItem(#MAIN_FILTER,-1,"Unreleased")
  AddGadgetItem(#MAIN_FILTER,-1,"ZDoom")
  
  SetGadgetState(#MAIN_FILTER,0)
  
  CreatePopupMenu(#DUMMY_MENU)
  
  CreateImageMenu(#MAIN_MENU, WindowID(#MAIN_WINDOW))
  MenuTitle("File")
  MenuItem(#MenuItem_1, "Run Game"+Chr(9)+"Enter",ImageID(#PLAY_IMAGE))
  MenuItem(#MenuItem_13,"Open Game Folder"+Chr(9)+"F4",ImageID(#FOLDER_IMAGE))
  AddKeyboardShortcut(#MAIN_WINDOW,#PB_Shortcut_F4,#MenuItem_13)
  MenuBar()
  MenuItem(#MenuItem_5, "Search Database"+Chr(9)+"F10",ImageID(#SEARCH_IMAGE))
  AddKeyboardShortcut(#MAIN_WINDOW,#PB_Shortcut_F10,#MenuItem_5)
  MenuItem(#MenuItem_4, "Refresh Database"+Chr(9)+"F5",ImageID(#REFRESH_IMAGE))
  AddKeyboardShortcut(#MAIN_WINDOW,#PB_Shortcut_F5,#MenuItem_4)
  MenuBar()
  MenuItem(#MenuItem_3, "Quit"+Chr(9)+"Ctrl+Q",ImageID(#CLOSE_IMAGE))
  AddKeyboardShortcut(#MAIN_WINDOW,#PB_Shortcut_Control|#PB_Shortcut_Q,#MenuItem_3)  
  MenuTitle("Options")
  If Original_Names
    MenuItem(#MenuItem_18, "Use New Names")
  Else
    MenuItem(#MenuItem_18, "Use Original Names")
  EndIf
  MenuBar()
  MenuItem(#MenuItem_6, "Show WinUAE GUI")
  OpenSubMenu("WinUAE Screen")
  MenuItem(#MenuItem_14, "Full Screen")
  MenuItem(#MenuItem_9, "Full Window")
  MenuItem(#MenuItem_15, "Windowed")
  CloseSubMenu()
  MenuBar()
  OpenSubMenu("Full Window Scaling")
  MenuItem(#MenuItem_21, "Default")
  MenuItem(#MenuItem_22, "Stretch")
  CloseSubMenu()
  MenuBar()
  MenuItem(#MenuItem_19, "Show Scanlines")
  MenuItem(#MenuItem_20, "Show LEDs")
  MenuBar()
  MenuItem(#MenuItem_7, "Stretch Window")
  MenuItem(#MenuItem_12, "Box Art Outline Colour",ImageID(#BORDER_IMAGE))
  MenuBar()
  MenuItem(#MenuItem_11, "Close Confirmation")
  MenuBar()
  MenuItem(#MenuItem_10, "Save Settings",ImageID(#FOLDER_IMAGE))
  MenuTitle("Help")
  MenuItem(#MenuItem_16, "Help"+Chr(9)+"F12",ImageID(#HELP_IMAGE))
  MenuItem(#MenuItem_2, "About",ImageID(#INFO_IMAGE))
  AddKeyboardShortcut(#MAIN_WINDOW,#PB_Shortcut_F12,#MenuItem_16)  
  
  Select Window_Type
    Case 1 : SetMenuItemState(#MAIN_MENU,#MenuItem_14,Window_Type)
    Case 2 : SetMenuItemState(#MAIN_MENU,#MenuItem_9,Window_Type)
    Case 3 : SetMenuItemState(#MAIN_MENU,#MenuItem_15,Window_Type)
  EndSelect
  
  SetMenuItemState(#MAIN_MENU,#MenuItem_7,Stretch_Window)
  SetMenuItemState(#MAIN_MENU,#MenuItem_19,Use_Scanlines)
  SetMenuItemState(#MAIN_MENU,#MenuItem_20,Show_Leds)
  SetMenuItemState(#MAIN_MENU,#MenuItem_11,Close_Confirm)
  
  If FW_Scaling 
    SetMenuItemState(#MAIN_MENU,#MenuItem_21,#False)
    SetMenuItemState(#MAIN_MENU,#MenuItem_22,#True)
  Else
    SetMenuItemState(#MAIN_MENU,#MenuItem_21,#True)
    SetMenuItemState(#MAIN_MENU,#MenuItem_22,#False)
  EndIf
  
EndProcedure

Procedure Draw_Main_Window()
  
  Protected winheight.i, winwidth.i, y.i, win_params
  
  ExamineDesktops()
  
  If Stretch_Window
    winheight=DesktopUnscaledY(GetMaxWindowHeight())
    winwidth=(winheight/9)*16
    If winwidth<1368 And DesktopWidth(0)>1280 : winwidth=1352 : EndIf
    win_params=#PB_Window_SystemMenu | #PB_Window_MinimizeGadget | #PB_Window_Invisible
  Else
    If WinW<1280 : WinW=1280 : EndIf
    If WinH<720 : WinH=720 : EndIf
    winheight=DesktopUnscaledX(WinH)
    winwidth=DesktopUnscaledY(WinW)
    win_params=#PB_Window_SystemMenu | #PB_Window_MinimizeGadget | #PB_Window_Invisible | #PB_Window_ScreenCentered
  EndIf
  
  OpenWindow(#MAIN_WINDOW, DesktopUnscaledX((DesktopWidth(0)/2)-(DpiX(winwidth)/2)-2), 5, winwidth , winheight-8, W_Title , win_params)
  
  Draw_Gadgets()
  
  CreateImage(#IFF_BLANK,DpiX(350), DpiY(564),32,#Black)
  StartDrawing(ImageOutput(#IFF_BLANK))
  FrontColor(#Red)
  DrawText(0,0,"No Image")
  StopDrawing()
  StartDrawing(CanvasOutput(#TITLE_GADGET))
  DrawImage(ImageID(#IFF_BLANK),0,0)
  StopDrawing()
  
EndProcedure

Procedure Draw_List()
  
  Pause_Gadget(#MAIN_LIST)
  
  ClearGadgetItems(#MAIN_LIST)
  
  ClearList(List_Numbers())
  
  Filter_List()
  
  ForEach DD_List()
    If DD_List()\DD_Filtered=#True
      If Original_Names
        AddGadgetItem(#MAIN_LIST,-1,DD_List()\DD_Config)
      Else
        AddGadgetItem(#MAIN_LIST,-1,DD_List()\DD_Name+Title_Extras())
      EndIf
      If Mod(CountGadgetItems(#MAIN_LIST),2)=0 : SetGadgetItemColor(#MAIN_LIST,CountGadgetItems(#MAIN_LIST)-1,#PB_Gadget_BackColor,$EEEEEE,#PB_All) : EndIf
      AddElement(List_Numbers())
      List_Numbers()=ListIndex(DD_List())
    EndIf
  Next    
  
  Resume_Gadget(#MAIN_LIST)
  
  If GetWindowLongPtr_(GadgetID(#MAIN_LIST), #GWL_STYLE) & #WS_VSCROLL
    SetGadgetItemAttribute(#MAIN_LIST,0,#PB_ListIcon_ColumnWidth,GadgetWidth(#MAIN_LIST)-20)
  Else
    SetGadgetItemAttribute(#MAIN_LIST,0,#PB_ListIcon_ColumnWidth,GadgetWidth(#MAIN_LIST)-4)
  EndIf
  
  SetActiveGadget(#MAIN_LIST)
  SetGadgetState(#MAIN_LIST,0)
  
EndProcedure

Procedure Process_UAE()
  
  Protected NewList File_List.s()
  Protected NewList Old_Config.s()
  
  Protected fileread$, output$, input$, answer$, KeepSet.b, progress_bar.i, old_gadget_list.i, text_info.i
  Protected F_HRes.s, F_VRes.s, W_HRes.s, W_VRes.s, Height.i, change.b, New_Path.s, Temp_Path.s, RTG_VRes.s, RTG_HRes.s
  Protected Scanlines.s, HiResScanlines.s, ScreenType.i, ScreenFilter.s, TurboFloppy.s, StretchScreen.s, AutoScale.s, RemoveOffset.s
  
  DeleteFile(Home_Path+"DD_CONFIGS.dat")
  DeleteFile(Home_Path+"DD_DB.dat")
  
  If FileSize(GetTemporaryDirectory()+"DD_Temp")=-1 : CreateDirectory(GetTemporaryDirectory()+"DD_Temp") : EndIf
  
  ClearList(File_List())
  
  change=#False
  
  Temp_Path=GetTemporaryDirectory()+"DD_Temp\"
  New_Path=ReplaceString(Home_Path,Chr(92),Chr(92)+Chr(92))
  
  ExamineDirectory(0,Home_Path+"Configurations\","*.uae")
  While NextDirectoryEntry(0)
    AddElement(File_List())
    File_List()=Home_Path+"Configurations\"+DirectoryEntryName(0)
  Wend
  
  OpenWindow(#PROGRESS_WINDOW,0,0,302,62,"Creating Database...",#PB_Window_WindowCentered,WindowID(#MAIN_WINDOW))
  StickyWindow(#PROGRESS_WINDOW,#True)
  old_gadget_list=UseGadgetList(WindowID(#PROGRESS_WINDOW))
  ImageGadget(#PB_Any,0,8,48,48,ImageID(#BUB_IMAGE))
  text_info=TextGadget(#PB_Any, 54,8,200,20,"Processing config files...") 
  progress_bar=ProgressBarGadget(#PB_Any,54,30,242,26,0,ListSize(File_List()))
  
  If CreatePack(0,Home_Path+"DD_CONFIGS.dat",#PB_PackerPlugin_BriefLZ)
    
    ForEach File_List()
      
      AddElement(DD_List())
      DD_List()\DD_Config=GetFilePart(File_List(),#PB_FileSystem_NoExtension)
      DD_List()\DD_Name=GetFilePart(File_List(),#PB_FileSystem_NoExtension)
      If ReadFile(0,File_List(),#PB_Ascii)
        
        If Mod(ListIndex(File_List()),10)=0
          SetGadgetState(progress_bar,ListIndex(File_List()))
          Window_Update()
        EndIf
        
        While Not Eof(0)
          AddElement(Old_Config())
          Old_Config()=ReadString(0)
        Wend
        
        CloseFile(0)
        
        If CreateFile(1,Temp_Path+GetFilePart(File_List()),#PB_Ascii)
          
          ForEach Old_Config()
            If FindString(Old_Config(),"floppy0=")
              If StringField(Old_Config(),2,Chr(61))<>""
                DD_List()\DD_Folder=StringField(Old_Config(),3,Chr(92))
              EndIf
            EndIf
            
            If FindString(Old_Config(),"cdimage0=")
              If StringField(Old_Config(),2,Chr(61))<>""
                DD_List()\DD_Folder=StringField(Old_Config(),3,Chr(92))
              EndIf
            EndIf
            
            If FindString(Old_Config(),"hardfile2=")
              If StringField(Old_Config(),2,Chr(61))<>""
                If FindString(Old_Config(),".\\")
                  DD_List()\DD_Folder=StringField(Old_Config(),5,Chr(92))
                EndIf
                If FindString(Old_Config(),".\") And DD_List()\DD_Folder="" : DD_List()\DD_Folder=StringField(Old_Config(),3,Chr(92)) : EndIf
              EndIf
            EndIf
            
            If FindString(Old_Config(),".\\",#PB_String_NoCase)
              If FindString(Old_Config(),"hardfile",#PB_String_NoCase) Or FindString(Old_Config(),"uaehf",#PB_String_NoCase)
                Old_Config()=ReplaceString(Old_Config(),".\\",New_Path)          
              Else
                Old_Config()=ReplaceString(Old_Config(),".\\",Home_Path)
              EndIf
            EndIf
            
            If FindString(Old_Config(),".\",#PB_String_NoCase)
              If FindString(Old_Config(),"hardfile",#PB_String_NoCase) Or FindString(Old_Config(),"uaehf",#PB_String_NoCase)
                Old_Config()=ReplaceString(Old_Config(),".\",New_Path)          
              Else
                Old_Config()=ReplaceString(Old_Config(),".\",Home_Path)
              EndIf
            EndIf
            
            If FindString(Old_Config(),"use_gui=", #PB_String_NoCase) : Old_Config()="use_gui=no" : EndIf
            
            WriteStringN(1,Old_Config())
          Next
          
          FlushFileBuffers(1) 
          CloseFile(1)
          ClearList(Old_Config())
          
        EndIf 
        AddPackFile(0,Temp_Path+GetFilePart(File_List()),GetFilePart(File_List()))
        DeleteFile(Temp_Path+GetFilePart(File_List()))
      EndIf
    Next
    
  EndIf
  
  ClosePack(0)
  
  DeleteDirectory(Temp_Path,"*.*",#PB_FileSystem_Force)
  
  UseGadgetList(old_gadget_list)
  
  CloseWindow(#PROGRESS_WINDOW)
  
  FreeList(Old_Config())
  FreeList(File_List())
  
EndProcedure

Procedure Scrape_DB()
  
  ForEach DD_List()
    DD_List()\DD_OCSECS=#True
    If FindString(DD_List()\DD_Name,"AMIGA CD") : DD_List()\DD_OCSECS=#False : EndIf
    If FindString(DD_List()\DD_Name,"[ShapeShifter]") : DD_List()\DD_Shapeshifter=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[ShapeShifter]") : EndIf
    If FindString(DD_List()\DD_Name,"[RTG]") : DD_List()\DD_RTG=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[RTG]") : DD_List()\DD_OCSECS=#False : EndIf
    If FindString(DD_List()\DD_Name,"[AGA]") : DD_List()\DD_AGA=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[AGA]") : DD_List()\DD_OCSECS=#False : EndIf
    If FindString(DD_List()\DD_Name,"[CD32]") : DD_List()\DD_CD32=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[CD32]") : DD_List()\DD_OCSECS=#False : EndIf
    If FindString(DD_List()\DD_Name,"[CDTV]") : DD_List()\DD_CDTV=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[CDTV]") : DD_List()\DD_OCSECS=#False : EndIf
    If FindString(DD_List()\DD_Name,"[AmigaCD]") : DD_List()\DD_AmigaCD=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[AmigaCD]") : DD_List()\DD_OCSECS=#False : EndIf
    If FindString(DD_List()\DD_Name,"[Arcadia]") : DD_List()\DD_Arcadia=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Arcadia]") : DD_List()\DD_OCSECS=#False : EndIf
    If FindString(DD_List()\DD_Name,"[Cubo CD32]") : DD_List()\DD_Cubo=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Cubo CD32]") : DD_List()\DD_OCSECS=#False : EndIf 
    If FindString(DD_List()\DD_Name,"[unreleased]") : DD_List()\DD_Unreleased=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[unreleased]") : EndIf
    If FindString(DD_List()\DD_Name,"[pre-release]") : DD_List()\DD_PreRelease=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[pre-release]") : EndIf
    If FindString(DD_List()\DD_Name,"[preview]") : DD_List()\DD_Preview=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[preview]") : EndIf
    If FindString(DD_List()\DD_Name,"[demo]") : DD_List()\DD_Demo=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[demo]") : EndIf
    If FindString(DD_List()\DD_Name,"[beta]") : DD_List()\DD_Beta=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[beta]") : EndIf 
    If FindString(DD_List()\DD_Name,"[hack]") : DD_List()\DD_Hack=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[hack]") : EndIf
    If FindString(DD_List()\DD_Name,"[alpha]") : DD_List()\DD_Alpha=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[alpha]") : EndIf
    If FindString(DD_List()\DD_Name,"[Hard Disk]") : DD_List()\DD_HDD=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Hard Disk]") : EndIf 
    If FindString(DD_List()\DD_Name,"[modification]") : DD_List()\DD_Mod=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[modification]") : EndIf
    If FindString(DD_List()\DD_Name,"[intro on disk 1]") : DD_List()\DD_Intro1=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[intro on disk 1]") : EndIf
    If FindString(DD_List()\DD_Name,"[intro on disk 3]") : DD_List()\DD_Intro3=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[intro on disk 3]") : EndIf
    If FindString(DD_List()\DD_Name,"[intro on disk 4]") : DD_List()\DD_Intro4=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[intro on disk 4]") : EndIf
    If FindString(DD_List()\DD_Name,"[NES conversion]") : DD_List()\DD_NES=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[NES conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[MS-DOS conversion]") : DD_List()\DD_MSDOS=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[MS-DOS conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[Windows conversion]") : DD_List()\DD_Windows=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Windows conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[Macintosh conversion]") : DD_List()\DD_Mac=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Macintosh conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[Atari ST conversion]") : DD_List()\DD_Atari=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Atari ST conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[PET version]") : DD_List()\DD_Pet=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[PET version]") : EndIf
    If FindString(DD_List()\DD_Name,"[C64 conversion]") : DD_List()\DD_C64=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[C64 conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[3DS conversion]") : DD_List()\DD_3DS=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[3DS conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[PDA conversion]") : DD_List()\DD_PDA=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[PDA conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[Sega CD conversion]") : DD_List()\DD_SegaCD=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Sega CD conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[Sega MegaDrive conversion]") : DD_List()\DD_Megadrive=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Sega MegaDrive conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[Wii conversion]") : DD_List()\DD_Wii=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Wii conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[ZDoom]") : DD_List()\DD_ZDoom=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[ZDoom]") : EndIf
    If FindString(DD_List()\DD_Name,"[Chocolate Doom]") : DD_List()\DD_CDoom=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Chocolate Doom]") : EndIf
    If FindString(DD_List()\DD_Name,"[JFSW]") : DD_List()\DD_JFSW=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[JFSW]") : EndIf
    If FindString(DD_List()\DD_Name,"[Build Game]") : DD_List()\DD_Build=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Build Game]") : EndIf
    If FindString(DD_List()\DD_Name,"[JFDuke3D]") : DD_List()\DD_JFDuke=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[JFDuke3D]") : EndIf
    If FindString(DD_List()\DD_Name,"[Arcade]") : DD_List()\DD_Arcade=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Arcade]") : EndIf
    If FindString(DD_List()\DD_Name,"[Reflection Keen]") : DD_List()\DD_Keen=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Reflection Keen]") : EndIf
    If FindString(DD_List()\DD_Name,"[AmiSpear]") : DD_List()\DD_AmiSpear=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[AmiSpear]") : EndIf
    If FindString(DD_List()\DD_Name,"[AmiWolf]") : DD_List()\DD_AmiWolf=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[AmiWolf]") : EndIf
    If FindString(DD_List()\DD_Name,"[ScummVM]") : DD_List()\DD_ScummVM=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[ScummVM]") : EndIf
    If FindString(DD_List()\DD_Name,"[OpenTyrian]") : DD_List()\DD_Tyrian=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[OpenTyrian]") : EndIf
    If FindString(DD_List()\DD_Name,"[American Laser Games]") : DD_List()\DD_American=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[American Laser Games]") : DD_List()\DD_OCSECS=#False : EndIf
    If FindString(DD_List()\DD_Name,"[Nova]") : DD_List()\DD_American=#True : DD_List()\DD_Nova=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Nova]") : DD_List()\DD_OCSECS=#False : EndIf
    If FindString(DD_List()\DD_Name,"[LaserDisc conversion]") : DD_List()\DD_Laser=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[LaserDisc conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[Arcade conversion]") : DD_List()\DD_Arcade_Conv=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Arcade conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[prototype]") : DD_List()\DD_Prototype=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[prototype]") : EndIf
    If FindString(DD_List()\DD_Name,"[full game]") : DD_List()\DD_FullGame=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[full game]") : EndIf
    If FindString(DD_List()\DD_Name,"[2MB]") : DD_List()\DD_2MB=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[2MB]") : EndIf
    If FindString(DD_List()\DD_Name,"[4MB]") : DD_List()\DD_4MB=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[4MB]") : EndIf
    If FindString(DD_List()\DD_Name,"[D1X_Rebirth]") : DD_List()\DD_D1X=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[D1X_Rebirth]") : EndIf
    If FindString(DD_List()\DD_Name,"[MSX conversion]") : DD_List()\DD_MSX=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[MSX conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[MSX2 conversion]") : DD_List()\DD_MSX2=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[MSX2 conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[Sharp X68000 conversion]") : DD_List()\DD_X68k=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Sharp X68000 conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[Apple IIGS conversion]") : DD_List()\DD_AppleII=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Apple IIGS conversion]") : EndIf
    If FindString(DD_List()\DD_Name,"[Exult]") : DD_List()\DD_Exult=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[Exult]") : EndIf
    If FindString(DD_List()\DD_Name,"[XBox 360 controllers]") : DD_List()\DD_X360=#True : DD_List()\DD_Name=RemoveString(DD_List()\DD_Name,"[XBox 360 controllers]") : EndIf
    DD_List()\DD_Name=Trim(DD_List()\DD_Name)
    DD_List()\DD_Name=ReplaceString(DD_List()\DD_Name,"   "," ")
  Next
  
EndProcedure

Procedure Sort_List()  
  
  SortStructuredList(DD_List(),#PB_Sort_Ascending,OffsetOf(DD_Data\DD_Config),TypeOf(DD_Data\DD_Config))
  
  ForEach DD_List()
    path=DD_List()\DD_Name
    path=RemoveString(path,"-",#PB_String_NoCase)
    path=RemoveString(path,"'",#PB_String_NoCase)
    path=ReplaceString(path,"(","*",#PB_String_NoCase)
    path=ReplaceString(path,"XBox","vbox",#PB_String_NoCase)
    DD_List()\DD_Sort=LCase(path)
  Next 
  
  SortStructuredList(DD_List(),#PB_Sort_Ascending,OffsetOf(DD_Data\DD_Sort),TypeOf(DD_Data\DD_Sort))
  
EndProcedure

Procedure MenuSelectColor(Event)
  Define old_col=Box_Colour
  Box_Colour = ColorRequester()
  If Box_Colour = -1: Box_Colour=old_col : ProcedureReturn: EndIf  
  StartDrawing(ImageOutput(#BORDER_IMAGE))
    Box(0,0,16,16,Box_Colour)
  StopDrawing() 
EndProcedure

If CreateImage(#BORDER_IMAGE,16,16,24,Box_Colour)
  StartDrawing(ImageOutput(#BORDER_IMAGE))
  Box(0,0,16,16,Box_Colour)
  StopDrawing()
EndIf

;- **** Program Startup ****

If FileSize(".\Configurations\")=-2
  
  UsePNGImageDecoder()
  UseJPEGImageDecoder()
  UseBriefLZPacker()
  
  CatchImage(#PDF_IMAGE,?PDF_Image)
  CatchImage(#TEXT_IMAGE,?Text_Image)
  CatchImage(#BUB_IMAGE,?Bub_Image)
  CatchImage(#PLAY_IMAGE,?Play_Image)
  CatchImage(#DOC_IMAGE,?Doc_Image)
  CatchImage(#FOLDER_IMAGE,?Folder_Image)
  CatchImage(#SEARCH_IMAGE,?Search_Image)
  CatchImage(#REFRESH_IMAGE,?Refresh_Image)
  CatchImage(#CLOSE_IMAGE,?Close_Image)
  CatchImage(#INFO_IMAGE,?Info_Image)
  CatchImage(#HELP_IMAGE,?Help_Image)
  CatchImage(#IMAGE_IMAGE,?Image_Image)
  ResizeImage(#PDF_IMAGE,16,16)
  ResizeImage(#TEXT_IMAGE,16,16)
  
  Load_Prefs()
    
  Draw_Main_Window()
  
  If FileSize(Home_Path+"DD_DB.dat")>0 And FileSize(Home_Path+"DD_CONFIGS.dat")>0
    Load_DB()
    Sort_List()
  Else  
    Process_UAE()
    Scrape_DB()
    Sort_List()
    Save_DB()
  EndIf
  
  Draw_List()
  Draw_Info()
  
  HideWindow(#MAIN_WINDOW,#False)
  
Else
  
  MessageRequester("Error","Cannot find configurations folder!",#PB_MessageRequester_Ok|#PB_MessageRequester_Error)
  
  End
  
EndIf

;- **** Main Loop ****

Repeat
  
  event=WaitWindowEvent()
  
  Select event

    Case #WM_KEYDOWN
      If CountGadgetItems(#MAIN_LIST)>0
        If EventwParam() = #VK_RETURN
          If CountGadgetItems(#MAIN_LIST)>0
            Run_Game()
          EndIf 
        EndIf
        If EventwParam() = #VK_F1
          Image_Popup(1)
        EndIf
        If EventwParam() = #VK_F2
          Image_Popup(2)
        EndIf
        If EventwParam() = #VK_F3
          Image_Popup(3)
        EndIf
      EndIf
      
    Case #PB_Event_Menu
      Select EventMenu()
        Case #MenuItem_1  ;{- Run Game
          If IsProgram(Program)
            MessageRequester("Error","WinUAE is already running!"+#CRLF$+"Please close it and try again.",#PB_MessageRequester_Error|#PB_MessageRequester_Ok)
          Else
            If CountGadgetItems(#MAIN_LIST)>0
              Run_Game()
            EndIf
          EndIf;}
        Case #MenuItem_2  ;{- About
          If #PB_Compiler_Processor=#PB_Processor_x64
            MessageRequester("About", W_Title+" (64Bit Version)"+#CRLF$+#CRLF$+"© 2022 Paul Vince (MrV2K)",#PB_MessageRequester_Info|#PB_MessageRequester_Ok)
          EndIf
          If #PB_Compiler_Processor=#PB_Processor_x86
            MessageRequester("About", W_Title+" (32Bit Version)"+#CRLF$+#CRLF$+"© 2022 Paul Vince (MrV2K)",#PB_MessageRequester_Info|#PB_MessageRequester_Ok)
          EndIf
          ;}
        Case #MenuItem_16 ;{- Help
          File_Viewer(Home_Path+"DDLaunch.txt")
          ;}
        Case #MenuItem_3  ;{- Quit
          If Close_Confirm
            If MessageRequester("Exit DDLaunch","Do you want to quit?",#PB_MessageRequester_YesNo|#PB_MessageRequester_Warning)=#PB_MessageRequester_Yes 
              Break
            EndIf
          Else
            Break
          EndIf
          ;}   
        Case #MenuItem_4  ;{- Rescan Configs
          If MessageRequester("Warning", "Rescan Configurations?"+#CRLF$+#CRLF$+"All Data Will Be Lost!",#PB_MessageRequester_YesNo|#PB_MessageRequester_Warning)=#PB_MessageRequester_Yes
            If ListSize(DD_List())>0
              ClearList(DD_List())
              ClearList(List_Numbers())
              ClearGadgetItems(#MAIN_LIST)
              search_name=""
              SetGadgetState(#MAIN_FILTER,0)
              Floppy_Speed=2
              SetGadgetText(#FLOPPY_FRAME,"Floppy Speed (100%)")
              SetGadgetState(#MAIN_FLOPPY,2)
              StartDrawing(CanvasOutput(#TITLE_GADGET))
              DrawImage(ImageID(#IFF_BLANK),0,0,DpiX(GadgetWidth(#TITLE_GADGET))-4, DpiY(GadgetHeight(#TITLE_GADGET))-4)
              StopDrawing()
              StartDrawing(CanvasOutput(#SCREEN_GADGET))
              DrawImage(ImageID(#IFF_BLANK),0,0,DpiX(GadgetWidth(#SCREEN_GADGET))-4, DpiY(GadgetHeight(#SCREEN_GADGET))-4)
              StopDrawing()
              StartDrawing(CanvasOutput(#BOXART_GADGET))
              DrawImage(ImageID(#IFF_BLANK),0,0,DpiX(GadgetWidth(#BOXART_GADGET))-4, DpiY(GadgetHeight(#BOXART_GADGET))-4)
              StopDrawing()
              Window_Update()
              Process_UAE()
              Scrape_DB()
              Sort_List()             
              Save_DB()
              SelectElement(DD_List(),0)
              Draw_List()
              Draw_Info()
              SetGadgetState(#MAIN_LIST,0)
              SetActiveGadget(#MAIN_LIST)
            EndIf
          EndIf ;}
        Case #MenuItem_5  ;{- Search
          count=GetGadgetState(#MAIN_LIST)
          search_name=InputRequester("Search Database","Enter Search Name:",search_name)
          If search_name>""
            SetGadgetText(#FILTER_FRAME,"Filter (F10) (Search: "+#DOUBLEQUOTE$+search_name+#DOUBLEQUOTE$+")")
          Else
            SetGadgetText(#FILTER_FRAME,"Filter (F10)")
          EndIf
          Draw_List()
          SetGadgetState(#MAIN_LIST,0)
          Draw_Info()
          ;} 
        Case #MenuItem_6  ;{- Show GUI
          
          If Show_GUI
            Show_GUI=#False
          Else
            Show_GUI=#True
          EndIf
          SetMenuItemState(#MAIN_MENU,#MenuItem_6,Show_GUI)
          ;}   
        Case #MenuItem_7  ;{- Stretch Window
          If Stretch_Window
            Stretch_Window=#False
          Else
            Stretch_Window=#True
          EndIf
          SetMenuItemState(#MAIN_MENU,#MenuItem_7,Stretch_Window)
          CloseWindow(#MAIN_WINDOW)
          Draw_Main_Window()
          Draw_List()
          Draw_Info()
          HideWindow(#MAIN_WINDOW,#False)
          ;} 
        Case #MenuItem_14 ;{- Full Screen
          Window_Type=1
          SetMenuItemState(#MAIN_MENU,#MenuItem_14,#True)
          SetMenuItemState(#MAIN_MENU,#MenuItem_9,#False)
          SetMenuItemState(#MAIN_MENU,#MenuItem_15,#False)
          ;} 
        Case #MenuItem_9  ;{- Full Window
          Window_Type=2
          SetMenuItemState(#MAIN_MENU,#MenuItem_14,#False)
          SetMenuItemState(#MAIN_MENU,#MenuItem_9,#True)
          SetMenuItemState(#MAIN_MENU,#MenuItem_15,#False)
          ;} 
        Case #MenuItem_15 ;{- Windowed
          Window_Type=3
          SetMenuItemState(#MAIN_MENU,#MenuItem_14,#False)
          SetMenuItemState(#MAIN_MENU,#MenuItem_9,#False)
          SetMenuItemState(#MAIN_MENU,#MenuItem_15,#True)
          ;} 
        Case #MenuItem_11 ;{- Close Confirm
          If Close_Confirm
            Close_Confirm=#False
          Else
            Close_Confirm=#True
          EndIf
          SetMenuItemState(#MAIN_MENU,#MenuItem_11,Close_Confirm)
          ;} 
        Case #MenuItem_10 ;{- Save Settings
          Save_Prefs()
          ;}
        Case #MenuItem_12 ;{- Cover Outline Colour          
          MenuSelectColor(EventMenu()) 
          Draw_Info()
          ;}
        Case #MenuItem_13 ;{- Open Game Folder
          Get_Game_Number()
          path=Home_Path+"Games\"+DD_List()\DD_Folder+"\"
          RunProgram("file://"+path)
          ;}
        Case #MenuItem_18 ;{- Name Toggle
          If Original_Names
            SetMenuItemText(#MAIN_MENU,#MenuItem_18,"Use Original Names")
            Original_Names=#False
          Else
            SetMenuItemText(#MAIN_MENU,#MenuItem_18,"Use New Names")
            Original_Names=#True
          EndIf
          Draw_List()
          ;}        
        Case #MenuItem_19 ;{- Scanlines toggle
          If Use_Scanlines
            Use_Scanlines=#False
          Else
            Use_Scanlines=#True
          EndIf
          SetMenuItemState(#MAIN_MENU,#MenuItem_19,Use_Scanlines)
          ;}
        Case #MenuItem_20 ;{- LEDs toggle
          If Show_Leds
            Show_Leds=#False
          Else
            Show_Leds=#True
          EndIf
          SetMenuItemState(#MAIN_MENU,#MenuItem_20,Show_Leds)
          SetMenuItemState(#MAIN_MENU,#MenuItem_20,Show_Leds)
          ;}
        Case #MenuItem_21, #MenuItem_22 ;{- Fullwindow Scaling
          If FW_Scaling
            FW_Scaling=#False 
            SetMenuItemState(#MAIN_MENU,#MenuItem_21,#True)
            SetMenuItemState(#MAIN_MENU,#MenuItem_22,#False)
          Else
            FW_Scaling=#True
            SetMenuItemState(#MAIN_MENU,#MenuItem_21,#False)
            SetMenuItemState(#MAIN_MENU,#MenuItem_22,#True)
          EndIf
          ;}
        Case 900 To 930 : File_Viewer(Home_Path+"Games\"+DD_List()\DD_Folder+"\"+GetMenuItemText(#POPUP_MENU,EventMenu()))
      EndSelect
      
    Case #PB_Event_Gadget
      
      Select EventGadget()
          
        Case #MAIN_LIST
          If EventType()= #PB_EventType_Change
            Get_Game_Number()
            Draw_Info()
          EndIf
          If EventType() = #PB_EventType_LeftDoubleClick
            PostEvent(#PB_Event_Menu,#MAIN_WINDOW,#MenuItem_1)
          EndIf
          If EventType()= #PB_EventType_RightClick
            DisplayPopupMenu(#POPUP_MENU, WindowID(#MAIN_WINDOW))
          EndIf
          
        Case #TITLE_GADGET
          If ListSize(DD_List())>0
            If EventType()= #PB_EventType_LeftDoubleClick
              Image_Popup(1)
            EndIf
            If EventType()= #PB_EventType_RightClick
              DisplayPopupMenu(#POPUP_MENU, WindowID(#MAIN_WINDOW))
            EndIf
          EndIf
          
        Case #SCREEN_GADGET
          If ListSize(DD_List())>0
            If EventType()= #PB_EventType_LeftDoubleClick
              Image_Popup(2)
            EndIf
            If EventType()= #PB_EventType_RightClick
              DisplayPopupMenu(#POPUP_MENU, WindowID(#MAIN_WINDOW))
            EndIf
          EndIf
          
        Case #BOXART_GADGET
          If ListSize(DD_List())>0
            If EventType()= #PB_EventType_LeftDoubleClick
              Image_Popup(3)
            EndIf
            If EventType()= #PB_EventType_RightClick
              DisplayPopupMenu(#POPUP_MENU, WindowID(#MAIN_WINDOW))
            EndIf
          EndIf          
          
        Case #MAIN_FILTER       
          Draw_List()
          SetGadgetState(#MAIN_LIST,0)
          Draw_Info()
          SetActiveGadget(#MAIN_LIST)
          
        Case #MAIN_FLOPPY
          
          Floppy_Speed=GetGadgetState(#MAIN_FLOPPY)
          Select Floppy_Speed
            Case 1 : SetGadgetText(#FLOPPY_FRAME,"Floppy Speed (Turbo)")
            Case 2 : SetGadgetText(#FLOPPY_FRAME,"Floppy Speed (100%)")
            Case 3 : SetGadgetText(#FLOPPY_FRAME,"Floppy Speed (200%)")
            Case 4 : SetGadgetText(#FLOPPY_FRAME,"Floppy Speed (400%)")
            Case 5 : SetGadgetText(#FLOPPY_FRAME,"Floppy Speed (800%)")
          EndSelect
          
      EndSelect
      
    Case #PB_Event_SizeWindow
      Select EventWindow()
        Case #FILE_WINDOW_01 : ResizeGadget(#FILE_WEBGADGET_01,0,0,WindowWidth(#FILE_WINDOW_01),WindowHeight(#FILE_WINDOW_01))
        Case #FILE_WINDOW_02 : ResizeGadget(#FILE_WEBGADGET_02,0,0,WindowWidth(#FILE_WINDOW_02),WindowHeight(#FILE_WINDOW_02))
        Case #FILE_WINDOW_03 : ResizeGadget(#FILE_WEBGADGET_03,0,0,WindowWidth(#FILE_WINDOW_03),WindowHeight(#FILE_WINDOW_03))
        Case #FILE_WINDOW_04 : ResizeGadget(#FILE_WEBGADGET_04,0,0,WindowWidth(#FILE_WINDOW_04),WindowHeight(#FILE_WINDOW_04))
        Case #FILE_WINDOW_05 : ResizeGadget(#FILE_WEBGADGET_05,0,0,WindowWidth(#FILE_WINDOW_05),WindowHeight(#FILE_WINDOW_05))
        Case #FILE_WINDOW_06 : ResizeGadget(#FILE_WEBGADGET_06,0,0,WindowWidth(#FILE_WINDOW_06),WindowHeight(#FILE_WINDOW_06))
        Case #FILE_WINDOW_07 : ResizeGadget(#FILE_WEBGADGET_07,0,0,WindowWidth(#FILE_WINDOW_07),WindowHeight(#FILE_WINDOW_07))
        Case #FILE_WINDOW_08 : ResizeGadget(#FILE_WEBGADGET_08,0,0,WindowWidth(#FILE_WINDOW_08),WindowHeight(#FILE_WINDOW_08))
        Case #FILE_WINDOW_09 : ResizeGadget(#FILE_WEBGADGET_09,0,0,WindowWidth(#FILE_WINDOW_09),WindowHeight(#FILE_WINDOW_09))
        Case #FILE_WINDOW_10 : ResizeGadget(#FILE_WEBGADGET_10,0,0,WindowWidth(#FILE_WINDOW_10),WindowHeight(#FILE_WINDOW_10))
      EndSelect
      
    Case #PB_Event_CloseWindow
      Select EventWindow()
        Case #MAIN_WINDOW 
          If Close_Confirm
            If MessageRequester("Exit DDLaunch","Do you want to quit?",#PB_MessageRequester_YesNo|#PB_MessageRequester_Warning)=#PB_MessageRequester_Yes 
              Break
            EndIf
          Else
            Break
          EndIf 
        Case #FILE_WINDOW_01 : CloseWindow(#FILE_WINDOW_01)
        Case #FILE_WINDOW_02 : CloseWindow(#FILE_WINDOW_02)
        Case #FILE_WINDOW_03 : CloseWindow(#FILE_WINDOW_03)
        Case #FILE_WINDOW_04 : CloseWindow(#FILE_WINDOW_04)
        Case #FILE_WINDOW_05 : CloseWindow(#FILE_WINDOW_05)
        Case #FILE_WINDOW_06 : CloseWindow(#FILE_WINDOW_06)
        Case #FILE_WINDOW_07 : CloseWindow(#FILE_WINDOW_07)
        Case #FILE_WINDOW_08 : CloseWindow(#FILE_WINDOW_08)
        Case #FILE_WINDOW_09 : CloseWindow(#FILE_WINDOW_09)
        Case #FILE_WINDOW_10 : CloseWindow(#FILE_WINDOW_10)
      EndSelect
  EndSelect
  
ForEver

Save_Prefs()

End

DataSection
  
  PDF_Image:
  IncludeBinary "pdf.png"
  
  Text_Image:
  IncludeBinary "text.png"
  
  Bub_Image:
  IncludeBinary "bub.png"
  
  Play_Image:
  IncludeBinary "Play.png"
  
  Doc_Image:
  IncludeBinary "Document.png"
  
  Folder_Image:
  IncludeBinary "Folder.png"
  
  Close_Image:
  IncludeBinary "Close.png"
  
  Search_Image:
  IncludeBinary "Search.png"
  
  Refresh_Image:
  IncludeBinary "Refresh.png"
  
  Info_Image:
  IncludeBinary "Info.png"
  
  Help_Image:
  IncludeBinary "Help.png"
  
  Image_Image:
  IncludeBinary "image.png"
  
EndDataSection

; IDE Options = PureBasic 6.00 Beta 4 (Windows - x64)
; CursorPosition = 166
; FirstLine = 135
; Folding = AAAAgAAA5
; Optimizer
; EnableThread
; EnableXP
; DPIAware
; UseIcon = dd.ico
; Executable = I:\WinUAE\DDLaunch64.exe
; CommandLine = -c "demo"
; CurrentDirectory = I:\WinUAE\
; Compiler = PureBasic 6.00 Beta 4 - C Backend (Windows - x64)
; Debugger = Standalone
; IncludeVersionInfo
; VersionField0 = 1.4.0.0
; VersionField1 = 1.4.0.0
; VersionField2 = MrV2k
; VersionField3 = DDLaunch
; VersionField4 = 1.4
; VersionField5 = 1.4
; VersionField6 = Game Launcher For Damien D's Collection
; VersionField7 = DDLaunch
; VersionField8 = DDLaunch
; VersionField9 = 2022 Paul Vince
; VersionField10 = -
; VersionField11 = -
; VersionField12 = -
; VersionField13 = -
; VersionField14 = https://easyemu.mameworld.info
; VersionField16 = VFT_APP
; VersionField17 = 0809 English (United Kingdom)