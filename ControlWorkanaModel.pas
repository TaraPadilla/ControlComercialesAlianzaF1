unit ControlWorkanaModel;

interface

uses
  System.SysUtils, System.Classes, Vcl.Dialogs;

type
  TControlWorkanaModel = class
  private
    FItemName: string;
    FTimeSpent:string;
    FPais: string;
    FCliente: string;
    FPresupuesto: string;
    FPresupuestoEnviado: string;
    FTiempoEstimado: string;
    FLink: string;
    FObservaciones: string;
  public
    procedure SetItemName(const AItemName: string);
    procedure SetTimeSpent(const ATimeSpent: string);
    procedure SetPais(const APais: string);
    procedure SetCliente(const ACliente: string);
    procedure SetPresupuesto(const APresupuesto: string);
    procedure SetPresupuestoEnviado(const APresupuestoEnviado: string);
    procedure SetTiempoEstimado(const ATiempoEstimado: string);
    procedure SetLink(const ALink: string);
    procedure SetObservaciones(const AObservaciones: string);
    procedure SaveToFile;
  end;

implementation

uses
  ControlWorkanaController;


procedure TControlWorkanaModel.SetCliente(const ACliente: string);
begin
   FCliente := ACliente;
end;

procedure TControlWorkanaModel.SetItemName(const AItemName: string);
begin
  FItemName := AItemName;
end;

procedure TControlWorkanaModel.SetLink(const ALink: string);
begin
  FLink := ALink;
end;

procedure TControlWorkanaModel.SetObservaciones(const AObservaciones: string);
begin
  FObservaciones := AObservaciones;
end;

procedure TControlWorkanaModel.SetPais(const APais: string);
begin
  FPais := APais;
end;

procedure TControlWorkanaModel.SetPresupuesto(const APresupuesto: string);
begin
  FPresupuesto := APresupuesto;
end;

procedure TControlWorkanaModel.SetPresupuestoEnviado(
  const APresupuestoEnviado: string);
begin
  FPresupuestoEnviado := APresupuestoEnviado;
end;

procedure TControlWorkanaModel.SetTiempoEstimado(const ATiempoEstimado: string);
begin
  FTiempoEstimado := ATiempoEstimado;
end;

procedure TControlWorkanaModel.SetTimeSpent(const ATimeSpent: string);
begin
  FTimeSpent := ATimeSpent;
end;

procedure TControlWorkanaModel.SaveToFile;
var
  FileHandle: TextFile;
  LineToWrite, DateTimeStr, FilePath, HeaderLine: string;
  FileExistsFlag: Boolean;
begin
  FilePath := TControlWorkanaController.GetAppPath + 'ControlTiempos.csv';
  HeaderLine := 'Fecha, Proyecto, Cliente, Pais, Presupuesto,Tiempo de Analisis, Valor real, Tiempo real, Link, Notas'; // Encabezados que deseas agregar
  FileExistsFlag := FileExists(FilePath);

  AssignFile(FileHandle, FilePath);

  // Abrir o crear el archivo y escribir los datos.
  if FileExistsFlag then
    Append(FileHandle) // Si el archivo ya existe, abre en modo Append para agregar datos
  else
  begin
    Rewrite(FileHandle); // Si no existe, lo crea desde cero
    Writeln(FileHandle, HeaderLine); // Escribe los encabezados
  end;

  // Obtener la fecha y la hora actual
  DateTimeStr := DateTimeToStr(Now);

  try
    // Construir la línea a escribir separada por comas (agregando nuevas columnas)
    LineToWrite := Format('%s, %s, %s, %s, %s, %s, %s, %s, %s, %s',
                          [DateTimeStr, FItemName, FCliente, FPais, FPresupuesto,
                           FTimeSpent, FPresupuestoEnviado, FTiempoEstimado, FLink, FObservaciones]);

    // Escribir la línea en el archivo
    WriteLn(FileHandle, LineToWrite);
  finally
    CloseFile(FileHandle);
  end;
end;



end.

