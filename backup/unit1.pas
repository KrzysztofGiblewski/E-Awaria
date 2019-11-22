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

  private

  public

  end;

var
  Form1: TForm1;

  TxtLista ,TxtSprawdz: TextFile;
 scierzka, scierzkaKontrolki,kontrolkaString , tempowaty:String;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
begin
  scierzka:=Edit1.Text+Edit2.Text;
  scierzkaKontrolki:=Edit1.Text+'kontrolka.txt';
  AssignFile(TxtLista, scierzka);

  try
    Append(TxtLista);
    Write(TxtLista, DateEdit1.Text+','+TimeEdit1.Text   +','+ ComboBox1.Text+','
                +'zglaszajacy' +','+ComboBox2.Text+',');
  finally
    CloseFile(TxtLista);
    Shape1.Brush.Color:=$007070FE;
    Button2.Enabled:=true;
    Button1.Enabled:=false;
    Memo1.Lines.LoadFromFile(scierzka);
  end;
 ///////////

  begin
  AssignFile(TxtSprawdz, scierzkaKontrolki);
  try
    Rewrite(TxtSprawdz);
    Write(TxtSprawdz,'a');

  finally
    CloseFile(TxtSprawdz);
end;
 //////////////



end;
  end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   scierzka:=Edit1.Text+Edit2.Text;
  AssignFile(TxtLista, scierzka);
  try
    Append(TxtLista);
    Write(TxtLista, DateEdit2.Text+','+TimeEdit2.Text   +','+ ComboBox3.Text+','
              +'naprawiający' +','+ComboBox4.Text+#13);
  finally
    CloseFile(TxtLista);
 Shape1.Brush.Color:= $0072FCB7  ;
  Button1.Enabled:=true;
  Button2.Enabled:=false;
  Memo1.Lines.LoadFromFile(scierzka);
  end;
   ///////////

  begin
  AssignFile(TxtSprawdz, scierzkaKontrolki);
  try
    Rewrite(TxtSprawdz);
    Write(TxtSprawdz,'s');

  finally
    CloseFile(TxtSprawdz);
end;
 //////////////


 end;
  end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  scierzka:=Edit1.Text+Edit2.Text;
  AssignFile(TxtLista, scierzka);
  try
    Append(TxtLista);

  finally
    CloseFile(TxtLista);
end;
  Memo1.Lines.LoadFromFile(scierzka);
    scierzkaKontrolki:=Edit1.Text+'kontrolka.txt';

  begin
  AssignFile(TxtSprawdz, scierzkaKontrolki);
  try
    Reset(TxtSprawdz);
   ReadLn(TxtSprawdz,kontrolkaString);
   if(kontrolkaString.Equals('a'))then
   begin
   showmessage('awaria');
   Shape1.Brush.Color:=$007070FE;
    Button2.Enabled:=true;
    Button1.Enabled:=false;


   end;
      if(kontrolkaString.Equals('s'))then
      begin
   showmessage('sprawna');
   Shape1.Brush.Color:= $0072FCB7  ;
  Button1.Enabled:=true;
  Button2.Enabled:=false;

      end;


  finally
    CloseFile(TxtSprawdz);
end;
  end;
    end;


end.

