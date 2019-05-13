// library used to generate the pdf
import toxi.geom.*;
import processing.pdf.*;

// create an image that can be loaded into processing
PImage img;
//unit to sample the image 
// their is a for loop lower where it loops through the x y values of the images based
// on the unit 
int unit = 10;
int unitw = 10;

void setup() {
  // size of the interface
  //size(1080, 1080);
  size(1920, 1080);
  // load image ---> images are stored in the data folder <----- 
  //img = loadImage("testpo.png");
  img = loadImage("2.jpg");
}

void draw(){
  
   // function to create pdf 
    //beginRecord(PDF,"p5-#####.pdf");
   // background color
    background(255);
    // function to create drawing
    drawIt();
    //endRecord();
    //if (frameCount > 1) {
    //exit();
    //}////
    //saveFrame();
 // println("frameSaved");
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

  for (int y = unit; y < height; y += unit) {
    for (int x = unit; x < width; x += unit) {
      // this is the main part of the script
      // get the color of the image from an image function called get
      color c = img.get(x, y);
      // assign the brightness values of the image to a float called b
      float b = brightness(c);
      // map 
      //float dia = map(b, 0, 255, 1, unit);


    

      //if (c < threshold) {
      if (b > threshold) {
        
        // distance values for the random seed to draw lines 
        float r = random(2, 10);
        float r2 = random(40, 100);
        float r3 = random(0.1, 0.5);
        float r4 = random(1,6);


        
        // 01  a point
        // assigns a color and transparency
        //stroke(c,60);
        // stroke weight of lines
        strokeWeight(2);
        // displays the point
      // point(x,y);
        
        
        // 02 vertical line
        
        stroke(c,90);
       strokeWeight(1);
        line(x , y , x, y +r);
        
        stroke(c,70);
       strokeWeight(2);
        line(x , y , x, y +r2);
        
        

       // 03 horizontal line 
        
        //stroke(c,70);        
       // strokeWeight(3);
       //line(x,y, x-r, y);
        
        
        
        // 04 angled line 01
        
        //stroke(c);
        //strokeWeight(4);
        //line(x, y, x + r2, y + r2);
        
        
        // 05 angled line 02
        
        //stroke(c);
        //strokeWeigh t(0.5);
        //line(x, y, x - r2, y - r2);
        stroke(c);
        strokeWeight(0.5);
       // line(x, y, x - r, y - r);

        
         //stroke(c,80);
        //strokeWeight(0.5);
        //line(x, y, x + r2, y + r2);
         stroke(c);
       strokeWeight(1);
       // line(x, y, x + r2, y + r2);
     
       // 06 rectangle
       
       // stroke(c,30);
       //fill(c,10);
       //strokeWeight(0.5);
       //rect(x, y, unit*4, unit*4);
       
       fill(c,50);
       //noStroke();
       stroke(c);
       //noFill();
       strokeWeight(0.1);
        fill(c);
       //rotate(PI/3.0);
       //rect(x, y, unit/2+r, unit/4+r);
       
      
       
       strokeWeight(0.1);
       //rect(x, y, unit*50, unit*50);
              
              
      }
    }
  }





  for (int y = unitw; y < height - 8; y += unitw) {
    for (int x = unitw; x < width - 10; x += unitw) {
      // this is the main part of the script
      // get the color of the image from an image function called get
      color c = img.get(x, y);
      // assign the brightness values of the image to a float called b
      float b = brightness(c);
      // map 
      //float dia = map(b, 0, 255, 1, unit);


    

      //if (c < threshold) {
      if (b > threshold) {
        
        // distance values for the random seed to draw lines 
        float r = random(1, 5);
        float r2 = random(6, 10);
        float r3 = random(0.1, 0.5);
        float r4 = random(10,60);


        
        // 01  a point
        // assigns a color and transparency
        stroke(c,60);
        // stroke weight of lines
        strokeWeight(3);
        // displays the point
       //point(x,y);
        
        
        // 02 vertical line
        
        stroke(c,50 );
        strokeWeight(1);
     //line(x,random (y+r)/2, x, y);
        
        stroke(c,70);
       //strokeWeight(2);
        //line(x , y , x, y +r2);
        
        

       // 03 horizontal line 
        
        stroke(c,70);        
        strokeWeight(1);
       //line(x,y, x-r, y);
        
        
        //
        // 04 angled line 01
        
        //stroke(c);
        //strokeWeight(4);
        //line(x, y, x + r2, y + r2);
        
        
        // 05 angled line 02
        
        //stroke(c);
        //strokeWeigh t(0.5);
        //line(x, y, x - r2, y - r2);
        stroke(c);
        strokeWeight(1);
        //line(x, y, x - r, y - r);

        
         //stroke(c,80);
        //strokeWeight(0.5);
        //line(x, y, x + r2, y + r2);
         stroke(c);
       strokeWeight(1);
       // line(x, y, x + r2, y + r2);
     
       // 06 rectangle
       
       // stroke(c,30);
       //fill(c,10);
       //strokeWeight(0.5);
       //rect(x, y, unit*4, unit*4);
       
       //fill(c,50);
       //noStroke();
       stroke(c,70);
       //noFill();
       strokeWeight(0.1);
        fill(c);
       //rotate(PI/3.0);
       //rect(x, y, unit/2+r, unit/4+r);
       
      
       
       strokeWeight(0.1);
       //rect(x, y, unit*50, unit*50);
       
        //saveFrame();
       // println("frameSaved");
              
              
      }
    }
  }
}









void keyPressed() {
 
   saveFrame();
   println("frameSaved");
  
}