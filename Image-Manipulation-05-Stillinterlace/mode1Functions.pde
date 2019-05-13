void mode1(){
  pg.beginDraw();
  pg2.beginDraw();

  PImage tempImg = pg.get();
  PImage tempImg2 = pg2.get();
  PImage tempImgN = pg.get();
  PImage tempImg2N = pg2.get();
 
  tempImg.loadPixels();
  tempImg2.loadPixels();
  tempImgN.loadPixels();
  tempImg2N.loadPixels();


  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int index = floor(i + j*width);

      float noiseVal = noise(i*noiseScale, j*noiseScale);
      noiseVal = map(noiseVal, 0, 1,0,2*PI);
      // changes the density of the noise vaule
      Vec2D aim = Vec2D.fromTheta(noiseVal);
      
      // step and angles effected by the buffered image
      if(j%2 == 0){
       //aim.rotate(PI/4);
       aim.scaleSelf(-200);
      }
      aim.x = round(aim.x);
      aim.y = round(aim.y);
      aim.y = aim.y*4;
      aim.x = aim.x*4;
      
      
      
      int index2 = floor(i+aim.x + (j+aim.y)*width);
      if(index2 < 0){
        index2 = 0;
      }
      if(index2 > tempImg.pixels.length-1){
        index2 = tempImg.pixels.length-1;
      }
      tempImgN.pixels[index2] = tempImg.pixels[index];
      tempImg2N.pixels[index2] = tempImg2.pixels[index];

     }
  }
  tempImg.updatePixels();
  tempImg2.updatePixels();
  tempImgN.updatePixels();
  tempImg2N.updatePixels();

  pg.image(tempImgN,0,0);
 
  
  pg2.image(tempImg2N,0,0);
  
  pg.endDraw();
  pg2.endDraw();
}