unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    GuessWord: TLabel;
    CorrectWords: TLabel;
    TimeLeft: TLabel;
    Timer1: TTimer;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GuessWordClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    words: array [0 .. 40] of string;
    wordIndex: integer;
    correct: integer;
    secondsLeft: integer;
    procedure initializeWords();
    procedure PickWord ();
    procedure NextWord();
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.PickWord ();
begin
  randomize();
  wordIndex := random (40);
  Guessword.caption := words [wordIndex];
end;

procedure TForm1.NextWord ();
begin
  inc (correct);
  CorrectWords.caption := IntToStr (correct);
  Edit1.Text := '';
  PickWord;
end;

procedure TForm1.initializeWords();
begin
  words[0] := 'hallo';
  words[1] := 'baum';
  words[2] := 'umleitung';
  words[3] := 'gehörschleife';
  words[4] := 'informatik';
  words[5] := 'kompetenz';
  words[6] := 'unterkurs';
  words[7] := 'physik';
  words[8] := 'überlegen';
  words[9] := 'apfel';
  words[10] := 'und';
  words[11] := 'mit';
  words[12] := 'weil';
  words[13] := 'also';
  words[14] := 'dennoch';
  words[15] := 'leider';
  words[16] := 'orgel';
  words[17] := 'gedächtniskirche';
  words[18] := 'words';
  words[19] := 'prozedur';
  words[20] := 'abitur';
  words[21] := 'örtlichkeit';
  words[22] := 'fuchs';
  words[23] := 'satzbau';
  words[24] := 'grammatik';
  words[25] := 'cookie';
  words[26] := 'erkältung';
  words[27] := 'clicker';
  words[28] := 'zusatz';
  words[29] := 'wombat';
  words[30] := 'maus';
  words[31] := 'haus';
  words[32] := 'raus';
  words[33] := 'greis';
  words[34] := 'knausern';
  words[35] := 'faust';
  words[36] := 'laus';
  words[37] := 'frohlocken';
  words[38] := 'milchglasfenster';
  words[39] := 'formeldahyd';
  words[40] := 'reimen';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitializeWords;
  PickWord;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if secondsLeft < 0 then
  begin
    secondsLeft := 60;
  end;
  if Edit1.Text = words [wordIndex] then
  begin
    NextWord;
  end;
end;

procedure TForm1.GuessWordClick(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if secondsLeft > 0 then
  begin
       dec(secondsLeft);
       TimeLeft.caption := 'Du hast noch noch ' + IntToStr (secondsLeft) + ' Sekunden';
  end;
  if secondsLeft = 0 then
  begin
       dec (secondsLeft);
       if correct > 40 then
       begin
            showmessage ('Du tippst ja fast schon schneller als Maxi! Hast Du zuhause heimlich geübt?');
       end;
       if correct < 40 then
       begin
            showmessage ('Du tippst nicht so schnell wie Maxi, aber mach Dir keine Sorgen, Maxi mag Dich trotzdem');
       end;
       if correct < 20 then
       begin
            showmessage ('Bro, hast Dus überhaupt versucht?');
       end;
  end;
end;

end.

