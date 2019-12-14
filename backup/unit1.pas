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
    Button10: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    TimeEdit1: TTimeEdit;
    TimeEdit2: TTimeEdit;
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
        procedure wypelnij(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

  TxtLista, TxtSprawdz, TxtAwaria: TextFile;
  scierzka, scierzkaKontrolki, scierzkaAwarii, kontrolkaString,
  tempowaty, stringolik, stringMaszyna , awariaString, logoawariowe ,uwagiAwari, uwagiNaprawy: string;

implementation

{$R *.lfm}

{ TForm1 }

 //ZGLOSZENIE
procedure TForm1.Button1Click(Sender: TObject);  //przycisk zgloszenia awarii
var odpowiedz:integer;
begin
  odpowiedz:= Application.MessageBox('Potwierdz zgloszenie', 'Zglos awarie',1);
  if odpowiedz=1 then
  begin
  scierzka := Edit1.Text + Edit2.Text;
  scierzkaKontrolki := Edit1.Text + Edit3.Text;
  AssignFile(TxtLista, scierzka);


  try
    Append(TxtLista);

    stringolik := ComboBox1.Text;
    tempowaty := ComboBox2.Text;
    stringMaszyna :=ComboBox5.Text;

    stringolik := stringolik.Replace(',', '.');
    tempowaty := tempowaty.Replace(',', '.');
    stringMaszyna :=stringMaszyna.Replace(',','.');
    stringolik := stringolik.ToUpper;
    tempowaty := tempowaty.ToUpper;
    stringMaszyna :=stringMaszyna.ToUpper;
    Write(TxtLista, stringMaszyna +','+ DateEdit1.Text + ',' + TimeEdit1.Text + ',' +
      stringolik + ',' + 'zglaszajacy' + ',' + tempowaty + ',');
  finally
    // awaria i enable przyciskow kontrolek
    CloseFile(TxtLista);
    Shape1.Brush.Color := $007BA6FD;
    Button2.Enabled := True;    //przycisk wylaczajacy awarie
    Button1.Enabled := False;  //przycisk zglaszajacy awarie
    ComboBox1.Enabled := False;
    ComboBox2.Enabled := False;
    ComboBox3.Enabled := True;
    ComboBox4.Enabled := True;  
    ComboBox5.Enabled := False;
    DateEdit1.Enabled:=False;
     TimeEdit1.Enabled:=False;
    DateEdit2.Enabled:=True;
    TimeEdit2.Enabled:=True;



    Memo1.Lines.LoadFromFile(scierzka);
  end;
  ///////////
  begin
    AssignFile(TxtAwaria, edit1.Text + 'awaria.txt');
    try
      Rewrite(TxtAwaria);
      Write(TxtAwaria, stringolik);
    finally
      CloseFile(TxtAwaria);
    end;
  end;
  begin
    AssignFile(TxtSprawdz, scierzkaKontrolki);
    try
      Rewrite(TxtSprawdz);
      Write(TxtSprawdz, 'a');

    finally
      CloseFile(TxtSprawdz);
    end;
    //////////////

  end;
end;
  if odpowiedz=0 then
  showmessage('nie to nie');
 
  end;

procedure TForm1.Button10Click(Sender: TObject);
var scierzkaDostepu,scierzkaDostepu2,scierzkaDostepu3:string;
begin
  scierzkaDostepu := Edit1.Text + Edit6.Text;
  scierzkaDostepu2 := Edit1.Text + Edit7.Text;
  scierzkaDostepu3:=Edit1.Text +Edit8.Text;
  combobox1.Items.LoadFromFile(scierzkaDostepu);
  combobox3.Items.LoadFromFile(scierzkaDostepu2);
  combobox5.Items.LoadFromFile(scierzkaDostepu3);

end;

//naprawa
procedure TForm1.Button2Click(Sender: TObject);        //przycisk potwierdzajacy naprawe
var naprawione: integer;
begin
  // okno potwierdzajace tak / nie ?
    naprawione:= Application.MessageBox('Potwierdzasz naprawienie maszyny','Potwierdzenie usuniecia awarii',1);
    if naprawione=1 then
  begin
  Label2.Caption := 'Maszyna sprawma';
  scierzka := Edit1.Text + Edit2.Text;
  AssignFile(TxtLista, scierzka);

  try
    Append(TxtLista);
    stringolik := ComboBox3.Text;
    tempowaty := ComboBox4.Text;
    stringolik := stringolik.Replace(',', '.');
    tempowaty := tempowaty.Replace(',', '.');
    Write(TxtLista, DateEdit2.Text + ',' + TimeEdit2.Text + ',' +
      stringolik + ',' + 'naprawiający' + ',' + tempowaty + #13);
    //+enter nowa linia
  finally
    CloseFile(TxtLista);
    Shape1.Brush.Color := $00CEFFCE;
    Button1.Enabled := True;      //wlacz awarie
    Button2.Enabled := False;   //przycisk wylaczajacy awarie
     ComboBox1.Enabled := True;
    ComboBox2.Enabled := True;
    ComboBox3.Enabled := False;
    ComboBox4.Enabled := False;
    ComboBox5.Enabled := True;
    DateEdit1.Enabled:=True;
    TimeEdit1.Enabled:=True;
    DateEdit2.Enabled:=False;
    TimeEdit2.Enabled:=False;
   Memo1.Lines.LoadFromFile(scierzka);
  end;
  begin
    AssignFile(TxtSprawdz, scierzkaKontrolki);
    try
      Rewrite(TxtSprawdz);
      Write(TxtSprawdz, 's');

    finally
      CloseFile(TxtSprawdz);
    end;
  end;
end;
    if naprawione=0 then
    showmessage('nie to nie');
end;
// wyswietla ostatnia awarie
procedure TForm1.Button3Click(Sender: TObject);
begin
  scierzkaAwarii := Edit1.Text + Edit4.Text;
  AssignFile(TxtAwaria, scierzkaAwarii);
  try
    Reset(TxtAwaria);
    Readln(TxtAwaria, logoawariowe);
  finally
    closeFile(TxtAwaria);
  end;
  label2.Caption := logoawariowe;

end;
//przypisanie dzis
procedure TForm1.Button4Click(Sender: TObject);
begin
  TimeEdit1.Time := Now;
end;
 //teraz
procedure TForm1.Button5Click(Sender: TObject);
begin
  TimeEdit2.Time := Now;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
    Panel2.Visible:=true;
  Memo1.Visible:=true;
  if edit5.Text<>'hasło'then
  panel1.Visible:=false;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Panel2.Visible:=false;
  memo1.Visible:=false;
  edit5.Text:='hasło';
end;

 //dzis
procedure TForm1.Button8Click(Sender: TObject);
begin
  DateEdit1.Date := Now;
end;
  //dzis
procedure TForm1.Button9Click(Sender: TObject);
begin
  DateEdit2.Date := Now;
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
  if edit5.Text='omg'then
  panel1.Visible:=true
  else     panel1.Visible:=false;
end;

procedure TForm1.Shape1ChangeBounds(Sender: TObject);
begin

end;



procedure TForm1.wypelnij(Sender: TObject);
begin

  Edit1.Text := Application.Location;
  Form1.Button10.Click;
  scierzka := Edit1.Text + Edit2.Text;
  AssignFile(TxtLista, scierzka);
  TimeEdit1.Time := Now;
  TimeEdit2.Time := Now;
  try
    Append(TxtLista);
  finally
    CloseFile(TxtLista);
  end;
  Memo1.Lines.LoadFromFile(scierzka);
  scierzkaKontrolki := Edit1.Text + Edit3.Text;
  AssignFile(TxtSprawdz, scierzkaKontrolki);
  try
    Reset(TxtSprawdz);
    if FileExists(scierzkaKontrolki) then // sprawdź, czy plik istnieje
    begin
      ReadLn(TxtSprawdz, kontrolkaString);
      if (kontrolkaString.Equals('a')) then
      begin
        Shape1.Brush.Color := $007070FE;
        Button2.Enabled := True;
        Button1.Enabled := False;
        ComboBox1.Enabled := False;
    ComboBox2.Enabled := False;
    ComboBox3.Enabled := True;
    ComboBox4.Enabled := True;
    DateEdit1.Enabled:=False;
     TimeEdit1.Enabled:=False;
    DateEdit2.Enabled:=True;
    TimeEdit2.Enabled:=True;

        label2.Caption := kontrolkaString;
      end;
      if (kontrolkaString.Equals('s')) then
      begin
        Shape1.Brush.Color := $00CEFFCE;
        Button1.Enabled := True;
        Button2.Enabled := False;
         ComboBox1.Enabled := True;
    ComboBox2.Enabled := True;
    ComboBox3.Enabled := False;
    ComboBox4.Enabled := False;
    DateEdit1.Enabled:=True;
    TimeEdit1.Enabled:=True;
    DateEdit2.Enabled:=False;
    TimeEdit2.Enabled:=False;

      end;

    end;
  finally
    CloseFile(TxtSprawdz);

  end;

end;



procedure ostatniaLinijka();
begin
end;

end.




