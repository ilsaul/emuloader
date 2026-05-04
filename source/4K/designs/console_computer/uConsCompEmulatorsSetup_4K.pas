unit uConsCompEmulatorsSetup_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, IniFiles, FileCtrl, Menus, uCommon,
  uCommonCustom,
  MPCommonObjects, EasyListview, ExtCtrls, ShadowLabel, PanelEx,
  ImgList, EditEx, ButtonsEx, BevelEx;

type
  TFormConsCompEmulatorsSetup4K = class(TForm)
    PanelEmulators: TPanelEx;
    LabelEmulatorFile: TShadowLabel;
    LabelEmuTitle: TShadowLabel;
    LabelEmuCartridgeParameter: TShadowLabel;
    LabelEmuDiscImageParameter: TShadowLabel;
    LabelEmuBootDiscParameter: TShadowLabel;
    ButtonClearEmulator: TBitBtnEx;
    LabelDaemonToolsFile: TShadowLabel;
    LabelDaemonToolsMount: TShadowLabel;
    LabelDaemonToolsUnmount: TShadowLabel;
    ButtonDaemonToolsHelp: TBitBtnEx;
    Systems: TEasyListview;
    DaemonToolsFile: TEditEx;
    ButtonSelectDaemonTools: TBitBtnEx;
    DaemonToolsMount: TEditEx;
    DaemonToolsUnmount: TEditEx;
    EmulatorFile: TEditEx;
    ButtonSelectEmulator: TBitBtnEx;
    EmuDescription: TEditEx;
    EmuCartridgeParameter: TEditEx;
    EmuDiscImageParameter: TEditEx;
    EmuBootDiscParameter: TEditEx;
    LabelEmuFloppyDiskParameter: TShadowLabel;
    LabelEmuCassetteTapeParameter: TShadowLabel;
    EmuFloppyDiskParameter: TEditEx;
    EmuCassetteTapeParameter: TEditEx;
    LabelEmuCartridgeParameter1: TShadowLabel;
    LabelEmuCartridgeParameter2: TShadowLabel;
    EmuCartridgeParameter2: TEditEx;
    LabelEmuDiscImageParameter1: TShadowLabel;
    LabelEmuDiscImageParameter2: TShadowLabel;
    EmuDiscImageParameter2: TEditEx;
    LabelEmuBootDiscParameter1: TShadowLabel;
    LabelEmuBootDiscParameter2: TShadowLabel;
    EmuBootDiscParameter2: TEditEx;
    LabelEmuFloppyDiskParameter1: TShadowLabel;
    LabelEmuFloppyDiskParameter2: TShadowLabel;
    EmuFloppyDiskParameter2: TEditEx;
    LabelEmuCassetteTapeParameter1: TShadowLabel;
    LabelEmuCassetteTapeParameter2: TShadowLabel;
    EmuCassetteTapeParameter2: TEditEx;
    IconCartridge: TImage;
    IconDiscImage: TImage;
    IconBootDisc: TImage;
    IconFloppyDisk: TImage;
    IconCassetteTape: TImage;
    EmuIcon: TImage;
    IL_EmulatorIcon: TImageList;
    EmuIconFrame: TBevelEx;
    VirtualDriveIconFrame: TBevelEx;
    VirtualDriveIcon: TImage;
    PanelBottom: TPanelEx;
    ButtonInstructions: TBitBtnEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    IconCartridgeReset: TImage;
    IconDiscImageReset: TImage;
    IconBootDiscReset: TImage;
    IconFloppyDiskReset: TImage;
    IconCassetteTapeReset: TImage;
    ButtonSelectFolders: TBitBtnEx;
    Emulator1PageButton: TSpeedButtonEx;
    Emulator2PageButton: TSpeedButtonEx;
    Emulator3PageButton: TSpeedButtonEx;
    Emulator4PageButton: TSpeedButtonEx;
    PageButtonsBottomLine: TBevelEx;
    IL_Systems: TImageList;
    LabelEmuHardDiskDriveParameter: TShadowLabel;
    LabelEmuHardDiskDriveParameter1: TShadowLabel;
    LabelEmuHardDiskDriveParameter2: TShadowLabel;
    IconHardDiskDrive: TImage;
    IconHardDiskDriveReset: TImage;
    EmuHardDiskDriveParameter: TEditEx;
    EmuHardDiskDriveParameter2: TEditEx;
    BitBtn1: TBitBtnEx;
    PanelSystemTitle: TPanelEx;
    LabelSystemTitle: TShadowLabel;
    LabelSystemType: TShadowLabel;
    IconSystemType: TImage;
    VirtualDriveFileNotFoundIcon: TImage;
    EmuFileNotFoundIcon: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsCompEmulatorsSetup4K: TFormConsCompEmulatorsSetup4K;

implementation

uses uMain;

{$R *.dfm}


end.
