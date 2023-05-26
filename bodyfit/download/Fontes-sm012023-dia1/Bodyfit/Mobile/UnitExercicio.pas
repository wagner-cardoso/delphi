unit UnitExercicio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TFrmExercicio = class(TForm)
    lytToolbar: TLayout;
    lblTitulo: TLabel;
    imgFechar: TImage;
    WebBrowser1: TWebBrowser;
    Label3: TLabel;
    procedure imgFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExercicio: TFrmExercicio;

implementation

{$R *.fmx}

procedure TFrmExercicio.imgFecharClick(Sender: TObject);
begin
    close;
end;

end.
