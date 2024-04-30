PROGRAM GAME_FOUILLIS;
USES GRAPH,WINCRT,WINMOUSE;

						{***********************PARTIE TYPES***********************}
						
TYPE 	TabVERA=array[1..100,1..100] of boolean;
		TabCOOR=Array[1..100,1..100] of integer;
		TabCH=Array[1..100,1..100] of char;
		TabStr=array[1..100,1..100] of String;

                      {***********************PATRIE VARIABLES***********************}

VAR		CoorXMouse,CoorYMouse,Buttons:Longint;
		Gr:TabCH;
		TabMot:TabStr;
		CoorXlettres,CoorYlettres,CoorXMot,CoorYMot,CoorXY:TabCOOR;
		VeraLettres,VeraTabMot,COMFIRM:TabVERA;
		MOT:String;
		VeraMot,Final:Boolean;
		Pilot,Mode,i,x,y,j,k,XX:Integer;
		
		       {***********************PARTIE PROCEDURES ET FONCTIONS***********************}
			   
PROCEDURE RempGr(var Gr:TabCH);		{PROCEDURE PERMETTANT DE REMPLIR LA GRILLE}
BEGIN
Gr[1,1]:='S';  Gr[1,2]:='E';  Gr[1,3]:='N'; Gr[1,4]:='I';	Gr[1,5]:='H';  Gr[1,6]:='T';  Gr[1,7]:='N';  Gr[1,8]:='A';	Gr[1,9]:='X';  Gr[1,10]:='A';  Gr[1,11]:='N';  Gr[1,12]:='T';  Gr[1,13]:='H';  Gr[1,14]:='I';  Gr[1,15]:='E';
Gr[2,1]:='E';  Gr[2,2]:='B';  Gr[2,3]:='T'; Gr[2,4]:='E';	Gr[2,5]:='U';  Gr[2,6]:='O';  Gr[2,7]:='M';  Gr[2,8]:='Y';	Gr[2,9]:='I';  Gr[2,10]:='I';  Gr[2,11]:='T';  Gr[2,12]:='I';  Gr[2,13]:='N';  Gr[2,14]:='T';  Gr[2,15]:='X';
Gr[3,1]:='S';  Gr[3,2]:='A';  Gr[3,3]:='U'; Gr[3,4]:='O';	Gr[3,5]:='T';  Gr[3,6]:='O';  Gr[3,7]:='L';  Gr[3,8]:='M';	Gr[3,9]:='P';  Gr[3,10]:='R';  Gr[3,11]:='M';  Gr[3,12]:='O';  Gr[3,13]:='T';  Gr[3,14]:='U';  Gr[3,15]:='A';
Gr[4,1]:='S';  Gr[4,2]:='R';  Gr[4,3]:='T'; Gr[4,4]:='A';	Gr[4,5]:='U';  Gr[4,6]:='O';  Gr[4,7]:='P';  Gr[4,8]:='A';	Gr[4,9]:='H';  Gr[4,10]:='A';  Gr[4,11]:='E';  Gr[4,12]:='E';  Gr[4,13]:='U';  Gr[4,14]:='A';  Gr[4,15]:='T';
Gr[5,1]:='E';  Gr[5,2]:='A';  Gr[5,3]:='G'; Gr[5,4]:='R';	Gr[5,5]:='C';  Gr[5,6]:='O';  Gr[5,7]:='R';  Gr[5,8]:='A';	Gr[5,9]:='O';  Gr[5,10]:='E';  Gr[5,11]:='S';  Gr[5,12]:='L';  Gr[5,13]:='N';  Gr[5,14]:='R';  Gr[5,15]:='M';
Gr[6,1]:='C';  Gr[6,2]:='E';  Gr[6,3]:='E'; Gr[6,4]:='O';	Gr[6,5]:='R';  Gr[6,6]:='T';  Gr[6,7]:='B';  Gr[6,8]:='O';	Gr[6,9]:='I';  Gr[6,10]:='N';  Gr[6,11]:='C';  Gr[6,12]:='S';  Gr[6,13]:='L';  Gr[6,14]:='I';  Gr[6,15]:='S';
Gr[7,1]:='N';  Gr[7,2]:='U';  Gr[7,3]:='P'; Gr[7,4]:='T';	Gr[7,5]:='I';  Gr[7,6]:='I';  Gr[7,7]:='S';  Gr[7,8]:='T';	Gr[7,9]:='D';  Gr[7,10]:='A';  Gr[7,11]:='N';  Gr[7,12]:='T';  Gr[7,13]:='I';  Gr[7,14]:='E';  Gr[7,15]:='E';
Gr[8,1]:='X';  Gr[8,2]:='E';  Gr[8,3]:='A'; Gr[8,4]:='C';	Gr[8,5]:='L';  Gr[8,6]:='T';  Gr[8,7]:='E';  Gr[8,8]:='T';	Gr[8,9]:='I';  Gr[8,10]:='L';  Gr[8,11]:='I';  Gr[8,12]:='C';  Gr[8,13]:='A';  Gr[8,14]:='F';  Gr[8,15]:='S';
Gr[9,1]:='S';  Gr[9,2]:='N';  Gr[9,3]:='U'; Gr[9,4]:='L';	Gr[9,5]:='L';  Gr[9,6]:='S';  Gr[9,7]:='E';  Gr[9,8]:='R';	Gr[9,9]:='E';  Gr[9,10]:='I';  Gr[9,11]:='T';  Gr[9,12]:='N';  Gr[9,13]:='E';  Gr[9,14]:='R';  Gr[9,15]:='S';
Gr[10,1]:='T'; Gr[10,2]:='L'; Gr[10,3]:='E'; Gr[10,4]:='A';	Gr[10,5]:='E'; Gr[10,6]:='I'; Gr[10,7]:='N'; Gr[10,8]:='E'; Gr[10,9]:='N'; Gr[10,10]:='I'; Gr[10,11]:='V'; Gr[10,12]:='E'; Gr[10,13]:='A'; Gr[10,14]:='U'; Gr[10,15]:='E';
Gr[11,1]:='E'; Gr[11,2]:='U'; Gr[11,3]:='R'; Gr[11,4]:='M';	Gr[11,5]:='T'; Gr[11,6]:='N'; Gr[11,7]:='E'; Gr[11,8]:='M'; Gr[11,9]:='E'; Gr[11,10]:='L'; Gr[11,11]:='P'; Gr[11,12]:='M'; Gr[11,13]:='O'; Gr[11,14]:='C'; Gr[11,15]:='N';
Gr[12,1]:='R'; Gr[12,2]:='G'; Gr[12,3]:='U'; Gr[12,4]:='E';	Gr[12,5]:='T'; Gr[12,6]:='S'; Gr[12,7]:='I'; Gr[12,8]:='A'; Gr[12,9]:='L'; Gr[12,10]:='E'; Gr[12,11]:='D'; Gr[12,12]:='R'; Gr[12,13]:='O'; Gr[12,14]:='B'; Gr[12,15]:='I';
Gr[13,1]:='E'; Gr[13,2]:='E'; Gr[13,3]:='T'; Gr[13,4]:='U';	Gr[13,5]:='E'; Gr[13,6]:='C'; Gr[13,7]:='L'; Gr[13,8]:='A'; Gr[13,9]:='Y'; Gr[13,10]:='O'; Gr[13,11]:='N'; Gr[13,12]:='N'; Gr[13,13]:='A'; Gr[13,14]:='G'; Gr[13,15]:='E';
Gr[14,1]:='R'; Gr[14,2]:='S'; Gr[14,3]:='A'; Gr[14,4]:='R';	Gr[14,5]:='S'; Gr[14,6]:='R'; Gr[14,7]:='E'; Gr[14,8]:='E'; Gr[14,9]:='X'; Gr[14,10]:='A'; Gr[14,11]:='M'; Gr[14,12]:='I'; Gr[14,13]:='N'; Gr[14,14]:='E'; Gr[14,15]:='N';
Gr[15,1]:='S'; Gr[15,2]:='T'; Gr[15,3]:='N'; Gr[15,4]:='A';	Gr[15,5]:='T'; Gr[15,6]:='U'; Gr[15,7]:='B'; Gr[15,8]:='E'; Gr[15,9]:='D'; Gr[15,10]:='E'; Gr[15,11]:='D'; Gr[15,12]:='I'; Gr[15,13]:='L'; Gr[15,14]:='O'; Gr[15,15]:='S';
END;
		
PROCEDURE RempTabMot(var	TabMot:TabStr);		{PROCEDURE QUI REMPLIE LA TABLE DES MOTS}

BEGIN
TabMot[1,1]:='XANTHINES';		TabMot[1,2]:='AIRELLES';		TabMot[1,3]:='TOUT';		 	TabMot[1,4]:='DEBUTANTS';		TabMot[1,5]:='RENTIERES';		TabMot[1,6]:='REEXAMINE';		TabMot[1,7]:='RILLETTES';		TabMot[1,8]:='FACILITE';		TabMot[1,9]:='HECTARE';			TabMot[1,10]:='ATH';			TabMot[1,11]:='ESSES';			TabMot[1,12]:='NEGATON';		TabMot[1,13]:='XIPHOIDIEN';
TabMot[2,1]:='XANTHIE';			TabMot[2,2]:='ATOURS';			TabMot[2,3]:='IMPORTANT';		TabMot[2,4]:='STERER';			TabMot[2,5]:='UN';			    TabMot[2,6]:='CLAYONNAGE';		TabMot[2,7]:='CLAMEUR';			TabMot[2,8]:='ESSENIENS';		TabMot[2,9]:='HABILLEUR';		TabMot[2,10]:='TAXE';			TabMot[2,11]:='ARABE';			TabMot[2,12]:='NIVEAU';			TabMot[2,13]:='XYLENE';
TabMot[3,1]:='XIMENIE';			TabMot[3,2]:='AMOUREUX';		TabMot[3,3]:='PASSIFS';			TabMot[3,4]:='LUGES';			TabMot[3,5]:='COMPLEMENT';		TabMot[3,6]:='BORDELAIS';		TabMot[3,7]:='NATURE';		 	TabMot[3,8]:='SOLIDE';			TabMot[3,9]:='PARTICULE';		TabMot[3,10]:='MATIN';			TabMot[3,11]:='SATI';			TabMot[3,12]:='HEURE';			TabMot[3,13]:='XYLOCOPES';
END;
		
PROCEDURE DRAW_LAYOUT;					{PROCEDURE VISANT A DESSINER LA FOUILLIS ET LA TABLE DES MOTS A CHERCHER EN MODE GRAPHIQUE}
 VAR	x,y:integer;
 Begin
 Setcolor(11);
 Rectangle((Round(GetmaxX/2)-17-(34*7)),35,(Round(GetmaxX/2)+17+(34*7)),545);
 Rectangle(0,GetmaxY-(45*3),GetmaxX,GetmaxY);
 y:=69;	x:=Round(GetmaxX/2)-17-(34*6);
 For i:=1 to 14 do
  Begin
  Line(Round(GetmaxX/2)-17-(34*7),y,Round(GetmaxX/2)+17+(34*7),y);
  Line(x,35,x,545);
  y:=y+34;	x:=x+34;
  End;
 x:=GetMaxY-(45*2);
 For i:=1 to 2 do
  Begin
  Line(0,x,GetMaxX,x);
  x:=x+45;
  End;
  x:=105;
 For i:=1 to 12 do
  Begin
  Line(x,GetmaxY-(45*3),x,GetmaxY);
  x:=x+105;
  End;
  Setcolor(15);
 End;

PROCEDURE FILL_GR(Gr:TabCH;	Var CoorXlettres,CoorYlettres:TabCOOR);				{PROCEDURE VISANT A REMPLIR LA FOUILLIS EN MODE GRAPHIQUE}
 VAR	x,y,j,k:integer;
 Begin
 Setcolor(11);
 y:=52;
 For j:=1 to 15 do
  Begin
  x:=Round(GetmaxX/2)-(34*7);
  For k:= 1 to 15 do
    begin
    OuttextXY(x,y,Gr[j,k]);
	CoorXLettres[j,k]:=x;
    CoorYLettres[j,k]:=y;
    x:=x+34;
   end;
  y:=y+34;
 end;
 Setcolor(15);
 End;
 
PROCEDURE FILL_TABMOT(TabMot:TabStr;	var CoorXMot,CoorYMot:TabCOOR);			{PROCEDURE VISANT A REMPLIR LA TABLE DES MOTS EN MODE GRAPHIQUE}
 VAR	x,y,j,k:Integer;
 Begin
 Setcolor(11);
 y:=GetMaxY-(45*3)+22;
 For j:=1 to 3 do
  Begin
  x:=10;
  For k:= 1 to 13 do
   begin
   OuttextXY(x,y,TabMot[j,k]);
   CoorXMot[j,k]:=x;
   CoorYMot[j,k]:=y;
   x:=x+105;
   end;
  y:=y+45;
 end;
 Setcolor(15);
 End;
 
PROCEDURE FILL_TEXT;
 Begin
 Setfillstyle(1,8);
 Bar(25,110,400,500);
 setcolor(11);
 settextstyle(1,0,2);
 OuttextXY(100,120,'Indications:');
 Line(100,Textheight('Indications:')+122,Textwidth('Indications:')+98,Textheight('Indications:')+122);
 Settextstyle(1,0,1);
 OuttextXY(35,160,'-Chercher les mots ci-dessous dans cette');
	OuttextXY(37,180,' fouillis.');
 OuttextXY(35,200,'-Cliquer sur une lettre avec le bouton gauche');
	OuttextXY(37,220,' de la souris pour la selectionner.');
 OuttextXY(35,240,'-Une fois une lettre est selectionne, Elle');
	OuttextXY(37,260,' prendra une couleur.');
 OuttextXY(35,280,'-Pour valider un mot, il faut selectionner');
	OuttextXY(37,300,' toutes ces lettres ordonnees selon');
	OuttextXY(37,320,' sa direction.');
 OuttextXY(35,340,'-Une fois un mot est selectionne, ses lettres');
	OuttextXY(37,360,' prendrons une couleur, et il sera'); 
	OuttextXY(37,380,' barre dans la table des mots.');
 OuttextXY(35,400,'-Si plus de 11 lettres sont selectionnees');
	OuttextXY(37,420,' et ne correspondent pas a un mot,');
	OuttextXY(37,440,' les cases seront reinitialisees.');
 OuttextXY(35,460,'-Appuyer a tout moment sur le bouton droit de');
	OuttextXY(37,480,' la sourie pour quitter le programme.');
	
 Bar(965,205,GetmaxX-25,375);
 Settextstyle(1,0,2);
 Setcolor(10);
 OuttextXY(995,215,'La definition du mot');
 OuttextXY(975,235,' finale a trouver est:');
 Setcolor(11);
 OuttextXY(980,275,'"Une ville algerienne"');
 
 Setcolor(15);	Settextstyle(1,0,1);
 End;
		
PROCEDURE INITVERA(Var Vera:TabVERA);				{PROCEDURE VISANT A INITIER UNE MATRICE DE BOOLEEN A VRAI}
 VAR	i,j:Integer;
 Begin
 For i:=1 to 15 do
  For j:=1 to 15 do
  Vera[i,j]:=True;
 End;
 
PROCEDURE INITCOOR(Var Coor:TabCOOR);				{PROCEDURE VISANT A INITIER UNE MATRICE D'ENTIER}
 VAR 	XX:Integer;
 Begin
 For XX:=1 to 16 do
  Begin 
  Coor[1,XX]:=0;
  Coor[2,XX]:=0;
  End;
 End;
 
PROCEDURE COLORCASE(Flood,color,CoorX,CoorY,border:integer);				{PROCEDURE VISANT A COLORER UNE CASE D'UNE MATRICE EN MODE GRAPHIQUE}
 Begin
 SetFillstyle(flood,color);
 floodfill(CoorX,CoorY,border);
 End;
 
FUNCTION HITBOX(CoorXMouse,CoorYMouse,j,k:integer; CoorXLettres,CoorYLettres:TabCOOR):Boolean;				{FONCTION VISANT A METTRE EN PLACE UN CARRE VIRTUEL PERMETTANT L'INTERACTION ENTRE LA SOURIS ET LE PROGRAMME EN MODE GRAPHIQUE}
 Begin
 HITBOX:=False;
 If (((CoorXMouse<CoorXLettres[j,k]+17) and (CoorXMouse>CoorXLettres[j,k]-17)) and ((CoorYMouse<CoorYLettres[j,k]+17) and (CoorYMouse>CoorYLettres[j,k]-17))) then
  HITBOX:=True;
 End;
 
                      {***********************PARTIE PROGRAMME PRINCIPALE***********************}
 
BEGIN
RempGr(Gr);	RempTabMot(TabMot);

Pilot:=Detect;	
InitMouse;
InitGraph(Pilot,Mode,'');

DRAW_LAYOUT;
FILL_GR(Gr,CoorXLettres,CoorYlettres);
FILL_TABMOT(TabMot,CoorXMot,CoorYMot);
FILL_TEXT;

INITVERA(VeraLettres);
INITVERA(COMFIRM);
INITVERA(VeraTabMot);
VeraMot:=True;	Final:=False;
Repeat
 If (VeraMot=True) then
  Begin
  MOT:='';
  VeraMot:=False;
  INITCOOR(CoorXY);
  XX:=1;
  end;
  
 Getmousestate(CoorXMouse,CoorYMouse,Buttons);
 For j:=1 to 15 do
  For k:=1 to 15 do
   If ((HITBOX(CoorXMouse,CoorYMouse,j,k,CoorXLettres,CoorYLettres)=True) and (Lpressed=True)) then
    If (VeraLettres[j,k]=True) then
    Begin
	COLORCASE(1,7,CoorXMouse,CoorYMouse,11);
	Mot:=Mot+Gr[j,k];
    VeraLettres[j,k]:=False;
	CoorXY[1,XX]:=CoorXLettres[j,k];
	CoorXY[2,XX]:=CoorYLettres[j,k];	
	XX:=XX+1;
    end
    else if (VeraLettres[j,k]=False) then
    begin
	If (COMFIRM[j,k]=False) then
	 COLORCASE(1,8,CoorXLettres[j,k],CoorYLettres[j,k],11)
	Else
	 COLORCASE(0,0,CoorXMouse,CoorYMouse,11);
	VeraLettres[j,k]:=True;
	Delete(Mot,Length(Mot),1);
	XX:=XX-1;	
	CoorXY[1,XX]:=0;	CoorXY[2,XX]:=0;
    end;
	
 For x:=1 to 3 do
  For y:=1 to 13 do
   If (Mot=TabMot[x,y]) then
    Begin
    VeraMot:=True;
	VeraTabMot[x,y]:=False;
	For XX:=1 to Length(Mot) do
	 For j:=1 to 15 do
	  For k:=1 to 15 do
	  If ((CoorXY[1,XX]=CoorXLettres[j,k]) and (CoorXY[2,XX]=CoorYLettres[j,k])) then
	  Begin
	  COLORCASE(1,8,CoorXLettres[j,k],CoorYLettres[j,k],11);
	  COMFIRM[j,k]:=False;
	  VeraLettres[j,k]:=True;
	  End;
	COLORCASE(1,8,CoorXMot[x,y],CoorYMot[x,y],11);
    Break;
    End
   Else if (Length(Mot)>11) then 
    Begin
    For j:=1 to 15 do
     For k:=1 to 15 do
	 If ((VeraLettres[j,k]=False) and (COMFIRM[j,k]=True)) then
	  COLORCASE(0,0,CoorXLettres[j,k],CoorYLettres[j,k],11)
	 Else if ((VeraLettres[j,k]=False) and (COMFIRM[j,k]=False)) then
  	  COLORCASE(1,8,CoorXLettres[j,k],CoorYLettres[j,k],11);
    INITVERA(VeraLettres);
    VeraMot:=True;
	Break;
	End;
	
 For x:=1 to 3 do
  For y:=1 to 13 do
  If (VeraTabMot[x,y]=False) then 
   Final:=True
  Else
   Begin
   Final:=False;
   Break;
   End;
   
 If (Final=True) then
  Begin 
  XX:=1065;
  For j:=1 to 15 do
   For k:=1 to 15 do 
   If (COMFIRM[j,k]=True) then
    Begin
	COLORCASE(4,10,CoorXLettres[j,k],CoorYLettres[j,k],11);
	Settextstyle(1,0,2);
	setcolor(10);
	While (XX<=176) do
	 Begin
	 OuttextXY(XX,315,Gr[j,k]);
	 XX:=XX+16;
     End;
	End;
  Settextstyle(1,0,1);
  Setcolor(11);
  end;
Until (Buttons=4);
END.