unit uCustomGameCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, IniFiles;

type
  TFormCustomGameCategory = class(TForm)
    PageControlCustomCommandLine: TPageControl;
    TabSheetCustomCommandLine: TTabSheet;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    GameIcon: TImage;
    LabelGameDescription: TLabel;
    ButtonClearNewCategory: TButton;
    LabelDefaultCategories: TGroupBox;
    ButtonOriginalCategory: TButton;
    DefaultCategoriesList: TComboBox;
    LabelCustomCategories: TGroupBox;
    NewCategory: TEdit;
    CustomCategoriesList: TComboBox;
    procedure ButtonClearNewCategoryClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure NewCategoryChange(Sender: TObject);
    procedure ButtonOriginalCategoryClick(Sender: TObject);
    procedure CustomCategoriesListChange(Sender: TObject);
    procedure DefaultCategoriesListChange(Sender: TObject);
  private
    { Private declarations }
    procedure CheckBlankFields;
  public
    GameName: String[12];
    OriginalCategory: String;
    { Public declarations }
  end;

var
  FormCustomGameCategory: TFormCustomGameCategory;

implementation

uses uMain;

{$R *.dfm}

procedure TFormCustomGameCategory.CheckBlankFields;
begin
  {ButtonOk.Enabled:= ((DefaultCategoriesList.Text <> OriginalCategory) and
                      (CustomCategoriesList.Text <> OriginalCategory) and
                      (NewCategory.Text <> OriginalCategory)) and
                     ((DefaultCategoriesList.Text = OriginalCategory) and (CustomCategoriesList.ItemIndex > 0));}


  ButtonOriginalCategory.Enabled:= ((DefaultCategoriesList.Text <> OriginalCategory) and
                                    (CustomCategoriesList.Text <> OriginalCategory) and
                                    (NewCategory.Text <> OriginalCategory));
end;

procedure TFormCustomGameCategory.ButtonClearNewCategoryClick(
  Sender: TObject);
begin
  NewCategory.Clear;
end;

procedure TFormCustomGameCategory.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCustomGameCategory.FormShow(Sender: TObject);
var
  TempList, Categories: THashedStringList;
  TempList2: TMemIniFile;
  Loop: Integer;
  CategoryDescription: String;
begin
  FormMain.UpdateGeneralAppearance(FormCustomGameCategory);
  FormMain.SetCustomGameCategoryLanguage;
  case FormMain.MenuGamesIcons.Checked of
    True : FormMain.BigGamesIconsImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
    False: FormMain.BuiltInBigListImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
  end;
  TabSheetCustomCommandLine.Caption:= Format('%s: %s', [FormMain.List.Column[FormMain.GetColumnIndex(14)].Caption, GameName]);
  LabelGameDescription.Caption:= FormMain.GamesList[FormMain.SelectedGame].eDescription;

  // Get list of categories, if file "catver.ini" is available
  case FileExists(FormMain.FrontendPath+'catver.ini') of
    True:
      begin
        TempList:= THashedStringList.Create;
        TempList2:= TMemIniFile.Create(FormMain.FrontendPath+'catver.ini');
        TempList2.ReadSectionValues('Category', TempList);
        OriginalCategory:= TempList2.ReadString('Category', GameName, '');
        FreeAndNil(TempList2);
        Categories:= THashedStringList.Create;
        Categories.BeginUpdate;
        for Loop:=0 to TempList.Count-1 do
        begin
          CategoryDescription:= TempList.Values[TempList.Names[Loop]];
          if ((Categories.IndexOf(CategoryDescription) = -1) and (CategoryDescription <> '')) then
             Categories.Add(CategoryDescription);
        end;
        Categories.Sort;
        Categories.EndUpdate;
        FreeAndNil(TempList);
        DefaultCategoriesList.Items.AddStrings(Categories);
        FreeAndNil(Categories);
      end;
    False: OriginalCategory:= FormMain.GamesList[FormMain.SelectedGame].eCategory;
  end;

  // Get list of custom categories, if file "GameCategory.ini" is available
  if FileExists(FormMain.FrontendPath+'GameCategory.ini') then
     begin
       TempList:= THashedStringList.Create;
       TempList.LoadFromFile(FormMain.FrontendPath+'GameCategory.ini');
       Categories:= THashedStringList.Create;
       Categories.BeginUpdate;
       for Loop:=0 to TempList.Count -1 do
       begin
         CategoryDescription:= TempList.Values[TempList.Names[Loop]];
         if ((Categories.IndexOf(CategoryDescription) = -1) and (CategoryDescription <> '')) then
            Categories.Add(CategoryDescription);
       end;
       Categories.Sort;
       Categories.EndUpdate;
       FreeAndNil(TempList);
       CustomCategoriesList.Items.AddStrings(Categories);
       FreeAndNil(Categories);
     end;

  NewCategory.Text:= FormMain.ReadCustomGameCategory(GameName);

  if NewCategory.Text = '' then
     begin
       CustomCategoriesList.ItemIndex:= 0;
       if FormMain.GamesList[FormMain.SelectedGame].eCategory = '' then
          DefaultCategoriesList.ItemIndex:= 0
       else
          begin
            Loop:= DefaultCategoriesList.Items.IndexOf(FormMain.GamesList[FormMain.SelectedGame].eCategory);
            if Loop <> -1 then
               DefaultCategoriesList.ItemIndex:= Loop;
          end;
     end
  else
     begin
       Loop:= CustomCategoriesList.Items.IndexOf(FormMain.GamesList[FormMain.SelectedGame].eCategory);
       if Loop <> -1 then
          CustomCategoriesList.ItemIndex:= Loop
       else
          CustomCategoriesList.ItemIndex:= 1;
     end;
  CheckBlankFields;
end;

procedure TFormCustomGameCategory.ButtonOkClick(Sender: TObject);
var
  CategoryDescription: String;
begin
  case CustomCategoriesList.ItemIndex of
    0:
      begin
        if DefaultCategoriesList.ItemIndex > 0 then
           CategoryDescription:= DefaultCategoriesList.Text;
      end;
    1:
      begin
        if NewCategory.Text <> '' then
           CategoryDescription:= NewCategory.Text;
      end;
    else
      CategoryDescription:= CustomCategoriesList.Text;
  end;

  if FormMain.UpdateCustomGameCategory(GameName, CategoryDescription, OriginalCategory) then
     begin
       FormMain.List.Items.BeginUpdate;
       FormMain.GamesList[FormMain.SelectedGame].eCategory:= CategoryDescription;
       FormMain.List.Items.EndUpdate;
       FormMain.List.Invalidate;
     end;
  Close;
end;

procedure TFormCustomGameCategory.NewCategoryChange(
  Sender: TObject);
begin
  CheckBlankFields;
end;

procedure TFormCustomGameCategory.ButtonOriginalCategoryClick(
  Sender: TObject);
begin
  DefaultCategoriesList.ItemIndex:= DefaultCategoriesList.Items.IndexOf(OriginalCategory);
  DefaultCategoriesList.OnChange(Self);
  CustomCategoriesList.ItemIndex:= 0;
  CustomCategoriesList.OnChange(Self);
end;

procedure TFormCustomGameCategory.CustomCategoriesListChange(
  Sender: TObject);
begin
  NewCategory.Enabled:= (CustomCategoriesList.ItemIndex = 1);
  if CustomCategoriesList.ItemIndex = 0 then
     NewCategory.Text:= '';
  CheckBlankFields;
end;

procedure TFormCustomGameCategory.DefaultCategoriesListChange(
  Sender: TObject);
begin
  CheckBlankFields;
end;

end.
