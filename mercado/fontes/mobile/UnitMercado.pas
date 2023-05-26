unit UnitMercado;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
  FMX.ListBox;

type
  TFrmMercado = class(TForm)
    LytToolbar: TLayout;
    imgVoltar: TImage;
    imgCarrinho: TImage;
    lblTitulo: TLabel;
    LytPesquisa: TLayout;
    RectPesquisa: TRectangle;
    edtBusca: TEdit;
    Image3: TImage;
    btnBusca: TButton;
    LytEndereco: TLayout;
    lblEndereco: TLabel;
    Image4: TImage;
    Image5: TImage;
    LblEntrega: TLabel;
    lblPedMin: TLabel;
    lbCategoria: TListBox;
    ListBoxItem1: TListBoxItem;
    Rectangle1: TRectangle;
    Label1: TLabel;
    ListBoxItem2: TListBoxItem;
    Rectangle2: TRectangle;
    Label2: TLabel;
    ListBoxItem3: TListBoxItem;
    Rectangle3: TRectangle;
    Label3: TLabel;
    ListBoxItem4: TListBoxItem;
    Rectangle4: TRectangle;
    Label4: TLabel;
    lbProdutos: TListBox;
    procedure FormShow(Sender: TObject);
  private
    procedure AddProduto(id_produto: integer; descricao, unidade: string;
      valor: double);
    procedure ListarProdutos;
    procedure ListarCategorias;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMercado: TFrmMercado;

implementation

{$R *.fmx}

uses UnitPrincipal, Frame.ProdutoCard;

procedure TFrmMercado.AddProduto(id_produto: integer;
                                 descricao, unidade: string;
                                 valor: double);
var
  item: TListBoxItem;
  frame: TFrameProdutoCard;
begin
  item := TListBoxItem.Create(lbProdutos);
  item.Selectable := False;
  item.Text := '';
  item.Height := 200;
  item.Tag := id_produto;
  lbProdutos.AddObject(item);

  // Frame...
  frame := TFrameProdutoCard.Create(item);
//  frame.imgFoto.Bitmap
  frame.lblDescricao.Text := descricao;
  frame.lblValor.Text := FormatFloat('R$ #,##0.00', valor);
  frame.lblUnidade.Text := unidade;

  item.AddObject(frame);

end;


procedure TFrmMercado.ListarProdutos;
begin
  // acessar o backend...

  AddProduto(0, 'Café Pilão torrado e moído', '800g', 15);
  AddProduto(0, 'Café Pilão torrado e moído', '700g', 14);
  AddProduto(0, 'Café Pilão torrado e moído', '600g', 13);
  AddProduto(0, 'Café Pilão torrado e moído', '500g', 12);
  AddProduto(0, 'Café Pilão torrado e moído', '400g', 11);
end;

procedure TFrmMercado.AddCategoria(id_categoria: integer;
                                 descricao: string);
begin

end;


procedure TFrmMercado.ListarCategorias;
begin
  lbCategoria.Items.Clear;

  AddCategoria(0, 'Alimentos');
  AddCategoria(0, 'Bebidas');
  AddCategoria(0, 'Limpeza');
  AddCategoria(0, 'Eletrônicos');
  AddCategoria(0, 'Informática');

  ListarProdutos;

end;


procedure TFrmMercado.FormShow(Sender: TObject);
begin
  ListarCategorias;
end;


end.
