//starting entpos, middle 15entpos(14th box), ending 45entpos    + 25                                                                                            mid
float[] mapcoords = {6.25, 31.25, 56.25, 81.25, 106.25, 131.25, 156.25, 181.25, 206.25, 231.25, 256.25, 281.25, 306.25, 331.25, 356.25, 381.25, 406.25, 431.25, 456.25, 481.25, 506.25, 531.25, 556.25, 581.25, 606.25, 631.25, 656.25, 681.25, 706.25, 731.25, 756.25, 781.25, 806.25, 831.25, 856.25, 881.25, 906.25};
int indexofmiddle = 18;
float[] spawncoords = {431.25,431.25, 431.25,456.25, 431.25,481.25, 456.25,431.25, 456.25,481.25, 481.25,431.25, 481.25,456.25, 481.25,481.25};
int spawnareasize = 2;
int movesallowed = 1000;
int[] goldendirs = new int[movesallowed];
float startingpos = 456.25;//x, y
int spawngoalawayby = 6;
int size = 25;
int obstnum = 250;
int batch = 1;
float[][] entities = new float[obstnum + 1][obstnum + 1];//extra 1 for goal
int[] red = {255,0,0};
int[] orange = {255,128,0};
int[] yellow = {255,255,0};
int[] green = {0,255,0};
int[] blue = {0,0,255};
int[] purple = {200,0,200};
int[] brown = {100,50,0};
int[] black = {0,0,0};
int[] white = {255,255,255};
int[] pink = {255,50,150};
int numofghosts = 50;
Player foundfirst;
boolean runninitback = false;
int runitbackmoves = 0;
float entpos = 6.25;//   size/4
int mapsize = 925;
int delayed = 0;
int delayby = 0;//must change on line 113 as well
Player p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p40,p41,p42,p43,p44,p45,p46,p47,p48,p49,p50,p51;//,p52,p53,p54,p55,p56,p57,p58,p59,p60,p61,p62,p63,p64,p65,p66,p67,p68,p69,p70,p71,p72,p73,p74,p75,p76,p77,p78,p79,p80,p81,p82,p83,p84,p85,p86,p87,p88,p89,p90,p91,p92,p93,p94,p95,p96,p97,p98,p99,p100;
Player[] players = {p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p40,p41,p42,p43,p44,p45,p46,p47,p48,p49,p50};//, p51,p52,p53,p54,p55,p56,p57,p58,p59,p60,p61,p62,p63,p64,p65,p66,p67,p68,p69,p70,p71,p72,p73,p74,p75,p76,p77,p78,p79,p80,p81,p82,p83,p84,p85,p86,p87,p88,p89,p90,p91,p92,p93,p94,p95,p96,p97,p98,p99};//,p100}; GHOSTS LIST
void setup() {//runs once at start
 size(925, 950);
 background(130);
  for(int x = 0; x < 925; x+=size) {//columns
    for(int y = 0; y < 925; y+=size) {//rows
      fill(160);
      rect( x, y, size, size );
    }
  }
  for(int x = 0; x < 5; x++){
    for(int y = 0; y < 5; y++){
      
    }
  }
  fill(0,255,0);
  rect( startingpos - entpos, startingpos - entpos, size, size );
  fill(140);
  for(int i = 0; i <= spawncoords.length - 1; i+=2){//make spawn area
    rect( spawncoords[i] - entpos, spawncoords[i + 1] - entpos, size, size );
  }
  p1 = new Player(startingpos, green, "Ghost 1", 1);
  p2 = new Player(startingpos, green, "Ghost 2",2);
  p3 = new Player(startingpos, green, "Ghost 3",3);
  p4 = new Player(startingpos, green, "Ghost 4",4);
  p5 = new Player(startingpos, green, "Ghost 5",1);
  p6 = new Player(startingpos, green, "Ghost 6",2);
  p7 = new Player(startingpos, green, "Ghost 7",3);
  p8 = new Player(startingpos, green, "Ghost 8",4);
  p9 = new Player(startingpos, green, "Ghost 9",1);
  p10 = new Player(startingpos, green, "Ghost 10",2);
  p11 = new Player(startingpos, green, "Ghost 11", 3);
  p12 = new Player(startingpos, green, "Ghost 12",4);
  p13 = new Player(startingpos, green, "Ghost 13",1);
  p14 = new Player(startingpos, green, "Ghost 14",2);
  p15 = new Player(startingpos, green, "Ghost 15",3);
  p16 = new Player(startingpos, green, "Ghost 16",4);
  p17 = new Player(startingpos, green, "Ghost 17", 1);
  p18 = new Player(startingpos, green, "Ghost 18",2);
  p19 = new Player(startingpos, green, "Ghost 19",3);
  p20 = new Player(startingpos, green, "Ghost 20",4);
  p21 = new Player(startingpos, green, "Ghost 21", 1);
  p22 = new Player(startingpos, green, "Ghost 22",2);
  p23 = new Player(startingpos, green, "Ghost 23",3);
  p24 = new Player(startingpos, green, "Ghost 24",4);
  p25 = new Player(startingpos, green, "Ghost 25",1);
  p26 = new Player(startingpos, green, "Ghost 26",2);
  p27 = new Player(startingpos, green, "Ghost 27",3);
  p28 = new Player(startingpos, green, "Ghost 28",4);
  p29 = new Player(startingpos, green, "Ghost 29",1);
  p30 = new Player(startingpos, green, "Ghost 30",2);
  p31 = new Player(startingpos, green, "Ghost 31", 3);
  p32 = new Player(startingpos, green, "Ghost 32",4);
  p33 = new Player(startingpos, green, "Ghost 33",1);
  p34 = new Player(startingpos, green, "Ghost 34",2);
  p35 = new Player(startingpos, green, "Ghost 35",3);
  p36 = new Player(startingpos, green, "Ghost 36",4);
  p37 = new Player(startingpos, green, "Ghost 37", 1);
  p38 = new Player(startingpos, green, "Ghost 38",2);
  p39 = new Player(startingpos, green, "Ghost 39",3);
  p40 = new Player(startingpos, green, "Ghost 40",4);
  p41 = new Player(startingpos, green, "Ghost 41", 1);
  p42 = new Player(startingpos, green, "Ghost 42",2);
  p43 = new Player(startingpos, green, "Ghost 43",3);
  p44 = new Player(startingpos, green, "Ghost 44",4);
  p45 = new Player(startingpos, green, "Ghost 45",1);
  p46 = new Player(startingpos, green, "Ghost 46",2);
  p47 = new Player(startingpos, green, "Ghost 47",3);
  p48 = new Player(startingpos, green, "Ghost 48",4);
  p49 = new Player(startingpos, green, "Ghost 49",1);
  p50 = new Player(startingpos, green, "Ghost 50",2);
  /*p51 = new Player(startingpos, green, "Ghost ", 3);
  p52 = new Player(startingpos, green, "Ghost ",4);
  p53 = new Player(startingpos, green, "Ghost ",1);
  p54 = new Player(startingpos, green, "Ghost ",2);
  p55 = new Player(startingpos, green, "Ghost ",3);
  p56 = new Player(startingpos, green, "Ghost ",4);
  p57 = new Player(startingpos, green, "Ghost ", 1);
  p58 = new Player(startingpos, green, "Ghost ",2);
  p59 = new Player(startingpos, green, "Ghost ",3);
  p60 = new Player(startingpos, green, "Ghost ",4);
  p61 = new Player(startingpos, green, "Ghost ", 1);
  p62 = new Player(startingpos, green, "Ghost ",2);
  p63 = new Player(startingpos, green, "Ghost ",3);
  p64 = new Player(startingpos, green, "Ghost ",4);
  p65 = new Player(startingpos, green, "Ghost ",1);
  p66 = new Player(startingpos, green, "Ghost ",2);
  p67 = new Player(startingpos, green, "Ghost ",3);
  p68 = new Player(startingpos, green, "Ghost ",4);
  p69 = new Player(startingpos, green, "Ghost ",1);
  p70 = new Player(startingpos, green, "Ghost ",2);
  p71 = new Player(startingpos, green, "Ghost ", 3);
  p72 = new Player(startingpos, green, "Ghost ",4);
  p73 = new Player(startingpos, green, "Ghost ",1);
  p74 = new Player(startingpos, green, "Ghost ",2);
  p75 = new Player(startingpos, green, "Ghost ",3);
  p76 = new Player(startingpos, green, "Ghost ",4);
  p77 = new Player(startingpos, green, "Ghost ", 1);
  p78 = new Player(startingpos, green, "Ghost ",2);
  p79 = new Player(startingpos, green, "Ghost ",3);
  p80 = new Player(startingpos, green, "Ghost ",4);
  p81 = new Player(startingpos, green, "Ghost ", 1);
  p82 = new Player(startingpos, green, "Ghost ",2);
  p83 = new Player(startingpos, green, "Ghost ",3);
  p84 = new Player(startingpos, green, "Ghost ",4);
  p85 = new Player(startingpos, green, "Ghost ",1);
  p86 = new Player(startingpos, green, "Ghost ",2);
  p87 = new Player(startingpos, green, "Ghost ",3);
  p88 = new Player(startingpos, green, "Ghost ",4);
  p89 = new Player(startingpos, green, "Ghost ",1);
  p90 = new Player(startingpos, green, "Ghost ",2);
  p91 = new Player(startingpos, green, "Ghost ", 3);
  p92 = new Player(startingpos, green, "Ghost ",4);
  p93 = new Player(startingpos, green, "Ghost ",1);
  p94 = new Player(startingpos, green, "Ghost ",2);
  p95 = new Player(startingpos, green, "Ghost ",3);
  p96 = new Player(startingpos, green, "Ghost ",4);
  p97 = new Player(startingpos, green, "Ghost ", 1);
  p98 = new Player(startingpos, green, "Ghost ",2);
  p99 = new Player(startingpos, green, "Ghost ",3);*/
  //p100 = new Player(startingpos, green, "Ghost ",4);
  setEntities(obstnum);//AT LEAST 10
}

void draw() {//runs continuously
  fill(0,255,0);
  rect( startingpos - entpos, startingpos - entpos, size, size );
  if(GoalFound() || runninitback){
    if(runitbackmoves == 0){//init player
      p51 = new Player(startingpos, red, "Player",2);//p numofghosts + 1
      //foundfirst.PruneDirs();
      goldendirs = foundfirst.getFinalDirs(foundfirst.chosendirs);
      /*for(int i : goldendirs){
        println(i);
      }*/
      for(int i = 0; i < numofghosts; i++){//kill old players
        players[i].Reset();
      }
      //println("Ghosts killed");
      fill(255,255,0);
      rect( entities[0][obstnum] - entpos, entities[1][obstnum] - entpos, size, size );//set goal
    }
    runninitback = true;
      if(runitbackmoves < goldendirs.length){
        p51.Move(goldendirs[runitbackmoves]);
        //println("Player moved " + goldendirs[runitbackmoves]);
      }else{//done moving
        p51.Reset();
        setEntities(obstnum);
        runitbackmoves = -1;//about to + 1 giving it 0
        runninitback = false;
      }
    runitbackmoves++;
  }else{
    for(Player p : players){
      try{
        p.SmartMove();
        //p.RandomMove();
      }catch(NullPointerException e){};
    }
  }
  delay(delayby);
}

void mousePressed(){//in final product, it will just do slowmode
  if(delayby == 0){
    delayby = 50;
  }else if(delayby == 50){
    delayby = 100;
  }else if(delayby == 100){
    delayby = 200;
  }else{
    delayby = 0;
  }
  /*for(Player p: players){
    try{
    p.SmartMove();}catch(Exception e){}
  }
 if(GoalFound()){
    for(Player p : players){
      try{
      p.Reset();}catch(Exception e){}
    }
    setEntities(obstnum);
    batch++;
  }*/
  //setEntities(obstnum);
}
void setEntities(int obstnum){
  boolean found = false;
  boolean exists = false;
  boolean inring = false;
  float x;
  float y;
  for(int i = 0; i <= obstnum; i++){
    fill(160);
    rect( entities[0][i] - entpos, entities[1][i] - entpos, size, size );
    entities[0][i] = 0;
    entities[1][i] = 0;
  }
  while(!found){
    boolean nearedge = true;
    while(nearedge){
      x = mapcoords[(int)random(37)];//random num 0-35
      y = mapcoords[(int)random(37)];
      if(!nearSpawn(x,y,spawngoalawayby)){//if not in spawn area
        if((81.25 < x && x < 831.25) && (81.25 < y && y < 831.25)){//if not near edge 81.25
          entities[0][obstnum] = x;//index of 100 = 101
          entities[1][obstnum] = y;
          fill(255,255,0);
          rect( x - entpos, y - entpos, size, size );//set goal
          found = true; 
          nearedge = false;
        }
      }
    }
  }//goal is initialized
  float[][] goalouterring = {{entities[0][obstnum] - size*2, entities[0][obstnum] - size, entities[0][obstnum], entities[0][obstnum] + size, entities[0][obstnum] + size*2, entities[0][obstnum] + size*2, entities[0][obstnum] + size*2, entities[0][obstnum] + size*2, entities[0][obstnum] + size*2, entities[0][obstnum] + size, entities[0][obstnum], entities[0][obstnum] - size, entities[0][obstnum] - size*2, entities[0][obstnum] - size*2, entities[0][obstnum] - size*2, entities[0][obstnum] - size*2},
  {entities[1][obstnum] - size*2, entities[1][obstnum] - size*2, entities[1][obstnum] - size*2, entities[1][obstnum] - size*2, entities[1][obstnum] - size*2, entities[1][obstnum] - size, entities[1][obstnum], entities[1][obstnum] + size, entities[1][obstnum] + size*2, entities[1][obstnum] + size*2, entities[1][obstnum] + size*2, entities[1][obstnum] + size*2, entities[1][obstnum] + size*2, entities[1][obstnum] + size, entities[1][obstnum], entities[1][obstnum] - size}};
  float[][] goalinnerring = {{entities[0][obstnum] - size, entities[0][obstnum], entities[0][obstnum] + size, entities[0][obstnum] + size, entities[0][obstnum] + size, entities[0][obstnum], entities[0][obstnum] - size, entities[0][obstnum] - size},{entities[1][obstnum] - size, entities[1][obstnum] - size, entities[1][obstnum] - size, entities[1][obstnum], entities[1][obstnum] + size, entities[1][obstnum] + size, entities[1][obstnum] + size, entities[1][obstnum]}};
  found = false;
  /*println("Outer ring:");
  for(int j = 0; j < 16; j++){
    println(goalouterring[0][j] + ", " + goalouterring[1][j]);
  }
  println("\nInner ring:");
  for(int j = 0; j < 8; j++){
    println(goalinnerring[0][j] + ", " + goalinnerring[1][j]);
  }*/
  found = false;
  for(int i = 0; i <= 2; i++){//for first 3 entity spots
    while(!found){
      x = mapcoords[(int)random(37)];//random num 0-35
      y = mapcoords[(int)random(37)];
      for(int j = 0; j < 8; j++){
        if(x == goalinnerring[0][j] && y == goalinnerring[1][j]){//if inside inner ring
          entities[0][i] = x;
          entities[1][i] = y;
          fill(255, 0,0);
          rect( x - entpos, y - entpos, size, size );
          found = true;
        }
      }
    }
    found = false;
  }
  for(int i = 3; i <= 9; i++){//for next 7 entity spots
    while(!found){
      x = mapcoords[(int)random(37)];//random num 0-35
      y = mapcoords[(int)random(37)];
      for(int j = 0; j < 16; j++){
        if(x == goalouterring[0][j] && y == goalouterring[1][j]){//if inside inner ring
          entities[0][i] = x;
          entities[1][i] = y;
          fill(255, 0,0);
          rect( x - entpos, y - entpos, size, size );
          found = true;
        }
      }
    }
    found = false;
  }
  for(int i = 10; i <= obstnum - 1; i++){//num obstacles - 1 - 10(inner and outer ring. starts at 10 bc obsts index 0-9(first 10 obsts) are already made
  while(!found){
      x = mapcoords[(int)random(37)];//random num 0-35
      y = mapcoords[(int)random(37)];
      for(int j = 0; j <= obstnum; j++){
        if(entities[0][j] == x && entities[1][j] == y){//if obstacle exists
          exists = true;
        }
      }
      for(int j = 0; j < 16; j++){//if in outer ring
        if(goalouterring[0][j] == x && goalouterring[1][j] == y){
          inring = true;
        }
      }
      for(int j = 0; j < 8; j++){//if in inner ring
        if(x == goalinnerring[0][j] && y == goalinnerring[1][j]){
          inring = true;
        }
      }
      if(!inSpawn(x,y) && !exists && !inring){//if not in spawn area and does not already exist
        entities[0][i] = x;
        entities[1][i] = y;
        fill(255, 0,0);
        rect( x - entpos, y - entpos, size, size );
        found = true; 
      }
      exists = false;
      inring = false;
    }
    found = false;
  }
  found = false;
  fill(160);
  rect(0,0,size,size);
}
boolean GoalFound(){
  boolean found = false;
  players[0] = p1;
  players[1] = p2;
  players[2] = p3;
  players[3] = p4;
  players[4] = p5;
  players[5] = p6;
  players[6] = p7;
  players[7] = p8;
  players[8] = p9;
  players[9] = p10;
  players[10] = p11;
  players[11] = p12;
  players[12] = p13;
  players[13] = p14;
  players[14] = p15;
  players[15] = p16;
  players[16] = p17;
  players[17] = p18;
  players[18] = p19;
  players[19] = p20;
  players[20] = p21;
  players[21] = p22;
  players[22] = p23;
  players[23] = p24;
  players[24] = p25;
  players[25] = p26;
  players[26] = p27;
  players[27] = p28;
  players[28] = p29;
  players[29] = p30;
  players[30] = p31;
  players[31] = p32;
  players[32] = p33;
  players[33] = p34;
  players[34] = p35;
  players[35] = p36;
  players[36] = p37;
  players[37] = p38;
  players[38] = p39;
  players[39] = p40;
  players[40] = p41;
  players[41] = p42;
  players[42] = p43;
  players[43] = p44;
  players[44] = p45;
  players[45] = p46;
  players[46] = p47;
  players[47] = p48;
  players[48] = p49;
  players[49] = p50;
  /*players[50] = p51;
  players[51] = p52;
  players[52] = p53;
  players[53] = p54;
  players[54] = p55;
  players[55] = p56;
  players[56] = p57;
  players[57] = p58;
  players[58] = p59;
  players[59] = p60;
  players[60] = p61;
  players[61] = p62;
  players[62] = p63;
  players[63] = p64;
  players[64] = p65;
  players[65] = p66;
  players[66] = p67;
  players[67] = p68;
  players[68] = p69;
  players[69] = p70;
  players[70] = p71;
  players[71] = p72;
  players[72] = p73;
  players[73] = p74;
  players[74] = p75;
  players[75] = p76;
  players[76] = p77;
  players[77] = p78;
  players[78] = p79;
  players[79] = p80;
  players[80] = p81;
  players[81] = p82;
  players[82] = p83;
  players[83] = p84;
  players[84] = p85;
  players[85] = p86;
  players[86] = p87;
  players[87] = p88;
  players[88] = p89;
  players[89] = p90;
  players[90] = p91;
  players[91] = p92;
  players[92] = p93;
  players[93] = p94;
  players[94] = p95;
  players[95] = p96;
  players[96] = p97;
  players[97] = p98;
  players[98] = p99;
  //players[99] = p100;*/
  for(int i = 0; i < numofghosts && !found; i++){
    try{
      if(players[i].x == entities[0][entities.length - 1] && players[i].y == entities[1][entities.length - 1]){//index of 100 = 101
        found = true;
        println("Goal found by " + players[i].name);
        fill(130);
        rect( 0, mapcoords[mapcoords.length - 1] - entpos + size, mapcoords[mapcoords.length - 1] - entpos + size, mapcoords[mapcoords.length - 1] - entpos + size);
        fill(0);
        text("Batch " + batch,9, 925, 100,950);
        foundfirst = players[i];
        batch++;
      }
    }catch(NullPointerException e){}
  }
  return found;
}
boolean inSpawn(float x, float y){
  boolean inspawn = false;
  if((mapcoords[indexofmiddle - spawnareasize] <= x && x <= mapcoords[indexofmiddle + spawnareasize]) && (mapcoords[indexofmiddle - spawnareasize] <= y && y <= mapcoords[indexofmiddle + spawnareasize])){
    inspawn = true;
  }
  return inspawn;
}
boolean nearSpawn(float x, float y, int awayby){//for goal
  boolean nearspawn = false;
  if((mapcoords[indexofmiddle - spawnareasize] - size*awayby <= x && x <= mapcoords[indexofmiddle + spawnareasize] + size*awayby) && (mapcoords[indexofmiddle - spawnareasize] - size*awayby <= y && y <= mapcoords[indexofmiddle + spawnareasize] + size*awayby)){
    nearspawn = true;
  }
  return nearspawn;
}
