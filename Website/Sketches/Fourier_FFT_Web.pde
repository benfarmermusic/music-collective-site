int c = 1;
int opc = 51;
int prev_c;
int prev_opc;
int color_max = 100;
int counter;
int i;
float amp;
int t;
boolean toggle;

//////////////////////////////////////////////////////////////////////////////////////////
void setup()
{
size(1000,600);
background(0);
}
//////////////////////////////////////////////////////////////////////////////////////////
void draw(){

colorMode(HSB,color_max,color_max,color_max); 

if (counter % 5 == 0)
{
    if (prev_c < c || c == 4)
      {
        c++;
        prev_c = c - 1 ;
      }
    if (prev_c > c  || c == color_max)
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

fill(c,100,100);
rect(0, 0, width, height);

counter++;

    colorMode(RGB,255,255,255);
    fill(255,255,255,50);
    rect(0,0,width,height);
    fill(0,0,0,10);
    rect(0,0,width,height);
    colorMode(HSB,color_max,color_max,color_max);
    
    translate(width/4,height/2);

  for (i = 0; i<fftBins-160; i++)
  {
    amp = getBinValue(i)/6;
    strokeWeight(amp/5);
    stroke (c*.75, 80, 80);
    fill(100,0,c+70);
    //if (i < 20) ellipse(i*2-200,0,2*amp,2*amp);
    //else if (amp > 6) ellipse (i*2-200,0,2*amp,2*amp);
    //else ellipse(i*2-200,0,20*amp,20*amp);
    ellipse(i*2-100,0,5*amp,5*amp);
  }

  amp = getBinValue(10)/25;

if (!toggle){
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
//////////////////////////////////////////////////////////////////////////////////////////

void keyPressed(){
  
  if (key == ' ')
  {
   if (toggle) toggle = false;
   else toggle = true;
  }
}