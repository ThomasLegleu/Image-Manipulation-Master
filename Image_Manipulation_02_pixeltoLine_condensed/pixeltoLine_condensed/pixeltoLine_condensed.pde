// library used to generate the pdf
import processing.pdf.*;

// create an image that can be loaded into processing
PImage img;
//unit to sample the image 
// their is a for loop lower where it loops through the x y values of the images based
// on the unit 
int unit = 5;

void setup() {
  // size of the interface
  size(600, 700);
  //size(1280, 960);
  // load image ---> images are stored in the data folder <----- 
  img = loadImage("envisat.png");
  //img = loadImage("DESERT.jpg");
}

void draw(){
  
   // function to create pdf 
   // beginRecord(PDF,"pixeltoLine-#####.pdf");
   // background color
    background(0);
    // function to create drawing
    drawIt();
    // endRecord();
    // if (frameCount > 10) {
    //exit();
    //}
}


void drawIt() { 
 
  
// map function is the most complicated thing on here i put all the parameters below  
float threshold = map(mouseX, 0, width, 0, 255);
//Syntax //map(value, start1, stop1, start2, stop2)
 
  //value
  //float: the incoming value to be converted 

  //start1
  //float: lower bound of the value's current range 

  //stop1
  //float: upper bound of the value's current range 

  //start2
  //float: lower bound of the value's target range 

  //stop2
  //float: upper bound of the value's target range 
 

// trying turning it off it basically keeps one random value instead of updating every frame
  randomSeed(0);
  //image(img, 0, 0);

  for (int y = unit/2; y < height; y += unit) {
    for (int x = unit/2; x < width; x += unit) {
      // this is the main part of the script
      // get the color of the image from an image function called get
      color c = img.get(x, y);
      // assign the brightness values of the image to a float called b
      float b = brightness(c);
      // map 
      //float dia = map(b, 0, 255, 1, unit);


      if (b < threshold) {
      //if (b < 255) {
        
        // distance values for the random seed to draw lines 
        float r = random(5, 20);
        float r2 = random(5, 100);
        float r3 = random(0.1, 0.5);
        float r4 = random(100);

        
        // 01  a point
        // assigns a color and transparency
        stroke(c,80);
        // stroke weight of lines
        strokeWeight(2);
        // displays the point
        point(x,y);
        
        
        // 02 vertical line
        
        //stroke(c,30);
        //strokeWeight(2);
        //line(x,y, x, y-r2/2);
        
        

        // 03 horizontal line 
        
        //stroke(c,30);
        //strokeWeight(2);
        //line(x,y, x-r2/2, y);
        
        
        
        // 04 angled line 01
        
        stroke(c,30);
        strokeWeight(0.5);
        line(x, y, x + r4, y + r4);
        
        // 05 angled line 02
        
        stroke(c,30);
        strokeWeight(0.5);
        line(x, y, x - r2, y - r2);
     
       // 06 rectangle
       
       // stroke(c,30);
       fill(c,30);
       //strokeWeight(0.5);
       rect(x, y, unit, unit);
              
              
      }
    }
  }
}


void keyPressed() {
  saveFrame();
  println("frameSaved");
}