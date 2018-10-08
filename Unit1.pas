unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure EsconderPopup(Sender: TObject);
    procedure MostrarPopup;
  end;

var
  Form1: TForm1;

implementation

uses
  TDevRopcks.Util.Background;

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  TBackground.Hide;
  EsconderPopup(Sender);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TBackground.Show(Application.MainForm, EsconderPopup);
  MostrarPopup;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  TBackground.Show(Application.MainForm);
  MostrarPopup;
end;

procedure TForm1.EsconderPopup(Sender: TObject);
begin
  //
  Layout1.Visible := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Layout1.Visible := False;
end;

procedure TForm1.MostrarPopup;
begin
  Layout1.Visible := True;
  Layout1.Align := TAlignLayout.Center;
  Layout1.BringToFront;
end;

end.
