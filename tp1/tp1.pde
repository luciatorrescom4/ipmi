PImage miObraArquitectonica;

void setup(){
  size( 800, 400 );
    background( 31, 88, 119 );

  miObraArquitectonica = loadImage( "miFoto2.png" );
}

void draw(){

  image( miObraArquitectonica, 0, 0, 400, 400 );


fill(43,108,146);
noStroke();
rect(400,108,400, 200);

fill(92,151,181);
noStroke();
rect(400,250,400,200);


fill( 255 );
noStroke();
 rect( 550, 146, 170, 220 );

fill(14,4,9);
noStroke();
rect(516,290,34,400); //puerta marron

fill(240); // el cuadrado ese grande horizontal
noStroke();
rect(515, 276, 35, 18);



rect(433,188,257,77);
fill(180); //180
noStroke();
quad(435,265,689,265,675,289,452,289 );

fill(255);
noStroke();
quad( 510, 320, 566, 320, 800, 400, 502, 400 );
rect(400, 344, 800, 400);




fill(162,145,138);
rect(400, 380, 800, 400);

fill(190);//190
rect(495, 274, 20, 70);

triangle(550,288,678,288,550,341);


//primera escalera
stroke(162,145,138);
strokeWeight(1.5);
line(510, 320, 566, 320);
line(509, 325, 580, 324);
line(508, 330, 600, 330);
line(507, 335, 620, 334);
line(506, 340, 640, 340);

//ultima escalera
stroke(162,145,138);
strokeWeight(1.5);
line(400, 344, 800, 344);
line(400, 350, 800, 350);
line(400, 355, 800, 355);
line(400, 360, 800, 360);
line(400, 365, 800, 365);
line(400, 370, 800, 370);
line(400, 375, 800, 375);

fill(180);
noStroke();
rect(454,202,210,52);

fill(165);//185
rect(554,202,110,20);

fill(41,79,101);
stroke(25,25,33);
rect(586,222,75,30);


fill(38,38,46);
noStroke();
rect(586,222,74,14);

stroke(25,25,33);
line(606,222,606,252);
line(626,222,626,252);
line(646,222,646,252);

fill(255);
noStroke();
triangle(454,202,536,202,454,254);

fill(130);
rect(515,287, 35, 8);

}
