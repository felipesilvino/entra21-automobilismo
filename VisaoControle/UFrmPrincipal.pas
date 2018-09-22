unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, System.ImageList, Vcl.ImgList;

type
  TFrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    miCadastro: TMenuItem;
    miCadastroUsuario: TMenuItem;
    miTemas: TMenuItem;
    miSair: TMenuItem;
    miLogoff: TMenuItem;
    miEncerrarAplicacao: TMenuItem;
    sbPrincipal: TStatusBar;
    miCadastroPiloto: TMenuItem;
    miCadastroEquipe: TMenuItem;
    miCadastroPais: TMenuItem;
    miCadastroFabricante: TMenuItem;
    ilImagens: TImageList;
    miGrafico: TMenuItem;
    miPilotoIdade: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure miSairClick(Sender: TObject);
    procedure miPaisClick(Sender: TObject);
    procedure miFabricanteClick(Sender: TObject);
    procedure miPilotoClick(Sender: TObject);
    procedure miEquipeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miLogoffClick(Sender: TObject);
    procedure miEncerrarAplicacaoClick(Sender: TObject);
    procedure miCadastroUsuarioClick(Sender: TObject);
    procedure miCadastroEquipeClick(Sender: TObject);
    procedure miCadastroFabricanteClick(Sender: TObject);
    procedure miCadastroPaisClick(Sender: TObject);
    procedure miCadastroPilotoClick(Sender: TObject);
    procedure miPilotoIdadeClick(Sender: TObject);
  private
    procedure miStyleMenuItemClick(Sender: TObject);
    procedure AtualizaUsuarioLogado;
    procedure FechaFormulariosFilhos;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses
    UDM
  , Vcl.Themes
  , UUsuarioLogado
  , UFrmCadastroPais
  , UFrmCadastroFabricante
  , UFrmCadastroPiloto
  , UFrmCadastroEquipe
  , UFrmCadastroUsuario
  , UFrmLogin
  , UFrmGrafico
  ;

procedure TFrmPrincipal.AtualizaUsuarioLogado;
begin
  sbPrincipal.Panels[1].Text :=
    'Usuário: ' + TUsuarioLogado.USUARIO.NOME;
end;

procedure TFrmPrincipal.FechaFormulariosFilhos;
var
  Indice: Integer;
begin
  for Indice := 0 to Pred(MDIChildCount) do
  begin
    MDIChildren[Indice].Free;
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  StyleName: String;
  StyleList: TStringList;
  miStyleMenuItem: TMenuItem;
begin
  StyleList        := TStringList.Create;
  StyleList.Sorted := True;
  try
    for StyleName in TStyleManager.StyleNames do
    begin
      StyleList.Add(StyleName);
    end;

    StyleList.Sort;
    for StyleName in StyleList do
    begin
      miStyleMenuItem         := mmPrincipal.CreateMenuItem;
      miStyleMenuItem.Caption := StyleName;
      miStyleMenuItem.Hint    := StyleName;
      miStyleMenuItem.OnClick := miStyleMenuItemClick;

      miTemas.Add(miStyleMenuItem);
    end;

  finally
    FreeAndNil(StyleList);
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text :=
    'Banco de Dados: ' + dmEntra21.SQLConnection.Params.Values[CNT_DATA_BASE];

  AtualizaUsuarioLogado
end;

procedure TFrmPrincipal.miCadastroFabricanteClick(Sender: TObject);
begin
  TFrmCadastroFabricante.Create(Self);
end;

procedure TFrmPrincipal.miCadastroPaisClick(Sender: TObject);
begin
  TFrmCadastroPais.Create(Self);
end;

procedure TFrmPrincipal.miCadastroPilotoClick(Sender: TObject);
begin
  TFrmCadastroPiloto.Create(Self);
end;

procedure TFrmPrincipal.miEncerrarAplicacaoClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.miEquipeClick(Sender: TObject);
begin
  TFrmCadastroEquipe.Create(Self);
end;

procedure TFrmPrincipal.miFabricanteClick(Sender: TObject);
begin
  TFrmCadastroFabricante.Create(Self);
end;

procedure TFrmPrincipal.miLogoffClick(Sender: TObject);
begin
  TUsuarioLogado.Logoff;
  Application.CreateForm(TFrmLogin, FrmLogin);
  if FrmLogin.ShowModal = mrYes then
  begin
    FreeAndNil(FrmLogin);

    FechaFormulariosFilhos;
    AtualizaUsuarioLogado;
  end
  else
  begin
    Close;
  end;
end;

procedure TFrmPrincipal.miPaisClick(Sender: TObject);
begin
  TFrmCadastroPais.Create(Self);
end;

procedure TFrmPrincipal.miPilotoClick(Sender: TObject);
begin
  TFrmCadastroPiloto.Create(Self);
end;

procedure TFrmPrincipal.miPilotoIdadeClick(Sender: TObject);
begin
  TFrmGrafico.Create(Self);
end;

procedure TFrmPrincipal.miSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.miStyleMenuItemClick(Sender: TObject);
begin
  TStyleManager.SetStyle(TMenuItem(Sender).Hint);
end;

procedure TFrmPrincipal.miCadastroEquipeClick(Sender: TObject);
begin
  TFrmCadastroEquipe.Create(Self);
end;

procedure TFrmPrincipal.miCadastroUsuarioClick(Sender: TObject);
begin
  TFrmCadastroUsuario.Create(Self);
end;

end.
