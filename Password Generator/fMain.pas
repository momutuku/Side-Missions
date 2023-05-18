unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ClipBrd, Vcl.Buttons,
  Vcl.NumberBox, uTheme, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    edPassword: TEdit;
    Button1: TButton;
    chUpper: TCheckBox;
    cbLower: TCheckBox;
    cbChar: TCheckBox;
    Label1: TLabel;
    cbNumbers: TCheckBox;
    SpeedButton1: TSpeedButton;
    nbPassLength: TEdit;
    lblLength: TLabel;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnDark: TImage;
    btnLight: TImage;

    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    gincluded: array of Integer;
    lower_letters, upper_letters, characters, numbers: array of char;
    TThemer: TTheme;
    function getChar(arr: Integer): char;
    procedure checkIncludes;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  i, lPosition, lv: Integer;
  lPass: String;
begin
  checkIncludes;
  // Generate the actual password
  if StrToInt(nbPassLength.text) < 10 then
  begin
    showMessage('Length should be more that 10');
    exit;
  end;

  for i := 0 to StrToInt(nbPassLength.text) - 1 do
  begin
    lv := Length(gincluded);
    lPosition := gincluded[Random(lv)];
    lPass := lPass + getChar(lPosition);

  end;
  edPassword.text := lPass;
  lblLength.color := clWhite;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  TThemer := TTheme.Create;
  numbers := ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  lower_letters := ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
    'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
  upper_letters := ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
    'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
  characters := ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+',
    '=', ')', ',', '<', '.', '>', '?', '/', ';', ':', '"', '\', '|', '`', '~'];
end;

function TForm2.getChar(arr: Integer): char;
begin
  case arr of

    0:
      begin
        Result := upper_letters[Random(Length(upper_letters))];
      end;
    1:
      begin
        Result := numbers[Random(Length(numbers))];
      end;
    2:
      begin
        Result := characters[Random(Length(characters))];
      end;
    3:
      begin
        Result := lower_letters[Random(Length(lower_letters))];
      end;
  end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  Clipboard.AsText := edPassword.text;
end;

procedure TForm2.Button2Click(Sender: TObject);

begin

  TThemer.changeTheme;
  Form2.color := TThemer.WindowColor;
  Label1.Font.color := TThemer.TextColor;
  lblLength.Font.color := TThemer.TextColor;
  Label1.color := TThemer.TextColor;
  Label2.Font.color := TThemer.TextColor;
  Label3.Font.color := TThemer.TextColor;
  Label4.Font.color := TThemer.TextColor;
  Label5.Font.color := TThemer.TextColor;
  nbPassLength.Font.color := TThemer.TextColor;
  btnLight.Visible := not btnLight.Visible;
  btnDark.Visible := not btnDark.Visible;
end;

procedure TForm2.checkIncludes;
begin
  gincluded := [];
  if chUpper.Checked then
    gincluded := gincluded + [0];
  if cbNumbers.Checked then
    gincluded := gincluded + [1];
  if cbChar.Checked then
    gincluded := gincluded + [2];
  if cbLower.Checked then
    gincluded := gincluded + [3];
end;

end.
