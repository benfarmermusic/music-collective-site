int angle;
int t;
float c;
int cmode=0;
int color_max = 255;
float r = 40;
float g = 100;
float b = 255;

float amp;
int band = 3;
int i;
int numberoflines = 8;
int s=1;
int mode = 0;
int slider=0;

void setup()
{
 size(1000,600);
 background(0);
 //textbox();
}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void draw() {

  slider = getSliderValue();
  fill(0,0,0,slider);
  noStroke();
  rect(0,0,width,height);

 
 if (cmode == 0) stroke(c,25,255);
 if (cmode == 1) stroke(random(255),255,.18*random(180)+230);
 if (cmode == 2) stroke(random(255),random(50,255),2.1*random(200)+55);
 
 amp = getBinValue(0)/s;

 if (mode == 0)drawinglines();
 else if (mode == 1) drawingcircles();
 else if (mode == 2) drawingsquares();
 else if (mode == 3) drawingtriangles();
  c = color_max*cos(t/2);
  t++;
}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void drawinglines()
{
 if (mousePressed == true) 
  {
     noCursor();
     translate(width/2,height/2);
     strokeWeight(amp);   
     for (i = 0; i < numberoflines; i++)
     {
        line(mouseX-width/2, mouseY-height/2, pmouseX-width/2, pmouseY-height/2);
        rotate(PI/(numberoflines/2));
     }
     translate(-width/2,-height/2);       
  }

}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void drawingcircles()
{
    if (mousePressed == true) 
  {
     noCursor();
     translate(width/2,height/2);
     noFill();
     strokeWeight(1);
     for (i = 0; i < numberoflines; i++)
     {
        ellipse(mouseX-width/2, mouseY-height/2,amp,amp);
        rotate(PI/(numberoflines/2));
     }
     translate(-width/2,-height/2);       
  }
}

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void drawingsquares()
{

    if (mousePressed == true) 
  {
     noCursor();
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
     rectMode(CORNER);
  }
}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void drawingtriangles()
{
     if (mousePressed == true) 
  {
     noCursor();
     translate(width/2,height/2);
     noFill();
     strokeWeight(1);
     for (i = 0; i < numberoflines; i++)
     {
        triangle(mouseX-width/2,mouseY-amp-height/2,mouseX+amp-width/2,mouseY+amp-height/2,mouseX-amp-width/2,mouseY+amp-height/2);
        rotate(PI/(numberoflines/2));
     }
     translate(-width/2,-height/2);       
  }
  
}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void keyPressed()
{
  if (key == ' ') background(0);
  else if (key == 'c' || key == 'C') 
  {      
    cmode++;
    if (cmode > 2) cmode = 0;
    if (cmode == 0)colorMode(RGB,255,255,255);
    if (cmode == 1)
    {
      colorMode(HSB,255,255,255);
      stroke(sin(t/3),60+random(30),155-random(100));
    }   
    if (cmode == 2)colorMode(HSB,255,255,255);  
    delay(1000);   
  }  
  else if (key == 's')
  {
    s++;
    if (s == 5) s=1; 
  }
  
  else if (key == 'm')
  {
    mode++;
    if (mode > 3) mode = 0;   
  }
  
  else if (key == 'l')
  {
    numberoflines *= 2;
    if (numberoflines == 128)numberoflines = 1;
  }
  
  else if (key == 'h')
  {
    textbox();
  }
  
  else if (key == 'd')
  {
    displayparameters();
  }
}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void textbox()
{
  stroke(c,25,255);
  text("Press 'SPACE' to clear the board",width/2-100,height/2-100); 
  text("Press 'M' to change the drawing mode",width/2-100,height/2-50);
  text("Press 'S' to change the size of the shape",width/2-100,height/2);
  text("Press 'C' to change the color scheme", width/2-100, height/2+50);
  text("Press 'L' to change the number of lines", width/2-100, height/2+100);
  text("Press 'D' to see current parameters", width/2-100, height/2+150);
  text("Press 'H' to view this menu again", width/2-100, height/2+200);
}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
void displayparameters()
{
  stroke(255);
  if (mode == 0)text("Mode: Lines", 50,100);
  else if (mode == 1)text("Mode: Circles" ,50,100);
  else if (mode == 2)text("Mode: Squares" ,50,100);
  else if (mode == 3)text("Mode: Triangles" ,50,100);
  text("Size:" + s,100,150);
  text("Number of Lines:" + numberoflines,50,200);
}
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
