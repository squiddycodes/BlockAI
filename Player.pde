//BlockAI b = new BlockAI();
class Player{
  float[] mapcoords = {6.25, 31.25, 56.25, 81.25, 106.25, 131.25, 156.25, 181.25, 206.25, 231.25, 256.25, 281.25, 306.25, 331.25, 356.25, 381.25, 406.25, 431.25, 456.25, 481.25, 506.25, 531.25, 556.25, 581.25, 606.25, 631.25, 656.25, 681.25, 706.25, 731.25, 756.25, 781.25, 806.25, 831.25, 856.25, 881.25, 906.25};
  float[] spawncoords = {431.25,431.25, 431.25,456.25, 431.25,481.25, 456.25,431.25, 456.25,481.25, 481.25,431.25, 481.25,456.25, 481.25,481.25};
  boolean rected = false;
  float x;
  float y;
  int xdir;
  int xalt;
  int ydir;
  int yalt;
  int pclass;
  int movesallowed = 1000;
  float[][] pos = new float[movesallowed][movesallowed];
  int[][] dirs = new int[movesallowed][movesallowed];
  int[] chosendirs = new int[movesallowed];
  int[] lastdir = new int[movesallowed];
  boolean isinloop = false;
  int lastloopindx;
  boolean loopfound = false;
  float tempx;
  float tempy;
  int obstscrossed = 0;
  String name;
  int obstnum = 250;
  int moves = 0;
  float ppos = 12.5;
  float startingpos = 456.25;//x, y
  int size = 25;
  int[] pcolor = new int[3];
  int[] red = {255,0,0};
  int[] green = {0,255,0};
  int[] blue = {0,0,255};
  boolean traversingobsty = false;
  int traversedirection = 0;
  int traverserand;
  boolean traversingobstx = false;
  Player(float pos, int[] ppcolor, String pname, int ppclass){
    x = pos;
    y = pos;
    pclass = ppclass;
    for(int i = 0; i < 3; i++){
      pcolor[i] = ppcolor[i];
    }
    name = pname;
    Create();
    println("Initialized " + pname);
  }
  void Create(){
    fill(pcolor[0],pcolor[1],pcolor[2]);
    rect( x, y, ppos, ppos, 5 );
  }
  void RandomMove(){
    boolean done = false;
    int direction;
    while(done == false){
      done = true;
      direction  = int(random(1,5));
      try{
      Move(direction);
      }catch(Exception e){done = false;}
    }
  }
  void Move(int direction){
    checkForDir();
    try{
    lastdir[moves] = direction;}catch(Exception e){println("Error with Player at (" + pos[moves - 1] + ", " + pos[moves - 1] + ")");}
    rected = false;
    if(direction == 1){//left
      if(x != (ppos / 2) && !hitsEntity(direction, x, y)){//if not all the way at left and if no entity at x-25, y
        if(x == 456.25 && y == 456.25){
          fill(0,255,0);
          rect( x - ppos/2, y - ppos/2, size, size );
        }else{
          for(int i = 0; i <= spawncoords.length - 1; i+=2){
            if(x == spawncoords[i] && y == spawncoords[i + 1]){
              fill(140);
              rect( spawncoords[i] - entpos, spawncoords[i + 1] - entpos, size, size );
              rected = true;
            }
          }
          if(!rected){
            fill(160);
            rect( x - ppos/2, y - ppos/2, size, size );
          }
        }
        //fill(160);
        //rect( x - ppos/2, y - ppos/2, size, size );
        fill(pcolor[0],pcolor[1],pcolor[2]);
        rect( x - size, y, ppos, ppos, 5 );//player
        pos[0][moves] = x-size;
        pos[1][moves] = y;
        dirs[0][moves] = xdir;
        dirs[1][moves] = ydir;
        chosendirs[moves] = 1;
        x-=size;
      }
    }else if(direction == 2){//right
      if(x != mapcoords[mapcoords.length - 1] && !hitsEntity(direction, x, y)){//if not at right edge
        if(x == 456.25 && y == 456.25){
          fill(0,255,0);
          rect( x - ppos/2, y - ppos/2, size, size );
        }else{
          
          for(int i = 0; i <= spawncoords.length - 1; i+=2){
            if(x == spawncoords[i] && y == spawncoords[i + 1]){
              fill(140);
              rect( spawncoords[i] - entpos, spawncoords[i + 1] - entpos, size, size );
              rected = true;
            }
          }
          if(!rected){
            fill(160);
            rect( x - ppos/2, y - ppos/2, size, size );
          }
        }
        fill(pcolor[0],pcolor[1],pcolor[2]);
        rect( x + size, y, ppos, ppos, 5 );
        pos[0][moves] = x+size;
        pos[1][moves] = y;
        dirs[0][moves] = xdir;
        dirs[1][moves] = ydir;
        chosendirs[moves] = 2;
        x+=size;
      }
    }else if(direction == 3){//up                                    DOWN THE GAME IS +++ Y
      if(y != (ppos / 2) && !hitsEntity(direction, x, y)){//if not at the top
        if(x == 456.25 && y == 456.25){
          fill(0,255,0);
          rect( x - ppos/2, y - ppos/2, size, size );
        }else{
          
          for(int i = 0; i <= spawncoords.length - 1; i+=2){
            if(x == spawncoords[i] && y == spawncoords[i + 1]){
              fill(140);
              rect( spawncoords[i] - entpos, spawncoords[i + 1] - entpos, size, size );
              rected = true;
            }
          }
          if(!rected){
            fill(160);
            rect( x - ppos/2, y - ppos/2, size, size );
          }
        }
        fill(pcolor[0],pcolor[1],pcolor[2]);
        rect( x, y - size, ppos, ppos, 5 );
        pos[0][moves] = x;
        pos[1][moves] = y-size;
        dirs[0][moves] = xdir;
        dirs[1][moves] = ydir;
        chosendirs[moves] = 3;
        y-=size;
      }
    }else if(direction == 4){//down
      if(y != mapcoords[mapcoords.length - 1] && !hitsEntity(direction, x, y)){//if not at bottom
      
        if(x == 456.25 && y == 456.25){
          fill(0,255,0);
          rect( x - ppos/2, y - ppos/2, size, size );
        }else{
          
          for(int i = 0; i <= spawncoords.length - 1; i+=2){
            if(x == spawncoords[i] && y == spawncoords[i + 1]){
              fill(140);
              rect( spawncoords[i] - entpos, spawncoords[i + 1] - entpos, size, size );
              rected = true;
            }
          }
          if(!rected){
            fill(160);
            rect( x - ppos/2, y - ppos/2, size, size );
          }
        }
        
        fill(pcolor[0],pcolor[1],pcolor[2]);
        rect( x, y + size, ppos, ppos, 5 );
        pos[0][moves] = x;
        pos[1][moves] = y+size;
        dirs[0][moves] = xdir;
        dirs[1][moves] = ydir;
        chosendirs[moves] = 4;
        y+=size;
      }
    }
    else{
      //println("Invalid direction: " + direction);
      /*if(xdir == 0){
        Move((int)random(3,5));//random direction for y (3-4)
      }
      else{
        Move((int)random(1,3));//random x dir
      }*/
    }
    moves++;
    try{
      lastloopindx++;}catch(Exception e){}
  }
  void SmartMove(){
      //println("moves: " + moves);
    if(moves < movesallowed - 1){
      checkForDir();
      dirs[0][moves] = xdir;
      dirs[1][moves] = ydir;
      traversedirection = (int)random(1,3);
      traverserand = (int)random(1,3);
      //println("Hits at " + pos[0][moves - 1] + ", " + pos[1][moves - 1] +"? " + hitsEntity(dirs[1][moves], pos[0][moves - 1], pos[1][moves - 1]) + " Hits at " + pos[0][moves - 2] + ", " + pos[1][moves - 2] +"? " + hitsEntity(dirs[1][moves], pos[0][moves - 2], pos[1][moves - 2]));
      //println("(" + hitsEntity(ydir, x, y) + " || " + hitsEntity(dirs[1][moves], pos[0][moves - 1], pos[1][moves - 1]) + ") || (" + hitsEntity(ydir, x, y) + " && " + !hitsEntity(dirs[1][moves], pos[0][moves - 1], pos[1][moves - 1]) + ") || (" + (!hitsEntity(ydir, x, y) + " && " + hitsEntity(dirs[1][moves], pos[0][moves - 1], pos[1][moves - 1])) + ") == " + ((hitsEntity(ydir, x, y) || hitsEntity(dirs[1][moves], pos[0][moves - 1], pos[1][moves - 1])) || (hitsEntity(ydir, x, y) && hitsEntity(dirs[1][moves], pos[0][moves - 1], pos[1][moves - 1])) || (!hitsEntity(ydir, x, y) && hitsEntity(dirs[1][moves], pos[0][moves - 2], pos[1][moves - 2]))));}catch(Exception e){}
      if(moves == 0){
        if(xdir != 0 && ydir != 0){
          switch(pclass){
            case 1:Move(xdir);break;
            case 2:Move(ydir);break;
            case 3:Move(xdir);break;
            case 4:Move(ydir);break;
          }
        }
        else if(xdir == 0){
          Move(ydir);
        }else if(ydir == 0){
          Move(xdir);
        }else{
          println("WOPPAN GANGNAM STYLE");
        }
      }else if(moves == 1){
        if(xdir != 0 && ydir != 0){
          switch(pclass){
            case 1:Move(xdir);break;
            case 2:Move(ydir);break;
            case 3:if(traversedirection == 1){Move(xdir);}else{Move(ydir);};break;
            case 4:if(traversedirection == 1){Move(ydir);}else{Move(xdir);};break;
          }
         }else if(xdir == 0){
           Move(ydir);
         }else if(ydir == 0){
           Move(xdir);
         }
         else{
           println("GreaT BRITISH BOMBS IN THE AIR MON");
         }
      }
      
      
      
      /*else if(isInLoop()){
        println(name + " is in loop");
      }*/
      else if(hitsEntity(xdir, x, y) && xdir != 0){//if hits xdir
        //println("Hit in xdir:" + ydir + " Traversing obst y = " + traversingobsty);
        //pcolor = green;
        traversingobstx = true;
        if(traversingobsty){
          TraverseObstacle(ydir, traversedirection);
        }else{//if dn hit on y
          TraverseObstacle(xdir, traversedirection);
        }
      }//Y -->
      else if(((hitsEntity(ydir, x, y) && !hitsEntity(dirs[1][moves], pos[0][moves - 1], pos[1][moves - 1])
      && hitsEntity(dirs[1][moves], pos[0][moves - 2], pos[1][moves - 2]))) && ydir != 0){//if hits in ydir
        //println("Hit in ydir:" + ydir + " Traversing obst x = " + traversingobstx + " traverse direction: " + traversedirection);
        //pcolor = blue;
        traversingobsty = true;
        if(traversingobstx){
          TraverseObstacle(xdir, traversedirection);
        }else{
          TraverseObstacle(ydir, traversedirection);
        }
      }
      else if((x == entities[0][obstnum] - size) && (y == entities[1][obstnum] - size)){//x = player, 0 = goal  x-
        Move(2);                                                                                           //   -0
        Move(4);                                                                                           
      }else if((x == entities[0][obstnum] + size) && (y == entities[1][obstnum] - size)){//x = player, 0 = goal  -x
        Move(1);                                                                                           //    0-
        Move(4);                                                                                           
      }else if((x == entities[0][obstnum] - size) && (y == entities[1][obstnum] + size)){//x = player, 0 = goal  -0
        Move(2);                                                                                           //    x-
        Move(3);
      }else if((x == entities[0][obstnum] + size) && (y == entities[1][obstnum] + size)){//x = player, 0 = goal  0-
        Move(1);                                                                                           //    -x
        Move(3);
      }
      else{//if doesn't hit enemy
        traversingobstx = false;
        traversingobsty = false;
        traversedirection = 0;
        //println(name + "movin ");
        //pcolor = red;
          if(xdir != 0 && ydir != 0){
            if(hitsEntity(xdir, x, y)){
              Move(ydir);
            }else if(hitsEntity(ydir, x, y)){
              Move(xdir);
            }else{//if doesn't hit entity
              if(moves%2==0){//even move
                switch(pclass){
                  case 1:Move(xdir);break;
                  case 2:Move(ydir);break;
                  case 3:Move(xdir);break;
                  case 4:Move(ydir);break;
                }
              }else{//odd move
                switch(pclass){
                  case 1:Move(xdir);break;
                  case 2:Move(ydir);break;
                  case 3:Move(ydir);break;
                  case 4:Move(xdir);break;
                }
              }
            }
        }else if(xdir == 0){
          if(hitsEntity(ydir, x, y)){
            Move(xdir);
          }else{
            Move(ydir);
          }
        }else if(ydir == 0){
          if(hitsEntity(xdir, x, y)){
            Move(ydir);
          }else{
            Move(xdir);
          }
        }
        else{
          println("NANI DESKA?!?");
        }
      }
      //println(name +" completed moves: " + moves);
    }
  }
  void Reset(){
    if(x == entities[0][100] && y == entities[1][100]){
      fill(255,255,0);
    }else{
      fill(160);
    }
    rect( x - (ppos / 2), y - (ppos / 2), size, size );//gray
    x = startingpos;
    y = startingpos;
    pos = new float[movesallowed][movesallowed];
    dirs = new int[movesallowed][movesallowed];
    chosendirs = new int[movesallowed];
    lastdir = new int[movesallowed];
    moves = 0;
  }
  boolean hitsEntity(int direction, float x, float y){
    boolean hits = false;
    if(direction == 1){//left
      for(int i = 0; i <obstnum; i++){
        if(entities[0][i] == x-size && entities[1][i] == y){
          hits = true;
        }
      }
    }else if(direction == 2){//right
      for(int i = 0; i <obstnum; i++){
        if(entities[0][i] == x+size && entities[1][i] == y){
          hits = true;
        }
      }
    }else if(direction == 3){//up
      for(int i = 0; i <obstnum; i++){
        if(entities[0][i] == x && entities[1][i] == y-size){
          hits = true;
        }
      }
    }else{//down
      for(int i = 0; i <obstnum; i++){
        if(entities[0][i] == x && entities[1][i] == y+size){
          hits = true;
        }
      }
    }
    return hits;
  }
  boolean inSpawn(float x, float y){
    boolean inspawn = false;
    if((406.25 < x && x < 506.25) && (406.25 < y && y < 506.25)){
      inspawn = true;
    }
    return inspawn;
  }
  void checkForDir(){
    if(entities[0][obstnum] - x < 0){//if goal is to the left
        xdir = 1;
        xalt = 2;
      }else if(entities[0][obstnum] - x > 0){//if goal is to the right
        xdir = 2;
        xalt = 1;
      }
      else{//if on same x as goal
        xdir = 0;
        xalt = 0;
      }
      if(entities[1][obstnum] - y < 0){//goal is above
        ydir = 3;
        yalt = 4;
      }
      else if(entities[1][obstnum] - y > 0){//goal is below
        ydir = 4;
        yalt = 3;
      }else{//goal is on same y
       ydir = 0;
       yalt = 0;
      }
      //println("xdir = " + xdir + " ydir = " + ydir);
  }
  int dirInverse(int direction){
    int ret = (int)random(1,4);
    switch(direction){
      case 1:ret=2;break;
      case 2:ret=1;break;
      case 3:ret=4;break;
      case 4:ret=3;break;
    }
    return ret;//red if no collision, green if y collision, purple if x collision
  }
  void TraverseObstacle(int direction, int traversedir){
    //println("Direction == " + direction);
    if(direction == 1 || direction == 2){//x dir
      if(traversedir == 1 && y != ppos/2){//go up
      //println(name + "moving up2");
        while(hitsEntity(3, x, y) && moves < movesallowed - 1){//when hit top
          while(hitsEntity(xalt, x, y) && moves < movesallowed - 1){
            while(hitsEntity(4, x, y) && moves < movesallowed - 1){
              Move(xdir);
            }
            Move(4);
          }
          Move(xalt);
        }
        Move(3);//if no hit top, go up
      }else if(traversedir == 2 && y != mapcoords[mapcoords.length - 1]){//go down
      //println(name + "moving down2");
        while(hitsEntity(4, x, y) && moves < movesallowed - 1){
          while(hitsEntity(xalt, x, y) && moves < movesallowed - 1){
            while(hitsEntity(3, x, y) && moves < movesallowed - 1){
              Move(xdir);
            }
            Move(3);
          }
          Move(xalt);
        }
        Move(4);
      }else if(traversedir == 2 && y == ppos/2){//if wants to go up but at top, go down
      //println(name + "moving down");
        while(hitsEntity(4, x, y) && moves < movesallowed - 1){
          while(hitsEntity(xalt, x, y) && moves < movesallowed - 1){
            while(hitsEntity(3, x, y) && moves < movesallowed - 1){
              Move(xdir);
            }
            Move(3);
          }
          Move(xalt);
        }
        Move(4);
      }
      else if(traversedir == 1 && y == mapcoords[mapcoords.length - 1]){//if wants to go down but at bottom, go up
      //println(name + "moving up");
        while(hitsEntity(3, x, y) && moves < movesallowed - 1){//when hit top
          while(hitsEntity(xalt, x, y) && moves < movesallowed - 1){
            while(hitsEntity(4, x, y) && moves < movesallowed - 1){
              Move(xdir);
            }
            Move(4);
          }
          Move(xalt);
        }
        Move(3);//if no hit top, go up
      }
      traversingobstx = false;
    }else if(direction == 3 || direction == 4){//y
      //print("moved ydir?");
      if(traversedir == 1 && x != ppos/2){//go left
          traversedir = 2;
          //println(name + "moving left2");
          while(hitsEntity(ydir, x, y) && moves < movesallowed - 1){
            while(hitsEntity(1, x, y) && moves < movesallowed - 1){
              while(hitsEntity(yalt, x, y) && moves < movesallowed - 1){
                while(hitsEntity(2, x, y) && moves < movesallowed - 1){
                  Move(ydir);
                }//if((hit entity in ydir || hit entity in ydir 1 move ago) || (hit entity in ydir && didn't hit entity in ydir 1 move ago))
                //          no                            yes                             no                          no                            
                Move(2);
              }
              Move(yalt);
            }
            Move(1);
          }
          Move(ydir);
          }
          else if(traversedir == 2 && x != mapcoords[mapcoords.length - 1]){//go right
          traversedir = 1;
          //println(name + "moving right2");
          while(hitsEntity(ydir, x, y) && moves < movesallowed - 1){
            while(hitsEntity(2, x, y) && moves < movesallowed - 1){
              while(hitsEntity(yalt, x, y) && moves < movesallowed - 1){
                while(hitsEntity(1, x, y) && moves < movesallowed - 1){
                  Move(ydir);
                }
                Move(1);
              }
              Move(yalt);
            }
            Move(2);
          }
          Move(ydir);
          }else if(traversedir == 2 && x == ppos/2){//if on left side of the map, go right
          traversedir = 1;
          //println(name + "moving right");
            while(hitsEntity(ydir, x, y) && moves < movesallowed - 1){
              while(hitsEntity(2, x, y) && moves < movesallowed - 1){
                while(hitsEntity(yalt, x, y) && moves < movesallowed - 1){
                  while(hitsEntity(1, x, y) && moves < movesallowed - 1){
                    Move(ydir);
                  }
                  Move(1);
                }
                Move(yalt);
              }
              Move(2);
            }
            Move(ydir);
            }else if(traversedir == 1 && x == mapcoords[mapcoords.length - 1]){//go left
            traversedir = 2;
            //println(name + "moving left");
            while(hitsEntity(ydir, x, y) && moves < movesallowed - 1){
              while(hitsEntity(1, x, y) && moves < movesallowed - 1){
                while(hitsEntity(yalt, x, y) && moves < movesallowed - 1){
                  while(hitsEntity(2, x, y) && moves < movesallowed - 1){
                    Move(ydir);
                  }    
                  Move(2);
                }
                Move(yalt);
              }
              Move(1);
            }
          Move(ydir);
        }
        traversingobsty = false;
    }
    else{println("shiitty");}
  }
  void doyathang(int[] dirs){
    for(int direction : dirs){
        if(direction != 0){
          p51.Move(direction);
          //println("moved " + direction);
        }
      }
  }
  int[] getFinalDirs(int[] dirs){
    int finaldirslen = 0;
    boolean keepgoing = true;
    for(int i = 0; keepgoing; i++){
      if(dirs[i] != 0 && dirs[i] != 5){
        finaldirslen++; 
      }
      if(dirs[i] == 0 && dirs[i + 1] == 0 && dirs[i + 2] == 0 && dirs[i + 3] == 0 ){
        keepgoing = false; 
      }
    }
    int[] finaldirs = new int[finaldirslen];
    int dirsindex = 0;
    for(int i = 0; dirsindex < finaldirslen; i++){
      if(dirs[i] != 0 && dirs[i] != 5){
       finaldirs[dirsindex] = dirs[i];
       dirsindex++;
      }
    }
    return finaldirs;
  }
  int[] PruneDirs(){//prunes chosendirs
    int prunedmoveslen = 0;
    boolean keepgoing = true;
    boolean allow = true;
    for(int i = 0; keepgoing; i++, allow = true){
      for(int j = 0; j < i; j++){
        if(pos[0][i] == pos[0][j] && pos[1][i] == pos[1][j]){//if it equals one of the prev pos'
          allow = false;
        }
      }
      if(pos[0][i] == 0 && pos[0][i + 1] == 0 && pos[0][i + 2] == 0 && pos[0][i + 3] == 0 ){
        keepgoing = false; 
      }
      if(allow){
        prunedmoveslen++;
      }
    }
    int[] prunedmoves = new int[prunedmoveslen];
    for(int i = 0; i < prunedmoveslen; i++, allow = true){//LOOP 2
      for(int j = 0; j < i; j++){
        if(pos[0][i] == pos[0][j] && pos[1][i] == pos[1][j]){//if pos[i] equals pos[j]  pos[j] is < pos[i]
          for(int x = j; x < i; x++){
            chosendirs[x] = 5;//will not be counted
          }
        }
      }
      if(pos[0][i] == 0 && pos[0][i + 1] == 0 && pos[0][i + 2] == 0 && pos[0][i + 3] == 0 ){
        keepgoing = false; 
      }
    }
    return prunedmoves;
  }
}
