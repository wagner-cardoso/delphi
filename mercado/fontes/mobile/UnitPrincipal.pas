unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Ani;

type
  TFrmPrincipal = class(TForm)
    LytToolbar: TLayout;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    LytPesquisa: TLayout;
    StyleBook: TStyleBook;
    RectPesquisa: TRectangle;
    Edit1: TEdit;
    Image3: TImage;
    Button1: TButton;
    LytSwitch: TLayout;
    RectSwitch: TRectangle;
    rectSelecao: TRectangle;
    lblCasa: TLabel;
    lblRetira: TLabel;
    LvMercado: TListView;
    ImgShopping: TImage;
    ImgTaxa: TImage;
    ImgPedidoMin: TImage;
    AnimationFiltro: TFloatAnimation;
    procedure FormShow(Sender: TObject);
    procedure LvMercadoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lblCasaClick(Sender: TObject);
  private
    procedure AddMercadoLv(id_mercado: integer; nome, endereco: string;
                           tx_entrega, vl_min_pedido: double);
    procedure ListarMercados;
    procedure SelecionarEntrega(lbl: TLabel);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses UnitMercado;

procedure TFrmPrincipal.AddMercadoLv(id_mercado: integer;
                                     nome, endereco: string;
                                     tx_entrega, vl_min_pedido: double);
var
  img: TListItemImage;
  txt: TListItemText;

begin
  with LvMercado.Items.Add do
  begin
    Height := 115;
    Tag := id_mercado;

    img := TListItemImage(Objects.FindDrawable('ImgShop'));
    img.Bitmap := ImgShopping.Bitmap;

    img := TListItemImage(Objects.FindDrawable('ImgTaxa'));
    img.Bitmap := ImgTaxa.Bitmap;

    img := TListItemImage(Objects.FindDrawable('ImgCompraMin'));
    img.Bitmap := ImgPedidoMin.Bitmap;

    txt := TListItemText(Objects.FindDrawable('TxtNome'));
    txt.Text := nome;

    txt := TListItemText(Objects.FindDrawable('TxtEndereco'));
    txt.Text := endereco;

    txt := TListItemText(Objects.FindDrawable('TxtTaxa'));
    txt.Text := 'Taxa de entrega: ' + FormatFloat('R$ #,##0.00', tx_entrega);

    txt := TListItemText(Objects.FindDrawable('TxtCompraMin'));
    txt.Text := 'Compra mínima: ' + FormatFloat('R$ #,##0.00', vl_min_pedido);
  end;
end;


procedure TFrmPrincipal.ListarMercados;
begin
  AddMercadoLv(1, 'Pão de açucar', 'Av. Paulista, 1500', 10, 50);
  AddMercadoLv(1, 'Pão de açucar', 'Av. Paulista, 1500', 10, 50);
  AddMercadoLv(1, 'Pão de açucar', 'Av. Paulista, 1500', 10, 50);
  AddMercadoLv(1, 'Pão de açucar', 'Av. Paulista, 1500', 10, 50);
end;


procedure TFrmPrincipal.LvMercadoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if not Assigned(FrmMercado) then
    Application.CreateForm(TFrmMercado, FrmMercado);

  FrmMercado.Show;

end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  ListarMercados;
end;

procedure TFrmPrincipal.SelecionarEntrega(lbl: TLabel);
begin
  lblCasa.FontColor := $ff8f8f8f;
  lblREtira.FontColor := $ff8f8f8f;

  lbl.FontColor := $ffffffff;

  AnimationFiltro.StopValue := lbl.Position.X;
  AnimationFiltro.Start;
end;


procedure TFrmPrincipal.lblCasaClick(Sender: TObject);
begin
  SelecionarEntrega(TLabel(Sender));
end;

end.
