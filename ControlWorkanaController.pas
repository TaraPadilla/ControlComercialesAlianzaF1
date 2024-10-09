unit ControlWorkanaController;

interface

uses
  System.SysUtils, System.Classes, ControlWorkanaModel, Vcl.ExtCtrls, System.DateUtils;

type
  TControlWorkanaController = class
  private
    FModel: TControlWorkanaModel;
    FTimer: TTimer;
    FStartTime: TDateTime;
    FElapsedTime: TDateTime;
  public
    constructor Create(AModel: TControlWorkanaModel);
    procedure StartTimer;
    procedure StopTimer;
    procedure ResetTimer;
    procedure OnTimer(Sender: TObject);
    procedure FinAnalisis;
    class function GetAppPath: string;
  end;

implementation

uses
  VistaFormulario, ufrmDatosProyecto, Vcl.Controls;

constructor TControlWorkanaController.Create(AModel: TControlWorkanaModel);
begin
  FModel := AModel;
  FTimer := TTimer.Create(nil);
  FTimer.Interval := 1000;  // Temporizador de 1 segundo
  FTimer.OnTimer := OnTimer;
end;

procedure TControlWorkanaController.StartTimer;
begin
  FStartTime := Now;
  FTimer.Enabled := True;
end;

procedure TControlWorkanaController.StopTimer;
begin
  FTimer.Enabled := False;
end;

procedure TControlWorkanaController.ResetTimer;
begin
  FElapsedTime := 0;
  FStartTime := 0;
end;


procedure TControlWorkanaController.FinAnalisis;
var
  TotalSeconds, MinutesSpent, SecondsSpent: Integer;
  TimeSpentFormatted: string;
   PresupuestoEnviado, TiempoEstimado, Link, Observaciones: string;
begin
    // Calculamos el total de segundos transcurridos
    TotalSeconds := SecondsBetween(FStartTime, Now);
    // Obtenemos los minutos y segundos
    MinutesSpent := TotalSeconds div 60;
    SecondsSpent := TotalSeconds mod 60;
    // Formateamos el tiempo como "minutos:segundos"
    TimeSpentFormatted := Format('%d:%2.2d', [MinutesSpent, SecondsSpent]);

     // Le pasamos los datos al modelo
     if Assigned(VistaF) then
     begin
      FModel.SetItemName(VistaF.edNombre.Text);
      FModel.SetTimeSpent(TimeSpentFormatted); // Solo pasamos los minutos ya calculados
      FModel.SetPais(VistaF.edPais.Text);
      FModel.SetCliente(VistaF.edCliente.Text);
      FModel.SetPresupuesto(VistaF.edPresupuesto.Text);

          // Obtener los valores ingresados en el formulario modal
      PresupuestoEnviado := frmDatosProyecto.edPresupuesto.Text;
      TiempoEstimado := frmDatosProyecto.edTiempo.Text;
      Link := frmDatosProyecto.edLink.Text;
      Observaciones := frmDatosProyecto.mmObservaciones.Text;

      // Configurar los valores adicionales en el modelo
      FModel.SetPresupuestoEnviado(PresupuestoEnviado);
      FModel.SetTiempoEstimado(TiempoEstimado);
      FModel.SetLink(Link);
      FModel.SetObservaciones(Observaciones);

      FModel.SaveToFile;

    end;
end;


class function TControlWorkanaController.GetAppPath: string;
begin
  Result := ExtractFilePath(ParamStr(0))
end;

procedure TControlWorkanaController.OnTimer(Sender: TObject);
begin
  FElapsedTime := Now - FStartTime;
  // Aquí actualizamos la vista con el tiempo transcurrido en el formato HH:MM:SS
  VistaF.LabelTime.Caption := FormatDateTime('hh:nn:ss', FElapsedTime);
end;

end.

