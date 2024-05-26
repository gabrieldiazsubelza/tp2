//Diaz Subelza Gabriel
//tp2 comisión 1

PFont calibri;
int segundos,pX,pX2,alturaRecuadro;
float velocidad;
String proceso;
PImage pikachu,charizard;

void setup(){
  size(640,480);
  calibri = loadFont("calibri.vlw");
  textFont(calibri,30);
  proceso = "inicioPB";
  velocidad = 4.5;
  alturaRecuadro = 0;
  pX = width;
  pX2 = -width;
  pikachu = loadImage("pikachu.png");
  charizard = loadImage("charizard.png");
}

void draw(){
  background(225);
  if(proceso.equals("inicioPB")){
    drawPB();
    textoIniciar();
  }else if(proceso.equals("encuentro")){
    drawPB();
    textoIniciar();
    fill(0);
    rect(pX,0,640,160);
    rect(pX2,160,640,160);
    rect(pX,320,640,160);
    if(pX != pX2 && pX2 != pX){
      pX -= velocidad;
      pX2 += velocidad;
    }else{
      proceso = "oscuro";
    }
  }else if(proceso.equals("oscuro")){
    if(frameCount%60 == 0){
    segundos++;;
    }
    background(0);
  }
  if(segundos > 1){
    fill(228,237,194);
    noStroke();
    rect(0,120,width,alturaRecuadro);
    if(alturaRecuadro != 200){
      alturaRecuadro++;
    }
  if(segundos > 2){
    image(pikachu,-width,120);
  }
  }
}

void mousePressed(){
  if((dist(mouseX,mouseY,width/2,height/2))<80){
    proceso = "encuentro";
  }
}

void drawPB(){
  fill(255,0,0);
  strokeWeight(10);
  arc(width/2,height/2,150,150,PI,TWO_PI);
  fill(255);
  strokeWeight(10);
  arc(width/2,height/2,150,150,0,PI);
  fill(0);
  strokeWeight(10);
  line(246,238,388,238);
  fill(255);
  strokeWeight(10);
  arc(width/2,height/2,50,50,0,TWO_PI);
}

void textoIniciar(){
  fill(0);
  textAlign(CENTER);
  text("HACÉ CLICK EN LA POKEBALL PARA INICIAR.",width/2,height/2+120);
}
