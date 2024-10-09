unit ufrmDatosProyecto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmDatosProyecto = class(TForm)
    Panel1: TPanel;
    edLink: TLabeledEdit;
    mmObservaciones: TMemo;
    Button1: TButton;
    edPresupuesto: TLabeledEdit;
    edTiempo: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatosProyecto: TfrmDatosProyecto;

implementation

{$R *.dfm}

end.
