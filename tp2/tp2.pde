PImage img1, img2, img3, img4, img5, img6;
PFont fuenteJuego;


int tiempoDelPwp;    
int momentoDeInicio = 0;
int segundosPantalla;


float movimientoDelTexto; // p1
float fade2;             // p2      
float opacidadDelFade4;  // p4   

//////7 segundos

void setup() {
  size(640, 480);
  frameRate(60); 
  
  // fotos
  img1 = loadImage("Franbow1.png");
  img2 = loadImage("Franbow2.png");
  img3 = loadImage("Franbow3.png"); 
  img4 = loadImage("Franbow4.png");
  img5 = loadImage("Franbow5.png");
  img6 = loadImage("Frambow6.png"); // ERA N
  
  
  
  fuenteJuego = loadFont("HighTowerText-Italic-48.vlw");
  textFont(fuenteJuego);
  textAlign(CENTER, CENTER);
  
  reinicio();
}

void draw(){
  background(0);
  
  tiempoDelPwp = millis() / 1000;
  segundosPantalla = tiempoDelPwp - momentoDeInicio;
  
  //pantallas
  
  // pantalla 1
  if (segundosPantalla >= 0 && segundosPantalla < 7) {
    image(img1, 0, 0, width, height);
    
   
    movimientoDelTexto = movimientoDelTexto + 0.3;
    
    fill(255);
    textSize(18);
    
    textAlign(LEFT, TOP);
    text("Fran Bow es un videojuego de terror psicológico y aventura gráfica lanzado en 2015. Fue creado por la empresa sueca Killmonday Games y se caracteriza por su estética oscura, dibujo infantil y temas perturbadores.", movimientoDelTexto, height - 160, 560, 200);
  }
  
  
  
  
  
  // pantalla 2 hospital
  else if (segundosPantalla >= 7 && segundosPantalla < 14){
    image(img2, 0, 0, width, height);
    
    if (fade2 < 255) {
      fade2 = fade2 + 4;
    }
    fill(255, 255, 255, fade2);
    textSize(18);
    
    textAlign(LEFT, TOP);
    text("La historia sigue a Fran, una niña que presencia la muerte de sus padres y termina internada en un hospital psiquiátrico. Junto a su gato, Sr. Medianoche, intenta escapar para descubrir la verdad sobre lo sucedido y reencontrarse con su tía.", 40, 20, 560, 200);
  } 
  
  
  
  
  
  
 // pantalla 3 hospital con sangre
  else if (segundosPantalla >= 14 && segundosPantalla < 21){
    image(img3, 0, 0, width, height);
    
    
    fill(255, 255, 200);
    textSize(18);
    
    textAlign(LEFT, TOP);
    text("El juego se basa en explorar escenarios, resolver acertijos y hablar con personajes. Una mecánica importante es el uso de unas pastillas que permiten ver otra versión más oscura y extraña de la realidad.", 40, 20, 560, 200);
  } 
  
  
  
  // pantalla 4 q tiene el fade
  else if (segundosPantalla >= 21 && segundosPantalla < 28){
    image(img4, 0, 0, width, height);
    
    if (opacidadDelFade4 < 255) {
      opacidadDelFade4 = opacidadDelFade4 + 2.5;
    }
    
    fill(255, 255, 255, opacidadDelFade4);
    textSize(18);
    
    textAlign(LEFT, TOP);
    text("Fran Bow mezcla terror psicológico, fantasía y misterio. Trata temas como la pérdida, la salud mental, el miedo y la infancia, usando un estilo visual dibujado a mano con contrastes entre lo tierno y lo macabro.", 40, 20, 560, 200);
  } 
  
  // pantalla 5
  else if (segundosPantalla >= 28 && segundosPantalla < 35){
    image(img5, 0, 0, width, height);
    
    fill(230, 255, 255);
    
    textSize(18);
    
    textAlign(LEFT, TOP);
    text("El juego fue muy valorado por su historia profunda, ambientación inquietante y originalidad. Se volvió popular entre fans de juegos narrativos y de terror independiente por su forma única de contar una historia.", 40, height - 80, 560, 200);
  } 
  
  // panatalla 6 solo boton
  else if (segundosPantalla >= 35){
    image(img6, 0, 0, width, height);
    
    textAlign(CENTER, CENTER);
 fill(0);
    stroke(0);
    strokeWeight(2);
            rect(20, height - 65, 120, 45, 8);
    
    fill(255);
    textSize(16);
    text("REINICIAR", 80, height - 42);
  }
}




// los reinicios del boton
void reinicio(){
movimientoDelTexto = 20;   
  fade2 = 0; 
   opacidadDelFade4 = 0;
}



void mousePressed() {
  if (segundosPantalla >= 35 && mouseX > 20 && mouseX < 140 && mouseY > height - 65 && mouseY < height - 20) {
  momentoDeInicio = tiempoDelPwp;
    reinicio();
  }
}
