
import peasy.*;
import toxi.geom.*;

PeasyCam pcam;



ArrayList agentList;
PImage img;
int colorSwitch;

void setup() {
  size(500, 325, P3D);
  background(0);
  frameRate(1000);
  
  ///instantiate camera
  //pcam = new PeasyCam(this, 500);
  
  
  agentList = new ArrayList();
  img = loadImage("8426104848_0d1fa04c29.jpg");
  colorSwitch = 0;

  //create agents
  for (int i = 0; i < 600; i++) {
    Vec3D tempPos = new Vec3D(random(0, width), random(0, height), random(100,600));
    float rad = 10;
    //find index for pixels
    int index = floor(tempPos.x + (tempPos.y * img.width));
    if (index >= img.pixels.length) {
      index = img.pixels.length - 1;
    }
    color newCol = img.pixels[index];
    agent newA = new agent(tempPos, rad, newCol);
    agentList.add(newA);
  }
}

void draw() {
  background(0);
  //image(img,0,0);
  lights();
  float factor = sin(radians(frameCount))*.5+.5;
  float fov = (factor)*((PI/1.2)-(PI/720)) + (PI/720);
  float cameraZ = (img.height/2.0)/tan(fov/2.0);
  perspective(fov, float(img.width)/float(img.height), 
  cameraZ/10.0, cameraZ*1000.0);
  camera(img.width/2.0, img.height/2.0, cameraZ,
  img.width/2.0, img.height/2.0, 0,
  0,1,0);
  //loop through agents and update and render them
  for (int i = 0; i < agentList.size(); i++) {
    agent me = (agent) agentList.get(i);
    me.update();
 }

  for (int i = 0; i < agentList.size(); i++) {
    agent me = (agent) agentList.get(i);

    me.render();
  }
}