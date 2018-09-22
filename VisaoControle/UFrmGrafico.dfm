object FrmGrafico: TFrmGrafico
  Left = 0
  Top = 0
  Caption = 'FrmGrafico'
  ClientHeight = 629
  ClientWidth = 877
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cdbPilotoIdade: TChart
    Left = 0
    Top = 0
    Width = 877
    Height = 629
    Title.Text.Strings = (
      'Piloto x Idade')
    Chart3DPercent = 21
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DOptions.Zoom = 97
    Align = alClient
    PopupMenu = ppTipoGrafico
    TabOrder = 0
    ExplicitHeight = 353
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      14
      15
      14)
    ColorPaletteIndex = 13
    object Series1: TPieSeries
      Marks.Callout.Length = 20
      SeriesColor = 12615680
      Title = 'Piloto x Idade'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      Data = {
        0602000000000000000000394000404000FF1000000053656261737469616E20
        56657474656C0000000000804940FF804000FF0A000000536368756D61636865
        72}
      Detail = {0000000000}
    end
  end
  object ppTipoGrafico: TPopupMenu
    Left = 664
    Top = 48
    object miPizza: TMenuItem
      Caption = 'Pizza'
      OnClick = miPizzaClick
    end
    object miBarras: TMenuItem
      Caption = 'Barras'
      OnClick = miBarrasClick
    end
  end
end
