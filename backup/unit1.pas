unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, EditBtn, StdCtrls, ExtCtrls;

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
    Memo1: TMemo;
    Shape1: TShape;
    Shape2: TShape;
    TimeEdit1: TTimeEdit;
    TimeEdit2: TTimeEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  AssignFile(TF, 'C:\temp\plik_awarii.txt');

  try
    Append(TF);
    Write(TF, DateEdit1.Text+','+TimeEdit1.Text   +','+ ComboBox1.Text+','+'zglaszajacy' +','+ComboBox2.Text+',');
  finally
    CloseFile(TF);
  end;

   end;

procedure TForm1.Button2Click(Sender: TObject);
var
  TF : TextFile;
  linijka:Integer;
begin
  AssignFile(TF, 'C:\temp\plik_awarii.txt');

  try
    Append(TF);
    Write(TF, DateEdit1.Text+','+TimeEdit1.Text   +','+ ComboBox1.Text+','+'naprawiający' +','+ComboBox2.Text+#13);
  finally
    CloseFile(TF);
 linijka:=  Memo1.Lines.Count;
 Memo1.Lines.Add(inttostr(linijka));
 // Memo1.Lines.LoadFromFile('C:\temp\plik_awarii.txt');

  end;

  end;

end.

