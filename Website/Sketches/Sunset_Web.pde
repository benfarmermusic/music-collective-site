int c = 1;
int opc = 51;
int prev_c;
int prev_opc;
int color_max = 85;
int counter;
int i;
int mode;
float amp;
int t;
int delay;
int mode = 0;
int color;

//////////////////////////////////////////////////////////////////////////////////////////
void setup()
{
size(1000,600);
background(0);
}
//////////////////////////////////////////////////////////////////////////////////////////
void draw()
{
colorMode(HSB,color_max,color_max*1.9,color_max); //<>//

if (counter % 5 == 0)
{
    if (prev_c < c || c == 4)
      {
        c++;
        prev_c = c - 1 ;
      }
    if (prev_c > c  || c == color_max) //<>// //<>//
      {
        c--;
        prev_c = c + 1;   
      }
}


if (counter % 5 == 0)
{
    if (prev_opc < opc || opc == 4)
      {
        opc++;
        prev_opc = opc - 1 ;
      }
    if (prev_opc > opc  || opc == color_max)
      {
        opc--;
        prev_opc = opc + 1;   
      }
}
  fill(c,100,100, 10); // semi-transparent white
  rect(0, 0, width, height);
  counter++;
    
if (mode == 1)
  {
  
  if (getBinValue(150) > 100)
  {
    colorMode(RGB,255,255,255);
    fill(255,255,255,50);
    rect(0,0,width,height);
    fill(0,0,0,10);
    rect(0,0,width,height);
    colorMode(HSB,color_max,color_max*1.9,color_max);
  }
  
  amp = getBinValue(10)/10;

  if (getBinValue(10) > 100)
    {
      for (t = 0; t<10;t++)
      {
      stroke(0,0,100);
      fill(c,50,50);
      translate(random(width),random(height));      
      triangle(random(amp),random(amp),2*amp,random(amp),random(amp),2*amp);
      translate(random(-width/2),random(-height/2));
      triangle(random(amp),random(amp),2*amp,random(amp),random(amp),2*amp);
      translate(random(width/2),random(height/2));
      triangle(random(amp),random(amp),2*amp,random(amp),random(amp),2*amp);
      translate(random(-width/2),random(-height/2));
      triangle(random(amp),random(amp),2*amp,random(amp),random(amp),2*amp);
      translate(random(width),random(height));
      triangle(random(amp),random(amp),2*amp,random(amp),random(amp),2*amp);
      translate(random(-width/2),random(-height/2));
      triangle(random(amp),random(amp),2*amp,random(amp),random(amp),2*amp);
      translate(random(width/2),random(height/2));
      triangle(random(amp),random(amp),2*amp,random(amp),random(amp),2*amp);
      translate(random(-width/2),random(-height/2));
      triangle(random(amp),random(amp),2*amp,random(amp),random(amp),2*amp); 
      }
    }
 }
 
 
 
 
translate(width/2,height/2);

for (i = fftBins-250; i>0; i--)
  {
    amp = getBinValue(i);
    strokeWeight(amp);
    color = getColorSliderValue();
  
    stroke(color,100,100);
    fill(85,40,c+70);
    if (i < 20) {
    ellipse(0,i*2,amp/2,amp/2);
    } 
    else {
    rect (-amp/8,i*2,amp/4,amp/4);
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////////////
void keyPressed(){
  
  if (key == ' ')
  {
    mode++;
    if (mode > 1) mode = 0 ;
  }
}