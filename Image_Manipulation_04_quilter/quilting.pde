void quilting(Blob in){
  float minX = in.xMin * width;
  float maxX = in.xMax*width;
  float minY = in.yMin*height;
  float maxY = in.yMax*height;
  
  float fullX = maxX - minX;
  float fullY = maxY - minY;
  
  float resX = fullX;
    
  for(int i = 0; i < 600; i++){
    float startX = minX + i*resX/6;
    PImage tempImg= dkImg.get(int(startX), int(minY), int(resX),int(fullY));
    float newStart = 10*(startX - maxX);
    newStart = (newStart+maxX);
    
   
    tint(90);
    image(tempImg, newStart/2, minY,int(resX/10), fullY*10);
 }
  
  float resY = fullY;
  
//for(int i = 0; i < 100 ; i++){
  //float startY = minY + i*resY/4;
 //PImage tempImg= dkImg.get(int(minX), int(startY), int(fullX),int(resY));
   //stroke(255,150,0);
  ////  float newStart =15*(startY-maxY);
  ////  newStart = newStart+maxY;
  //  //tint(255,90);
  // // image(tempImg, minX,newStart, int(fullX), int(resY));
 //// }
 //// noTint();
////}
}