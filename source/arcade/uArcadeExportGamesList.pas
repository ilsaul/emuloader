unit uArcadeExportGamesList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PanelEx, AdvOfficeButtons, MPCommonObjects,
  EasyListview, AdvGroupBox, IniFiles, ShadowLabel, ButtonsEx;

type
  TFormArcadeExportGamesList = class(TForm)
    BottomBar: TPanelEx;
    ButtonApplyAndExit: TBitBtnEx;
    ButtonCancel: TBitBtnEx;
    GroupExportOptionsAllGames: TAdvGroupBoxEx;
    ExportOption_ArcadeGames: TAdvOfficeCheckBoxEx;
    ExportOption_NonArcadeMAMEMachines: TAdvOfficeCheckBoxEx;
    LabelExportOption_MAMESoftwareListGames: TShadowLabel;
    ExportOption_MAMESoftwareListGames: TAdvOfficeCheckBoxEx;
    ExportOption_MAME: TAdvOfficeCheckBoxEx;
    ExportOption_Supermodel3: TAdvOfficeCheckBoxEx;
    ExportOption_Daphne: TAdvOfficeCheckBoxEx;
    ExportOption_Demul: TAdvOfficeCheckBoxEx;
    ExportOption_HBMAME: TAdvOfficeCheckBoxEx;
    ExportOption_DICE: TAdvOfficeCheckBoxEx;
    ExportOption_SegaModel2: TAdvOfficeCheckBoxEx;
    ExportOption_ZiNc: TAdvOfficeCheckBoxEx;
    GroupMAMEContentManagerPlus: TAdvGroupBoxEx;
    MCMPlus_MAME: TAdvOfficeCheckBoxEx;
    MCMPlus_HBMAME: TAdvOfficeCheckBoxEx;
    GroupExportOptionsGameColumnsFullFormat: TAdvGroupBoxEx;
    GameInfoListToExport: TEasyListview;
    GameInfoListToExport_MoveUp: TBitBtnEx;
    GameInfoListToExport_MoveDown: TBitBtnEx;
    GameInfoToExport_MicrosoftExcelFormat: TAdvOfficeCheckBoxEx;
    ButtonHelp_GameInfoToExport_MicrosoftExcelFormat: TBitBtnEx;
    ButtonApply: TBitBtnEx;
    ButtonHelp: TBitBtnEx;
    GameInfoListToExport_Reset: TBitBtnEx;
    GameInfoListToExport_Default: TBitBtnEx;
    GameInfoToExport_UseGamesListVisibleColumns: TAdvOfficeCheckBoxEx;
    TopBar: TPanelEx;
    LabelSelectMode: TShadowLabel;
    PanelExportList: TPanelEx;
    ExportList: TEasyListview;
    procedure FormShow(Sender: TObject);
    procedure ExportListItemPaintText(Sender: TCustomEasyListview;
      Item: TEasyItem; Position: Integer; ACanvas: TCanvas);
    procedure GameInfoListToExportItemPaintText(
      Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
      ACanvas: TCanvas);
    procedure GameInfoListToExport_MoveUpClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonApplyClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonApplyAndExitClick(Sender: TObject);
    procedure ButtonHelpClick(Sender: TObject);
    procedure ButtonHelp_GameInfoToExport_MicrosoftExcelFormatClick(
      Sender: TObject);
    procedure GameInfoListToExport_ResetClick(Sender: TObject);
    procedure GameInfoListToExport_DefaultClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ExportListItemSelectionChanged(Sender: TCustomEasyListview;
      Item: TEasyItem);
  private
    { Private declarations }
    procedure ReadSettings(LoadGameInfoColumnsOnly: Boolean = False);
    procedure WriteSettings;
    function  GenerateFile: Boolean;
  public
    { Public declarations }
  end;

var
  FormArcadeExportGamesList: TFormArcadeExportGamesList;

implementation

uses uMain, uCommon, uApplyFilterMsgBox;

{$R *.dfm}

procedure TFormArcadeExportGamesList.ReadSettings(LoadGameInfoColumnsOnly: Boolean = False);
var
  IniFile: TMemIniFile;
  Loop, Count, IntValue: Integer;
  TempStr: String;
  Item: TEasyItem;
  GameInfoArray: array of Integer;
begin
  if not FileExists(FormMain.GetFrontendExtraIniFile) then
     Exit;
  try
    IniFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);
    if IniFile.SectionExists('ExportArcadeGames') then
    begin
      if not LoadGameInfoColumnsOnly then
      begin
        ExportOption_ArcadeGames.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'ExportAllGamesOption_ArcadeGames', 1));
        ExportOption_NonArcadeMAMEMachines.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'ExportAllGamesOption_NonArcadeMAMEMachines', 1));
        ExportOption_MAMESoftwareListGames.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'ExportAllGamesOption_MAMESoftwareListGames', 1));
        ExportOption_MAME.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'ExportAllGamesOption_MAME', 1));
        ExportOption_Supermodel3.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'ExportAllGamesOption_Supermodel3', 1));
        ExportOption_Daphne.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'ExportAllGamesOption_Daphne', 1));
        ExportOption_Demul.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'ExportAllGamesOption_Demul', 1));
        ExportOption_HBMAME.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'ExportAllGamesOption_HBMAME', 1));
        ExportOption_DICE.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'ExportAllGamesOption_DICE', 1));
        ExportOption_SegaModel2.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'ExportAllGamesOption_SegaModel2', 1));
        ExportOption_ZiNc.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'ExportAllGamesOption_ZiNc', 1));

        MCMPlus_MAME.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'MCMPlus_MAME', 1));
        MCMPlus_HBMAME.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'MCMPlus_HBMAME', 1));

        GameInfoToExport_UseGamesListVisibleColumns.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'GameInfoToExport_UseGamesListVisibleColumns', 0));
        GameInfoToExport_MicrosoftExcelFormat.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'GameInfoToExport_MicrosoftExcelFormat', 1));
      end;

      Count:= GameInfoListToExport.Groups.ItemCount;
      SetLength(GameInfoArray, Count+1);
      Item:= GameInfoListToExport.Groups.FirstItem;
      repeat
        GameInfoArray[Item.Index+1]:= Item.StateImageIndex;
        Item:= GameInfoListToExport.Groups.NextItem(Item);
      until Item = nil;

      GameInfoListToExport.BeginUpdate;
      GameInfoListToExport.Groups.ReIndexDisable:= True;

      FormMain.ClearListView(GameInfoListToExport);
      for Loop:=1 to Count do
      begin
        if Loop < 10 then
           TempStr:= '0'
        else
           TempStr:= '';

        IntValue:= IniFile.ReadInteger('ExportArcadeGames', 'GameInfoToExport_Item'+TempStr+IntToStr(Loop), GameInfoArray[Loop]);

        Item:= GameInfoListToExport.Items.Add;
        Item.StateImageIndex:= IntValue;
        case IntValue of
          -1: Item.Caption:= 'System Name';
          03: Item.Caption:= 'Screen Orientation';
          06: Item.Caption:= 'Category';
          11: Item.Caption:= 'Number of Players';
          else
              Item.Caption:= aColumns[IntValue, 1];
        end;

        Item.Checked:= Boolean(IniFile.ReadInteger('ExportArcadeGames', 'GameInfoToExport_CheckedItem'+TempStr+IntToStr(Loop), 1));
      end;

      GameInfoListToExport.Groups.ReIndexDisable:= False;
      GameInfoListToExport.EndUpdate;
      SetLength(GameInfoArray, 0);
    end;
  finally
    FreeAndNil(IniFile);
  end;
end;

procedure TFormArcadeExportGamesList.WriteSettings;
var
  IniFile: TMemIniFile;
  Item: TEasyItem;
  TempStr: String;
begin
  if FormMain.CheckReadOnly(FormMain.GetFrontendExtraIniFile) then
     Exit;

  try
    IniFile:= TMemIniFile.Create(FormMain.GetFrontendExtraIniFile);

    IniFile.WriteInteger('ExportArcadeGames', 'ExportAllGamesOption_ArcadeGames', Ord(ExportOption_ArcadeGames.Checked));

    IniFile.WriteInteger('ExportArcadeGames', 'ExportAllGamesOption_NonArcadeMAMEMachines', Ord(ExportOption_NonArcadeMAMEMachines.Checked));
    IniFile.WriteInteger('ExportArcadeGames', 'ExportAllGamesOption_MAMESoftwareListGames', Ord(ExportOption_MAMESoftwareListGames.Checked));
    IniFile.WriteInteger('ExportArcadeGames', 'ExportAllGamesOption_MAME', Ord(ExportOption_MAME.Checked));
    IniFile.WriteInteger('ExportArcadeGames', 'ExportAllGamesOption_Supermodel3', Ord(ExportOption_Supermodel3.Checked));
    IniFile.WriteInteger('ExportArcadeGames', 'ExportAllGamesOption_Daphne', Ord(ExportOption_Daphne.Checked));
    IniFile.WriteInteger('ExportArcadeGames', 'ExportAllGamesOption_Demul', Ord(ExportOption_Demul.Checked));
    IniFile.WriteInteger('ExportArcadeGames', 'ExportAllGamesOption_HBMAME', Ord(ExportOption_HBMAME.Checked));
    IniFile.WriteInteger('ExportArcadeGames', 'ExportAllGamesOption_DICE', Ord(ExportOption_DICE.Checked));
    IniFile.WriteInteger('ExportArcadeGames', 'ExportAllGamesOption_SegaModel2', Ord(ExportOption_SegaModel2.Checked));
    IniFile.WriteInteger('ExportArcadeGames', 'ExportAllGamesOption_ZiNc', Ord(ExportOption_ZiNc.Checked));

    IniFile.WriteInteger('ExportArcadeGames', 'MCMPlus_MAME', Ord(MCMPlus_MAME.Checked));
    IniFile.WriteInteger('ExportArcadeGames', 'MCMPlus_HBMAME', Ord(MCMPlus_HBMAME.Checked));

    Item:= GameInfoListToExport.Groups.FirstItem;
    repeat
      TempStr:= IntToStr(Item.Index+1);
      if Item.Index+1 in [1..9] then
         TempStr:= '0'+TempStr;

      IniFile.WriteInteger('ExportArcadeGames', 'GameInfoToExport_Item'+TempStr, Item.StateImageIndex);
      IniFile.WriteInteger('ExportArcadeGames', 'GameInfoToExport_CheckedItem'+TempStr, Ord(Item.Checked));

      Item:= GameInfoListToExport.Groups.NextItem(Item);
    until Item = nil;

    IniFile.WriteInteger('ExportArcadeGames', 'GameInfoToExport_UseGamesListVisibleColumns', Ord(GameInfoToExport_UseGamesListVisibleColumns.Checked));
    IniFile.WriteInteger('ExportArcadeGames', 'GameInfoToExport_MicrosoftExcelFormat', Ord(GameInfoToExport_MicrosoftExcelFormat.Checked));
  finally
    IniFile.UpdateFile;
    FreeAndNil(IniFile);
  end;
end;

function TFormArcadeExportGamesList.GenerateFile: Boolean;
var
  ExportGames: THashedStringList;
  Item: TEasyItem;
  Group: TEasyGroup;
  FileStr, FullGameInfoStr: String;
  SelIndex: Integer;

  function ValidateGameFilter: Boolean;
  begin
    // export all games filters
    Result:= True;
    case FormMain.TempGameVars.eSystemID of
      idMAME      : Result:= ExportOption_MAME.Checked;
      idSupermodel: Result:= ExportOption_Supermodel3.Checked;
      idDaphne    : Result:= ExportOption_Daphne.Checked;
      idDemul     : Result:= ExportOption_Demul.Checked;
      idHBMAME    : Result:= ExportOption_HBMAME.Checked;
      idDICE      : Result:= ExportOption_DICE.Checked;
      idSegaModel2: Result:= ExportOption_SegaModel2.Checked;
      idZiNc      : Result:= ExportOption_ZiNc.Checked;
    end;
    if not Result then
       Exit;

    case FormMain.TempGameVars.eSystemType of
      0: Result:= ExportOption_ArcadeGames.Checked; // arcade games
      1: Result:= ExportOption_NonArcadeMAMEMachines.Checked; // non-arcade machines (MAME only)
    end;
    if not Result then
       Exit;

    if FormMain.TempGameVars.eSoftwareName <> '' then
       Result:= ExportOption_MAMESoftwareListGames.Checked;
  end;

  function MountExcelFormatStr(const InfoStr: WideString): String;
  begin
    Result:= '';
    if GameInfoToExport_MicrosoftExcelFormat.Checked then
       begin
         if FullGameInfoStr <> '' then
            FullGameInfoStr:= FullGameInfoStr+',';

         if InfoStr <> '' then
            FullGameInfoStr:= FullGameInfoStr+'"'+FormMain.EncodeUnicodeStr(InfoStr)+'"'
         else
            FullGameInfoStr:= FullGameInfoStr+'""';
       end
    else
       begin
         if InfoStr <> '' then
            begin
              if FullGameInfoStr <> '' then
                 FullGameInfoStr:= FullGameInfoStr+' - ';
              FullGameInfoStr:= FullGameInfoStr+FormMain.EncodeUnicodeStr(InfoStr);
            end;
       end;
  end;

  function AddGameToList(IsGameEntry: Boolean = True): Boolean;
  var
    ItemFullFormat: TEasyItem;
    ColumnItemFullFormat: TEasyColumn;
  begin
    Result:= True;
    if IsGameEntry then
       FormMain.FillTempGameInfo(Item);
    case SelIndex of
      0, 1, 4: // full format
        begin
          // all games (full format)
          // visible games only (full format)
          // selected games (full format)
          if ((SelIndex = 0) and ValidateGameFilter and IsGameEntry) or ((SelIndex = 0) and (not IsGameEntry)) or (SelIndex <> 0) then
          begin
            FullGameInfoStr:= '';
            if GameInfoToExport_UseGamesListVisibleColumns.Checked then
            begin
              ColumnItemFullFormat:= FormMain.GamesListView.Header.Columns.FirstVisible;
              repeat
                if ColumnItemFullFormat.Index in [0, 1, 2, 3, 6, 8, 9, 11, 22] then
                begin
                  if IsGameEntry then
                  begin
                    case ColumnItemFullFormat.Index of
                      00: MountExcelFormatStr(FormMain.TempGameVars.eTitle);
                      01: MountExcelFormatStr(FormMain.TempGameVars.eYear);
                      02: MountExcelFormatStr(FormMain.TempGameVars.eManufacturer);
                      03: MountExcelFormatStr(aOrientation[FormMain.TempGameVars.eScreenOrientation]);
                      06: MountExcelFormatStr(FormMain.TempGameVars.eCategory); // category / software name title
                      08: MountExcelFormatStr(FormMain.TempGameVars.eName);
                      09: MountExcelFormatStr(FormMain.TempGameVars.eClone);
                      11:
                        begin
                          if FormMain.TempGameVars.eNumberPlayersIni <> '' then
                             MountExcelFormatstr(FormMain.TempGameVars.eNumberPlayersIni)
                          else
                             MountExcelFormatstr(FormMain.TempGameVars.eNumberPlayers);
                        end;
                      22:
                        begin
                          if ExportOption_MAMESoftwareListGames.Checked then
                             MountExcelFormatstr(FormMain.TempGameVars.eSoftwareName);
                        end;
                    end;
                  end
                  else
                  begin
                    // add column titles as the top of the file!!!!
                    case ColumnItemFullFormat.Index of
                      00, 01, 02, 06, 08, 09: MountExcelFormatStr(ColumnItemFullFormat.Caption);
                      03: MountExcelFormatStr('Screen');
                      11: MountExcelFormatStr('Players');
                      22:
                        begin
                          if ExportOption_MAMESoftwareListGames.Checked then
                             MountExcelFormatStr(ColumnItemFullFormat.Caption);
                        end;
                    end;
                  end;
                end;
                ColumnItemFullFormat:= FormMain.GamesListView.Header.Columns.NextVisible(ColumnItemFullFormat);
              until ColumnItemFullFormat = nil;
            end
            else
            begin
              ItemFullFormat:= GameInfoListToExport.Groups.FirstItem;
              repeat
                // software name title is the same as "category" column
                // first I need to add the column titles... it must be the very first entry in the .txt file!!!!
                if ItemFullFormat.Checked then
                begin
                  if IsGameEntry then
                  begin
                    //case ItemFullFormat.Tag of
                    case ItemFullFormat.StateImageIndex of
                      -1: MountExcelFormatStr(FormMain.GetArcadeSystemIniSection(FormMain.TempGameVars.eSystemID)); // system name
                      00: MountExcelFormatStr(FormMain.TempGameVars.eTitle);
                      01: MountExcelFormatStr(FormMain.TempGameVars.eYear);
                      02: MountExcelFormatStr(FormMain.TempGameVars.eManufacturer);
                      03: MountExcelFormatStr(aOrientation[FormMain.TempGameVars.eScreenOrientation]);
                      06: MountExcelFormatStr(FormMain.TempGameVars.eCategory); // category / software name title
                      08: MountExcelFormatStr(FormMain.TempGameVars.eName);
                      09: MountExcelFormatStr(FormMain.TempGameVars.eClone);
                      //10: MountExcelFormatStr(FormMain.TempGameVars.eDriverName);
                      11:
                        begin
                          if FormMain.TempGameVars.eNumberPlayersIni <> '' then
                             MountExcelFormatstr(FormMain.TempGameVars.eNumberPlayersIni)
                          else
                             MountExcelFormatstr(FormMain.TempGameVars.eNumberPlayers);
                        end;
                      22:
                        begin
                          if ExportOption_MAMESoftwareListGames.Checked then
                             MountExcelFormatstr(FormMain.TempGameVars.eSoftwareName);
                        end;
                    end;
                  end
                  else
                  begin
                    // add column titles as the top of the file!!!!
                    case ItemFullFormat.StateImageIndex of
                      -1: MountExcelFormatstr('System'); // system name
                      00, 01, 02, 06, 08, 09 {,10}: MountExcelFormatStr(ItemFullFormat.Caption);
                      22:
                        begin
                          if ExportOption_MAMESoftwareListGames.Checked then
                             MountExcelFormatStr(ItemFullFormat.Caption);
                        end;
                      03: MountExcelFormatStr('Screen');
                      11: MountExcelFormatStr('Players');
                    end;
                  end;
                end;
                ItemFullFormat:= GameInfoListToExport.Groups.NextItem(ItemFullFormat);
              until ItemFullFormat = nil;
            end;
            if IsGameEntry then
               ExportGames.Add(FullGameInfoStr)
            else
               ExportGames.Insert(0, FullGameInfoStr);
               // this line doesn't work... it adds crap the the beginning of the file; do not remove it, it reminds me of this mistake!
               //ExportGames.Insert(0, Char($EF)+Char($BB)+Char($BF)+FullGameInfoStr); // this will save the file as UTF-8 format :-)) -> Char($EF)+Char($BB)+Char($BF)
          end;
        end;
      2, 3, 5: // short format
        begin
          // all games (gamename=system name)
          // visible games only (gamename=system name)
          // selected games (gamename=system name)
          if ((SelIndex = 2) and ValidateGameFilter) or (SelIndex <> 2) then
             begin
               FullGameInfoStr:= FormMain.GetPlayedGamesNameEntry(FormMain.TempGameVars.eName, FormMain.TempGameVars.eSoftwareName)+
                                 '='+FormMain.GetArcadeSystemIniSection(FormMain.TempGameVars.eSystemID, True);
               ExportGames.Add(FullGameInfoStr);
             end;
        end;
      6, 7, 8: // MCM Plus compatible list (game name only)
        begin
          // there is no support for software list games, only arcade/non-arcade machines listed in -listxml output!!!
          if FormMain.IsMAMEBasedSys(FormMain.TempGameVars.eSystemID) and (FormMain.TempGameVars.eSoftwareName = '') then
             begin
               if (FormMain.TempGameVars.eSystemID = idMAME) and (MCMPlus_MAME.Checked) then
                  ExportGames.Add(FormMain.TempGameVars.eName);
               if (FormMain.TempGameVars.eSystemID = idHBMAME) and (MCMPlus_HBMAME.Checked) then
                  ExportGames.Add(FormMain.TempGameVars.eName);
             end;
        end;
    end;
  end;
begin
  //      full format
  // 0 -> export all games
  // 1 -> export visible games
  // 4 -> export selected games

  //      short format
  // 2 -> export all games
  // 3 -> export visible games
  // 5 -> export selected games

  //      MAME Content Manager Plus format
  // 6 -> export all games
  // 7 -> export visible games
  // 8 -> export selected games

  Result:= FormMain.CheckSelected(ExportList);
  if not Result then
     Exit;

  FormMain.ShowFilterMsgBox(FormMain.MenuExportGamesListTextFile.Caption, 'Parsing games list to generate file, please wait...', True);
  
  FormMain.ClearMemGameInfo(FormMain.TempGameVars); // make sure vars reset to default value... just in case

  ExportGames:= THashedStringList.Create;
  ExportGames.BeginUpdate;

  SelIndex:= ExportList.Selection.First.ImageIndex;
  if FormMain.IsGroupedView then
  begin
    Group:= FormMain.GamesListView.Groups.FirstGroup;
    repeat
      Item:= FormMain.GamesListView.Groups.FirstInGroup(Group);
      repeat
        if not uMain.TEasyGameInfo(Item).eIsCustomGame then
          begin
            case SelIndex of
              0, 2, 6: AddGameToList; // all games (full format) ; all games (gamename=system format)
              1, 3, 7:
                begin
                  // visible games only (full format); visible games only (gamename=system format)
                  if Item.Visible then
                     AddGameToList;
                end;
              4, 5, 8: // selected games (full format); selected games (gamename=system format)
                begin
                  if Item.Selected then
                     AddGameToList;
                end;
            end;
          end;
        Item:= FormMain.GamesListView.Groups.NextInGroup(Group, Item);
      until Item = nil;
      Group:= FormMain.GamesListView.Groups.NextGroup(Group);
    until Group = nil;
  end
  else
  begin
    Item:= FormMain.GamesListView.Groups.FirstItem;
    repeat
      if not uMain.TEasyGameInfo(Item).eIsCustomGame then
        begin
          case SelIndex of
            0, 2, 6: AddGameToList; // all games (full format) ; all games (gamename=system format)
            1, 3, 7:
              begin
                // visible games only (full format); visible games only (gamename=system format)
                if Item.Visible then
                   AddGameToList;
              end;
            4, 5, 8: // selected games (full format); selected games (gamename=system format)
              begin
                if Item.Selected then
                   AddGameToList;
              end;
          end;
        end;
      Item:= FormMain.GamesListView.Groups.NextItem(Item);
    until Item = nil;
  end;

  //ExportGames.Sort;
  ExportGames.EndUpdate;
  FormMain.ClearMemGameInfo(FormMain.TempGameVars);
  FormMain.HideFilterMsgBox;
  if ExportGames.Count > 0 then
     begin
       if SelIndex in [0, 1, 4] then
          AddGameToList(False); // add the column titles entry at the top of the file

       FileStr:= FormMain.DialogSaveFile(4, 'Save Games List To a File');
       if FileStr <> '' then
          ExportGames.SaveToFile(FileStr);

     end;
  FreeAndNil(ExportGames);
  FormMain.ClearMemGameInfo(FormMain.TempGameVars);
  SetCurrentDir(FormMain.FrontendPath);
end;

procedure TFormArcadeExportGamesList.FormShow(Sender: TObject);
begin
  FormMain.ELV_ResetNormalColors(ExportList);
  FormMain.ELV_ResetNormalColors(GameInfoListToExport);

  if IsNightMode then
     begin
       SetFormColors(FormArcadeExportGamesList, TopBar, BottomBar, LabelSelectMode, nil, nil, -1, True);

       SetPanelBorderColors(PanelExportList, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk);

       FormMain.SetEasyListViewColors(ExportList, FormArcadeExportGamesList.Color, clWhite, clrLightRed, clGray);
       FormMain.SetEasyListViewHeaderColors(ExportList, True);

       SetGroupBoxBorderStyle(GroupMAMEContentManagerPlus);
       SetGroupBoxColors(GroupMAMEContentManagerPlus, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk, item_caption_active_color[1], item_caption_active_shadow_color[1], -1, clrMedDarkGray, False);

       SetCheckBoxColors(MCMPlus_MAME, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(MCMPlus_HBMAME, item_caption_active_color[1], item_caption_active_shadow_color[1], False);

       SetGroupBoxBorderStyle(GroupExportOptionsAllGames);
       SetGroupBoxColors(GroupExportOptionsAllGames, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk, item_caption_active_color[1], item_caption_active_shadow_color[1], -1, clrMedDarkGray, False);

       SetCheckBoxColors(ExportOption_ArcadeGames, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(ExportOption_NonArcadeMAMEMachines, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(ExportOption_MAMESoftwareListGames, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(ExportOption_MAME, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(ExportOption_Supermodel3, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(ExportOption_Daphne, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(ExportOption_Demul, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(ExportOption_HBMAME, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(ExportOption_DICE, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(ExportOption_SegaModel2, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(ExportOption_ZiNc, item_caption_active_color[1], item_caption_active_shadow_color[1], False);

       SetGroupBoxBorderStyle(GroupExportOptionsGameColumnsFullFormat);
       SetGroupBoxColors(GroupExportOptionsGameColumnsFullFormat, clrBorderGroupBoxGrayBk, clrInnerBorderGroupBoxGrayBk, item_caption_active_color[1], item_caption_active_shadow_color[1], -1, clrMedDarkGray, False);

       FormMain.SetEasyListViewColors(GameInfoListToExport, FormArcadeExportGamesList.Color, item_caption_active_color[1]{clWhite}, clRed);
       FormMain.SetEasyListViewHeaderColors(GameInfoListToExport, True);

       SetCheckBoxColors(GameInfoToExport_UseGamesListVisibleColumns, item_caption_active_color[1], item_caption_active_shadow_color[1], False);
       SetCheckBoxColors(GameInfoToExport_MicrosoftExcelFormat, item_caption_active_color[1], item_caption_active_shadow_color[1], False);

       FormMain.ELV_SetNightModeColors(ExportList);
       FormMain.ELV_SetNightModeColors(GameInfoListToExport);

       FormMain.SetButtonExColors(ButtonApplyAndExit);
       FormMain.SetButtonExColors(ButtonApply);
       FormMain.SetButtonExColors(ButtonCancel);
       FormMain.SetButtonExColors(ButtonHelp);
       FormMain.SetButtonExColors(GameInfoListToExport_MoveUp);
       FormMain.SetButtonExColors(GameInfoListToExport_MoveDown);
       FormMain.SetButtonExColors(GameInfoListToExport_Reset);
       FormMain.SetButtonExColors(GameInfoListToExport_Default);
       FormMain.SetButtonExColors(ButtonHelp_GameInfoToExport_MicrosoftExcelFormat);
     end;

  ReadSettings;
  ExportList.SetFocus;
  ExportList.Groups.FirstItem.Selected:= True;
  ExportList.Selection.FocusedItem:= ExportList.Selection.First;
end;

procedure TFormArcadeExportGamesList.ExportListItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if Item.Selected then
     ACanvas.Font.Style:= [fsBold];
end;

procedure TFormArcadeExportGamesList.GameInfoListToExportItemPaintText(
  Sender: TCustomEasyListview; Item: TEasyItem; Position: Integer;
  ACanvas: TCanvas);
begin
  if not Item.Checked then
     ACanvas.Font.Color:= clGray;
end;

procedure TFormArcadeExportGamesList.GameInfoListToExport_MoveUpClick(Sender: TObject);
begin
  FormMain.ELV_MoveItem(GameInfoListToExport, Boolean(TBitBtn(Sender).Tag));
end;

procedure TFormArcadeExportGamesList.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
     WriteSettings;
end;

procedure TFormArcadeExportGamesList.ButtonApplyClick(Sender: TObject);
begin
  GenerateFile;
end;

procedure TFormArcadeExportGamesList.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormArcadeExportGamesList.ButtonApplyAndExitClick(Sender: TObject);
begin
  if GenerateFile then
     Close;
end;

procedure TFormArcadeExportGamesList.ButtonHelpClick(Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    Use this feature to create a ');
  FormMain.AddMsgText('.txt', clBlack, [fsBold]);
  FormMain.AddMsgText(' file of the current games list. There are three output formats to choose from:'+#13#10+#13#10);
  FormMain.AddMsgText('  Full Format', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': this mode is suitable to use with an external app like a file viewer or Microsoft Excel.'+#13#10);
  FormMain.AddMsgText('Game Info to Export', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' settings are only used in this output format. You can change what game info will be inluded, '+
                      'their order and visibility. Optionally, you can create the .txt file in a format that can be imported in ');
  FormMain.AddMsgText('Excel', clBlack, [fsItalic]);
  FormMain.AddMsgText(' by checking the ');
  FormMain.AddMsgText('Microsoft Excel Format', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' option.'+#13#10+#13#10);

  FormMain.AddMsgText('  Short Format', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': this output mode can be used to quickly create favorites profiles for MAME and arcade systems, or for another reason.'+#13#10+#13#10);

  FormMain.AddMsgText('  MAME Content Manager Plus', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': use this mode if you want to create a .txt file compatible with ');
  FormMain.AddMsgText('MCM+', clBlack, [fsItalic]);
  FormMain.AddMsgText(' application. Only MAME and HBMAME games will be added even if you have other systems selected.'+#13#10+#13#10+
                      '    Each output more have three options to choose:'+#13#10+#13#10);

  FormMain.AddMsgText('  Export All Games', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': this option will export all visible/invisible games in main games list.'+#13#10+
                      'You can customize what systems will be inluded in the ');
  FormMain.AddMsgText('Export All Games', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' options panel.'+#13#10+#13#10);

  FormMain.AddMsgText('  Export Visible Games', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': use this one to export only visible games in main games list. First, change the main games filters the way you like. ');
  FormMain.AddMsgText('Game Info to Export', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' settings are applied to the list.'+#13#10+#13#10);

  FormMain.AddMsgText('  Export Selected Games', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(': You can export only the games you manually selected in main games list. ');
  FormMain.AddMsgText('Game Info to Export', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' settings are applied to the list.'+#13#10+#13#10+
                      '    All settings are saved in ');
  FormMain.AddMsgText(FormMain.GetFrontendExtraIniFile, MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' file and are restored later so you won''t have to customize this feature all over again.');

  GenerateMessage('Help', 'How to watch game video previews.');
end;

procedure TFormArcadeExportGamesList.ButtonHelp_GameInfoToExport_MicrosoftExcelFormatClick(
  Sender: TObject);
begin
  CallMessageBox;
  FormMain.AddMsgText('    You can use this setting to create a games list compatible with the ');
  FormMain.AddMsgText('Import', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' feature in ');
  FormMain.AddMsgText('Microsoft Excel', clBlack, [fsBold]);
  FormMain.AddMsgText('.'+#13#10+#13#10+'Make sure you select the following parameters in Excel:'+#13#10);
  FormMain.AddMsgText('1.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' Select ');
  FormMain.AddMsgText('Comma', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' as ');
  FormMain.AddMsgText('delimiter', clBlack, [fsBold]);
  FormMain.AddMsgText(#13#10+'2.', MsgTxtColors.colorWarning, [fsBold]);
  FormMain.AddMsgText(' Select ');
  FormMain.AddMsgText('Double Quote', MsgTxtColors.colorFileName, [fsBold]);
  FormMain.AddMsgText(' as ');
  FormMain.AddMsgText(' text qualifier', clBlack, [fsBold]);
  FormMain.AddMsgText(#13#10+#13#10+'  Double quotes for each game info is required because you can have the comma char in a text or a number. '+
                      'Here''s a sample of the output:'+#13#10+#13#10);
  FormMain.AddMsgText('"Title","Year","Game Name","Manufacturer"'+#13#10+
                      '"Ragnagard / Shin-Oh-Ken","1996","ragnagrd","Saurus"'+#13#10+
                      '"Raiden (Rev. A)","1994","raiden","Atari"', clBlack, [], taLeftJustify, -1, 'Consolas');

  GenerateMessage('Help', 'Microsoft Excel Format.');
end;

procedure TFormArcadeExportGamesList.GameInfoListToExport_ResetClick(Sender: TObject);
begin
  ReadSettings(True);
end;

procedure TFormArcadeExportGamesList.GameInfoListToExport_DefaultClick(Sender: TObject);
var
  Item: TEasyItem;

  function AddItem_ELV(Index: Integer): Boolean;
  begin
    Result:= True;
    Item:= GameInfoListToExport.Items.Add;
    Item.StateImageIndex:= Index;
    case Index of
      -1: Item.Caption:= 'System Name';
      03: Item.Caption:= 'Screen Orientation';
      06: Item.Caption:= 'Category';
      11: Item.Caption:= 'Number of Players';
      else
          Item.Caption:= aColumns[Index, 1];
    end;
    Item.Checked:= True;
  end;

begin
  GameInfoListToExport.BeginUpdate;
  GameInfoListToExport.Groups.ReIndexDisable:= True;

  FormMain.ClearListView(GameInfoListToExport);
  AddItem_ELV(-1); // system name
  AddItem_ELV(0);  // title
  AddItem_ELV(1);  // year
  AddItem_ELV(2);  // manufacturer
  AddItem_ELV(8);  // game name
  AddItem_ELV(9);  // clone of
  AddItem_ELV(22); // MAME software name
  AddItem_ELV(3);  // screen orientation
  AddItem_ELV(11); // number of players
  AddItem_ELV(6);  // category / MAME software title

  GameInfoListToExport.Groups.ReIndexDisable:= False;
  GameInfoListToExport.EndUpdate;

end;

procedure TFormArcadeExportGamesList.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     Close;
end;

procedure TFormArcadeExportGamesList.ExportListItemSelectionChanged(
  Sender: TCustomEasyListview; Item: TEasyItem);
var
  InfoToExportEnabled: Boolean;
begin
  if Item.Selected then
     begin
       InfoToExportEnabled:= Item.ImageIndex in [0, 1, 4];
       if GroupExportOptionsGameColumnsFullFormat.Visible <> InfoToExportEnabled then
          GroupExportOptionsGameColumnsFullFormat.Visible:= InfoToExportEnabled;
     end;
end;

end.
