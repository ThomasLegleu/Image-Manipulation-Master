class agent{
  Vec3D pos;
  float rad;
  ArrayList neighbors;
  color myCol;
  
  agent(Vec3D _pos, float _rad, color _myCol){
    pos = _pos.copy();    
    rad = _rad;
    myCol = _myCol;
    neighbors = new ArrayList();
  }
  
  void update(){
    //this is the empty vector for adding behaviors
    Vec3D acc = new Vec3D();
    neighbors = new ArrayList();
    
    //call the behavior functions
    Vec3D avd = avoid();
    Vec3D coh = cohesion();
    Vec3D orb = orbit();
    
    //adjust behavior scales
    avd.scaleSelf(1);
    coh.scaleSelf(1);
    orb.scaleSelf(1);
    
    //add my behaviors to acc
    acc.addSelf(avd);
    acc.addSelf(coh);
    acc.addSelf(orb);
    
    acc.limit(.01*rad);
    pos.addSelf(acc);
    borders();
  }
  
  void borders(){
    if(pos.z < 100){
      pos.z = 100;
    }
    if(pos.z > 600){
      pos.z = 600;
    }
    if(pos.x < 0){
      pos.x = 0;
    }
    if(pos.x > img.width){
      pos.x = img.width;
    }
    if(pos.y < 0){
      pos.y = 0;
    }
    if(pos.y > img.height){
      pos.y = img.height;
    }
  }
  
  Vec3D orbit(){
    Vec3D sum = new Vec3D();
    //loop through our neighbors
    for(int i = 0; i < agentList.size(); i++){
      agent other = (agent) agentList.get(i);
      //make sure you are not checking against yourself
      if(other != this){
        //get distance and test against radius
        float dis = pos.distanceTo(other.pos);
        
        //lots of math
        if(dis < (rad + other.rad)*1.1){
          neighbors.add(other);
          //get vector from other agent to our position
          Vec3D temp = pos.sub(other.pos);
          temp.normalize();
          
          //rotate temp 
          temp.rotateZ(PI/60);
          temp.normalize();
          
          //add that vector back to the other agent's position
          temp.scaleSelf(dis);
          temp.addSelf(other.pos);
          
          //subtract current position from new position to get trajectory
          temp.subSelf(pos);
          
          sum.addSelf(temp);
        }
      }      
    }
    return sum;
  }
  
  Vec3D cohesion(){
    Vec3D sum = new Vec3D();
    //loop through our neighbors
    for(int i = 0; i < agentList.size(); i++){
      agent other = (agent) agentList.get(i);
      //make sure you are not checking against yourself
      if(other != this){
        //get distance and test against radius
        float dis = pos.distanceTo(other.pos);
        
        //lots of math
        if(dis > rad + other.rad){
          Vec3D temp = other.pos.sub(pos);
          temp.normalize();
          float factor = 1/pow(dis,1);
          temp.scaleSelf(factor);
          sum.addSelf(temp);
        }
      }      
    }
    return sum;
  }
  
  Vec3D avoid(){
    Vec3D sum = new Vec3D();
    //loop through our neighbors
    for(int i = 0; i < agentList.size(); i++){
      agent other = (agent) agentList.get(i);
      //make sure you are not checking against yourself
      if(other != this){
        //get distance and test against radius
        float dis = pos.distanceTo(other.pos);
        
        //lots of math
        if(dis < rad + other.rad){
          Vec3D temp = pos.sub(other.pos);
          temp.normalize();
          temp.scaleSelf((rad+other.rad - dis)/2);
          sum.addSelf(temp);
        }
      }      
    }
    return sum;
  }
  
  void render(){
    //noFill();
    //stroke(255,60);
    //ellipse(pos.x, pos.y, 2*rad, 2*rad);
    
    int index = floor(pos.x + (pos.y * img.width));
    if (index >= img.pixels.length) {
      index = img.pixels.length - 1;
    }
    myCol = img.pixels[index];
    
      fill(myCol);
      noStroke();
      
      pushMatrix();
      translate(pos.x, pos.y, pos.z);
      box(rad);
      popMatrix();
      
    //  ellipse(pos.x, pos.y, 2*rad, 2*rad);
     
    
//    for(int i = 0; i < neighbors.size(); i++){
//      agent other = (agent) neighbors.get(i);
//      
//      line(pos.x, pos.y, (other.pos.x+pos.x)/2, (other.pos.y+pos.y)/2);
//    }
    
  }
  
}
