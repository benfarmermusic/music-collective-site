int c = 1;
int prev_c;
float color_max = 85;
int counter;
int i;
float amp;
int t;
int delay;
float fade=20;
float track;
int darker;
int smaller;
boolean toggle = false;

//////////////////////////////////////////////////////////////////////////////////////////
void setup()
{
size(1000,600);
background(0);

}
//////////////////////////////////////////////////////////////////////////////////////////
void draw()
{
colorMode(HSB,color_max,color_max*5,color_max);
 //<>// //<>//
updowncounter();

counter++;

if (counter % 70 == 0) track+=.5;
fill(c,100,100,track);

rect(0, 0, width, height);
translate(width/2,height/2);

rorschach();

}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
void updowncounter()
{
  if (counter % 5 == 0)
  {
    if (prev_c < c || c == 4)
      {
        c++;
        prev_c = c - 1 ;
      }
    if (prev_c > c  || c == color_max) //<>//
      {
        c--;
        prev_c = c + 1;   
      }
  }

}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
void rorschach()
{    


    for (i=0; i < fftBins; i++)
      {
        amp = getBinValue(i)/7; 
        strokeWeight(amp);
        //ellipse(random(i),random(width),2*amp,amp/5);
        ellipse(random(i),random(width),sin(t/60)*2*amp,amp/5);
      }
     for (i = fftBins; i>0; i--)
      {
        amp = getBinValue(i)/7; 
        strokeWeight(amp);       
       // ellipse(random(i),-random(width),amp,amp);
        ellipse(random(i),-random(width),sin(t/60)*2*amp,amp/5);
      }
    
    scale(-1,1);
    
    for (i=0; i < fftBins; i++)
      {
        amp = getBinValue(i)/7; 
        strokeWeight(amp);
       // ellipse(random(i),random(width),amp,amp);
        ellipse(random(i),random(width),sin(t/60)*2*amp,amp/5);
      }
     for (i = fftBins; i>0; i--)
      {
        amp = getBinValue(i)/7; 
        strokeWeight(amp);
        //ellipse(random(i),-random(width),2*amp,amp/5);
        ellipse(random(i),-random(width),sin(t/60)*2*amp,amp/5);
      }
    
    scale(-1,1);
    t++;
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////