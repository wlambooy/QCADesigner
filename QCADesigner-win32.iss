; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=QCADesigner
AppVerName=QCADesigner 1.4.0
AppPublisher=University of Calgary
AppPublisherURL=qcadesigner.ca
AppSupportURL=qcadesigner.ca
AppUpdatesURL=qcadesigner.ca
DefaultDirName={pf}\QCADesigner
DefaultGroupName=QCADesigner
LicenseFile=C:\cygwin\home\Konrad\QCADesigner-distrib\share\QCADesigner\COPYING
ChangesAssociations=yes

[Tasks]
; NOTE: The following entry contains English phrases ("Create a desktop icon" and "Additional icons"). You are free to translate them into another language if required.
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; Flags: unchecked

[Registry]
; This adds the GTK+ libraries to QCADesigner.exe's path
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\QCADesigner.exe"; Flags: uninsdeletekeyifempty
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\QCADesigner.exe"; ValueType: string; ValueData: "{app}\bin\QCADesigner.exe"; Flags: uninsdeletevalue
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\QCADesigner.exe"; ValueType: string; ValueName: "Path"; ValueData: "{app};{code:GetGtkPath}\lib"; Flags: uninsdeletevalue
; File associations
Root: HKCR; SubKey: ".qca"; Flags: uninsdeletekey
Root: HKCR; SubKey: ".qca"; ValueType: string; ValueName: ""; ValueData: "QCADesigner.File"
Root: HKCR; SubKey: "QCADesigner.File"; Flags: uninsdeletekey
Root: HKCR; SubKey: "QCADesigner.File"; ValueType: string; ValueName: ""; ValueData: "QCADesigner Design"
Root: HKCR; SubKey: "QCADesigner.File"; ValueType: dword; ValueName: "BrowserFlags"; ValueData: 8; Flags: uninsdeletevalue
Root: HKCR; SubKey: "QCADesigner.File"; ValueType: dword; ValueName: "EditFlags"; ValueData: 0; Flags: uninsdeletevalue
Root: HKCR; SubKey: "QCADesigner.File\DefaultIcon"; Flags: uninsdeletekey
Root: HKCR; SubKey: "QCADesigner.File\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\share\pixmaps\QCADesigner\QCADesigner.winxp.ico"; MinVersion: 0, 1
Root: HKCR; SubKey: "QCADesigner.File\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\share\pixmaps\\QCADesigner\QCADesigner.win32.ico"; MinVersion: 1, 0
Root: HKCR; SubKey: "QCADesigner.File\shell"; Flags: uninsdeletekey
Root: HKCR; SubKey: "QCADesigner.File\shell"; ValueType: string; ValueName: ""; ValueData: "Open"
Root: HKCR; SubKey: "QCADesigner.File\shell\Open"; Flags: uninsdeletekey
Root: HKCR; SubKey: "QCADesigner.File\shell\Open"; ValueType: string; ValueName: ""; ValueData: "&Open"
Root: HKCR; SubKey: "QCADesigner.File\shell\Open\command"; Flags: uninsdeletekey
Root: HKCR; SubKey: "QCADesigner.File\shell\Open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\bin\QCADesigner.exe"" ""%1"""

[Files]
Source: "C:\cygwin\home\Konrad\QCADesigner-distrib\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs
;Source: "C:\cygwin\home\Konrad\source\QCADesigner\src\QCADesigner.exe"; DestDir: "{app}"; Flags: ignoreversion
;Source: "C:\cygwin\home\Konrad\source\QCADesigner\pixmaps\*"; DestDir: "{app}\pixmaps"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\QCADesigner"; Filename: "{app}\bin\QCADesigner.exe"; IconFilename: "{app}\share\pixmaps\QCADesigner\QCADesigner.winxp.ico"; MinVersion: 0, 1
Name: "{userdesktop}\QCADesigner"; Filename: "{app}\bin\QCADesigner.exe"; Tasks: desktopicon; IconFilename: "{app}\share\pixmaps\QCADesigner\QCADesigner.winxp.ico"; MinVersion: 0, 1
Name: "{group}\QCADesigner"; Filename: "{app}\bin\QCADesigner.exe"; IconFilename: "{app}\share\pixmaps\QCADesigner\QCADesigner.ico"; MinVersion: 1, 0
Name: "{userdesktop}\QCADesigner"; Filename: "{app}\bin\QCADesigner.exe"; Tasks: desktopicon; IconFilename: "{app}\share\pixmaps\QCADesigner\QCADesigner.ico"; MinVersion: 1, 0

[Code]

var
  Exists: Boolean;
  GtkPath: String;

function GetGtkInstalled (): Boolean;
begin
  Exists := RegQueryStringValue (HKLM, 'Software\GTK\2.0', 'Path', GtkPath);
  if not Exists then begin
    Exists := RegQueryStringValue (HKCU, 'Software\GTK\2.0', 'Path', GtkPath);
  end;
   Result := Exists
end;

function GetGtkPath (S: String): String;
begin
    Result := GtkPath;
end;

function InitializeSetup(): Boolean;
begin
  Result := GetGtkInstalled ();
  if not Result then begin
    MsgBox ('Please install the GTK+ 2.0 Runtime Environment before installing QCADesigner.  You can obtain GTK+ from http://www.dropline.net/gtk .', mbError, MB_OK);
  end;
end;
