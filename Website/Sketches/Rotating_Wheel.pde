int numberoflines = 6;
int i;
int j;
int mode;
boolean stop;

float step=0;
float amp;
PShape s;
int counter;
int hue;
float color3;

void setup()
{
 size(1000,500);
 background(0);
 //frameRate(40);
colorMode(HSB, 100, 100, 100);
//s = createShape();

}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void draw() {

 background(0);
 amp = getBinValue(0);
 translate(width/2,height/2);
 if (mode == 0) colorwheel();
 else if (mode == 1) colorwheel_2();
 else if (mode == 2) flatred();
 else if (mode == 3) spiral();
 ellipses();
 slidingwindow();


 counter++;
 hue++;
 if (hue >100) hue = 0;
 if (counter > height) counter = -height; 
 if (!stop) counter = height;
 translate(-width/2,-height/2);  
 step = step + PI/100; 
 
 drawing();
 
}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void colorwheel()
{

     rotate(step);
     strokeWeight(5);   
     stroke(100,100,100);

     for (j = 0; j < 10; j++)
     {
     fill(j*10,100,100);
     stroke(100,100,100);
     rotate(PI/5);
     beginShape();
     vertex(0,0);
     vertex(0,-height);
     vertex(width,-height);
     vertex(0,0);
     endShape();
     }



}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void colorwheel_2()
{

   
     rotate(step);
     strokeWeight(5);   
     stroke(100,100,100);
     
     if (hue % 100 == 0) color3 = random(100);
     
     for (j = 0; j < 10; j++)
     {
     fill(color3,100,100);
     stroke(100,100,100);
     rotate(PI/5);
     beginShape();
     vertex(0,0);
     vertex(0,-height);
     vertex(width,-height);
     vertex(0,0);
     endShape();
     noFill();
     stroke(100,0,100);
     }

}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void flatred()
{

    rotate(step);
     strokeWeight(5);   
     stroke(100,100,100);
     
     for (j = 0; j < 10; j++)
     {
     fill(hue * (j/10),100,100);
     stroke(100,100,100);
     rotate(PI/5);
     beginShape();
     vertex(0,0);
     vertex(0,-height);
     vertex(width,-height);
     vertex(0,0);
     endShape();
     noFill();
     stroke(100,0,100);
     }
      // rotate(PI);

}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void spiral()
{

    background(hue,100,100);

}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void ellipses()
{
    amp = getBinValue(0);
    
    for (j = 0; j < 10; j++)
     {
     rotate(PI/5);
     noFill();
     stroke(100,0,100);
     strokeWeight(5);
     ellipse(width/4,height/4-50,amp/2,amp/2);
     }
 
     noFill();
     stroke(100,0,100);
     ellipse(0,0,amp,amp);
}

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void slidingwindow(){
  
  stroke(100,0,100);
  fill(hue,100,100);
  rotate(-step);
  beginShape();
  vertex(-width,height/2+counter);
  vertex(width,height/2+counter);
  vertex(width,-height/2+counter);
  vertex(-width,-height/2+counter);
  vertex(-width,height/2+counter);
  endShape();
  
}

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void drawing(){
  if (mousePressed == true) 
  {
     noCursor();
     amp = getBinValue(0);
     translate(width/2,height/2);
     noFill();
     strokeWeight(1);
     for (i = 0; i < numberoflines; i++)
     {
        rectMode(CENTER);
        rect(mouseX-width/2, mouseY-height/2,amp,amp);
        rotate(PI/(numberoflines/2));
     }
     translate(-width/2,-height/2);       
  }
}
  /////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

void keyPressed()
{
 if (key == ' ')
 {
   mode++;
   mode = mode % 4;
 
 }
 
 if (key == 'f')
 {
   if (stop) stop = false;
   else stop = true;
 }
}