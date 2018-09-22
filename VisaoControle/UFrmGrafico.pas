unit UFrmGrafico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart
  , SQLExpr
  , VCLTee.Series, Vcl.Menus
  ;

type
  TFrmGrafico = class(TForm)
    cdbPilotoIdade: TChart;
    Series1: TPieSeries;
    ppTipoGrafico: TPopupMenu;
    miPizza: TMenuItem;
    miBarras: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miPizzaClick(Sender: TObject);
    procedure miBarrasClick(Sender: TObject);
  private
    FSeriesAtual: TChartSeries;
    procedure CarregaSeries(const Series: TChartSeries);
  end;

implementation

uses
    UDM
  , UPiloto
  , URepositorioPiloto
  , DateUtils
  ;

{$R *.dfm}

procedure TFrmGrafico.CarregaSeries(const Series: TChartSeries);
var
  PILOTO: TPILOTO;
  FRepositorioPiloto: TRepositorioPiloto;
begin
  FRepositorioPiloto := TRepositorioPiloto.Create;
  try
    Series.Clear;
    Series.LegendTitle := 'Piloto';

    for PILOTO in FRepositorioPiloto.RetornaTodos do
    begin
      Series.Add(YearsBetween(PILOTO.DATA_NASCIMENTO, now), PILOTO.NOME);
    end;

  finally
    FreeAndNil(FRepositorioPiloto);
  end;
end;

procedure TFrmGrafico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmGrafico.FormShow(Sender: TObject);
begin
  miBarras.Click;
end;

procedure TFrmGrafico.miBarrasClick(Sender: TObject);
begin
  cdbPilotoIdade.RemoveAllSeries;

  FSeriesAtual := cdbPilotoIdade.AddSeries(TBarSeries);
  CarregaSeries(FSeriesAtual);
end;

procedure TFrmGrafico.miPizzaClick(Sender: TObject);
begin
  cdbPilotoIdade.RemoveAllSeries;

  FSeriesAtual := cdbPilotoIdade.AddSeries(TPieSeries);
  CarregaSeries(FSeriesAtual);
end;

end.
