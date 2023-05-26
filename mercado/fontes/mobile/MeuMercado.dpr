program MeuMercado;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitMercado in 'UnitMercado.pas' {FrmMercado},
  Frame.ProdutoCard in 'Frames\Frame.ProdutoCard.pas' {FrameProdutoCard: TFrame},
  UnitSplash in 'UnitSplash.pas' {FrmSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmMercado, FrmMercado);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.Run;
end.
