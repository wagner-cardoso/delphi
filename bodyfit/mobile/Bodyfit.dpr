program Bodyfit;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  Frame.Treino in 'Frames\Frame.Treino.pas' {FrameTreino: TFrame},
  UnitTreinoDetalhe in 'UnitTreinoDetalhe.pas' {FrmTreinoDetalhe},
  UnitTreinoCad in 'UnitTreinoCad.pas' {FrmTreinoCad},
  Frame.FichaExercicio in 'Frames\Frame.FichaExercicio.pas' {FrameFichaExercicio: TFrame},
  UnitExercicio in 'UnitExercicio.pas' {FrmExercicio},
  UnitPerfil in 'UnitPerfil.pas' {FrmPerfil},
  UnitPerfilCad in 'UnitPerfilCad.pas' {FrmPerfilCad},
  UnitPerfilSenha in 'UnitPerfilSenha.pas' {FrmPerfilSenha};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
