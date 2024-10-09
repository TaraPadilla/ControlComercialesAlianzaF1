unit VistaFormulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  ControlWorkanaController, ControlWorkanaModel, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ButtonGroup, System.Win.ComObj, System.Generics.Collections, Vcl.Clipbrd;

type
  TVistaF = class(TForm)
    panelDatos: TPanel;
    btnStart: TButton;
    btnStop: TButton;
    btnReset: TButton;
    Panel1: TPanel;
    edNombre: TLabeledEdit;
    edPais: TLabeledEdit;
    edCliente: TLabeledEdit;
    edPresupuesto: TLabeledEdit;
    mmEstatico: TMemo;
    tabContador: TTabSheet;
    Panel2: TPanel;
    tabAcciones: TTabSheet;
    Panel3: TPanel;
    mmDinamico: TMemo;
    mmProyecto: TMemo;
    btnGroup: TButtonGroup;
    LabelTime: TLabel;
    PageControl1: TPageControl;
    Panel4: TPanel;
    Panel5: TPanel;
    btViable: TButton;
    btFinAnalisis: TButton;
    Panel6: TPanel;
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnGroupButtonClicked(Sender: TObject; Index: Integer);
    procedure btViableClick(Sender: TObject);
    procedure btFinAnalisisClick(Sender: TObject);
    procedure mmDinamicoClick(Sender: TObject);
  private
    { Private declarations }
    FController: TControlWorkanaController;
    FModel: TControlWorkanaModel;
  public
    { Public declarations }
     procedure InitializeMVC;
     procedure ReiniciarFormulario;
  end;

var
  VistaF: TVistaF;

implementation

uses
  ufrmDatosProyecto;
  var gStart: Boolean;
  var   ButtonStates: TList<Boolean>;


{$R *.dfm}

{ TForm1 }

procedure TVistaF.btFinAnalisisClick(Sender: TObject);
var PresupuestoEnviado, TiempoEstimado, Link, Observaciones: string;
begin
  if gStart then
  begin
    // Mostrar el formulario modal para capturar la información adicional
    if frmDatosProyecto.ShowModal = mrOk then
    begin
    // Invocar el método del controlador para finalizar el análisis
      FController.FinAnalisis;
      FController.StopTimer;
      LabelTime.Caption := 'Proyecto guardado';
      ReiniciarFormulario;
      ShowMessage('Felicidades proyecto guardado, continua tus analisis.')
    end;
  end;
end;

procedure TVistaF.btnGroupButtonClicked(Sender: TObject; Index: Integer);
var
  ExcelApp, WorkBook, Sheet: Variant;
  RowIndex: Integer;
  TextFromExcel: string;
  FilePath: string;
begin
  // Determinamos la fila en base al índice del botón (+1 porque las filas empiezan desde 1)
  RowIndex := Index+1;
  FilePath := TControlWorkanaController.GetAppPath + 'TextosParaWorkana.xlsx'; // Ruta absoluta generada
  try
    // Crear instancia de Excel
    ExcelApp := CreateOleObject('Excel.Application');
    WorkBook := ExcelApp.Workbooks.Open(FilePath);
    Sheet := WorkBook.Worksheets[1]; // Suponemos que estamos trabajando en la primera hoja
    // Obtenemos el texto de la columna 2 (la columna 1 puede ser un ID o algo similar)
    TextFromExcel := Sheet.Cells[RowIndex, 3].Value;
    // Asignar el texto al Memo después de obtenerlo del Excel
    mmDinamico.Text := TextFromExcel;
    // Hacemos el reemplazo del texto
    case RowIndex of
       2:  begin
         mmDinamico.Text := StringReplace(TextFromExcel, 'XXX', mmProyecto.Text, [rfReplaceAll, rfIgnoreCase]);
       end;
       6,7,8: begin
         TextFromExcel := StringReplace(TextFromExcel, 'XXX', edCliente.Text, [rfReplaceAll, rfIgnoreCase]);         mmDinamico.Text := StringReplace(TextFromExcel, 'XX', edCliente.Text, [rfReplaceAll, rfIgnoreCase]);
         TextFromExcel := StringReplace(TextFromExcel, 'YYY', edPais.Text, [rfReplaceAll, rfIgnoreCase]);
         mmDinamico.Text := TextFromExcel;
       end;
    end;
    // Cerrar el archivo de Excel
    WorkBook.Close(False);
  finally
    ExcelApp.Quit; // Asegurarse de cerrar la aplicación de Excel
  end;
end;

procedure TVistaF.btnResetClick(Sender: TObject);
begin
  FController.ResetTimer;
  LabelTime.Caption := '00:00:00';
  if gStart then
    if MessageDlg('¿Está seguro de que desea reiniciar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      // Coloca aquí el código para reiniciar el formulario
      ReiniciarFormulario;
    end;
end;

procedure TVistaF.btnStartClick(Sender: TObject);
begin
  if gStart then Exit;

  if (edNombre.Text = '') or
     (edPais.Text = '') or
     (edCliente.Text = '') or
     (edPresupuesto.Text = '')
  then
  begin
    ShowMessage('Por favor, completa todos los campos.');
    Exit;
  end;

  gStart := True;
  PageControl1.ActivePageIndex := 1;

  // Iniciar el temporizador a través del controlador
  FController.StartTimer;
end;


procedure TVistaF.btnStopClick(Sender: TObject);
begin
  if gStart then
  begin
    FController.StopTimer;
    if frmDatosProyecto.ShowModal = mrOk then
    begin
      FController.FinAnalisis;
      LabelTime.Caption := 'Proyecto guardado';
      ReiniciarFormulario;
    end;
  end;
end;


procedure TVistaF.btViableClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TVistaF.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('¿Está seguro de que desea cerrar la aplicación?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    CanClose := False
  else
    CanClose := True;
end;

procedure TVistaF.FormCreate(Sender: TObject);
begin
  //Self.FormStyle := fsStayOnTop;
  InitializeMVC;
  ReiniciarFormulario;
end;

procedure TVistaF.InitializeMVC;
begin
  FModel := TControlWorkanaModel.Create;
  FController := TControlWorkanaController.Create(FModel);
end;

procedure TVistaF.mmDinamicoClick(Sender: TObject);
begin
  Clipboard.AsText := mmDinamico.Text;
end;

procedure TVistaF.ReiniciarFormulario;
begin
  // Aquí se resetean los campos del formulario a su estado inicial
  edNombre.Clear;
  edPais.Clear;
  edCliente.Clear;
  edPresupuesto.Clear;
  gStart := False;
  mmProyecto.Clear;

  with frmDatosProyecto do
  begin
    if Assigned(frmDatosProyecto) then
    begin
      edPresupuesto.Clear;
      edTiempo.Clear;
      edLink.Clear;
      mmObservaciones.Clear;
    end;
  end;


end;

end.
