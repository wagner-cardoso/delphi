unit Frame.FichaExercicio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFrameFichaExercicio = class(TFrame)
    rectSugestao: TRectangle;
    lblTitulo: TLabel;
    Image4: TImage;
    lblSubTitulo: TLabel;
    Rectangle1: TRectangle;
    CheckBox1: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
