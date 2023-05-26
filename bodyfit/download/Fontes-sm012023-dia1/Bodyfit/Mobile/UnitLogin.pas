unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.TabControl, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls;

type
  TFrmLogin = class(TForm)
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
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TFrmLogin.btnLoginClick(Sender: TObject);
begin
    if NOT Assigned(FrmPrincipal) then
        Application.CreateForm(TFrmPrincipal, FrmPrincipal);

    Application.MainForm := FrmPrincipal;
    FrmPrincipal.show;
    FrmLogin.Close;
end;

end.
