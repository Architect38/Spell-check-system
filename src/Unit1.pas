unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sSkinManager, sDialogs, ExtCtrls, sPanel, sButton,
  sLabel, sMemo, sRadioButton, sEdit;
const
 n=7;
type
  slovo=record
    s:array[1..n] of string;
    k:array[1..n] of integer;
  end;
  TForm1 = class(TForm)
    sSkinManager1: TsSkinManager;
    sButton1: TsButton;
    Image1: TImage;
    sMemo1: TsMemo;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sEdit1: TsEdit;
    sLabel3: TsLabel;
    sButton2: TsButton;
    procedure sButton1Click(Sender: TObject);
    procedure sRadioButton1Click(Sender: TObject);
    procedure sRadioButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  f1,f2,f3:textfile;
  s,s1,s2,s3:string;
  i,j,t,t1,t2,er,p,k,k1,k2:integer;
  slov:slovo;
  c:char;
  s10:ansistring;
  //=====================================================================
  ms,ms1,ms2,ms3,ms4,ms5:string;
  mk:integer;
  mf1:textfile;
implementation

uses Unit2, Unit3, Unit4;

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
    form2.sRadioButton8.Caption:='�������� ��� ���������';
    form2.sLabel1.Caption:='� ����� "'+s1+'" ������';
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



procedure TForm1.sButton1Click(Sender: TObject);
 var
i,j:integer;
begin
AssignFile(f1,'input.sll');
AssignFile(f2,'slvr.sll');
AssignFile(f3,'new.sll');
try
Rewrite(f1);
write(f1,smemo1.text);
finally
CloseFile(f1);
end;
reset(f1);
rewrite(f3);
zap();
end;
//==============================================================================
 function proverka():integer;
begin
  reset(mf1);
  while not eof(mf1) do
  begin
    readln(mf1,ms2);

    ms3:=copy(ms2,1,length(ms1));
    if (ms3=ms1) and (ms2[length(ms3)+1]='�') then
      begin
        proverka:=1;
        break;
      end
      else
        proverka:=0;
  end;
  closefile(mf1);
end;
//==============================================================================

//==============================================================================
procedure TForm1.sRadioButton1Click(Sender: TObject);
begin
smemo1.Visible:=true;
sbutton1.Visible:=true;
slabel2.Visible:=true;
slabel3.Visible:=false;
sedit1.Visible:=false;
sbutton2.Visible:=false;

end;

procedure TForm1.sRadioButton2Click(Sender: TObject);
begin
smemo1.Visible:=false;
sbutton1.Visible:=false;
slabel2.Visible:=false;
slabel3.Visible:=true;
sedit1.Visible:=true;
sbutton2.Visible:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
AssignFile(mf1,'1.txt');
smemo1.Visible:=true;
sbutton1.Visible:=true;
slabel2.Visible:=true;
slabel3.Visible:=false;
sedit1.Visible:=false;
sbutton2.Visible:=false;
sradiobutton1.Checked:=true;
end;



procedure TForm1.sButton2Click(Sender: TObject);
begin
 ms:=sEdit1.Text;

for i:=1 to length(ms) do
 if ms[i]<>' ' then ms1:=ms1+ms[i];

 for i:=1 to length(ms1) do
    if ms1[i] in ['�'..'�'] then ms1[i]:=locase(ms1[i]);
ms5:=ms1;
form3.sLabel7.Caption:='';
form3.sLabel8.Caption:='';
form3.sLabel9.Caption:='';
form3.sLabel10.Caption:='';
form3.sLabel11.Caption:='';
form3.sLabel6.Caption:='';

if (proverka()=1) and (sEdit1.Text<>'')  then
  begin
    form3.sLabel6.Caption:=ms1;
    delete(ms2,1,length(ms1));
    for i:=1 to length(ms2) do
     if ms2[i]<>',' then mk:=mk+1 else break;   // ���������
    form3.sLabel8.Caption:=copy(ms2,1,mk);
    delete(ms2,1,mk+1);
    mk:=0;

    for i:=1 to length(ms2) do
     if ms2[i]<>',' then mk:=mk+1 else break;      //������
    form3.sLabel7.Caption:=copy(ms2,1,mk);
    delete(ms2,1,mk+1);
    mk:=0;

    for i:=1 to length(ms2) do
     if ms2[i]<>',' then mk:=mk+1 else break;  //�������
    form3.sLabel9.Caption:=copy(ms2,1,mk);
    delete(ms2,1,mk+1);
    mk:=0;

    for i:=1 to length(ms2) do
     if ms2[i]<>',' then mk:=mk+1 else break;      //���������
    form3.sLabel10.Caption:=copy(ms2,1,mk);
    delete(ms2,1,mk+1);
    mk:=0;

    for i:=1 to length(ms2) do
     if ms2[i]<>',' then mk:=mk+1 else break;    //������
    form3.sLabel11.Caption:=copy(ms2,1,mk);
    delete(ms2,1,mk+1);
    mk:=0;
    form1.Enabled:=false;
    form3.Show;

end;

if (proverka=0) and (sEdit1.Text<>'') then
  begin
    form4.Show; // LETS GOOOOOOOO BITCH!!!!!!
    form1.Enabled:=false;
  end;

ms2:='';
ms3:='';
ms1:='';
sEdit1.Text:='';
end;

end.
