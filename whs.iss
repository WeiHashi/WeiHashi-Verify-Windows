; 脚本由 Inno Setup 脚本向导 生成！
; 有关创建 Inno Setup 脚本文件的详细资料请查阅帮助文档！

#define MyAppName "微哈师授权工具"
#define MyAppVersion "1.0"
#define MyAppPublisher "Meteor"
#define MyAppURL "https://devmeteor.cn"
#define MyAppExeName "微哈师授权工具.exe"

[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (生成新的GUID，点击 工具|在IDE中生成GUID。)
AppId={{E1270E81-39AA-4D52-854D-CABC2C65F276}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=微哈师授权工具安装包
SetupIconFile=src\img\whs.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "微哈师授权工具.exe"; DestDir: "{app}"; Flags: ignoreversion
; 注意: 不要在任何共享系统文件上使用“Flags: ignoreversion”

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

;安装后启动
;[Run]
;Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
Root:HKCR;Subkey:meteor;ValueType: string;ValueData:MeteorProtocol;Flags: uninsdeletevalue
Root:HKCR;Subkey:meteor;ValueType: string; ValueName:URL Protocol;ValueData:{app}\微哈师授权工具.exe;Flags: uninsdeletevalue
Root:HKCR;Subkey:meteor\DefaultIcon;ValueType: string;ValueData:{app}\微哈师授权工具.exe,1;Flags: uninsdeletevalue
Root:HKCR;Subkey:meteor\shell;ValueType: none;
Root:HKCR;Subkey:meteor\shell\open;ValueType: none;
Root:HKCR;Subkey:meteor\shell\open\command;ValueType: string;ValueData:"""{app}\微哈师授权工具.exe"" ""%1""";Flags: uninsdeletevalue

                                                                             
