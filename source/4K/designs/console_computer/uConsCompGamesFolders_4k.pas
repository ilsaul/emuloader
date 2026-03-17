unit uConsCompGamesFolders_4K;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon, uCommonCustom, MPCommonObjects, EasyListview, StdCtrls,
  Buttons, IniFiles, ShadowLabel, ExtCtrls, PanelEx, ImgList,
  ButtonsEx;

type
  TFormConsCompGamesFolders4K = class(TForm)
    Systems: TEasyListview;
    PanelFolders: TPanelEx;
    LabelFolderROM: TShadowLabel;
    LabelFolderDiscImage: TShadowLabel;
    LabelFolderFloppyDisk: TShadowLabel;
    LabelFolderCassetteTape: TShadowLabel;
    LabelRecursiveFolderInfo: TShadowLabel;
    IconCartridge: TImage;
    IconDiscImage: TImage;
    IconFloppyDisk: TImage;
    IconCassetteTape: TImage;
    LabelFolderHardDiskDrive: TShadowLabel;
    IconHardDiskDrive: TImage;
    FolderROM: TEasyListview;
    ButtonMoveFolderUp_ROM: TBitBtnEx;
    ButtonMoveFolderDown_ROM: TBitBtnEx;
    ButtonAddFolder_ROM: TBitBtnEx;
    ButtonDeleteFolder_ROM: TBitBtnEx;
    ButtonEditFolder_ROM: TBitBtnEx;
    ButtonClearFolder_ROM: TBitBtnEx;
    FolderDiscImage: TEasyListview;
    ButtonMoveFolderUp_ISO: TBitBtnEx;
    ButtonMoveFolderDown_ISO: TBitBtnEx;
    ButtonAddFolder_ISO: TBitBtnEx;
    ButtonDeleteFolder_ISO: TBitBtnEx;
    ButtonEditFolder_ISO: TBitBtnEx;
    ButtonClearFolder_ISO: TBitBtnEx;
    FolderFloppyDisk: TEasyListview;
    ButtonMoveFolderDown_FLOPPY: TBitBtnEx;
    ButtonAddFolder_FLOPPY: TBitBtnEx;
    ButtonDeleteFolder_FLOPPY: TBitBtnEx;
    ButtonEditFolder_FLOPPY: TBitBtnEx;
    ButtonClearFolder_FLOPPY: TBitBtnEx;
    FolderCassetteTape: TEasyListview;
    ButtonMoveFolderUp_TAPE: TBitBtnEx;
    ButtonMoveFolderDown_TAPE: TBitBtnEx;
    ButtonAddFolder_TAPE: TBitBtnEx;
    ButtonDeleteFolder_TAPE: TBitBtnEx;
    ButtonEditFolder_TAPE: TBitBtnEx;
    ButtonClearFolder_TAPE: TBitBtnEx;
    ButtonMoveFolderUp_FLOPPY: TBitBtnEx;
    PanelBottom: TPanelEx;
    ButtonOk: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    FolderHardDiskDrive: TEasyListview;
    ButtonMoveFolderUp_HARDDISK: TBitBtnEx;
    ButtonMoveFolderDown_HARDDISK: TBitBtnEx;
    ButtonAddFolder_HARDDISK: TBitBtnEx;
    ButtonDeleteFolder_HARDDISK: TBitBtnEx;
    ButtonEditFolder_HARDDISK: TBitBtnEx;
    ButtonClearFolder_HARDDISK: TBitBtnEx;
    IL_Systems: TImageList;
    PanelSystemTitle: TPanelEx;
    IconSystemType: TImage;
    LabelSystemType: TShadowLabel;
    LabelSystemTitle: TShadowLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsCompGamesFolders4K: TFormConsCompGamesFolders4K;

implementation

uses uMain;

{$R *.dfm}



end.

