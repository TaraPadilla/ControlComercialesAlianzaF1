object frmDatosProyecto: TfrmDatosProyecto
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Confirma Datos'
  ClientHeight = 444
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 444
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 224
    ExplicitWidth = 185
    ExplicitHeight = 41
    object edLink: TLabeledEdit
      Left = 48
      Top = 115
      Width = 337
      Height = 36
      EditLabel.Width = 35
      EditLabel.Height = 28
      EditLabel.Caption = 'Link'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -20
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImeName = 'US'
      ParentFont = False
      TabOrder = 0
      Text = ''
    end
    object mmObservaciones: TMemo
      Left = 48
      Top = 249
      Width = 337
      Height = 89
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Button1: TButton
      Left = 150
      Top = 368
      Width = 107
      Height = 33
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 2
    end
    object edPresupuesto: TLabeledEdit
      Left = 48
      Top = 48
      Width = 337
      Height = 36
      EditLabel.Width = 107
      EditLabel.Height = 28
      EditLabel.Caption = 'Presupuesto'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -20
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = ''
    end
    object edTiempo: TLabeledEdit
      Left = 48
      Top = 182
      Width = 337
      Height = 36
      EditLabel.Width = 152
      EditLabel.Height = 28
      EditLabel.Caption = 'Tiempo Estimado'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -20
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImeName = 'US'
      ParentFont = False
      TabOrder = 4
      Text = ''
    end
  end
end
