object VistaF: TVistaF
  Left = 433
  Top = 191
  Caption = 'Control de Workana'
  ClientHeight = 546
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 546
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 0
    ExplicitWidth = 934
    ExplicitHeight = 542
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 673
      Height = 546
      ActivePage = tabAcciones
      Align = alClient
      MultiLine = True
      TabHeight = 20
      TabOrder = 0
      TabWidth = 100
      ExplicitWidth = 934
      ExplicitHeight = 542
      object tabContador: TTabSheet
        Caption = 'Control'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 665
          Height = 210
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 936
          ExplicitHeight = 224
          object LabelTime: TLabel
            Left = 368
            Top = 184
            Width = 54
            Height = 15
            Caption = 'LabelTime'
          end
          object edNombre: TLabeledEdit
            Left = 32
            Top = 48
            Width = 300
            Height = 36
            EditLabel.Width = 94
            EditLabel.Height = 15
            EditLabel.Caption = 'Nombre Proyecto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = ''
          end
          object edPais: TLabeledEdit
            Left = 456
            Top = 130
            Width = 300
            Height = 36
            EditLabel.Width = 21
            EditLabel.Height = 15
            EditLabel.Caption = 'Pais'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = ''
          end
          object edCliente: TLabeledEdit
            Left = 456
            Top = 48
            Width = 300
            Height = 36
            EditLabel.Width = 84
            EditLabel.Height = 15
            EditLabel.Caption = 'Nombre Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = ''
          end
          object edPresupuesto: TLabeledEdit
            Left = 32
            Top = 130
            Width = 300
            Height = 36
            EditLabel.Width = 65
            EditLabel.Height = 15
            EditLabel.Caption = 'Presupuesto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Text = ''
          end
          object mmEstatico: TMemo
            Left = 560
            Top = 343
            Width = 225
            Height = 89
            Lines.Strings = (
              'Realiza un detalle de la propuesta con '
              'tres parrafos no densos,nunca uses '
              'negrilla o bold en las respuestas, captar '
              'la '
              'atencion diciendo que soy la mejor con '
              'tres razones con otras palabras, agregue '
              'generalidades tecnicas discutidas o '
              'necesarias. '
              'Di que revise la pagina (si aplica) y '
              'muestra interes. Debe generar una '
              'accion '
              'inmmediata: decirle que programemos '
              'una videollamada por la palataform o '
              'me '
              'escriba en el chat para aclarar dudas, '
              'definir alcances y  llegar a un acuerdo '
              'comercial.  '
              'Enfocate en que lo que necesita el '
              'cliente, Lenguaje natural que no parezca '
              'IA, profesional tecnico y formal,'
              'Usa estrategias de marketing y marca '
              'personal para atraer al cliente '
              'engagement.'
              'Dile que revise mi perfil. Demuestra '
              'mentalidad positiva y emprendedora, '
              'agrega compromiso con los tiempos de '
              'entrega y uso de scrum.'
              'Saluda diciendo Cordial saludo XXX y '
              'despidete como Tara Campos Ingeniera '
              'de desarrollo. '
              'El cliente esta en YYY , ajusta si es '
              'necesario cultural o dialecticamente.')
            TabOrder = 4
            Visible = False
          end
        end
        object panelDatos: TPanel
          Left = 0
          Top = 210
          Width = 665
          Height = 306
          Align = alBottom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ExplicitTop = 224
          ExplicitWidth = 936
          object btnStart: TButton
            Left = 88
            Top = 6
            Width = 185
            Height = 33
            Caption = 'Start'
            TabOrder = 0
            OnClick = btnStartClick
          end
          object btnStop: TButton
            Left = 291
            Top = 6
            Width = 185
            Height = 33
            Caption = 'Stop'
            TabOrder = 1
            OnClick = btnStopClick
          end
          object btnReset: TButton
            Left = 490
            Top = 6
            Width = 185
            Height = 33
            Caption = 'Reset'
            TabOrder = 2
            OnClick = btnResetClick
          end
        end
      end
      object tabAcciones: TTabSheet
        Caption = 'Viabilidad'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 665
          Height = 516
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 926
          ExplicitHeight = 512
          object Panel4: TPanel
            Left = 1
            Top = 1
            Width = 224
            Height = 514
            Align = alLeft
            Caption = 'Panel4'
            TabOrder = 0
            ExplicitHeight = 510
            object btnGroup: TButtonGroup
              Left = 1
              Top = 1
              Width = 222
              Height = 448
              Align = alTop
              BevelOuter = bvRaised
              BorderWidth = 3
              ButtonHeight = 30
              ButtonWidth = 50
              ButtonOptions = [gboFullSize, gboGroupStyle, gboShowCaptions]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Segoe UI'
              Font.Style = []
              Items = <
                item
                  Caption = 'Iniciar'
                end
                item
                  Caption = 'Viabilidad'
                end
                item
                  Caption = 'Objetivos'
                end
                item
                  Caption = 'Lista de tareas'
                end
                item
                  Caption = 'Listado de Precios'
                end
                item
                  Caption = 'Presupuesto OK'
                end
                item
                  Caption = 'Presupuesto Fallido'
                end
                item
                  Caption = 'Dudas'
                end
                item
                  Caption = 'Disponibilidad'
                end
                item
                  Caption = 'Tiempo estimado'
                end
                item
                  Caption = 'Experiencia'
                end
                item
                  Caption = 'Necesidades'
                end
                item
                  Caption = 'Oferta de Valor'
                end>
              TabOrder = 0
              OnButtonClicked = btnGroupButtonClicked
            end
          end
          object Panel5: TPanel
            Left = 225
            Top = 1
            Width = 439
            Height = 514
            Align = alClient
            Anchors = [akRight, akBottom]
            Caption = 'Panel5'
            TabOrder = 1
            ExplicitWidth = 799
            ExplicitHeight = 528
            DesignSize = (
              439
              514)
            object mmProyecto: TMemo
              Left = 24
              Top = 24
              Width = 349
              Height = 139
              Anchors = [akLeft, akTop, akRight, akBottom]
              Lines.Strings = (
                '')
              TabOrder = 0
              ExplicitWidth = 713
              ExplicitHeight = 153
            end
            object mmDinamico: TMemo
              Left = 20
              Top = 200
              Width = 349
              Height = 219
              Anchors = [akLeft, akRight]
              Lines.Strings = (
                'Revisa la viabilidad del siguiente proyecto, que presenta una '
                'empresa para que desarrollemos. Necesito saber '
                'si es viable t'#233'cnica y econ'#243'micamente, considerando las '
                'herramientas y recursos que manejamos, y si es '
                'factible implementarlo sin complicaciones innecesarias: Extrae '
                'primero las generalidades u objetivos tecnicos '
                'y de modelo de negocio: ')
              TabOrder = 1
              OnClick = mmDinamicoClick
              ExplicitWidth = 713
            end
            object Panel6: TPanel
              Left = 1
              Top = 455
              Width = 437
              Height = 58
              Align = alBottom
              TabOrder = 2
              object btFinAnalisis: TButton
                Left = 220
                Top = 16
                Width = 113
                Height = 25
                Caption = 'Fin Analisis'
                TabOrder = 0
                OnClick = btFinAnalisisClick
              end
              object btViable: TButton
                Left = 96
                Top = 16
                Width = 97
                Height = 25
                Caption = 'Iniciar Analisis'
                TabOrder = 1
                OnClick = btViableClick
              end
            end
          end
        end
      end
    end
  end
end
