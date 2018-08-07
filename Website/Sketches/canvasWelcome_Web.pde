float x, y;
float y1, y2; 
float h, s, b, a;
float sw;


int amount = 2000;
int scalar;
dust[] dustarray = new dust[amount];
float shapecolor;

int numberofsectors = 4;
float amp;
int i,j,k;
int pos;
boolean flagdown = false;


//////////////////////////////////////////////////////////////////////////////////////////
void setup()
{
size(1000,600);
background(0);
frameRate(30);
colorMode(HSB,100,100,100);

for (k = 0; k < amount; k++)
{
 dustarray[k] = new dust();
}


}
//////////////////////////////////////////////////////////////////////////////////////////
void draw()
{
horzLine(77, 0);

//noStroke();
//fill(0,0,100,5);
//rect(0,0,width,height);

for (j = 0; j < amount; j++)
{
  dustarray[j].display();
  dustarray[j].move();
}

if (frameCount % 6 == 0)shapecolor = random(100);
fill(20,100,100);
stroke(20,100,100);
  
pos++;

translate(width/2,height/2);

}

void keyPressed()
{
  if (key == CODED) {
    if (keyCode == RIGHT) scalar++;
    else if (keyCode == LEFT) scalar--;
   flagdown = true;
   
   
  }
  if (key == ' ') amp = random(100);
}
  
void horzLine(int amount, float topY) {
   for (int i=0; i<amount; i++) {
     
    y1 = random(height*topY, height);

    h = map(y1, 0, height, 96, 8); //random(96, 128);
    b = map(y1, 0, height, 64, 196); // random(22, 255);
    s = 50;
    a= 15;
    stroke(h, s, b, a);

    x = random(width);
    strokeWeight(random(24));
    line(0, y1+random(-33,33), width, y1+random(-33,33));
  }  
}

class dust{
  float xpos;
  float ypos;
  float rad;
   
  float speedx;
  float speedy;
  
  float alpha;
   
  int counter;
  int i;
  int t;
 
  
  dust(){
    
   rad = random(width/200);
   alpha = random(10);
    
   xpos = random(width);
   ypos = random(height);
  
   noStroke();
   speedx = random(-3,3);
   speedy = random(-3,3);
   colorMode(HSB,100,100,100);   
  }
  
  void display()
  {
    if (counter % 3 == 0){   
    colorMode(RGB, 255,255,255);
       
    fill(255,255,255, alpha);
   
    ellipse(xpos,ypos,rad,rad);
       
    noStroke();
    noFill();
  
    colorMode(HSB,100,100,100);
    }
  }
  
  void move()
  {
    xpos += random(20)*sin(t)+speedx;
    ypos += random(20)*sin(t)+speedy;
  if (xpos < 0) xpos = width;
  if (xpos > width) xpos = 0;
  if (ypos < 0) ypos = height;
  if (ypos > height) ypos = 0 ;
  t++;
  }
  }
      
      
      