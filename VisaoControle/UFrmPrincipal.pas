unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus;

type
  TFrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    miCadastro: TMenuItem;
    miPais: TMenuItem;
    miSair: TMenuItem;
    sbPrincipal: TStatusBar;
    miFabricante: TMenuItem;
    miPiloto: TMenuItem;
    miEquipe: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure miSairClick(Sender: TObject);
    procedure miPaisClick(Sender: TObject);
    procedure miFabricanteClick(Sender: TObject);
    procedure miPilotoClick(Sender: TObject);
    procedure miEquipeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses
    UDM
  , UFrmCadastroPais
  , UFrmCadastroFabricante
  , UFrmCadastroPiloto
  , UFrmCadastroEquipe
  ;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text :=
    'Banco de Dados: ' + dmEntra21.SQLConnection.Params.Values[CNT_DATA_BASE];
end;

procedure TFrmPrincipal.miEquipeClick(Sender: TObject);
begin
  TFrmCadastroEquipe.Create(Self);
end;

procedure TFrmPrincipal.miFabricanteClick(Sender: TObject);
begin
  TFrmCadastroFabricante.Create(Self);
end;

procedure TFrmPrincipal.miPaisClick(Sender: TObject);
begin
  TFrmCadastroPais.Create(Self);
end;

procedure TFrmPrincipal.miPilotoClick(Sender: TObject);
begin
  TFrmCadastroPiloto.Create(Self);
end;

procedure TFrmPrincipal.miSairClick(Sender: TObject);
begin
  Close;
end;

end.
