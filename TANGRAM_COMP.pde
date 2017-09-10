float posx[] = new float[7];
float posy[] = new float[7];
float r[] = new float[7];
color col[] = new color[7];
boolean lock;
int sh;
float l = 70;
int sel;
color C;
boolean left;
int lev;
PImage fig;
String c = "Cat";
String h = "House";
String d = "Duck";
String f = "Fish";
String m = "Man";
String b = "Bird";
String dg = "Dog";
String hr = "Horse";
String rb = "Rabbit";
String ss = "Spaceship";
String fr = "Freestyle";
String ad = "CREATE YOUR OWN FIGURES";
String tan = "FREESTYLE TANGRAM";
String ins = "INSTRUCTIONS:";
String t = "--LEFT CLICK = Shape moving";
String rot = "--RIGHT CLICK = Shape rotation";
String chfig = "--C = Change figure"; 
String paral = "--R or L = Parallelepiped orientation (Mirror)";
String res = "--SPACE = Reset game";

void setup(){
  size(1100,600);
  reset();
}

void reset(){
  posx[0]=190;//Triangulo grande 1
  posy[0]=420;
  r[0]=radians(-90);
  col[0]= color(240,255,49);
  
  posx[1]=140;//Triangulo grande 2
  posy[1]=470;
  r[1]=radians(180);
  col[1]= color(243,153,49);
  
  posx[2]=265;//Triangulo pequeño 1
  posy[2]=420;
  r[2]=0;
  col[2]= color(50,164,248);
  
  posx[3]=240;//Cuadrado
  posy[3]=470;
  r[3]=radians(45);
  col[3]= color(230,50,48);
  
  posx[4]=190;//Triangulo pequeño 2
  posy[4]=495;
  r[4]=radians(90);
  col[4]=color(50,230,76);
  
  posx[5]=165;//Paralelepipedo
  posy[5]=545;
  r[5]=radians(45);
  col[5]=color(51,235,233);
  
  posx[6]=265;//Triangulo mediano
  posy[6]=545;
  r[6]=radians(-135);
  col[6]= color(255,51,230);
  
  left = false;
}

void draw(){
  background(224);
  
  fill(0);//TITULO
  textSize(30);
  text(tan,420,50);
  
  textSize(28);//INSTRUCCIONES
  fill(0);
  text(ins,860,80);
  textSize(18);
  text(t,850,120,200,180);
  text(rot,850,180,200,240);
  text(chfig,850,240,200,270);
  text(paral,850,270,200,360);
  text(res,850,360,200,450);
  
  fill(250);//Tablero de juego
  rect(340,60,480,510);
  
  fill(224);//Figuras a armar
  pushMatrix();
    if(lev == 0){
      fig = loadImage("CAT.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(c,166,315,224,30);
    }
    if(lev == 1){
      fig = loadImage("HOUSE.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(h,166,315,224,30);
    }
    if(lev == 2){
      fig = loadImage("DUCK.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(d,166,315,224,30);
    }
    if(lev == 3){
      fig = loadImage("FISH.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(f,166,315,224,30);
    }
    if(lev == 4){
      fig = loadImage("RUNNING MAN.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(m,166,315,224,30);
    }
    if(lev == 5){
      fig = loadImage("BIRD.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(b,166,315,224,30);
    }
    if(lev == 6){
      fig = loadImage("DOG.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(dg,166,315,224,30);
    }
    if(lev == 7){
      fig = loadImage("HORSE.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(hr,156,315,224,30);
    }
    if(lev == 8){
      fig = loadImage("RABBIT.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(rb,156,315,224,30);
    }
    if(lev == 9){
      fig = loadImage("SPACESHIP.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(ss,136,315,224,30);
    }
    if(lev == 10){
      fill(0);
      textSize(30);
      text(ad,86,151,224,100);
      textSize(20);
      text(fr,136,315,224,30);
    }
  popMatrix();
  for(sh = 0; sh < 7; sh++){
    pushMatrix();
    fill(col[sh]);
    translate(posx[sh],posy[sh]);
    rotate(r[sh]);
    switch(sh){
      case 0://Grande 1
        beginShape(TRIANGLES);
        vertex((sqrt(2)/2)*l,-sqrt(2)*l);
        vertex(-(sqrt(2)/2)*l,0);
        vertex((sqrt(2)/2)*l,sqrt(2)*l);
        endShape();
        break;
      case 1://Grande 2
        beginShape(TRIANGLES);
        vertex((sqrt(2)/2)*l,-sqrt(2)*l);
        vertex(-(sqrt(2)/2)*l,0);
        vertex((sqrt(2)/2)*l,sqrt(2)*l);
        endShape();
        break;
      case 2://Pequeño 1
        
        beginShape(TRIANGLES);
        vertex((sqrt(2)/4)*l,-(sqrt(2)/2)*l);
        vertex(-(sqrt(2)/4)*l,0);
        vertex((sqrt(2)/4)*l,(sqrt(2)/2)*l);
        endShape();
        break;
      case 3://Cuadrado
        
        rect(-l/2,-l/2,l,l);
        break;
      case 4://Pequeño 2
        
        beginShape(TRIANGLES);
        vertex((sqrt(2)/4)*l,-(sqrt(2)/2)*l);
        vertex(-(sqrt(2)/4)*l,0);
        vertex((sqrt(2)/4)*l,(sqrt(2)/2)*l);
        endShape();
        break;
      case 5://Paralelepípedo
        if(!left){
          beginShape(QUADS);
          vertex(-l/2,0);
          vertex(-l/2,l);
          vertex(l/2,0);
          vertex(l/2,-l); 
          endShape();
        }else{
          beginShape(QUADS);
          vertex(-l/2,-l);
          vertex(-l/2,0);
          vertex(l/2,l);
          vertex(l/2,0);      
          endShape();
        }
        break;
      case 6://Mediano        
        beginShape(TRIANGLES);
        vertex(l/2,-l);
        vertex(-l/2,0);
        vertex(l/2,l);
        endShape();
        break;
    }
    popMatrix();
  }
}

void mousePressed(){ 
  C = get(mouseX,mouseY);
  for(sh=0;sh<7;sh++){
  if(C == col[sh]){
      if(mouseButton == LEFT && !lock){
        lock = true;
      }
  }
  if(mouseButton == RIGHT){
  color D = get(mouseX,mouseY); 
    if(D == col[sh]){
      r[sh] += radians(45);
    }
  }
  }
}

void mouseDragged(){
  for(sh=0;sh<7;sh++){
    if(C == col[sh]){
      posx[sh] = mouseX;
      posy[sh] = mouseY;
    }
  }
}

void mouseReleased(){
  if(mouseButton == LEFT){
    lock = false;
  }
}

void keyPressed(){
  if(key == ' '){
    reset();
  }
  if(key == 'r' || key == 'R'){
    left = true;
  }else if(key == 'l' || key == 'L'){
    left = false;
  }
  if(key == 'c'|| key == 'C'){
    if(lev == 10){
      lev = 0;
    }else{
      lev++;
    }
  }
}