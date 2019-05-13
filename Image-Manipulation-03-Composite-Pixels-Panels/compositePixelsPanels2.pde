import peasy.*;
import toxi.geom.*;
import toxi.volume.*;
import toxi.geom.mesh.*;
import toxi.processing.*;




PImage img1;
PImage img2;
PImage composite;
PImage composite2;
int colorSwitch;

void setup() {
  
  
  
  size(1080,1080);
  img1 = loadImage("049d14048.jpg");
  img2 = loadImage("sc.jpg");
  composite = img1.get();
  composite2 = img2.get();
  frameRate(6000);
  colorSwitch = 0;

 
}

void draw() {
  
  if(frameCount == 1){
    image(img1,0,0);
  }
  
  
  if (frameCount%1000 == 0) {
    if (colorSwitch == 0) {
      colorSwitch = 1;
    }else {
      colorSwitch = 0;
    }
   
  }
 
  
  if (colorSwitch == 0){
 //for (int i = 0; i < 5; i++){
  
//     tempX = random(0,width);
//    int tempY = random(0,height);
    
    int xFac = floor(4);
    float xres = pow(2,xFac);
    xres = xres*5;
    
    int yFac = floor(4);
    float yres = pow(2,yFac);
    yres = yres*5;
    
    float xPos = random(0,width);
    float yPos = random(0,height);
    
    xPos = floor(xPos/xres);
    xPos = xPos*xres;
    yPos = floor(yPos/yres);
    yPos = yPos*yres;
    
    
    PImage tempImg = img2.get(int(xPos),int(yPos),int(xres),int(xres));
    tint(255,random(70,85));
    image(tempImg,xPos,yPos);  
//
    
    
  }else{
      // saveFrame();
//for (int i = 0; i < 5; i++){
    int xFac = floor(4);
    float xres = pow(2,xFac);
    xres = xres*5;
    
    int yFac = floor(random(0.25,4));
    float yres = pow(2,yFac);
    yres = yres*5;
    
    float xPos = random(0,width);
    float yPos = random(0,height);
    
    xPos = floor(xPos/xres);
    xPos = xPos*xres;
    yPos = floor(yPos/yres);
    yPos = yPos*yres;
    
    
    PImage tempImg2 = img1.get(int(xPos),int(yPos),int(xres),int(xres));
    tint(255,random(70,85));
    image(tempImg2,xPos,yPos); 
  // 
  }
  
 //saveFrame();
  
  
println(frameCount);
 
}