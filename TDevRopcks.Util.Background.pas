unit TDevRopcks.Util.Background;

interface

uses
  FMX.Objects,
  FMX.Types,
  System.UITypes,
  System.Classes;

type
  TBackground = class
    private
      class var
        FBackground    : TRectangle;
        FActionPosHide : TNotifyEvent;
      class procedure Click(Sender: TObject);
    public
      class procedure Show(AParent: TFMXObject; const AActionPosHide: TNotifyEvent = nil);
      class procedure Hide;
  end;

implementation

{ TBackuground }

class procedure TBackground.Click(Sender: TObject);
begin
  if Assigned(FActionPosHide) then
    FActionPosHide(Sender);

  Hide;
end;

class procedure TBackground.Hide;
begin
  if Assigned(FBackground) then
  begin
    FBackground.AnimateFloat('OPACITY', 0);
    FBackground.Visible := False;

    FBackground.DisposeOf;
    FBackground := nil;
  end;
end;

class procedure TBackground.Show(AParent: TFMXObject; const AActionPosHide: TNotifyEvent);
begin
  FBackground            := TRectangle.Create(nil);
  FBackground.Parent     := AParent; //Application.MainForm;
  FBackground.Fill.Color := TAlphaColorRec.Black;
  FBackground.Opacity    := 0.0;
  FBackground.Visible    := True;
  FBackground.Align      := TAlignLayout.Contents;

  if Assigned(AActionPosHide) then
    FActionPosHide := AActionPosHide;

  FBackground.OnClick := Click;

  FBackground.BringToFront;
  FBackground.AnimateFloat('OPACITY', 0.4);
end;

end.
