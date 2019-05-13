import blobDetection.*;

PImage dkImg;

BlobDetection blobDet;

void setup(){
  dkImg = loadImage("three.jpg");
  size(1920,1080);
  blobDet = new BlobDetection(width,height);
  blobDet.setPosDiscrimination(true);
  blobDet.setThreshold(0.4f);
  blobDet.computeBlobs(dkImg.pixels);
  background(0);
}

void draw(){
  //image(dkImg,0,0);
  for(int i = 0; i < blobDet.getBlobNb(); i++){
    Blob b = blobDet.getBlob(i);
    stroke(255,150,0);
    noFill();
    
    //float minX = b.xMin
    
    
    if(b!=null){
      
        quilting(b);
      
    }
  }
}