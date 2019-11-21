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
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    Panel1: TPanel;
    Shape1: TShape;
    TimeEdit1: TTimeEdit;
    TimeEdit2: TTimeEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TimeEdit1Change(Sender: TObject);
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
  scierzka:  String;
begin
  scierzka:=Edit1.Text+Edit2.Text;
  AssignFile(TF, scierzka);

  try
    Append(TF);
    Write(TF, DateEdit1.Text+','+TimeEdit1.Text   +','+ ComboBox1.Text+','
                +'zglaszajacy' +','+ComboBox2.Text+',');
  finally
    CloseFile(TF);
    Shape1.Brush.Color:=$007070FE;
    Button2.Enabled:=true;
    Button1.Enabled:=false;
    Memo1.Lines.LoadFromFile(scierzka);
  end;

   end;

procedure TForm1.Button2Click(Sender: TObject);
var
  TF : TextFile;
 scierzka:String;
begin
   scierzka:=Edit1.Text+Edit2.Text;
  AssignFile(TF, scierzka);
  try
    Append(TF);
    Write(TF, DateEdit2.Text+','+TimeEdit2.Text   +','+ ComboBox3.Text+','
              +'naprawiający' +','+ComboBox4.Text+#13);
  finally
    CloseFile(TF);
 Shape1.Brush.Color:= $0072FCB7  ;
  Button1.Enabled:=true;
  Button2.Enabled:=false;
  Memo1.Lines.LoadFromFile(scierzka);
  end;

  end;

procedure TForm1.FormActivate(Sender: TObject);
//var
//  TF : TextFile;
// scierzka:String;
begin
  // scierzka:=Edit1.Text+Edit2.Text;
  //AssignFile(TF, scierzka);
  //try
  //  Append(TF);
  //
  //finally
  //  CloseFile(TF);
end;

procedure TForm1.TimeEdit1Change(Sender: TObject);
begin

end;

end.

