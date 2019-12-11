unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sRadioButton, sButton, sLabel, sEdit, jpeg, ExtCtrls,
  sMemo;

type
  TForm2 = class(TForm)
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sRadioButton3: TsRadioButton;
    sRadioButton4: TsRadioButton;
    sRadioButton5: TsRadioButton;
    sRadioButton6: TsRadioButton;
    sRadioButton7: TsRadioButton;
    sButton1: TsButton;
    sLabel1: TsLabel;
    sRadioButton8: TsRadioButton;
    sRadioButton9: TsRadioButton;
    sEdit1: TsEdit;
    Image1: TImage;
    sLabel2: TsLabel;
    sRadioButton10: TsRadioButton;

    procedure sButton1Click(Sender: TObject);
    procedure sRadioButton1Click(Sender: TObject);
    procedure sRadioButton2Click(Sender: TObject);
    procedure sRadioButton3Click(Sender: TObject);
    procedure sRadioButton4Click(Sender: TObject);
    procedure sRadioButton5Click(Sender: TObject);
    procedure sRadioButton6Click(Sender: TObject);
    procedure sRadioButton7Click(Sender: TObject);
    procedure sRadioButton8Click(Sender: TObject);
    procedure sRadioButton9Click(Sender: TObject);
    procedure sRadioButton10Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}
procedure sort2();
var
 i,j,ck:integer;
 cs:string;
begin
      for j:=1 to n-1 do
        for i:=1 to n-1 do
          if slov.k[i]<slov.k[i+1] then
            begin
             ck:=slov.k[i];
             slov.k[i]:=slov.k[i+1];
             slov.k[i+1]:=ck;
             cs:=slov.s[i];
             slov.s[i]:=slov.s[i+1];
             slov.s[i+1]:=cs;
            end;
end;

procedure sort();
var
 i,j,ck:integer;
 cs:string;
begin
      for j:=1 to n-1 do
        for i:=1 to n-1 do
          if slov.k[i]>slov.k[i+1] then
            begin
             ck:=slov.k[i];
             slov.k[i]:=slov.k[i+1];
             slov.k[i+1]:=ck;
             cs:=slov.s[i];
             slov.s[i]:=slov.s[i+1];
             slov.s[i+1]:=cs;
            end;
end;

procedure srav3();
var
i,j:integer;
begin
reset(f2);
      while not eof(f2) do
        begin //2
          readln(f2,s2); t:=0; er:=0; t1:=0; t2:=0;
          if (length(s2)<=length(s1)+2)and(length(s2)>=length(s1)-2) then
            begin //3
              if length(s1)=length(s2) then
                begin //4
                  for i:=1 to length(s1) do
                    begin
                      if s1[i]=s2[i] then
                        begin
                          t:=t+1;
                          t1:=t1+1;
                          t2:=t2+1;
                         end
                       else t1:=0;
                       if (s1[i]=s2[i])and(t1=2) then t:=t+3;
                       if (s1[i]=s2[i])and(t1=3) then t:=t+5;
                       if (s1[i]=s2[i])and(t1=4) then t:=t+7;
                       if t2=length(s1)-1 then t:=t+40;
                       if (t2=length(s1)-2)and(length(s1)>5) then t:=t+20;
                     end;
               end; //4
             if length(s1)-length(s2)=1 then
               begin
                 for i:=1 to length(s2) do
                   if (s1[i]=s2[i])or((s1[i]<>s2[i])and(s1[i+1]=s2[i]))then t:=t+1;
                 if t=length(s2)then t:=t+40;
                 if (t=length(s2)-1)and(length(s1)>6) then t:=t+20;
               end;
            
             if length(s2)-length(s1)=1 then
               begin
                 for i:=1 to length(s1) do
                   if (s2[i]=s1[i])or((s1[i]<>s2[i])and(s2[i+1]=s1[i]))then t:=t+1;
                 if t=length(s1)then t:=t+40;
                 if (t=length(s1)-1)and(length(s1)>7) then t:=t+20;
               end;
            
             if (length(s1)-length(s2)=2)and(length(s1)>=7) then
               begin
                 for i:=1 to length(s2) do
                   if (s1[i]=s2[i])or((s1[i]<>s2[i])and((s1[i+1]=s2[i])or(s1[i+2]=s2[i])))then t:=t+1;
                 if t=length(s2) then t:=t+20;
              end;

             if (length(s2)-length(s1)=2)and(length(s2)>=7) then
              begin
                for i:=1 to length(s1) do 
                  if (s1[i]=s2[i])or((s1[i]<>s2[i])and((s2[i+1]=s1[i])or(s2[i+2]=s1[i])))then t:=t+1;
                if t=length(s1) then t:=t+20;
              end;
           end; //3
          j:=1;
          while j<=n do
            begin
              if t>slov.k[j] then
                begin
                  slov.s[j]:=s2;
                  slov.k[j]:=t;
                  j:=8;
                end;
              j:=j+1;
            end;
          sort();
        end;//2
    closefile(f2);
    sort2();
end;

procedure srav2();
var
 i,k1,k2:integer;
begin
reset(f2);
k1:=length(s1);
i:=1;
 while not eof(f2) do
  begin
   readln(f2,s2);
   k2:=length(s2);
   if slov.s[i]='' then
    begin
     if (s1[1]=s2[1]) and (s1[k1]=s2[k2]) and (k1=k2-1) then slov.s[i]:=s2;
     if (s1[1]=s2[1]) and (s1[2]=s2[2]) and (k1=k2-1) then slov.s[i]:=s2;
     if (s1[1]=s2[2]) and (s1[2]=s2[k2]) and (k1=k2-1) then slov.s[i]:=s2;
     if (length(s1)=length(s2)) and ((s1[1]=s2[1])or(s1[2]=s2[2])) then slov.s[i]:=s2;
     if slov.s[i]<>'' then i:=i+1;
    end;
    if i=8 then break;
  end;
closefile(f2);
end;
function UpCase(ch: char): char;
begin
  if (ch in ['a'..'z', '�'..'�']) then
    result := chr(ord(ch) - 32)
  else
    result := ch;
end;

function LoCase(ch: char): char;
begin
  if (ch in ['A'..'Z', '�'..'�']) then
    result := chr(ord(ch) + 32)
  else
    result := ch;
end;

function poisk():integer;
begin
reset(f2);
   while not eof(f2) do
      begin
        readln(f2,s2);
          if s1=s2 then result:=1;
          if s1='' then result:=1;
      end;
closefile(f2);
end;

procedure zap();
var
i,j:integer;
begin
 while not eof(f1) do
  begin
    repeat
      read(f1,c);
      s:=s+c;
      if (c in ['�'..'�']) or (c in ['�'..'�'])then s1:=s1+c
      else c:=' ';
      if (eoln(f1)) and not(eof(f1)) then c:=' ';
    until (c=' ') or (eof(f1));


if s[1] in ['�'..'�'] then k1:=1;
  for i:=1 to length(s) do
    if s[i] in ['�'..'�'] then s[i]:=locase(s[i]);
for i:=1 to length(s1) do
  if s1[i] in ['�'..'�'] then  s1[i]:=locase(s1[i]);

p:=poisk();
if (p<>1)and(length(s1)=2) then
  begin
    srav2();
    form2.sRadioButton1.Caption:=slov.s[1];
    form2.sRadioButton2.Caption:=slov.s[2];
    form2.sRadioButton3.Caption:=slov.s[3];
    form2.sRadioButton4.Caption:=slov.s[4];
    form2.sRadioButton5.Caption:=slov.s[5];
    form2.sRadioButton6.Caption:=slov.s[6];
    form2.sRadioButton7.Caption:=slov.s[7];
    form2.sLabel1.Caption:='� ����� "'+s1+'" ������';
    form2.sRadioButton8.Caption:='�������� ��� ���������';
    form2.sRadioButton9.Caption:='������ ���� �������';
    form2.Show;
    form1.Enabled:=false;
    form2.sButton1.Enabled:=false;
    exit;
  end;

if (p<>1)and(length(s1)>2) then
  begin //1
    srav3();
    form2.sRadioButton1.Caption:=slov.s[1];
    form2.sRadioButton2.Caption:=slov.s[2];
    form2.sRadioButton3.Caption:=slov.s[3];
    form2.sRadioButton4.Caption:=slov.s[4];
    form2.sRadioButton5.Caption:=slov.s[5];
    form2.sRadioButton6.Caption:=slov.s[6];
    form2.sRadioButton7.Caption:=slov.s[7];
    form2.sLabel1.Caption:='� ����� "'+s1+'" ������';
    form2.sRadioButton8.Caption:='�������� ��� ���������';
    form2.sRadioButton9.Caption:='������ ���� �������';
    form2.Show;
    form1.Enabled:=false;
    form2.sButton1.Enabled:=false;
    exit;
  end;//1

 if k1=1 then
    s[1]:=upcase(s[1]);
    write(f3,s);

for i:=1 to n do
 begin
  slov.s[i]:='';
  slov.k[i]:=0;
 end;
k1:=0;
s1:='';
s2:='';
s:='';
end;
CloseFile(f1);
CloseFile(f3);
form1.smemo1.lines.loadfromfile('new.sll');
deletefile('new.sll');
deletefile('input.sll');
end;



procedure TForm2.sButton1Click(Sender: TObject);
var
i,j:integer;
begin
 if sradiobutton1.Checked=true then begin s2:=sradiobutton1.Caption; sradiobutton1.Checked:=false; end;
 if sradiobutton2.Checked=true then begin s2:=sradiobutton2.Caption; sradiobutton2.Checked:=false; end;
 if sradiobutton3.Checked=true then begin s2:=sradiobutton3.Caption; sradiobutton3.Checked:=false; end;
 if sradiobutton4.Checked=true then begin s2:=sradiobutton4.Caption; sradiobutton4.Checked:=false; end;
 if sradiobutton5.Checked=true then begin s2:=sradiobutton5.Caption; sradiobutton5.Checked:=false; end;
 if sradiobutton6.Checked=true then begin s2:=sradiobutton6.Caption; sradiobutton6.Checked:=false; end;
 if sradiobutton7.Checked=true then begin s2:=sradiobutton7.Caption; sradiobutton7.Checked:=false; end;
 if sradiobutton8.Checked=true then begin s2:=s1; sradiobutton8.Checked:=false; end;
 if sradiobutton9.Checked=true then begin s2:=sedit1.Text; sradiobutton9.Checked:=false; end;
 if sradiobutton10.Checked=true then s2:=s1;
 k:=pos(s1,s);
 delete(s,k,length(s1));
 insert(s2,s,k);
 if k1=1 then s[1]:=upcase(s[1]);
 write(f3,s);
 for i:=1 to n do
 begin
  slov.s[i]:='';
  slov.k[i]:=0;
 end;
k1:=0;
s1:='';
s2:='';
s:='';
form1.Enabled:=true;
form2.Close;
if sradiobutton10.checked=false then
zap()
else
 begin
   while not eof(f1) do
   begin
   readln(f1,s10);
   writeln(f3,s10); end;
   CloseFile(f1);
   CloseFile(f3);
   s10:='';
   form1.smemo1.lines.loadfromfile('new.sll');
   deletefile('new.sll');
   deletefile('input.sll');
   sradiobutton10.Checked:=false;
 end;
end;






procedure TForm2.sRadioButton1Click(Sender: TObject);
begin
sbutton1.Enabled:=true;
end;

procedure TForm2.sRadioButton2Click(Sender: TObject);
begin
sbutton1.Enabled:=true;
end;

procedure TForm2.sRadioButton3Click(Sender: TObject);
begin
sbutton1.Enabled:=true;
end;

procedure TForm2.sRadioButton4Click(Sender: TObject);
begin
sbutton1.Enabled:=true;
end;

procedure TForm2.sRadioButton5Click(Sender: TObject);
begin
sbutton1.Enabled:=true;
end;

procedure TForm2.sRadioButton6Click(Sender: TObject);
begin
sbutton1.Enabled:=true;
end;

procedure TForm2.sRadioButton7Click(Sender: TObject);
begin
sbutton1.Enabled:=true;
end;

procedure TForm2.sRadioButton8Click(Sender: TObject);
begin
sbutton1.Enabled:=true;
end;

procedure TForm2.sRadioButton9Click(Sender: TObject);
begin
sbutton1.Enabled:=true;
end;

procedure TForm2.sRadioButton10Click(Sender: TObject);
begin
sbutton1.Enabled:=true;
end;

end.
