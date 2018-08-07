Rain r1;
int numDrops = 40;
Rain[] drops = new Rain[numDrops]; // Declare and create the array
int pour = 1;
int fd;

PFont f;
int i;
float t;
float r;
float r_e;
int c;
int c_2 = 128;
int white = 0;
int color;


int scalar=2;
int prev_scalar=1;

int cscale=2;
int prev_cscale=1;

float angle_1=0;
float angle_2=0;

int cuantos = 16000;
Pelo[] lista ;
float radio = 200;
float rx = 0;
float ry =0;

int ledPin = 12;



void setup()
{
  
  size(1000,600);
  background(0);
  smooth();
  noStroke();
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
  //radio = height/3.5;
//  lista = new Pelo[cuantos];
  //for (int i = 0; i < lista.length; i++) {
    //lista[i] = new Pelo();
//  }
  //noiseDetail(3);
}
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
void draw()
{
rainamount(); 
square_2_fft();  
rectsizer();

  translate(width/2, height/2);
  fill(0);
  noStroke();
  sphere(radio);
 // for (int i = 0; i < lista.length; i++) 
  //{
//      lista[i].dibujar();
  //}
fill(255, 128);
t++;
noStroke();

}
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
class Rain {
  float r = random(1000);
  float y = random(-height);

  void fall() {
    y = y + 7;
    fill(138,43,226,180);
    ellipse(r, y, 10, 10);

   if(y>height){
   r = random(1000);
   y = random(-200);
   }
  }
}
//////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////
void rectsizer()
{
 // fill(0,100);
 // rect(0,0,1000,600);

}
//////////////////////////////////////////////////////////////////////////////////////
void rainamount()
{

    for (int i = 0; i < drops.length; i++) {
     drops[i].fall();
    }

}
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
class Pelo
{
  float z = random(-radio, radio);
  float phi = random(TWO_PI);
  float largo = random(1.15, 1.2);
  float theta = asin(z/radio);

  Pelo() { // what's wrong with a constructor here
    z = random(-radio, radio);
    phi = random(TWO_PI);
    largo = random(1.15, 1.2);
    theta = asin(z/radio);
  }

  void dibujar() {

    float off = (noise(millis() * 0.0001, sin(phi))-0.5) * 0.3;
    float offb = (noise(millis() * 0.0001, sin(z) * 0.01)-0.5) * 0.3;

    float thetaff = theta+off;
    float phff = phi+offb;
    float x = radio * cos(theta) * cos(phi);
    float y = radio * cos(theta) * sin(phi);
    float z = radio * sin(theta);

    float xo = radio * cos(thetaff) * cos(phff);
    float yo = radio * cos(thetaff) * sin(phff);
    float zo = radio * sin(thetaff);

    float xb = xo * largo;
    float yb = yo * largo;
    float zb = zo * largo;
    colorMode(HSB,255,255,255); 
    strokeWeight(1);
    beginShape(LINES);
    stroke(0);
    vertex(x, y, z);
    stroke(200, 250, 250);
    
    r_e = 80/(getBinValue(120)+70);
    
    vertex(xb/r_e, yb/r_e, zb/r_e);
    endShape();
    colorMode(RGB,255,255,255);
    

  }
}

void square_2_fft()
{

  colorMode(HSB,255,255,255);
  fill(0,80);
  rect(0,0,1000,600);
  //colorMode(HSB,85,255,255);
  //color = getColorSliderValue();
  fill(100, 250, 250);
  rect(width/2-r/2,height/2-r/2,r,r);
  
  r = getBinValue(3); 
  
  c++;
  if (c ==256) c = 0;
  colorMode(RGB,255,255,255);
}