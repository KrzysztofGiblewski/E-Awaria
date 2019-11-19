unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, EditBtn,
  StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Shape1: TShape;
    Shape2: TShape;
    TimeEdit1: TTimeEdit;
    TimeEdit2: TTimeEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  TF : TextFile;
begin
  AssignFile(TF, 'C:\temp\plik.txt');

  try
    Append(TF);
    Writeln(TF, DateEdit1.Text +' '+ TimeEdit1.Text   +' '+ ComboBox1.Text+' zglaszajacy '+ComboBox2.Text);
  finally
    CloseFile(TF);
  end;

   end;

end.

