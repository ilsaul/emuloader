unit uArcadeGamesFilter;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms,
  Buttons, SysUtils, StdCtrls, ExtCtrls, IniFiles, ImgList,
  MPCommonObjects, MPCommonUtilities, EasyListview, PanelEx;

type
  TFormArcadeGamesFilter = class(TForm)
    IL_MainFiltersMAME: TImageList;
    FiltersListView: TEasyListview;
    PanelEx1: TPanelEx;
    ButtonGoToCurrentFilter: TBitBtn;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FiltersListViewItemSelectionChanged(
      Sender: TCustomEasyListview; Item: TEasyItem);
    procedure FormActivate(Sender: TObject);
    procedure FiltersListViewGroupClick(Sender: TCustomEasyListview;
      Group: TEasyGroup; KeyStates: TCommonKeyStates;
      HitTest: TEasyGroupHitTestInfoSet);
    procedure FiltersListViewItemDblClick(Sender: TCustomEasyListview;
      Button: TCommonMouseButton; MousePos: TPoint;
      HitInfo: TEasyHitInfoItem);
    procedure ButtonGoToCurrentFilterClick(Sender: TObject);
  private
    { Private declarations }
    function  FiltersIniFound: Boolean;
    function  MountFiltersList: Boolean;
  public
    { Public declarations }
    SelNodeName: String;
  end;

var
  FormArcadeGamesFilter: TFormArcadeGamesFilter;

implementation

uses uMain, uCommon;

{$R *.dfm}

function TFormArcadeGamesFilter.FiltersIniFound: Boolean;
begin
  Result:= FileExists(FormMain.GetIniFilesFolder+'mame_filters.ini');
end;

function TFormArcadeGamesFilter.MountFiltersList: Boolean;
var
  GroupSolo, Group: TEasyGroup;
  Item: TEasyItem;
  filters_file: TMemIniFile;
  mainSectionList, subSectionsList: THashedStringList;
  Loop, Loop2: Integer;
  SubSectionsFound: Boolean;
  iconFolder: String;

  function AddFilterIcon(const iFile: String): Integer;
  begin
    Result:= 1;
    if FormMain.AddDefaultIcons(iFile+'.ico', iconFolder, IL_MainFiltersMAME, False) then
       Result:= IL_MainFiltersMAME.Count-1;
  end;

begin
  Application.ProcessMessages;
  Result:= FiltersIniFound;
  case Result of
    True:
      begin
        try
          filters_file:= TMemIniFile.Create(FormMain.GetIniFilesFolder+'mame_filters.ini');
          mainSectionList:= THashedStringList.Create;
          filters_file.ReadSectionValues('main', mainSectionList);
        except
          FreeAndNil(filters_file);
          FreeAndNil(mainSectionList);
        end;
      end;
    False:
      begin
        CallMessageBox;
        FormMain.AddMsgText('    File ');
        FormMain.AddMsgText(FormMain.GetIniFilesFolder+'mame_filters.ini', $00a65300, [fsBold]);
        FormMain.AddMsgText(' was not found. The filters list cannot be loaded.'+#13#10+'Aborting...');
        GenerateMessage('Games Filters', 'File access failed.', '', 2, False, 1);
        Exit;
      end;
  end;

  if (not Assigned(mainSectionList)) or (mainSectionList.Count = 0) then
     begin
       CallMessageBox;
       FormMain.AddMsgText('    The ');
       FormMain.AddMsgText('[main]', clBlack, [fsBold]);
       FormMain.AddMsgText(' section is empty or was not be found. This section is required for the filters to work correctly.'+
                           #13#10+'File ');
       FormMain.AddMsgText(FormMain.GetIniFilesFolder+'mame_filters.ini', $00a65300, [fsBold]);
       FormMain.AddMsgText(' is not valid. Aborting...');
       GenerateMessage('Games Filters', 'Failed to read filters list.', '', 2, False, 1);
       Result:= False;
       FreeAndNil(filters_file);
       FreeAndNil(mainSectionList);
       Exit;
     end;

  iconFolder:= FormMain.GetFolderFull(32)+'arcade_filters\';
  FormMain.AddDefaultIcons('no_icon.ico', iconFolder, IL_MainFiltersMAME);
  subSectionsList:= THashedStringList.Create; // will hold sub-sections of main section
  FiltersListView.BeginUpdate;
  FiltersListView.Items.ReIndexDisable:= True;
  GroupSolo:= FiltersListView.Groups.Add;
  GroupSolo.Caption:= 'General';
  GroupSolo.ImageIndex:= 1;
  for Loop:=0 to mainSectionList.Count-1 do
  begin
    SubSectionsFound:= filters_file.SectionExists(mainSectionList.Names[Loop]);
    case SubSectionsFound of
      True:
        begin
          Group:= FiltersListView.Groups.Add;
          Group.ImageIndex:= 1;
          Group.Caption:= mainSectionList.ValueFromIndex[Loop];
          Group.Captions[1]:= mainSectionList.Names[Loop];

          Item:= Group.Items.Add;
          Item.ImageIndex:= AddFilterIcon(mainSectionList.Names[Loop]);
          Item.Caption:= 'List All';
          Item.Captions[1]:= mainSectionList.Names[Loop];
          Item.Tag:= Ord(Item.Captions[1] = FormMain.SelectedFilterName);
        end;
      False:
        begin
          Item:= GroupSolo.Items.Add;
          Item.ImageIndex:= AddFilterIcon(mainSectionList.Names[Loop]);
          Item.Caption:= mainSectionList.ValueFromIndex[Loop];
          Item.Captions[1]:= mainSectionList.Names[Loop];
          if Item.Captions[1] = 'allgames' then
             Item.Bold:= True;
          Item.Tag:= Ord(Item.Captions[1] = FormMain.SelectedFilterName);
        end;
    end;
    if SubSectionsFound then
       begin
         // add sub-filters
         subSectionsList.Clear;
         filters_file.ReadSectionValues(mainSectionList.Names[Loop], subSectionsList);
         if subSectionsList.Count > 0 then
            begin
              for Loop2:=0 to subSectionsList.Count-1 do
              begin
                Item:= Group.Items.Add;
                Item.ImageIndex:= AddFilterIcon(subSectionsList.Names[Loop2]);
                Item.Caption:= subSectionsList.ValueFromIndex[Loop2];
                Item.Captions[1]:= subSectionsList.Names[Loop2];
                Item.Tag:= Ord(Item.Captions[1] = FormMain.SelectedFilterName);
              end;
            end
         else
            begin
              CallMessageBox;
              FormMain.AddMsgText('Section ');
              FormMain.AddMsgText('['+mainSectionList.Names[Loop]+']', clBlack, [fsBold]);
              FormMain.AddMsgText(' but there is nothing in it. No sub-filters will be added for ');
              FormMain.AddMsgText(mainSectionList.ValueFromIndex[Loop], clBlack, [fsBold]);
              FormMain.AddMsgText('. Either remove this section or replace the file ');
              FormMain.AddMsgText(FormMain.GetIniFilesFolder+'mame_filters.ini', $00a65300, [fsBold]);
              FormMain.AddMsgText(' with a proper copy.');
              GenerateMessage('Games Filters', 'A main filter was found with empty sub-filters.', '', 2);
            end;
        end;
  end;
  FormMain.ELV_RemoveDefaultGroup(FiltersListView);
  FiltersListView.Items.ReIndexDisable:= False;
  FiltersListView.EndUpdate;
  iconFolder:= '';
  Loop:= mainSectionList.IndexOfName(FormMain.SelectedFilterName);
  if Loop <> -1 then
     begin
       iconFolder:= mainSectionList.ValueFromIndex[Loop];
       if FormMain.SelectedFilterName <> 'allgames' then
          iconFolder:= iconFolder+' - List All';
     end;
  FreeAndNil(mainSectionList);
  FreeAndNil(subSectionsList);
  FreeAndNil(filters_file);
  FormMain.ELV_SelectItem(FiltersListView, 0, FormMain.SelectedFilterName, Ord(FormMain.SelectedFilterName <> ''));
  if iconFolder = '' then
     iconFolder:= FiltersListView.Selection.First.Caption;
  FiltersListView.SetFocus;

  FormArcadeGamesFilter.Caption:= iconFolder;
  Item:= FiltersListView.Selection.First;
  //FormArcadeGamesFilter.Caption:= FormArcadeGamesFilter.Caption+ ' [selected: '+Item.OwnerGroup.Caption+' -> '+Item.Caption+']';
  ButtonGoToCurrentFilter.Hint:= ButtonGoToCurrentFilter.Hint+#13#10+Item.OwnerGroup.Caption+' -> '+Item.Caption;
end;

procedure TFormArcadeGamesFilter.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  case ModalResult of
    mrOk:
      begin
        if not FormMain.CheckSelected(FiltersListView) then
           SelNodeName:= 'cancel';
      end;
    mrCancel: SelNodeName:= 'cancel';
  end;
end;

procedure TFormArcadeGamesFilter.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case FormMain.MenuArcadeBrowseGames.Tag of
    0:
      begin
        case Key of
          #13: ButtonOk.Click;
          #27: ButtonCancel.Click;
        end;
      end;
    else
      begin
        if Key in ['S', 's'] then
           ButtonOk.Click
        else
        if Key in ['Q', 'q'] then
           ButtonCancel.Click;
      end;
  end;
end;

procedure TFormArcadeGamesFilter.FormShow(Sender: TObject);
begin
  case FiltersIniFound of
    True:
      begin
        if FormMain.MenuArcadeBrowseGames.Tag <> 0 then
           FiltersListView.IncrementalSearch.Enabled:= False;
        FormMain.ELV_ResetNormalColors(FiltersListView);
      end;
    False: ButtonCancel.Click;
  end;
end;

procedure TFormArcadeGamesFilter.FiltersListViewItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
begin
  if Item.Selected then
     begin
       FormMain.ELV_SetSelectRibbon(0, FiltersListView);
       SelNodeName:= Item.Captions[1];
       if SelNodeName <> FormMain.SelectedFilterName then
          begin
            if not ButtonGoToCurrentFilter.Enabled then
               ButtonGoToCurrentFilter.Enabled:= True;
          end
       else
          ButtonGoToCurrentFilter.Enabled:= False;
     end;
end;

{
       if Data.aFilterName = 'classic' then
          HintText:= 'Show all games except Neo-Geo'
       else
       if Data.aFilterName = 'chd' then
          HintText:= 'Show all games that have a .chd file'
       else
       if Data.aFilterName = 'irem' then
          HintText:= 'Custom "Irem" compilation using drivers:'+#13#10+
                     'm62.c, m72.c, m90.c, m92.c, m107.c, mpatrol.c, vigilant.c'
       else
       if Data.aFilterName = 'midway' then
          HintText:= 'Custom "Midway" compilation using drivers:'+#13#10+
                     'midtunit.c, midvunit.c, midwunit.c, midxunit.c, midyunit.c, midzeus.c'
       else
       if Data.aFilterName = 'capcom' then
          HintText:= 'This filter enable all sub-filters in the "Capcom" category'
       else
       if Data.aFilterName = 'capcom_oldschool' then
          HintText:= 'Custom "Capcom" compilation using drivers:'+#13#10+
                     'gng.c, gunsmoke.c, higemaru.c, sonson.c, commando.c, tigeroad.c'
       else
       if Data.aFilterName = 'sega' then
          HintText:= 'This filter enable all sub-filters in the "Sega" category'
       else
       if Data.aFilterName = 'system16' then
          HintText:= 'This filter use the following drivers:'+#13#10+
                     'system16.c, segahang.c, segaorun.c, segas16a.c, segas16b.c'
       else
       if Data.aFilterName = 'system18' then
          HintText:= 'This filter use the following drivers:'+#13#10+
                     'system18.c, segas18.c'
       else
       if Data.aFilterName = 'system32' then
          HintText:= 'This filter use the following drivers:'+#13#10+
                     'system32.c, segas32.c'
       else
       if Data.aFilterName = 'segaxybd' then
          HintText:= 'This filter use the following drivers:'+#13#10+
                     'segaxbd.c, segaybd.c'
       else
       if Data.aFilterName = 'megatech_megaplay' then
          HintText:= 'This filter use the following drivers:'+#13#10+
                     'megatech.c, megaplay.c'
       else
       if Data.aFilterName = 'konami' then
          HintText:= 'This filter enable all sub-filters in the "Konami" category'
       else
       if Data.aFilterName = 'hornet_gticlub' then
          HintText:= 'Custom "Konami" Voodoo compilation using drivers:'+#13#10+
                     'hornet.c, gticlub.c'
       else
       if Data.aFilterName = 'konami_oldschool1' then
          HintText:= 'Custom "Konami" compilation using drivers:'+#13#10+
                     'tmnt.c, simpsons.c, moo.c, parodius.c, xexex.c'
       else
       if Data.aFilterName = 'konami_oldschool2' then
          begin
            HintText:= 'Custom "Konami" compilation using drivers:'+#13#10+
                       'trackfld.c, gyruss.c, hyperspt.c, yiear.c, pingpong.c,'+#13#10+
                       'gberet.c, hcastle.c, contra.c, thunderx.c, 88games.c,'+#13#10+
                       'nemesis.c, twin16.c, gradius3.c, pooyan.c'
          end
       else
       if Data.aFilterName = 'taito' then
          HintText:= 'This filter enable all sub-filters in the "Taito" category'
       else
       if Data.aFilterName = 'taito_misc' then
          HintText:= 'Multiple "Taito" systems using drivers:'+#13#10+
                     'taito_b.c, taito_h.c, taito_l.c, taito_x.c'+#13#10+
                     'taito_z.c, taitojc.c, taitosj.c'
       else
       if Data.aFilterName = 'taito_oldschool' then
          HintText:= 'Custom "Taito" compilation using drivers:'+#13#10+
                     'halleys.c, tsamurai.c, fastfred.c, superqix.c, flstory.c, '+
                     'slapfght.c'+#13#10+'tnzs.c, arkanoid.c, bublbobl.c, rainbow.c, lkage.c'
       else
       if Data.aFilterName = 'namco' then
          HintText:= 'This filter enable all sub-filters in the "Namco" category'
       else
       if Data.aFilterName = 'namcos11' then
          HintText:= 'Multiple "Namco" systems using drivers:'+#13#10+
                     'namcos10.c, namcos11.c'
       else
       if Data.aFilterName = 'namcos22' then
          HintText:= 'Multiple "Namco" systems using drivers:'+#13#10+
                     'namcos22.c, namcos23.c'
       else
       if Data.aFilterName = 'namco_misc' then
          HintText:= 'Multiple "Namco" systems using drivers:'+#13#10+
                     'namcona1.c, namconb1.c, namcond1.c, namcofl.c'
       else
       if Data.aFilterName = 'namco_oldschool' then
          HintText:= 'Custom "Namco" compilation using drivers:'+#13#10+
                     'galaga.c, mappy.c, gaplus.c, baraduke.c'+#13#10+
                     'rallyx.c, pacland.c, pacman.c, polepos.c'
       else
       if Data.aFilterName = 'atari' then
          HintText:= 'This filter enable all sub-filters in the "Atari" category'
       else
       if Data.aFilterName = 'atari_misc' then
          HintText:= 'Multiple "Atari" systems using drivers:'+#13#10+
                     'atarig1.c, atarig42.c, atarigt.c, atarigx2.c'
       else
       if Data.aFilterName = 'atari_oldschool' then
          HintText:= 'Custom "Atari" compilation using drivers:'+#13#10+
                     'centiped.c, ccastles.c, irobot.c, missile.c, arcadecl.c, badlands.c, '+
                     'blstroid.c'+#13#10+'gauntlet.c, harddriv.c, klax.c, atetris.c, toobin.c, xybots.c'
       else
       if Data.aFilterName = 'nintendo' then
          HintText:= 'This filter enable all sub-filters in the "Nintendo" category'
       else
       if Data.aFilterName = 'nintendo_oldschool' then
          HintText:= 'Custom "Nintendo" compilation using drivers:'+#13#10+
                     'dkong.c, popeye.c, punchout.c, mario.c';
}

procedure TFormArcadeGamesFilter.FormActivate(Sender: TObject);
begin
  if Tag = 1 then
     Exit;
  Screen.Cursor:= crHourGlass;
  case MountFiltersList of
    True: Tag:= 1;
    False:
      begin
        Screen.Cursor:= crDefault;
        ButtonCancel.Click;
        PostMessage(Handle, wm_Close, 0, 0);
      end;
  end;
  Screen.Cursor:= crDefault;
end;

procedure TFormArcadeGamesFilter.FiltersListViewGroupClick(
  Sender: TCustomEasyListview; Group: TEasyGroup;
  KeyStates: TCommonKeyStates; HitTest: TEasyGroupHitTestInfoSet);
begin
  Group.Expanded:= not Group.Expanded;
end;

procedure TFormArcadeGamesFilter.FiltersListViewItemDblClick(
  Sender: TCustomEasyListview; Button: TCommonMouseButton;
  MousePos: TPoint; HitInfo: TEasyHitInfoItem);
begin
  if Button = cmbLeft then
     ButtonOk.Click;
end;

procedure TFormArcadeGamesFilter.ButtonGoToCurrentFilterClick(
  Sender: TObject);
begin
  FormMain.ELV_SelectItem(FiltersListView, 0, FormMain.SelectedFilterName, Ord(FormMain.SelectedFilterName <> ''));
  FiltersListView.SetFocus;
end;

end.
