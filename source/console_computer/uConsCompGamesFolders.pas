unit uConsCompGamesFolders;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon, uCommonCustom, MPCommonObjects, EasyListview, StdCtrls,
  Buttons, IniFiles, ShadowLabel, ExtCtrls, PanelEx, ImgList,
  ButtonsEx;

type
  TFormConsCompGamesFolders = class(TForm)
    Systems: TEasyListview;
    PanelFolders: TPanelEx;
    IL_GameIconSmall: TImageList;
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
    LabelSystemTitle: TShadowLabel;
    LabelSystemType: TShadowLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SystemsItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure ButtonMoveFolderUp_ROMClick(Sender: TObject);
    procedure ButtonAddFolder_ROMClick(Sender: TObject);
    procedure ButtonDeleteFolder_ROMClick(Sender: TObject);
    procedure ButtonEditFolder_ROMClick(Sender: TObject);
    procedure ButtonClearFolder_ROMClick(Sender: TObject);
    procedure FolderROMItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FolderROMItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FolderROMKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FolderDiscImageItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FolderFloppyDiskItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FolderCassetteTapeItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FolderDiscImageItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FolderFloppyDiskItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FolderCassetteTapeItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FolderDiscImageKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FolderFloppyDiskKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FolderCassetteTapeKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FolderHardDiskDriveItemEdited(Sender: TCustomEasyListview;
      Item: TEasyItem; var NewValue: Variant; var Accept: Boolean);
    procedure FolderHardDiskDriveItemEditEnd(Sender: TCustomEasyListview;
      Item: TEasyItem);
    procedure FolderHardDiskDriveKeyAction(Sender: TCustomEasyListview;
      var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
  private
    { Private declarations }
    newsysCustomFolders: packed array[1..MaxConsoleComputerSystems] of packed array[Low(MediaTypeCustom)..High(MediaTypeCustom)] of THashedStringList;
    // 1 -> cartridge; 2 -> disc image; 3 -> floppy disk; 4 -> cassette tape; 5 -> hard disk drive
    // ... 3 to 5 are for computer systems only
    procedure InitializeFoldersVariablesTemp;
    procedure UpdateEmulatorInfo;
    procedure ToggleControls(const SystemID: Integer);
    procedure AddGamesFoldersHashedList(const MediaTypeID: Integer; ELV_Holder: TEasyListview);
    procedure PopulateFolders(ELV_Holder: TEasyListview);

    procedure ResizeForm;
  public
    { Public declarations }
  end;

var
  FormConsCompGamesFolders: TFormConsCompGamesFolders;

implementation

uses uMain;

{$R *.dfm}

procedure TFormConsCompGamesFolders.InitializeFoldersVariablesTemp;
var
  SystemID, MediaType: Integer;
begin
  // define values for all arrays or exception error will occur....
  try
    for SystemID:= 1 to MaxConsoleComputerSystems do
    begin
      for MediaType:= Low(MediaTypeCustom) to High(MediaTypeCustom) do
      begin
        case Assigned(sysCustomFolders[SystemID, MediaType]) of
          True:
            begin
              newsysCustomFolders[SystemID, MediaType]:= THashedStringList.Create;
              newsysCustomFolders[SystemID, MediaType].AddStrings(sysCustomFolders[SystemID, MediaType]);
            end;
          False: newsysCustomFolders[SystemID, MediaType]:= nil;
        end;
      end;
    end;
  except
  end;
end;

procedure TFormConsCompGamesFolders.UpdateEmulatorInfo;
var
  sysID, MediaType: Integer;
begin
  for sysID:=1 to MaxConsoleComputerSystems do
  begin
    for MediaType:=Low(MediaTypeCustom) to High(MediaTypeCustom) do
    begin
      case Assigned(newsysCustomFolders[sysID, MediaType]) of
        True:
          begin
            case Assigned(sysCustomFolders[sysID, MediaType]) of
              True : sysCustomFolders[sysID, MediaType].Clear;
              False: sysCustomFolders[sysID, MediaType]:= THashedStringList.Create;
            end;
            sysCustomFolders[sysID, MediaType].AddStrings(newsysCustomFolders[sysID, MediaType]);
          end;
        False: FreeAndNil(sysCustomFolders[sysID, MediaType]);
      end;
    end;
  end;
  UpdateCustomGamesFolders; // save changes to "sysgamefolders.ini"
end;

procedure TFormConsCompGamesFolders.ToggleControls(const SystemID: Integer);

  function  SetControlStatus(ctrlEnabled: Boolean; ELV_Holder: TEasyListview;
                 UpButton, DownButton, AddButton,
                 DeleteButton, EditButton, ClearButton: TBitBtnEx; MediaIcon: TImage): Boolean;
  var
    iColor: TColor;
  begin
    Result:= ctrlEnabled;
    ELV_Holder.Enabled:= ctrlEnabled;
    if ELV_Holder.Enabled then
       begin
         if IsNightMode then
            iColor:= clrDarkGray
         else
            iColor:= clWhite;
         if ELV_Holder.Color <> iColor then
            ELV_Holder.Color:= iColor;
       end
    else
       begin
         if ELV_Holder.Color <> FormConsCompGamesFolders.Color then
            ELV_Holder.Color:= FormConsCompGamesFolders.Color;
       end;
    FormMain.SetEasyListViewBorderColor(ELV_Holder, ctrlEnabled);

    UpButton.Enabled:= ctrlEnabled;
    DownButton.Enabled:= ctrlEnabled;
    AddButton.Enabled:= ctrlEnabled;
    DeleteButton.Enabled:= ctrlEnabled;
    EditButton.Enabled:= ctrlEnabled;
    ClearButton.Enabled:= ctrlEnabled;
    MediaIcon.Visible:= ctrlEnabled;
  end;

begin
  if SystemID = 48 then
     LabelFolderROM.Caption:= 'Cartridge and Executable Folders' // Atari 400/800/XL
  else
  if not SameText('Cartridge Folders', LabelFolderROM.Caption) then
     LabelFolderROM.Caption:= 'Cartridge Folders';

  LabelFolderROM.Enabled:= SystemUseCartridge(SystemID);
  SetControlStatus(LabelFolderROM.Enabled, FolderROM, ButtonMoveFolderUp_ROM,
                   ButtonMoveFolderDown_ROM, ButtonAddFolder_ROM, ButtonDeleteFolder_ROM,
                   ButtonEditFolder_ROM, ButtonClearFolder_ROM, IconCartridge);

  LabelFolderDiscImage.Enabled:= SystemUseDisc(SystemID);
  SetControlStatus(LabelFolderDiscImage.Enabled, FolderDiscImage, ButtonMoveFolderUp_ISO,
                   ButtonMoveFolderDown_ISO, ButtonAddFolder_ISO, ButtonDeleteFolder_ISO,
                   ButtonEditFolder_ISO, ButtonClearFolder_ISO, IconDiscImage);

  LabelFolderFloppyDisk.Enabled:= SystemUseFloppyDisk(SystemID);
  SetControlStatus(LabelFolderFloppyDisk.Enabled, FolderFloppyDisk, ButtonMoveFolderUp_FLOPPY,
                   ButtonMoveFolderDown_FLOPPY, ButtonAddFolder_FLOPPY, ButtonDeleteFolder_FLOPPY,
                   ButtonEditFolder_FLOPPY, ButtonClearFolder_FLOPPY, IconFloppyDisk);

  LabelFolderCassetteTape.Enabled:= SystemUseCassetteTape(SystemID);
  SetControlStatus(LabelFolderCassetteTape.Enabled, FolderCassetteTape, ButtonMoveFolderUp_TAPE,
                   ButtonMoveFolderDown_TAPE, ButtonAddFolder_TAPE, ButtonDeleteFolder_TAPE,
                   ButtonEditFolder_TAPE, ButtonClearFolder_TAPE, IconCassetteTape);

  LabelFolderHardDiskDrive.Enabled:= SystemUseHardDiskDrive(SystemID);
  SetControlStatus(LabelFolderHardDiskDrive.Enabled, FolderHardDiskDrive, ButtonMoveFolderUp_HARDDISK,
                   ButtonMoveFolderDown_HARDDISK, ButtonAddFolder_HARDDISK, ButtonDeleteFolder_HARDDISK,
                   ButtonEditFolder_HARDDISK, ButtonClearFolder_HARDDISK, IconHardDiskDrive);
end;

procedure TFormConsCompGamesFolders.AddGamesFoldersHashedList(const MediaTypeID: Integer; ELV_Holder: TEasyListview);
var
  Item: TEasyItem;
begin
  if not FormMain.CheckTotal(ELV_Holder) then
     Exit;
  Item:= ELV_Holder.Groups.FirstItem;
  repeat
    if not Assigned(newsysCustomFolders[Systems.Tag, MediaTypeID]) then
       newsysCustomFolders[Systems.Tag, MediaTypeID]:= THashedStringList.Create;
    newsysCustomFolders[Systems.Tag, MediaTypeID].Add(Item.Caption);
    Item:= ELV_Holder.Groups.NextItem(Item);
  until Item = nil;
end;

procedure TFormConsCompGamesFolders.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  sysID, MediaType: Integer;
begin
  CanClose:= not FormMain.ELV_IsEditing(FolderROM);
  if CanClose then
     CanClose:= not FormMain.ELV_IsEditing(FolderDiscImage);
  if CanClose then
     CanClose:= not FormMain.ELV_IsEditing(FolderFloppyDisk);
  if CanClose then
     CanClose:= not FormMain.ELV_IsEditing(FolderCassetteTape);
  if CanClose then
     CanClose:= not FormMain.ELV_IsEditing(FolderHardDiskDrive);
  if CanClose then
     begin
       for sysID:=1 to MaxConsoleComputerSystems do
       begin
         for MediaType:=Low(MediaTypeCustom) to High(MediaTypeCustom) do
             FreeAndNil(newsysCustomFolders[sysID, MediaType]);
       end;
     end;
end;

procedure TFormConsCompGamesFolders.PopulateFolders(ELV_Holder: TEasyListview);
var
  Loop: Integer;
begin
  ELV_Holder.BeginUpdate;
  ELV_Holder.Items.Clear;
  if Assigned(newsysCustomFolders[Systems.Tag, ELV_Holder.Tag]) then
     begin
       for Loop:=0 to newsysCustomFolders[Systems.Tag, ELV_Holder.Tag].Count-1 do
       begin
         with ELV_Holder.Items.Add do
         begin
           ImageIndex:= MaxConsoleComputerSystems+ELV_Holder.Tag;
           Caption:= newsysCustomFolders[Systems.Tag, ELV_Holder.Tag].Strings[Loop];
         end;
       end;
     end;
  ELV_Holder.EndUpdate;
end;

procedure TFormConsCompGamesFolders.ResizeForm;
var
  iDiff, iScreenWidth, iScreenHeight: Integer;
begin
  iScreenWidth:= Screen.Width;
  iScreenHeight:= Screen.Height;

  // no resize necessary for 1280x800 with 68x68 icons
  if (iScreenWidth < 1280) or (iScreenHeight < 800) then
  begin // go back to 48x48 icons
    IL_Systems.Width:= 48;
    IL_Systems.Height:= 48;
    Systems.CellSizes.Icon.Width:= 62;
    Systems.CellSizes.Icon.Height:= 82;
    Systems.Width:= 577;
    Systems.Height:= 672;
    LabelSystemTitle.Width:= 558;
    PanelFolders.Left:= 558;
    PanelFolders.Height:= 672;
    if FormConsCompGamesFolders.ClientWidth <> 984 then
       FormConsCompGamesFolders.ClientWidth:= 984;
    if FormConsCompGamesFolders.ClientHeight <> 672 then
       FormConsCompGamesFolders.ClientHeight:= 672;

    if iScreenHeight = 720 then
       begin
         PanelSystemTitle.Left:= 0;
         PanelSystemTitle.Top:= (Systems.CellSizes.Icon.Height*7);
         PanelSystemTitle.Width:= PanelFolders.Left;
         PanelSystemTitle.Height:= Systems.Height-PanelSystemTitle.Top;
         PanelSystemTitle.Frames:= [frTop];
       end
    else
       begin
         PanelSystemTitle.Left:= (Systems.CellSizes.Icon.Width*3)+2; // +2 for border
         PanelSystemTitle.Top:= (Systems.CellSizes.Icon.Height*7)+2;
         PanelSystemTitle.Width:= PanelFolders.Left-PanelSystemTitle.Left;
       end;

    LabelSystemType.Left:= (PanelSystemTitle.Width-LabelSystemType.Width) div 2;
    LabelSystemTitle.Left:= (PanelSystemTitle.Width-LabelSystemTitle.Width) div 2;
  end;

  if iScreenHeight < 720 then
     Exit;

  if iScreenHeight = 720 then
     begin
       iDiff:= FormConsCompGamesFolders.Height-670;
       FormConsCompGamesFolders.Height:= 670;
       Systems.Width:= Systems.Width+(Systems.CellSizes.Icon.Width);
       Systems.Height:= FormConsCompGamesFolders.ClientHeight;
       PanelSystemTitle.Height:= PanelSystemTitle.Height-iDiff;
       PanelFolders.Left:= PanelFolders.Left+(Systems.CellSizes.Icon.Width);
       PanelFolders.Height:= PanelFolders.Height-iDiff;

       LabelSystemType.Top:= LabelSystemType.Top-9;
       LabelSystemTitle.Top:= LabelSystemTitle.Top-9;
       PanelSystemTitle.Width:= PanelFolders.Left;
       PanelSystemTitle.Height:= Systems.Height-PanelSystemTitle.Top;
       LabelSystemTitle.Width:= PanelFolders.Left-1;
       LabelSystemType.Left:= (PanelSystemTitle.Width-LabelSystemType.Width) div 2;
       LabelSystemTitle.Left:= (PanelSystemTitle.Width-LabelSystemTitle.Width) div 2;
       FormConsCompGamesFolders.ClientWidth:= PanelFolders.Left+PanelFolders.Width;
     end;
end;

procedure TFormConsCompGamesFolders.FormShow(Sender: TObject);
begin
  LoadCustomMAMEIconToForm(TForm(Sender));
  ResizeForm;

  FormMain.LoadNonArcadeSystemIcons(IL_Systems, False);

  FormMain.IL_LeftPanel.GetIcon(16, IconCartridge.Picture.Icon);
  FormMain.IL_LeftPanel.GetIcon(20, IconDiscImage.Picture.Icon);
  FormMain.IL_LeftPanel.GetIcon(17, IconFloppyDisk.Picture.Icon);
  FormMain.IL_LeftPanel.GetIcon(18, IconCassetteTape.Picture.Icon);
  FormMain.IL_LeftPanel.GetIcon(22, IconHardDiskDrive.Picture.Icon);

  FormMain.ELV_ResetNormalColors(Systems);
  FormMain.ELV_ResetNormalColors(FolderROM);
  FormMain.ELV_ResetNormalColors(FolderDiscImage);
  FormMain.ELV_ResetNormalColors(FolderFloppyDisk);
  FormMain.ELV_ResetNormalColors(FolderCassetteTape);
  FormMain.ELV_ResetNormalColors(FolderHardDiskDrive);

  if IsNightMode then
     begin
       FormMain.ELV_SetNightModeColors(Systems);
       FormMain.ELV_SetNightModeColors(FolderROM);
       FormMain.ELV_SetNightModeColors(FolderDiscImage);
       FormMain.ELV_SetNightModeColors(FolderFloppyDisk);
       FormMain.ELV_SetNightModeColors(FolderCassetteTape);
       FormMain.ELV_SetNightModeColors(FolderHardDiskDrive);
     end;
  InitializeFoldersVariablesTemp;
  ELV_PopulateCustomSystems(Systems, Systems.Tag, -1, True);
end;

procedure TFormConsCompGamesFolders.SystemsItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       Systems.Tag:= Systems.Selection.First.ImageIndex;
       ELV_GetSystemTitleConsoleComputer(Systems, Item, LabelSystemTitle, LabelSystemType);
       ToggleControls(Systems.Tag);
       PopulateFolders(FolderROM);
       PopulateFolders(FolderDiscImage);
       PopulateFolders(FolderFloppyDisk);
       PopulateFolders(FolderCassetteTape);
       PopulateFolders(FolderHardDiskDRive);
     end;
end;

procedure TFormConsCompGamesFolders.ButtonMoveFolderUp_ROMClick(Sender: TObject);
begin
  case TBitBtnEx(Sender).HelpContext of
    1: FormMain.ELV_MoveItem(FolderROM, Boolean(TBitBtnEx(Sender).Tag));
    2: FormMain.ELV_MoveItem(FolderDiscImage, Boolean(TBitBtnEx(Sender).Tag));
    3: FormMain.ELV_MoveItem(FolderFloppyDisk, Boolean(TBitBtnEx(Sender).Tag));
    4: FormMain.ELV_MoveItem(FolderCassetteTape, Boolean(TBitBtnEx(Sender).Tag));
    5: FormMain.ELV_MoveItem(FolderHardDiskDrive, Boolean(TBitBtnEx(Sender).Tag));
  end;
end;

procedure TFormConsCompGamesFolders.ButtonAddFolder_ROMClick(Sender: TObject);
var
  MediaTypeID: Integer;
begin
  MediaTypeID:= TBitBtnEx(Sender).HelpContext;
  case MediaTypeID of
    1: FormMain.DialogSelectMultiFolders(FolderROM);
    2: FormMain.DialogSelectMultiFolders(FolderDiscImage);
    3: FormMain.DialogSelectMultiFolders(FolderFloppyDisk);
    4: FormMain.DialogSelectMultiFolders(FolderCassetteTape);
    5: FormMain.DialogSelectMultiFolders(FolderHardDiskDrive);
  end;
  if Assigned(newsysCustomFolders[Systems.Tag, MediaTypeID]) then
     newsysCustomFolders[Systems.Tag, MediaTypeID].Clear;
  case MediaTypeID of
    1: AddGamesFoldersHashedList(MediaTypeID, FolderROM);
    2: AddGamesFoldersHashedList(MediaTypeID, FolderDiscImage);
    3: AddGamesFoldersHashedList(MediaTypeID, FolderFloppyDisk);
    4: AddGamesFoldersHashedList(MediaTypeID, FolderCassetteTape);
    5: AddGamesFoldersHashedList(MediaTypeID, FolderHardDiskDrive);
  end;
end;

procedure TFormConsCompGamesFolders.ButtonDeleteFolder_ROMClick(Sender: TObject);
var
  MediaTypeID: Integer;

  function DeleteItems(ELV_Holder: TEasyListview): Boolean;
  begin
    Result:= FormMain.CheckSelected(ELV_Holder);
    if not Result then
       Exit;
    FormMain.ELV_DeleteSelected(ELV_Holder);
    case FormMain.CheckTotal(ELV_Holder) of
      True:
        begin
          newsysCustomFolders[Systems.Tag, MediaTypeID].Clear;
          AddGamesFoldersHashedList(MediaTypeID, ELV_Holder);
        end;
      False:
        begin
          FreeAndNil(newsysCustomFolders[Systems.Tag, MediaTypeID]);
        end;
    end;
    ELV_Holder.SetFocus;
  end;
begin
  MediaTypeID:= TBitBtnEx(Sender).HelpContext;
  case MediaTypeID of
    1: DeleteItems(FolderROM);
    2: DeleteItems(FolderDiscImage);
    3: DeleteItems(FolderFloppyDisk);
    4: DeleteItems(FolderCassetteTape);
    5: DeleteItems(FolderHardDiskDrive);
  end;
end;

procedure TFormConsCompGamesFolders.ButtonEditFolder_ROMClick(Sender: TObject);
begin
  case TBitBtnEx(Sender).HelpContext of
    1: FormMain.ELV_EnableEdit(FolderROM);
    2: FormMain.ELV_EnableEdit(FolderDiscImage);
    3: FormMain.ELV_EnableEdit(FolderFloppyDisk);
    4: FormMain.ELV_EnableEdit(FolderCassetteTape);
    5: FormMain.ELV_EnableEdit(FolderHardDiskDrive);
  end;
end;

procedure TFormConsCompGamesFolders.ButtonClearFolder_ROMClick(Sender: TObject);
var
  MediaTypeID: Integer;
begin
  MediaTypeID:= TBitBtnEx(Sender).HelpContext;
  case MediaTypeID of
    1: FormMain.ClearListView(FolderROM);
    2: FormMain.ClearListView(FolderDiscImage);
    3: FormMain.ClearListView(FolderFloppyDisk);
    4: FormMain.ClearListView(FolderCassetteTape);
    5: FormMain.ClearListView(FolderHardDiskDrive);
  end;
  FreeAndNil(newsysCustomFolders[Systems.Tag, MediaTypeID]);
end;

procedure TFormConsCompGamesFolders.FolderROMItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
begin
  if not Item.Selected then
     Exit;
  if NewValue = '' then
     Accept:= False
  else
     begin
       if Item.Caption <> NewValue then
          begin
            Item.Caption:= NewValue;
            newsysCustomFolders[Systems.Tag, FolderROM.Tag].Strings[Item.Index]:= NewValue;
          end;
     end;
end;

procedure TFormConsCompGamesFolders.FolderROMItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(FolderROM, False);
end;

procedure TFormConsCompGamesFolders.FolderROMKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_DELETE: ButtonDeleteFolder_ROM.Click;
    VK_F2: ButtonEditFolder_ROM.Click;
  end;
end;

procedure TFormConsCompGamesFolders.FolderDiscImageItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
begin
  if not Item.Selected then
     Exit;
  if NewValue = '' then
     Accept:= False
  else
     begin
       if Item.Caption <> NewValue then
          begin
            Item.Caption:= NewValue;
            newsysCustomFolders[Systems.Tag, FolderDiscImage.Tag].Strings[Item.Index]:= NewValue;
          end;
     end;
end;

procedure TFormConsCompGamesFolders.FolderFloppyDiskItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
begin
  if not Item.Selected then
     Exit;
  if NewValue = '' then
     Accept:= False
  else
     begin
       if Item.Caption <> NewValue then
          begin
            Item.Caption:= NewValue;
            newsysCustomFolders[Systems.Tag, FolderFloppyDisk.Tag].Strings[Item.Index]:= NewValue;
          end;
     end;
end;

procedure TFormConsCompGamesFolders.FolderCassetteTapeItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
begin
  if not Item.Selected then
     Exit;
  if NewValue = '' then
     Accept:= False
  else
     begin
       if Item.Caption <> NewValue then
          begin
            Item.Caption:= NewValue;
            newsysCustomFolders[Systems.Tag, FolderCassetteTape.Tag].Strings[Item.Index]:= NewValue;
          end;
     end;
end;

procedure TFormConsCompGamesFolders.FolderDiscImageItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(FolderDiscImage, False);
end;

procedure TFormConsCompGamesFolders.FolderFloppyDiskItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(FolderFloppyDisk, False);
end;

procedure TFormConsCompGamesFolders.FolderCassetteTapeItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(FolderCassetteTape, False);
end;

procedure TFormConsCompGamesFolders.FolderDiscImageKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_DELETE: ButtonDeleteFolder_ISO.Click;
    VK_F2: ButtonEditFolder_ISO.Click;
  end;
end;

procedure TFormConsCompGamesFolders.FolderFloppyDiskKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_DELETE: ButtonDeleteFolder_FLOPPY.Click;
    VK_F2: ButtonEditFolder_FLOPPY.Click;
  end;
end;

procedure TFormConsCompGamesFolders.FolderCassetteTapeKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_DELETE: ButtonDeleteFolder_TAPE.Click;
    VK_F2: ButtonEditFolder_TAPE.Click;
  end;
end;

procedure TFormConsCompGamesFolders.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.Click;
end;

procedure TFormConsCompGamesFolders.FolderHardDiskDriveItemEdited(
  Sender: TCustomEasyListview; Item: TEasyItem; var NewValue: Variant;
  var Accept: Boolean);
begin
  if not Item.Selected then
     Exit;
  if NewValue = '' then
     Accept:= False
  else
     begin
       if Item.Caption <> NewValue then
          begin
            Item.Caption:= NewValue;
            newsysCustomFolders[Systems.Tag, FolderROM.Tag].Strings[Item.Index]:= NewValue;
          end;
     end;
end;

procedure TFormConsCompGamesFolders.FolderHardDiskDriveItemEditEnd(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  FormMain.ELV_SetEditManager(FolderHardDiskDrive, False);
end;

procedure TFormConsCompGamesFolders.FolderHardDiskDriveKeyAction(
  Sender: TCustomEasyListview; var CharCode: Word; var Shift: TShiftState;
  var DoDefault: Boolean);
begin
  case CharCode of
    VK_DELETE: ButtonDeleteFolder_HARDDISK.Click;
    VK_F2: ButtonEditFolder_HARDDISK.Click;
  end;
end;

procedure TFormConsCompGamesFolders.ButtonCancelClick(Sender: TObject);
begin
  FormMain.MainMenuOptions.Tag:= 1;
  Close;
end;

procedure TFormConsCompGamesFolders.ButtonOkClick(Sender: TObject);
begin
  FormMain.MainMenuOptions.Tag:= 0;
  UpdateEmulatorInfo;
  FormConsCompGamesFolders.ModalResult:= mrOk;
  Close;
end;

end.

