; �ű��� Inno Setup �ű��� ���ɣ�
; �йش��� Inno Setup �ű��ļ�����ϸ��������İ����ĵ���

#define MyAppName "΢��ʦ��Ȩ����"
#define MyAppVersion "1.0"
#define MyAppPublisher "Meteor"
#define MyAppURL "https://devmeteor.cn"
#define MyAppExeName "΢��ʦ��Ȩ����.exe"

[Setup]
; ע: AppId��ֵΪ������ʶ��Ӧ�ó���
; ��ҪΪ������װ����ʹ����ͬ��AppIdֵ��
; (�����µ�GUID����� ����|��IDE������GUID��)
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
OutputBaseFilename=΢��ʦ��Ȩ���߰�װ��
SetupIconFile=src\img\whs.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "΢��ʦ��Ȩ����.exe"; DestDir: "{app}"; Flags: ignoreversion
; ע��: ��Ҫ���κι���ϵͳ�ļ���ʹ�á�Flags: ignoreversion��

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

;��װ������
;[Run]
;Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
Root:HKCR;Subkey:meteor;ValueType: string;ValueData:MeteorProtocol;Flags: uninsdeletevalue
Root:HKCR;Subkey:meteor;ValueType: string; ValueName:URL Protocol;ValueData:{app}\΢��ʦ��Ȩ����.exe;Flags: uninsdeletevalue
Root:HKCR;Subkey:meteor\DefaultIcon;ValueType: string;ValueData:{app}\΢��ʦ��Ȩ����.exe,1;Flags: uninsdeletevalue
Root:HKCR;Subkey:meteor\shell;ValueType: none;
Root:HKCR;Subkey:meteor\shell\open;ValueType: none;
Root:HKCR;Subkey:meteor\shell\open\command;ValueType: string;ValueData:"""{app}\΢��ʦ��Ȩ����.exe"" ""%1""";Flags: uninsdeletevalue

                                                                             
