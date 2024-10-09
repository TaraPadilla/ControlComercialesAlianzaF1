program ControlWorkana;

uses
  Vcl.Forms,
  VistaFormulario in 'VistaFormulario.pas' {VistaF},
  ControlWorkanaModel in 'ControlWorkanaModel.pas',
  ControlWorkanaController in 'ControlWorkanaController.pas',
  ufrmDatosProyecto in 'ufrmDatosProyecto.pas' {frmDatosProyecto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TVistaF, VistaF);
  Application.CreateForm(TfrmDatosProyecto, frmDatosProyecto);
  Application.Run;
end.
