unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    TabControl: TTabControl;
    TabLogin: TTabItem;
    TabConta: TTabItem;
    rectLogin: TRectangle;
    Rectangle1: TRectangle;
    Edit1: TEdit;
    Edit2: TEdit;
    rectBtnLogin: TRectangle;
    btnLogin: TSpeedButton;
    Label1: TLabel;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Edit3: TEdit;
    Edit4: TEdit;
    Rectangle4: TRectangle;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Edit5: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
