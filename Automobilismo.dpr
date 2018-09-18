program Automobilismo;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Controls,
  System.SysUtils,
  MidasLib,
  UFrmCRUD in 'VisaoControle\UFrmCRUD.pas' {FrmCRUD},
  UUtilitarios in 'Modelo\UUtilitarios.pas',
  UMensagens in 'Modelo\UMensagens.pas',
  UConstantes in 'Modelo\UConstantes.pas',
  UDialogo in 'Modelo\UDialogo.pas',
  UOpcaoPesquisa in 'Modelo\UOpcaoPesquisa.pas',
  UDM in 'Modelo\Persistencia\UDM.pas' {dmEntra21: TDataModule},
  UEntidade in 'Modelo\Persistencia\UEntidade.pas',
  URepositorio in 'Modelo\Persistencia\URepositorio.pas',
  URepositorioDB in 'Modelo\Persistencia\URepositorioDB.pas',
  URegraCRUD in 'Modelo\Regra\URegraCRUD.pas',
  UFabricante in 'Modelo\Persistencia\UFabricante.pas',
  UPais in 'Modelo\Persistencia\UPais.pas',
  URepositorioFabricante in 'Modelo\Persistencia\URepositorioFabricante.pas',
  URepositorioPais in 'Modelo\Persistencia\URepositorioPais.pas',
  URegraCRUDFabricante in 'Modelo\Regra\URegraCRUDFabricante.pas',
  URegraCRUDPais in 'Modelo\Regra\URegraCRUDPais.pas',
  UFrmCadastroFabricante in 'VisaoControle\UFrmCadastroFabricante.pas' {FrmCadastroFabricante},
  UFrmCadastroPais in 'VisaoControle\UFrmCadastroPais.pas' {FrmCadastroPais},
  UFrmPrincipal in 'VisaoControle\UFrmPrincipal.pas' {FrmPrincipal},
  UPiloto in 'Modelo\Persistencia\UPiloto.pas',
  URepositorioPiloto in 'Modelo\Persistencia\URepositorioPiloto.pas',
  URegraCRUDPiloto in 'Modelo\Regra\URegraCRUDPiloto.pas',
  UFrmCadastroPiloto in 'VisaoControle\UFrmCadastroPiloto.pas' {FrmCadastroPiloto},
  UEquipe in 'Modelo\Persistencia\UEquipe.pas',
  URepositorioEquipe in 'Modelo\Persistencia\URepositorioEquipe.pas',
  URegraCRUDEquipe in 'Modelo\Regra\URegraCRUDEquipe.pas',
  UFrmCadastroEquipe in 'VisaoControle\UFrmCadastroEquipe.pas' {FrmCadastroEquipe},
  UFrmPesquisa in 'VisaoControle\UFrmPesquisa.pas' {frmPesquisa},
  UFrmLogin in 'VisaoControle\UFrmLogin.pas' {FrmLogin},
  UFrmCadastroUsuario in 'VisaoControle\UFrmCadastroUsuario.pas' {FrmCadastroUsuario},
  UListaVisualizacao in 'Modelo\UListaVisualizacao.pas',
  UUsuarioLogado in 'Modelo\UUsuarioLogado.pas',
  URepositorioUsuario in 'Modelo\Persistencia\URepositorioUsuario.pas',
  UUsuario in 'Modelo\Persistencia\UUsuario.pas',
  URegraCRUDUsuario in 'Modelo\Regra\URegraCRUDUsuario.pas';

{$R *.res}

begin
  {$DEFINE DEV}

  Application.Initialize;

  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TdmEntra21, dmEntra21);

  {$IFDEF PROD}
  FrmLogin := TFrmLogin.Create(nil);
  if FrmLogin.ShowModal = mrYes then
    begin
      FreeAndNil(FrmLogin);
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
      Application.Run;
    end
  else
    begin
      Application.Run;
      Application.Terminate;
    end;
  {$ELSE}
  TUsuarioLogado.Unico.RealizaLogin('admin', 'adminadmin');
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
  {$ENDIF}
end.