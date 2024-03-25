PImage bg, P_Bottle, G_Bottle, Waste;

int time;
int lives = 3;
int score = 0;

int P_Bottle_X, P_Bottle_Y;
int G_Bottle_X, G_Bottle_Y;
int Waste_X, Waste_Y;

//Set up the code for the button
//Coordinate of the button 
int buttonX = 100;
int buttonY = 200;



void setup()
{
  size(1000,700, P2D);
  bg = loadImage("img1.jpeg");
  P_Bottle = loadImage("img2.png");
  G_Bottle = loadImage("img3.png");
  Waste = loadImage("img4.png");
  frameRate(150);
  
 // got this part idea from lab 3
  P_Bottle_Y = 166+(int)random(200);
  P_Bottle_X = 150+ 190/2;
  
  G_Bottle_Y = 166+(int)random(200);
  G_Bottle_X = 400 + 190/2;
 
  
  Waste_Y = 166+(int)random(200);
  Waste_X = 650 + 190/2;

  
  
  // this code is from lab 3
  textureMode(NORMAL);
  blendMode(BLEND);
  noStroke();
  
  
  // Make the button
  rect(buttonX, buttonY, 200, 500);
  
  
}

void draw()
{
   
  background(bg); // got this image from (https://bit.ly/3VgPvbU)
  image(P_Bottle,150,510,190,190); // got this image from(https://bit.ly/3uMh8Ot)
  image(G_Bottle, 400,510,190,190); // got this image from (https://bit.ly/3uEIJRS)
  image(Waste, 650,520,190,190); // got this image from(https://bit.ly/3FMSPpW)
  
  // this code is from lab 3
  // I changed the variables as well as the vertext coordinates. 
  // plastic bottle 
  pushMatrix();
  translate(P_Bottle_X, P_Bottle_Y);
  beginShape();
  texture(P_Bottle);
  vertex( -95, -95, 0, 0); // Load vertex data (x,y) and (U,V) texture data into GPU
  vertex(95, -95, 1, 0); // Square centred on (0,0) of width 40 and height 40
  vertex(95, 95, 1, 1); // Textured with an image of a drop
  vertex( -95, 95, 0, 1);
  endShape(CLOSE); // Tell GPU you have loaded shape into memory.
  popMatrix(); 
  
  // glass bottle
  pushMatrix();
  translate(G_Bottle_X, G_Bottle_Y);
  beginShape();
  texture(G_Bottle);
   vertex( -95, -95, 0, 0); // Load vertex data (x,y) and (U,V) texture data into GPU
  vertex(95, -95, 1, 0); // Square centred on (0,0) of width 40 and height 40
  vertex(95, 95, 1, 1); // Textured with an image of a drop
  vertex( -95, 95, 0, 1);
  endShape(CLOSE); // Tell GPU you have loaded shape into memory.
  popMatrix(); 
  
  // Waste 
  pushMatrix();
  translate(Waste_X, Waste_Y);
  beginShape();
  texture(Waste);
   vertex( -95, -95, 0, 0); // Load vertex data (x,y) and (U,V) texture data into GPU
  vertex(95, -95, 1, 0); // Square centred on (0,0) of width 40 and height 40
  vertex(95, 95, 1, 1); // Textured with an image of a drop
  vertex( -95, 95, 0, 1);
  endShape(CLOSE); // Tell GPU you have loaded shape into memory.
  popMatrix(); 
  //delay(200); // delaying object by 3 seconds
  
  
  // Lives
  fill(255,0,0);
  text("Lives: " + lives, 700,200);
  
  // Score
  fill(255,0,0);
  text("Score: " + score, 700,500);
  
  P_Bottle_Y +=2;
  G_Bottle_Y += 2;
  Waste_Y +=2;
  
    
    if(P_Bottle_Y > 800){
    
      P_Bottle_X = 150+ 190/2;
      P_Bottle_Y = 90;
      delay(60);
      lives --;
      
    }
  

  if(G_Bottle_Y > 850){
    
    G_Bottle_X = 400+ 190/2;
    G_Bottle_Y = 90;
    delay(40);
    lives --;
    
  }
  if(Waste_Y > 800){
    
    Waste_X = 650+ 190/2;
    Waste_Y = 90;
    delay(55);
    lives --;
  }
}
