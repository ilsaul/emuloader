unit uDOSMAMECustomConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, INIFiles, ImgList, GR32_RangeBars,
  GR32_Image, uGR32Extra;

type
  TFormDOSMAMECustomConfiguration = class(TForm)
    MAMEConfigImageList: TImageList;
    GameIcon: TImage;
    LabelGameDescription: TLabel;
    PageControlOptions: TPageControl;
    TabSheetDOSMAMEOptions: TTabSheet;
    PageControlOptions2: TPageControl;
    TabSheetDOSMAMEDisplay: TTabSheet;
    LabelResolution: TLabel;
    LabelDepth: TLabel;
    LabelVESA: TLabel;
    LabelCenterX: TLabel;
    LabelSkipColumns: TLabel;
    LabelMonitor: TLabel;
    LabelCenterY: TLabel;
    LabelSkipLines: TLabel;
    LabelGamma: TLabel;
    LabelCenterYValue: TLabel;
    LabelCenterXValue: TLabel;
    LabelSkipColumnsValue: TLabel;
    LabelSkipLinesValue: TLabel;
    LabelVGAFrequency: TLabel;
    LabelVGAFrequencyValue: TLabel;
    LabelDepthValue: TLabel;
    LabelVESAValue: TLabel;
    LabelGammaValue: TLabel;
    LabelMonitorValue: TLabel;
    LabelResolutionValue: TLabel;
    CenterX: TGaugeBar;
    SkipColumns: TGaugeBar;
    CenterY: TGaugeBar;
    SkipLines: TGaugeBar;
    VGAFrequency: TGaugeBar;
    Depth: TGaugeBar;
    Gamma: TGaugeBar2;
    Monitor: TGaugeBar;
    TabSheetDOSMAMESoundControllers: TTabSheet;
    TabSheetDOSMAMEMiscellaneous: TTabSheet;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    ReadMAMEcfg: TButton;
    LabelControllers: TGroupBox;
    LabelJoystick: TLabel;
    LabelJoystickValue: TLabel;
    Joystick: TGaugeBar;
    SteadyKey: TCheckBox;
    Mouse: TCheckBox;
    LabelSound: TGroupBox;
    LabelSoundCard: TLabel;
    LabelSoundCardValue: TLabel;
    LabelSampleRate: TLabel;
    LabelSampleRateValue: TLabel;
    LabelVolume: TLabel;
    LabelVolumeValue: TLabel;
    LabelCustomSampleRate: TLabel;
    LabelCustomSampleRateValue: TLabel;
    SoundCard: TGaugeBar;
    SampleRate: TGaugeBar;
    Volume: TGaugeBar;
    CustomSampleRate: TGaugeBar;
    Stereo: TCheckBox;
    DetectSampleRate: TCheckBox;
    Samples: TCheckBox;
    ResampleFilter: TCheckBox;
    LabelTweaks: TGroupBox;
    Tweak: TCheckBox;
    Cheat: TCheckBox;
    Shape1: TShape;
    DisplayImage: TImage32Ex;
    SoundControllersImage: TImage32Ex;
    MiscellaneousImage: TImage32Ex;
    TabSheetDOSMAMEDisplay2: TTabSheet;
    LabelVector: TGroupBox;
    LabelFlicker: TLabel;
    LabelFlickerValue: TLabel;
    LabelBeam: TLabel;
    LabelBeamValue: TLabel;
    LabelVectorResolution: TLabel;
    LabelVectorResolutionValue: TLabel;
    Antialias: TCheckBox;
    Flicker: TGaugeBar2;
    Beam: TGaugeBar2;
    Translucency: TCheckBox;
    Display2Image: TImage32Ex;
    LabelIntensity: TLabel;
    Intensity: TGaugeBar2;
    LabelIntensityValue: TLabel;
    VectorResolution: TGaugeBar;
    VESA: TGaugeBar;
    LabelCustomResolution: TLabel;
    CustomResolution: TEdit;
    Resolution: TGaugeBar;
    LabelFrameSkip: TLabel;
    FrameSkip: TGaugeBar;
    LabelFrameSkipValue: TLabel;
    WaitInterlace: TCheckBox;
    Stretch: TCheckBox;
    TripleBuffer: TCheckBox;
    WaitVSync: TCheckBox;
    NoRotate: TCheckBox;
    RotateLeft: TCheckBox;
    RotateRight: TCheckBox;
    VSync: TCheckBox;
    AlwaysSynced: TCheckBox;
    FlipX: TCheckBox;
    FlipY: TCheckBox;
    LabelScanlines: TLabel;
    Scanlines: TGaugeBar;
    LabelScanlinesValue: TLabel;
    MMX: TGaugeBar;
    LabelMMX: TLabel;
    LabelMMXValue: TLabel;
    Dirty: TGaugeBar;
    LabelDirtyValue: TLabel;
    LabelDirty: TLabel;
    DebuggerResolution: TGaugeBar;
    LabelDebuggerResolutionValue: TLabel;
    LabelDebuggerResolution: TLabel;
    Brightness: TGaugeBar2;
    LabelBrightness: TLabel;
    KeyboardLEDs: TCheckBox;
    LabelArtwork: TGroupBox;
    LabelArtworkResolution: TLabel;
    LabelArtworkResolutionValue: TLabel;
    Artwork: TCheckBox;
    Backdrop: TCheckBox;
    Overlay: TCheckBox;
    Bezel: TCheckBox;
    Crop: TCheckBox;
    ArtworkResolution: TGaugeBar;
    Throttle: TCheckBox;
    LabelBrightnessValue: TLabel;
    Sound: TCheckBox;
    PauseBrightness: TGaugeBar2;
    LabelPauseBrightnessValue: TLabel;
    LabelPauseBrightness: TLabel;
    SkipDisclaimer: TCheckBox;
    SkipGameInfo: TCheckBox;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ReadMAMEcfgClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CenterXChange(Sender: TObject);
    procedure CenterYChange(Sender: TObject);
    procedure SkipColumnsChange(Sender: TObject);
    procedure SkipLinesChange(Sender: TObject);
    procedure VolumeChange(Sender: TObject);
    procedure VGAFrequencyChange(Sender: TObject);
    procedure DepthChange(Sender: TObject);
    procedure FrameSkipChange(Sender: TObject);
    procedure VESAChange(Sender: TObject);
    procedure GammaChange(Sender: TObject);
    procedure FlickerChange(Sender: TObject);
    procedure BeamChange(Sender: TObject);
    procedure SampleRateChange(Sender: TObject);
    procedure CustomSampleRateChange(Sender: TObject);
    procedure MonitorChange(Sender: TObject);
    procedure ResolutionChange(Sender: TObject);
    procedure VectorResolutionChange(Sender: TObject);
    procedure SoundCardChange(Sender: TObject);
    procedure JoystickChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IntensityChange(Sender: TObject);
    procedure ScanlinesChange(Sender: TObject);
    procedure MMXChange(Sender: TObject);
    procedure DirtyChange(Sender: TObject);
    procedure BrightnessChange(Sender: TObject);
    procedure DebuggerResolutionChange(Sender: TObject);
    procedure ArtworkResolutionChange(Sender: TObject);
    procedure PauseBrightnessChange(Sender: TObject);
  private
    { Private declarations }
    procedure ReadGameConfigFile(CustomFile: Boolean);
    procedure UpdateGameConfigFile;
  public
    //Folders: THashedStringList;
    SaveCfg: Boolean;
    GameName: String;
    EmulatorString: String;
    { Public declarations }
  end;

var
  FormDOSMAMECustomConfiguration: TFormDOSMAMECustomConfiguration;

implementation

uses uMain;

{$R *.DFM}

// procedures---------------------------------------------------------
procedure TFormDOSMAMECustomConfiguration.ReadGameConfigFile(CustomFile: Boolean);
var
  MAMEcfg: TIniFile;
  Result, Result2: String;
begin
  ThousandSeparator:= Char(',');
  DecimalSeparator:= Char('.');
  case CustomFile of
    True:
      begin
        case FileExists(FormMain.FrontendPath+'resources\dosgamecfg\'+GameName+'.cfg') of
          True : MAMEcfg:= TIniFile.Create(FormMain.FrontendPath+'resources\dosgamecfg\'+GameName+'.cfg');
          False: MAMEcfg:= TIniFile.Create(ExtractFilePath(EmulatorString)+'mame.cfg');
        end;
      end;
    False: MAMEcfg:= TIniFile.Create(ExtractFilePath(EmulatorString)+'mame.cfg');
  end;

  with MAMEcfg do
  begin
    // Read MAME Options
    // Display Options
    if ValueExists('config', 'resolution') then
       begin
         Result:= ReadString('config', 'resolution', 'auto');
         Result2:= IntToStr(FormMain.SetResolution(Result));
         if Result2 = '-1' then
            CustomResolution.Text:= Result
         else
            Resolution.Position:= StrToInt(Result2);
       end;

    if ValueExists('config', 'depth') then
       begin
          Result:= ReadString('config', 'depth', 'auto');
           if Result = 'auto' then
              Depth.Position:= 0 else
           if Result = '8' then
              Depth.Position:= 1 else
           if Result = '15' then
              Depth.Position:= 2 else
           if Result = '16' then
              Depth.Position:= 3 else
           if Result = '24' then
              Depth.Position:= 4 else
           if Result = '32' then
              Depth.Position:= 5 else
              Depth.Position:= 0;
       end;

    if ValueExists('config', 'vesamode') then
       VESA.Position:= FormMain.SetDOSVesaMode(ReadString('config', 'vesamode', 'auto'));

    if ValueExists('config', 'centerx') then
       CenterX.Position:= ReadInteger('config', 'centerx', 0);
    if ValueExists('config', 'centery') then
       CenterY.Position:= ReadInteger('config', 'centery', 0);

    if ValueExists('config', 'skipcolumns') then
       SkipColumns.Position:=ReadInteger('config', 'skipcolumns', 0);
    if ValueExists('config', 'skiplines') then
       SkipLines.Position:=ReadInteger('config', 'skiplines', 0);

    if ValueExists('config', 'monitor') then
       begin
         Result:=ReadString('config', 'monitor', 'standard');
         if Result = 'standard' then
            Monitor.Position:= 0 else
         if Result = 'ntsc' then
            Monitor.Position:= 1 else
         if Result = 'pal' then
            Monitor.Position:= 2 else
         if Result = 'arcade' then
            Monitor.Position:= 3 else
            Monitor.Position:= 0;
       end;

    if ValueExists('config', 'frameskip') then
       begin
         Result:=ReadString('config', 'frameskip', 'auto');
           if Result = 'auto' then
              Frameskip.Position:= -1
           else
              Frameskip.Position:= StrToInt(Result);
       end;

    if ValueExists('config', 'gamma') then
       Gamma.Position:= StrToFloat(Format('%1.2f', [StrToFloat(TrimLeft(ReadString('config', 'gamma', '1.00')))]));

    if ValueExists('config', 'scanlines') then
       Scanlines.Position:= FormMain.SetDOSScanlines(ReadString('config', 'scanlines', 'yes'));
    if ValueExists('config', 'debug_resolution') then
       DebuggerResolution.Position:= FormMain.SetDOSResolution(ReadString('config', 'debug_resolution', 'auto'));
    if ValueExists('config', 'brightness') then
       Brightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(TrimLeft(ReadString('config', 'brightness', '1.00')))]));
    if ValueExists('config', 'pause_brightness') then
       PauseBrightness.Position:= StrToFloat(Format('%1.2f', [StrToFloat(TrimLeft(ReadString('config', 'pause_brightness', '0.65')))]));

    // Vector Options
    if ValueExists('config', 'antialias') then
       Antialias.Checked:= ReadString('config', 'antialias', 'yes') = 'yes';
    if ValueExists('config', 'translucency') then
       Translucency.Checked:= ReadString('config', 'translucency', 'yes') = 'yes';
    if ValueExists('config', 'vgafreq') then
       VGAFrequency.Position:= ReadInteger('config', 'vgafreq', -1);
    if ValueExists('config', 'flicker') then
       Flicker.Position:= StrToFloat(Format('%3.2f', [StrToFloat(TrimLeft(ReadString('config', 'flicker', '0.00')))]));
    if ValueExists('config', 'beam') then
       Beam.Position:= StrToFloat(Format('%2.2f', [StrToFloat(TrimLeft(ReadString('config', 'beam', '1.00')))]));
    if ValueExists('config', 'intensity') then
       Intensity.Position:= StrToFloat(Format('%1.2f', [StrToFloat(TrimLeft(ReadString('config', 'intensity', '1.50')))]));
    if ValueExists('config', 'vectorres') then
       VectorResolution.Position:= FormMain.SetResolution(ReadString('config', 'vectorres', 'auto'));

    // Sound Card Options
    if ValueExists('config', 'soundcard') then
       begin
         Result:= ReadString('config', 'soundcard', '-1');
         case StrToInt(Result) of
          -1: SoundCard.Position:= 0;
           0: SoundCard.Position:= 1;
           1: SoundCard.Position:= 2;
           3: SoundCard.Position:= 3;
           4: SoundCard.Position:= 4;
           5: SoundCard.Position:= 5;
           6: SoundCard.Position:= 6;
           7: SoundCard.Position:= 7;
          end;
       end;
    if ValueExists('config', 'sound') then
       Sound.Checked:= ReadString('config', 'sound', 'yes') = 'yes';

    if ValueExists('config', 'samplerate') then
       begin
         Result:= ReadString('config', 'samplerate', '44100');
         case StrToInt(Result) of
           11025: SampleRate.Position:= 0;
           22050: SampleRate.Position:= 1;
           44100: SampleRate.Position:= 2;
           48000: SampleRate.Position:= 3;
           else   CustomSampleRate.Position:= StrToInt(Result);
         end;
       end;

    if ValueExists('config', 'volume') then
       Volume.Position:= ReadInteger('config', 'volume', 0);
    if ValueExists('config', 'stereo') then
       Stereo.Checked:= ReadString('config', 'stereo', 'yes') = 'yes';
    if ValueExists('config', 'samples') then
       Samples.Checked:= ReadString('config', 'samples', 'yes') = 'yes';
    if ValueExists('config', 'sampleratedetect') then
       DetectSampleRate.Checked:= ReadString('config', 'sampleratedetect', 'yes') = 'yes';
    if ValueExists('config', 'resamplefilter') then
       ResampleFilter.Checked:= ReadString('config', 'resamplefilter', 'yes') = 'yes';

    // Controllers Options
    if ValueExists('config', 'joystick') then
       Joystick.Position:= FormMain.SetDOSJoystick(ReadString('config', 'joystick', 'none'));
    if ValueExists('config', 'mouse') then
       Mouse.Checked:= ReadString('config', 'mouse', 'yes') = 'yes';
    if ValueExists('config', 'keyboard_leds') then
       KeyboardLEDs.Checked:= ReadString('config', 'keyboard_leds', 'yes') = 'yes';

    // Visual Effects Options
    if ValueExists('config', 'stretch') then
       Stretch.Checked:= ReadString('config', 'stretch', 'yes') = 'yes';
    if ValueExists('config', 'vsync') then
       VSync.Checked:= ReadString('config', 'vsync', 'yes') = 'yes';
    if ValueExists('config', 'alwayssynced') then
       AlwaysSynced.Checked:= ReadString('config', 'alwayssynced', 'yes') = 'yes';
    if ValueExists('config', 'waitvsync') then
       WaitVSync.Checked:= ReadString('config', 'waitvsync', 'yes') = 'yes';
    if ValueExists('config', 'rol') then
       RotateLeft.Checked:= ReadString('config', 'rol', 'yes') = 'yes';
    if ValueExists('config', 'ror') then
       RotateRight.Checked:= ReadString('config', 'ror', 'yes') = 'yes';
    if ValueExists('config', 'norotate') then
       NoRotate.Checked:= ReadString('config', 'norotate', 'yes') = 'yes';
    if ValueExists('config', 'triplebuffer') then
       TripleBuffer.Checked:= ReadString('config', 'triplebuffer', 'yes') = 'yes';
    if ValueExists('config', 'waitinterlace') then
       WaitInterlace.Checked:= ReadString('config', 'waitinterlace', 'yes') = 'yes';

    if ValueExists('config', 'mmx') then
       begin
         Result:= ReadString('config', 'mmx', 'auto');
         if Result = 'auto' then
            MMX.Position:= -1 else
         if Result = 'yes' then
            MMX.Position:= 0 else
         if Result = 'no' then
            MMX.Position:= 1 else
            MMX.Position:= -1;
       end;

    if ValueExists('config', 'dirty') then
       begin
         Result:= ReadString('config', 'dirty', 'auto');
         if Result = 'auto' then
            Dirty.Position:= -1 else
         if Result = 'yes' then
            Dirty.Position:= 0 else
         if Result = 'no' then
            Dirty.Position:= 1 else
            Dirty.Position:= -1;
       end;

    if ValueExists('config', 'flipx') then
       FlipX.Checked:= ReadString('config', 'flipx', 'yes') = 'yes';
    if ValueExists('config', 'flipy') then
       FlipY.Checked:= ReadString('config', 'flipy', 'yes') = 'yes';

    if ValueExists('config', 'artwork') then
       Artwork.Checked:= ReadString('config', 'artwork', 'yes') = 'yes';
    if ValueExists('config', 'use_backdrops') then
       Backdrop.Checked:= ReadString('config', 'use_backdrops' ,'yes') = 'yes';
    if ValueExists('config', 'use_overlays') then
       Overlay.Checked:= ReadString('config', 'use_overlays', 'yes') = 'yes';
    if ValueExists('config', 'use_bezels') then
       Bezel.Checked:= ReadString('config', 'use_bezels', 'yes') = 'yes';
    if ValueExists('config', 'artwork_crop') then
       Crop.Checked:= ReadString('config', 'artwork_crop', 'no') = 'yes';
    if ValueExists('config', 'artwork_resolution') then
       begin
         Result:= ReadString('config', 'artwork_resolution', 'auto');
         if Result = 'auto' then
            ArtworkResolution.Position:= 0
         else
            ArtworkResolution.Position:= StrToInt(Result);
       end;

    // Tweaks Options
    if ValueExists('config', 'throttle') then
       Throttle.Checked:= ReadString('config', 'throttle', 'yes') = 'yes';
    if ValueExists('config', 'tweak') then
       Tweak.Checked:= ReadString('config', 'tweak', 'yes') = 'yes';
    if ValueExists('config', 'cheat') then
       Cheat.Checked:= ReadString('config', 'cheat', 'yes') = 'yes';
    if ValueExists('config', 'steadykey') then
       SteadyKey.Checked:= ReadString('config', 'steadykey', 'no') = 'yes';
    if ValueExists('config', 'skip_disclaimer') then
       SkipDisclaimer.Checked:= ReadString('config', 'skip_disclaimer', 'no') = 'yes';
    if ValueExists('config', 'skip_gameinfo') then
       SkipGameInfo.Checked:= ReadString('config', 'skip_gameinfo', 'no') = 'yes';

    { -ignorecfg     ignore mame.cfg and start with default options
      -debug         Activates the integrated debugger.
                       During emulation, press the Tilde key (~) to activate the
                       debugger. This is available only if the program is compiled with
                       MAME_DEBUG defined

      theese are in-line options (does not have in mame.cfg) }

    FreeAndNil(MAMEcfg);
  end;
end;

procedure TFormDOSMAMECustomConfiguration.UpdateGameConfigFile;
var
  MAMEcfg, OriginalMAMEcfg: TIniFile;
  EmptyFile: Boolean;
  CheckEmptyFile: THashedStringList;

  procedure UpdateStringValue(MAMEentry, CustomValue: String);
  var
    OriginalValue: String;
  begin
    OriginalValue:= OriginalMAMEcfg.ReadString('config', MAMEentry, '');
    if (OriginalValue <> LowerCase(CustomValue)) and (OriginalValue <> '') then
       MAMEcfg.WriteString('config', MAMEentry, LowerCase(CustomValue))
    else
    if OriginalValue = LowerCase(CustomValue) then
       MAMEcfg.DeleteKey('config', MAMEentry);
  end;

begin
  MAMEcfg:= TIniFile.Create(FormMain.FrontendPath+'resources\dosgamecfg\'+GameName+'.cfg');
  OriginalMAMEcfg:= TIniFile.Create(ExtractFilePath(EmulatorString)+'mame.cfg');
  // Write MAME Options
  // Display Options
  if CustomResolution.Text = '' then
     UpdateStringValue('resolution', LabelResolutionValue.Caption)
  else
     UpdateStringValue('resolution', CustomResolution.Text);

  case Depth.Position of
    0: UpdateStringValue('depth', 'auto');
    1: UpdateStringValue('depth', '8');
    2: UpdateStringValue('depth', '15');
    3: UpdateStringValue('depth', '16');
    4: UpdateStringValue('depth', '24');
    5: UpdateStringValue('depth', '32');
  end;

  UpdateStringValue('vesamode', LabelVESAValue.Caption);

  UpdateStringValue('centerx', IntToStr(CenterX.Position));
  UpdateStringValue('centery', IntToStr(CenterY.Position));

  UpdateStringValue('skipcolumns', IntToStr(SkipColumns.Position));
  UpdateStringValue('skiplines', IntToStr(SkipLines.Position));

  case Monitor.Position of
    0: UpdateStringValue('monitor', 'standard');
    1: UpdateStringValue('monitor', 'ntsc');
    2: UpdateStringValue('monitor', 'pal');
    3: UpdateStringValue('monitor', 'arcade');
  end;

  if Frameskip.Position = -1 then
     UpdateStringValue('frameskip', 'auto')
  else
     UpdateStringValue('frameskip', IntToStr(Frameskip.Position));

  UpdateStringValue('gamma', LabelGammaValue.Caption);

  UpdateStringValue('scanlines', LabelScanlinesValue.Caption);
  UpdateStringValue('debug_resolution', LabelDebuggerResolutionValue.Caption);
  UpdateStringValue('brightness', LabelBrightnessValue.Caption);
  UpdateStringValue('pause_brightness', LabelPauseBrightnessValue.Caption);

  // Vector Options
  case Antialias.Checked of
    True : UpdateStringValue('antialias', 'yes');
    False: UpdateStringValue('antialias', 'no');
  end;

  case Translucency.Checked of
    True : UpdateStringValue('translucency', 'yes');
    False: UpdateStringValue('translucency', 'no');
  end;

  UpdateStringValue('vgafreq', IntToStr(VGAFrequency.Position));

  UpdateStringValue('flicker', LabelFlickerValue.Caption);
  UpdateStringValue('beam', LabelBeamValue.Caption);
  UpdateStringValue('intensity', LabelIntensityValue.Caption);
  UpdateStringValue('vectorres', LabelVectorResolutionValue.Caption);

  // Sound Card Options
  case SoundCard.Position of
    0: UpdateStringValue('soundcard', '-1');
    1: UpdateStringValue('soundcard', '0');
    2: UpdateStringValue('soundcard', '1');
    3: UpdateStringValue('soundcard', '3');
    4: UpdateStringValue('soundcard', '4');
    5: UpdateStringValue('soundcard', '5');
    6: UpdateStringValue('soundcard', '6');
    7: UpdateStringValue('soundcard', '7');
  end;

  case Sound.Checked of
    True : UpdateStringValue('sound', 'yes');
    False: UpdateStringValue('sound', 'no');
  end;

  if CustomSampleRate.Position = 4999 then
     begin
       case SampleRate.Position of
         0: UpdateStringValue('samplerate', '11025');
         1: UpdateStringValue('samplerate', '22050');
         2: UpdateStringValue('samplerate', '44100');
         3: UpdateStringValue('samplerate', '48000');
       end;
     end
  else
     UpdateStringValue('samplerate', IntToStr(CustomSampleRate.Position));

  UpdateStringValue('volume', IntToStr(Volume.Position));

  case Stereo.Checked of
    True : UpdateStringValue('stereo', 'yes');
    False: UpdateStringValue('stereo', 'no');
  end;

  case Samples.Checked of
    True : UpdateStringValue('samples', 'yes');
    False: UpdateStringValue('samples', 'no');
  end;

  case DetectSampleRate.Checked of
    True : UpdateStringValue('sampleratedetect', 'yes');
    False: UpdateStringValue('sampleratedetect', 'no');
  end;

  case ResampleFilter.Checked of
      True : UpdateStringValue('resamplefilter', 'yes');
      False: UpdateStringValue('resamplefilter', 'no');
    end;

  // Controllers Options
  case Joystick.Position of
     0: UpdateStringValue('joystick', 'none');
     1: UpdateStringValue('joystick', 'auto');
     2: UpdateStringValue('joystick', 'standard');
     3: UpdateStringValue('joystick', 'dual');
     4: UpdateStringValue('joystick', '4button');
     5: UpdateStringValue('joystick', '6button');
     6: UpdateStringValue('joystick', '8button');
     7: UpdateStringValue('joystick', 'fspro');
     8: UpdateStringValue('joystick', 'wingex');
     9: UpdateStringValue('joystick', 'wingwarrior');
    10: UpdateStringValue('joystick', 'sidewinder');
    11: UpdateStringValue('joystick', 'gamepadpro');
    12: UpdateStringValue('joystick', 'grip');
    13: UpdateStringValue('joystick', 'grip4');
    14: UpdateStringValue('joystick', 'sneslpt1');
    15: UpdateStringValue('joystick', 'sneslpt2');
    16: UpdateStringValue('joystick', 'sneslpt3');
    17: UpdateStringValue('joystick', 'psxlpt1');
    18: UpdateStringValue('joystick', 'psxlpt2');
    19: UpdateStringValue('joystick', 'psxlpt3');
    20: UpdateStringValue('joystick', 'n64lpt1');
    21: UpdateStringValue('joystick', 'n64lpt2');
    22: UpdateStringValue('joystick', 'n64lpt3');
    23: UpdateStringValue('joystick', 'segaisa');
    24: UpdateStringValue('joystick', 'segapci');
    25: UpdateStringValue('joystick', 'db9lpt1');
    26: UpdateStringValue('joystick', 'db9lpt2');
    27: UpdateStringValue('joystick', 'db9lpt3');
    28: UpdateStringValue('joystick', 'tgxlpt1');
    29: UpdateStringValue('joystick', 'tgxlpt2');
    30: UpdateStringValue('joystick', 'tgxlpt3');
  end;

  case Mouse.Checked of
    True : UpdateStringValue('mouse', 'yes');
    False: UpdateStringValue('mouse', 'no');
  end;

  case KeyboardLEDs.Checked of
    True : UpdateStringValue('keyboard_leds', 'yes');
    False: UpdateStringValue('keyboard_leds', 'no');
  end;

  case Artwork.Checked of
      True : UpdateStringValue('artwork', 'yes');
      False: UpdateStringValue('artwork', 'no');
  end;

  case Backdrop.Checked of
    True : UpdateStringValue('use_backdrops', 'yes');
    False: UpdateStringValue('use_backdrops', 'no');
  end;

  case Overlay.Checked of
    True : UpdateStringValue('use_overlays', 'yes');
    False: UpdateStringValue('use_overlays', 'no');
  end;

  case Bezel.Checked of
    True : UpdateStringValue('use_bezels', 'yes');
    False: UpdateStringValue('use_bezels', 'no');
  end;

  case Crop.Checked of
    True : UpdateStringValue('artwork_crop', 'yes');
    False: UpdateStringValue('artwork_crop', 'no');
  end;

  UpdateStringValue('artwork_resolution', 'auto');

  // Visual Effects Options
  case Stretch.Checked of
    True : UpdateStringValue('stretch', 'yes');
    False: UpdateStringValue('stretch', 'no');
  end;

  case VSync.Checked of
    True : UpdateStringValue('vsync', 'yes');
    False: UpdateStringValue('vsync', 'no');
  end;

  case AlwaysSynced.Checked of
    True : UpdateStringValue('alwayssynced', 'yes');
    False: UpdateStringValue('alwayssynced', 'no');
  end;

  case WaitVSync.Checked of
    True : UpdateStringValue('waitvsync', 'yes');
    False: UpdateStringValue('waitvsync', 'no');
  end;

  case RotateLeft.Checked of
    True : UpdateStringValue('rol', 'yes');
    False: UpdateStringValue('rol', 'no');
  end;

  case RotateRight.Checked of
    True : UpdateStringValue('ror', 'yes');
    False: UpdateStringValue('ror', 'no');
  end;

  case NoRotate.Checked of
    True : UpdateStringValue('norotate', 'yes');
    False: UpdateStringValue('norotate', 'no');
  end;

  case TripleBuffer.Checked of
    True : UpdateStringValue('triplebuffer', 'yes');
    False: UpdateStringValue('triplebuffer', 'no');
  end;

  case WaitInterlace.Checked of
    True : UpdateStringValue('waitinterlace', 'yes');
    False: UpdateStringValue('waitinterlace', 'no');
  end;

  UpdateStringValue('mmx', LowerCase(LabelMMXValue.Caption));
  UpdateStringValue('dirty', LowerCase(LabelDirtyValue.Caption));

  case FlipX.Checked of
    True : UpdateStringValue('flipx', 'yes');
    False: UpdateStringValue('flipx', 'no');
  end;

  case FlipY.Checked of
    True : UpdateStringValue('flipy', 'yes');
    False: UpdateStringValue('flipy', 'no');
  end;

  // Tweaks Options
  case Throttle.Checked of
    True : UpdateStringValue('throttle', 'yes');
    False: UpdateStringValue('throttle', 'no');
  end;

  case Tweak.Checked of
    True : UpdateStringValue('tweak', 'yes');
    False: UpdateStringValue('tweak', 'no');
  end;

  case Cheat.Checked of
    True : UpdateStringValue('cheat', 'yes');
    False: UpdateStringValue('cheat', 'no');
  end;

  case SteadyKey.Checked of
    True : UpdateStringValue('steadykey', 'yes');
    False: UpdateStringValue('steadykey', 'no');
  end;

  case SkipDisclaimer.Checked of
    True : UpdateStringValue('skip_disclaimer', 'yes');
    False: UpdateStringValue('skip_disclaimer', 'no');
  end;

  case SkipGameInfo.Checked of
    True : UpdateStringValue('skip_gameinfo', 'yes');
    False: UpdateStringValue('skip_gameinfo', 'no');
  end;

  { -ignorecfg     ignore mame.cfg and start with default options
    -debug         Activates the integrated debugger.
                     During emulation, press the Tilde key (~) to activate the
                     debugger. This is available only if the program is compiled with
                     MAME_DEBUG defined

    theese are in-line options (does not have in mame.cfg) }
  CheckEmptyFile:= THashedStringList.Create;
  MAMEcfg.ReadSection('config', CheckEmptyFile);
  EmptyFile:= (CheckEmptyFile.Count = 0);
  FreeAndNil(MAMEcfg);
  if EmptyFile then
     begin
       if FileExists(FormMain.FrontendPath+'resources\dosgamecfg\'+GameName+'.cfg') then
          DeleteFile(FormMain.FrontendPath+'resources\dosgamecfg\'+GameName+'.cfg');
     end;
  FreeAndNil(CheckEmptyFile);
end;

procedure TFormDOSMAMECustomConfiguration.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

{
  Controllers - Complete List

          "none",           JOY_TYPE_NONE
	  "auto",           JOY_TYPE_AUTODETECT
	  "standard",       JOY_TYPE_STANDARD
	  "dual",           JOY_TYPE_2PADS
	  "4button",        JOY_TYPE_4BUTTON
	  "6button",        JOY_TYPE_6BUTTON
	  "8button",        JOY_TYPE_8BUTTON
	  "fspro",          JOY_TYPE_FSPRO
	  "wingex",         JOY_TYPE_WINGEX
	  "sidewinder",     JOY_TYPE_SIDEWINDER
	  "gamepadpro",     JOY_TYPE_GAMEPAD_PRO
	  "grip",           JOY_TYPE_GRIP
	  "grip4",          JOY_TYPE_GRIP4
	  "sneslpt1",       JOY_TYPE_SNESPAD_LPT1
	  "sneslpt2",       JOY_TYPE_SNESPAD_LPT2
	  "sneslpt3",       JOY_TYPE_SNESPAD_LPT3
	  "psxlpt1",        JOY_TYPE_PSXPAD_LPT1
	  "psxlpt2",        JOY_TYPE_PSXPAD_LPT2
	  "psxlpt3",        JOY_TYPE_PSXPAD_LPT3
	  "n64lpt1",        JOY_TYPE_N64PAD_LPT1
	  "n64lpt2",        JOY_TYPE_N64PAD_LPT2
	  "n64lpt3",        JOY_TYPE_N64PAD_LPT3
	  "wingwarrior",    JOY_TYPE_WINGWARRIOR
	  "segaisa",        JOY_TYPE_IFSEGA_ISA
	  "segapci",        JOY_TYPE_IFSEGA_PCI
          "db9lpt1",        JOY_TYPE_DB9_LPT1
	  "db9lpt2",        JOY_TYPE_DB9_LPT2
	  "db9lpt3",        JOY_TYPE_DB9_LPT3
	  "tgxlpt1",        JOY_TYPE_TURBOGRAFX_LPT1
	  "tgxlpt2",        JOY_TYPE_TURBOGRAFX_LPT2
	  "tgxlpt3",        JOY_TYPE_TURBOGRAFX_LPT3}

procedure TFormDOSMAMECustomConfiguration.ReadMAMEcfgClick(Sender: TObject);
begin
  // read all options from gamecfg\game.cfg
  ReadGameConfigFile(False);
  ReadGameConfigFile(True);
end;

procedure TFormDOSMAMECustomConfiguration.FormShow(Sender: TObject);
begin
  FormMain.UpdateGeneralAppearance(FormDOSMAMECustomConfiguration);
  FormMain.SetDOSMAMECustomConfigurationLanguage;
  case FormMain.MenuRealIcons.Checked of
    True : FormMain.BigRealIconsImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
    False: FormMain.BuiltInBigListImageList.GetIcon(FormMain.GamesList[FormMain.SelectedGame].eImageIndex, GameIcon.Picture.Icon);
  end;
  LabelGameDescription.Caption:= FormMain.GamesList[FormMain.SelectedGame].eDescription;
  ReadMAMEcfg.OnClick(Self);
end;

procedure TFormDOSMAMECustomConfiguration.ButtonOkClick(Sender: TObject);
begin
  UpdateGameConfigFile;// update all options to gamecfg\game.cfg
  Close;
end;

procedure TFormDOSMAMECustomConfiguration.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
     ButtonCancel.OnClick(Self);
end;

procedure TFormDOSMAMECustomConfiguration.CenterXChange(Sender: TObject);
begin
  LabelCenterXValue.Caption:= IntToStr(CenterX.Position);
end;

procedure TFormDOSMAMECustomConfiguration.CenterYChange(Sender: TObject);
begin
  LabelCenterYValue.Caption:= IntToStr(CenterY.Position);
end;

procedure TFormDOSMAMECustomConfiguration.SkipColumnsChange(Sender: TObject);
begin
  LabelSkipColumnsValue.Caption:= IntToStr(SkipColumns.Position);
end;

procedure TFormDOSMAMECustomConfiguration.SkipLinesChange(Sender: TObject);
begin
  LabelSkipLinesValue.Caption:= IntToStr(SkipLines.Position);
end;

procedure TFormDOSMAMECustomConfiguration.VolumeChange(Sender: TObject);
begin
  LabelVolumeValue.Caption:= IntToSTr(Volume.Position)+' dB';
end;

procedure TFormDOSMAMECustomConfiguration.VGAFrequencyChange(Sender: TObject);
begin
  if VGAFrequency.Position = -1 then
     LabelVGAFrequencyValue.Caption:= 'Auto'
  else
     LabelVGAFrequencyValue.Caption:= IntToStr(VGAFrequency.Position);
end;

procedure TFormDOSMAMECustomConfiguration.DepthChange(Sender: TObject);
begin
  LabelDepthValue.Caption:= FormMain.GetDOSDepth(Depth);
end;

procedure TFormDOSMAMECustomConfiguration.FrameSkipChange(Sender: TObject);
begin
  if FrameSkip.Position = -1 then
     LabelFrameSkipValue.Caption:= 'Auto'
  else
     LabelFrameSkipValue.Caption:= IntToStr(FrameSkip.Position);
end;

procedure TFormDOSMAMECustomConfiguration.VESAChange(Sender: TObject);
begin
  LabelVESAValue.Caption:= FormMain.GetDOSVesaMode(VESA);
end;

procedure TFormDOSMAMECustomConfiguration.GammaChange(Sender: TObject);
begin
  LabelGammaValue.Caption:= TrimLeft(Format('%1.2f', [Gamma.Position]));
end;

procedure TFormDOSMAMECustomConfiguration.FlickerChange(Sender: TObject);
begin
  LabelFlickerValue.Caption:= TrimLeft(Format('%3.2f',[Flicker.Position]));
end;

procedure TFormDOSMAMECustomConfiguration.BeamChange(Sender: TObject);
begin
  LabelBeamValue.Caption:= TrimLeft(Format('%2.2f', [Beam.Position]));
end;

procedure TFormDOSMAMECustomConfiguration.SampleRateChange(Sender: TObject);
begin
  LabelSampleRateValue.Caption:= FormMain.GetSampleRate(SampleRate);
end;

procedure TFormDOSMAMECustomConfiguration.CustomSampleRateChange(Sender: TObject);
begin
  if CustomSampleRate.Position = 4999 then
     LabelCustomSampleRateValue.Caption:= 'Disabled'
  else
     LabelCustomSampleRateValue.Caption:= IntToStr(CustomSampleRate.Position)+' Hz';
end;

procedure TFormDOSMAMECustomConfiguration.MonitorChange(Sender: TObject);
begin
  LabelMonitorValue.Caption:= FormMain.GetDOSMonitor(Monitor);
end;

procedure TFormDOSMAMECustomConfiguration.ResolutionChange(Sender: TObject);
begin
  LabelResolutionValue.Caption:= FormMain.GetResolution(Resolution);
  //FormMain.GetDOSResolution(Resolution);
end;

procedure TFormDOSMAMECustomConfiguration.VectorResolutionChange(
  Sender: TObject);
begin
  LabelVectorResolutionValue.Caption:= FormMain.GetResolution(VectorResolution);
  //FormMain.GetDOSResolution(VectorResolution);
end;

procedure TFormDOSMAMECustomConfiguration.SoundCardChange(Sender: TObject);
begin
  LabelSoundCardValue.Caption:= FormMain.GetDOSSoundCard(SoundCard);
end;

procedure TFormDOSMAMECustomConfiguration.JoystickChange(Sender: TObject);
begin
  LabelJoystickValue.Caption:= FormMain.GetDOSJoystick(Joystick);
end;

procedure TFormDOSMAMECustomConfiguration.FormCreate(Sender: TObject);
begin
  // Load Icons
  // Custom Options tab
  FormMain.LoadIcon(DisplayImage, 'MAMEConfiguration\Display.png');
  FormMain.LoadIcon(Display2Image, 'MAMEConfiguration\Display.png');
  FormMain.LoadIcon(SoundControllersImage, 'MAMEConfiguration\SoundControllers.png');
  FormMain.LoadIcon(MiscellaneousImage, 'MAMEConfiguration\Miscellaneous.png');
end;

procedure TFormDOSMAMECustomConfiguration.IntensityChange(Sender: TObject);
begin
  LabelIntensityValue.Caption:= TrimLeft(Format('%1.2f', [Intensity.Position]));
end;

procedure TFormDOSMAMECustomConfiguration.ScanlinesChange(Sender: TObject);
begin
  case Scanlines.Position of
    0: LabelScanlinesValue.Caption:= 'Yes';
    1: LabelScanlinesValue.Caption:= 'No';
    2: LabelScanlinesValue.Caption:= 'Horizontal';
    3: LabelScanlinesValue.Caption:= 'Vertical';
  end;
end;

procedure TFormDOSMAMECustomConfiguration.MMXChange(Sender: TObject);
begin
  case MMX.Position of
    -1: LabelMMXValue.Caption:= 'Auto';
     0: LabelMMXValue.Caption:= 'Yes';
     1: LAbelMMXValue.Caption:= 'No';
  end;
end;

procedure TFormDOSMAMECustomConfiguration.DirtyChange(Sender: TObject);
begin
  case Dirty.Position of
    -1: LabelDirtyValue.Caption:= 'Auto';
     0: LabelDirtyValue.Caption:= 'Yes';
     1: LAbelDirtyValue.Caption:= 'No';
  end;
end;

procedure TFormDOSMAMECustomConfiguration.BrightnessChange(
  Sender: TObject);
begin
  LabelBrightnessValue.Caption:= TrimLeft(Format('%1.2f', [Brightness.Position]));
end;

procedure TFormDOSMAMECustomConfiguration.DebuggerResolutionChange(
  Sender: TObject);
begin
  LabelDebuggerResolutionValue.Caption:= FormMain.GetDOSResolution(DebuggerResolution);
end;

procedure TFormDOSMAMECustomConfiguration.ArtworkResolutionChange(
  Sender: TObject);
begin
  if ArtworkResolution.Position = 0 then
     LabelArtworkResolutionValue.Caption:= 'Auto'
  else
     LabelArtworkResolutionValue.Caption:= IntToStr(ArtworkResolution.Position);
end;

procedure TFormDOSMAMECustomConfiguration.PauseBrightnessChange(
  Sender: TObject);
begin
  LabelPauseBrightnessValue.Caption:= TrimLeft(Format('%1.2f', [PauseBrightness.Position]));
end;

end.
