// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 23-4: Super fancy ArrayList and rectangle particle system

//Modifications 
//Eduardo Irías

// A simple Particle Class
class Particle {
  
  float x;
  float y;
  
  
  float pwidth;
  float pheight;
  
  float xspeed;
  float yspeed;
  float life;
  
  boolean ballform;
  boolean ismulticolor;
  
  
  
  // Make the Particle
  Particle(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    pwidth = random(2,5);
    pheight =random(25,30);
    xspeed = 0;
    yspeed = random(-2,0);
    life = 355;
    
   
    
    
  
  }
  
  // Move
  void run() {
    x = x + xspeed;
    y = y + yspeed;
   
  }
  
  // Fall down
  void gravity() {
    yspeed += 0.1;
  }
  
  // Stop moving
  void stop() {
    xspeed = 0;
    //yspeed = 0;
    y=y-random(10,100);
    ballform = true;
     
  }
  
  // Ready for deletion
  boolean finished() {
    // The Particle has a "life" variable which decreases.
    // When it reaches 0 the Particle can be removed from the ArrayList.
    life -= 2.0; 
    if (life < 0) return true;
    else return false;
  }
  
  // Show
  void display() {
    // Life is used to fade out the particle as well
    noStroke();
    
    if (!ismulticolor) { 
     fill(random(95,121),random(127,148),random(155,175),life);
    }else {
      fill(random(0,255),random(0,255),random(0,255),life);
    }
    
    if (!ballform) {
      rect(x, y, pwidth, pheight, 18);
    } else {
      ellipse(x,y,5,5);
      
    }
    //filter(BLUR,8);

  }
}
