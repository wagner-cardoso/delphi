unit UnitTreinoCad;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox;

type
  TFrmTreinoCad = class(TForm)
    lytToolbar: TLayout;
    lblTitulo: TLabel;
    imgFechar: TImage;
    Layout1: TLayout;
    Label7: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    rectBtnLogin: TRectangle;
    btnConcluir: TSpeedButton;
    lbExercicios: TListBox;
    procedure FormShow(Sender: TObject);
    procedure imgFecharClick(Sender: TObject);
  private
    procedure AddExercicio(id_exercicio: integer; titulo, subtitulo: string;
      ind_concluido: boolean);
    procedure CarregarExercicios;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTreinoCad: TFrmTreinoCad;

implementation

{$R *.fmx}

uses Frame.FichaExercicio;

procedure TFrmTreinoCad.AddExercicio(id_exercicio: integer;
                                     titulo, subtitulo: string;
                                     ind_concluido: boolean);
var
    item: TListBoxItem;
    frame: TFrameFichaExercicio;
begin
    item := TListBoxItem.Create(lbExercicios);
    item.Selectable := false;
    item.Text := '';
    item.Width := Trunc(lbExercicios.Width * 0.85);
    item.Tag := id_exercicio;

    // Frame...
    frame := TFrameFichaExercicio.Create(item);
    frame.lblTitulo.Text := titulo;
    frame.lblSubtitulo.Text := subtitulo;

    item.AddObject(frame);

    lbExercicios.AddObject(item);
end;


procedure TFrmTreinoCad.CarregarExercicios;
begin
    AddExercicio(1, 'Cardio (esteira ou bike)', '15 minutos', false);
    AddExercicio(2, 'Prancha isométrica', '3x 15 a 20', false);
    AddExercicio(3, 'Lombar máquina', '3x 15 a 20', false);
    AddExercicio(4, 'Supino', '3x 15 a 20', false);
    AddExercicio(5, 'Remada', '3x 15 a 20', false);
end;


procedure TFrmTreinoCad.FormShow(Sender: TObject);
begin
    CarregarExercicios;
end;

procedure TFrmTreinoCad.imgFecharClick(Sender: TObject);
begin
    close;
end;

end.
