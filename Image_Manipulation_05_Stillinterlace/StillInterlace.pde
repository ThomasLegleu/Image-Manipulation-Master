import toxi.geom.*;

PImage img;
PImage img2;

//fps
int fR = 100;
// time in s
int time = 15;

int total = fR*time;

PGraphics pg;
PGraphics pg2;

int noiseCount;
int step = 50;

// HD 1080 images 
//String a = "gone";
//String b = "gone";



// change String letter here
//String x = a;

float noiseScale = 0.0005;



void setup(){
  size(3264,2448);
  //noiseCount = int(random(100));
  img = loadImage("download.jpg");
  img2 = loadImage("download.jpg");

  pg = createGraphics(width, height);
  pg2 = createGraphics(width, height);

  // splits the pg graphics into two different buffers
  initGraphics();
  
  //filter(0,0.6);
}

void draw(){
  
  background(255);
  image(pg,0,0);
  image(pg2,0,0);
  if(frameCount%step == 0){
    noiseCount++;
    noiseSeed(noiseCount);
  }
  //filter(0,0.55);
   mode1();
  
  
  
 // println(frameCount + " of " + total);
  
  //change Folder name _01, _02, ...
  //saveFrame(x + "_02/" + x + "_####.png");
  
   if(frameCount%5 == 0){
  
 saveFrame("bathtub_05/capture_####");
println("captured");
}
  
  if (frameCount == (total)) {
    exit();
    }
    
}

void initGraphics(){
  // begin buffer
  pg.beginDraw();
  pg2.beginDraw();
  // load the pixels if pixels are even use pg if pixels are odd use pg2
  pg.loadPixels();
  pg2.loadPixels();
  for(int i = 0; i < img.width; i++){
    for(int j = 0; j < img.height; j++){
      int index = i + j*img.width;
      if(j%6 == 0){
        pg.pixels[index] = img.pixels[index];
      }else{
         pg2.pixels[index] = img2.pixels[index];
      }
    }
  }
  // updatepixels everyframe 
  pg2.updatePixels();
  pg.updatePixels();
   pg.endDraw();
  pg2.endDraw();
}



void keyPressed() {
 if(key == ' '){
  
 saveFrame("bathtub_02 noisescale/capture_####");
println("captured"); 
}
}