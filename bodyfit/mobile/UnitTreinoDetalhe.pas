unit UnitTreinoDetalhe;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox;

type
  TFrmTreinoDetalhe = class(TForm)
    lytToolbar: TLayout;
    lblTitulo: TLabel;
    imgFechar: TImage;
    Label7: TLabel;
    lbExercicios: TListBox;
    rectBtnLogin: TRectangle;
    btnIniciar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure imgFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIniciarClick(Sender: TObject);
    procedure lbExerciciosItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    procedure AddExercicio(id_exercicio: integer; titulo, subtitulo: string);
    procedure CarregarExercicios;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTreinoDetalhe: TFrmTreinoDetalhe;

implementation

{$R *.fmx}

uses Frame.Treino, UnitTreinoCad, UnitExercicio;

procedure TFrmTreinoDetalhe.AddExercicio(id_exercicio: integer;
                                         titulo, subtitulo: string);
var
    item: TListBoxItem;
    frame: TFrameTreino;
begin
    item := TListBoxItem.Create(lbExercicios);
    item.Selectable := false;
    item.Text := '';
    item.Height := 90;
    item.Tag := id_exercicio;

    // Frame...
    frame := TFrameTreino.Create(item);
    frame.lblTitulo.Text := titulo;
    frame.lblSubtitulo.Text := subtitulo;

    item.AddObject(frame);

    lbExercicios.AddObject(item);
end;

procedure TFrmTreinoDetalhe.btnIniciarClick(Sender: TObject);
begin
    if NOT Assigned(FrmTreinoCad) then
        Application.CreateForm(TFrmTreinoCad, FrmTreinoCad);

    FrmTreinoCad.show;
end;

procedure TFrmTreinoDetalhe.CarregarExercicios;
begin
    AddExercicio(1, 'Cardio (esteira ou bike)', '15 minutos');
    AddExercicio(2, 'Prancha isométrica', '3x 15 a 20');
    AddExercicio(3, 'Lombar máquina', '3x 15 a 20');
    AddExercicio(4, 'Supino', '3x 15 a 20');
    AddExercicio(5, 'Remada', '3x 15 a 20');
end;

procedure TFrmTreinoDetalhe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmTreinoDetalhe := nil;
end;

procedure TFrmTreinoDetalhe.FormShow(Sender: TObject);
begin
    CarregarExercicios;
end;

procedure TFrmTreinoDetalhe.imgFecharClick(Sender: TObject);
begin
    close;
end;

procedure TFrmTreinoDetalhe.lbExerciciosItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
    if NOT Assigned(FrmExercicio) then
        Application.CreateForm(TFrmExercicio, FrmExercicio);

    FrmExercicio.show;
end;

end.
