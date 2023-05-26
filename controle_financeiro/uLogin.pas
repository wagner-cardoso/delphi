unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.TabControl,
  System.Actions, FMX.ActnList, u99Permissions, FMX.MediaLibrary.Actions,
  FMX.StdActns;

type
  TfrmLogin = class(TForm)
    Layout2: TLayout;
    imgLogo: TImage;
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    edtLogin: TEdit;
    StyleBook1: TStyleBook;
    Layout3: TLayout;
    RoundRect2: TRoundRect;
    edtSenha: TEdit;
    Layout4: TLayout;
    RoundRect3: TRoundRect;
    Label1: TLabel;
    TabControl: TTabControl;
    tabLogin: TTabItem;
    tabConta: TTabItem;
    Layout5: TLayout;
    Image1: TImage;
    Layout6: TLayout;
    RoundRect4: TRoundRect;
    edtCadNome: TEdit;
    Layout7: TLayout;
    RoundRect5: TRoundRect;
    edtCadEmail: TEdit;
    Layout8: TLayout;
    Rect_conta_proximo: TRoundRect;
    Label2: TLabel;
    Layout9: TLayout;
    RoundRect7: TRoundRect;
    edtCadSenha: TEdit;
    tabFoto: TTabItem;
    Layout10: TLayout;
    c_foto_editar: TCircle;
    Layout11: TLayout;
    RoundRect8: TRoundRect;
    Label3: TLabel;
    tabEscolher: TTabItem;
    Layout12: TLayout;
    Label4: TLabel;
    img_foto: TImage;
    Img_library: TImage;
    Layout13: TLayout;
    Img_foto_voltar: TImage;
    Layout14: TLayout;
    img_escolher_voltar: TImage;
    Layout15: TLayout;
    Layout16: TLayout;
    lbl_login_tab: TLabel;
    lbl_login_conta: TLabel;
    Rectangle1: TRectangle;
    ActionList1: TActionList;
    ActConta: TChangeTabAction;
    ActEscolher: TChangeTabAction;
    ActFoto: TChangeTabAction;
    ActLogin: TChangeTabAction;
    Layout17: TLayout;
    lbl_conta_login: TLabel;
    Label6: TLabel;
    Rectangle2: TRectangle;
    Layout18: TLayout;
    ActLibrary: TTakePhotoFromLibraryAction;
    ActCamera: TTakePhotoFromCameraAction;
    procedure lbl_login_contaClick(Sender: TObject);
    procedure lbl_conta_loginClick(Sender: TObject);
    procedure Rect_conta_proximoClick(Sender: TObject);
    procedure Img_foto_voltarClick(Sender: TObject);
    procedure c_foto_editarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure img_fotoClick(Sender: TObject);
    procedure Img_libraryClick(Sender: TObject);
    procedure img_escolher_voltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActLibraryDidFinishTaking(Image: TBitmap);
    procedure ActCameraDidFinishTaking(Image: TBitmap);
  private
    { Private declarations }
    permissao: T99Permissions;
    procedure TrataErroPermissao(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}


procedure TfrmLogin.ActCameraDidFinishTaking(Image: TBitmap);
begin
    c_foto_editar.Fill.Bitmap.Bitmap := Image;
    ActFoto.Execute;
end;

procedure TfrmLogin.ActLibraryDidFinishTaking(Image: TBitmap);
begin
  c_foto_editar.Fill.Bitmap.Bitmap := Image;
    ActFoto.Execute;
end;

procedure TfrmLogin.c_foto_editarClick(Sender: TObject);
begin
  ActEscolher.Execute;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  permissao := T99Permissions.Create;
end;

procedure TfrmLogin.FormDestroy(Sender: TObject);
begin
  permissao.DisposeOf;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  TabControl.ActiveTab := tabLogin;
end;

procedure TfrmLogin.TrataErroPermissao(Sender: TObject);
begin
  showmessage('Voce não possui permissão de acesso para esse recurso');
end;

procedure TfrmLogin.img_escolher_voltarClick(Sender: TObject);
begin
  ActFoto.Execute;
end;

procedure TfrmLogin.img_fotoClick(Sender: TObject);
begin
  permissao.Camera(ActCamera, TrataErroPermissao);
end;

procedure TfrmLogin.Img_foto_voltarClick(Sender: TObject);
begin
  ActConta.Execute;
end;

procedure TfrmLogin.Img_libraryClick(Sender: TObject);
begin
  permissao.PhotoLibrary(ActLibrary, TrataErroPermissao);
end;

procedure TfrmLogin.lbl_conta_loginClick(Sender: TObject);
begin
  ActLogin.Execute;
end;

procedure TfrmLogin.lbl_login_contaClick(Sender: TObject);
begin
  ActConta.Execute;
end;

procedure TfrmLogin.Rect_conta_proximoClick(Sender: TObject);
begin
  ActFoto.Execute;
end;

end.
