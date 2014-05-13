import java.awt.Rectangle;

ArrayList particles;

Rectangle blackhole;


PImage overlay;

Maxim maxim;

ArrayList drops;

AudioPlayer dropsound;
AudioPlayer rain;
AudioPlayer thunder; 

PImage [] boy;
int currentPosition = 0;

void setup() {
  size(1024,768);
  frameRate(120/2);
  
  blackhole = new Rectangle(0,720,1024,68);
  particles = new ArrayList();
  
  drops = new ArrayList();
  boy = loadImages("boy/boy", ".png", 8);
  
  maxim = new Maxim(this);
  
  rain = maxim.loadFile("rain-02.wav");
  rain.setLooping(true);
  
  thunder = maxim.loadFile("thunder.wav");
  thunder.setLooping(false);
  thunder.play();
  
  dropsound = maxim.loadFile("droid.wav");
  dropsound.setLooping(false);
  smooth();
}



void draw() {
  
 background(13,20,29);
 
 if (random(1,100) > 98) {
   background(255);
   if (!thunder.isPlaying()) {
     thunder.cue(0);
     thunder.play();
   }
 }
 
  noStroke();
  fill(10,15,17);
  rect(blackhole.x, blackhole.y, blackhole.width,blackhole.height);
 
 image(boy[round(currentPosition)], 750,640,boy[round(currentPosition)].width/2, boy[round(currentPosition)].height/2);
  currentPosition += 1;
  if(currentPosition >= boy.length) {
     currentPosition = 0;
  }
  
  
  
  
  for (int i = 3; i >= 0; i-- )    {
    particles.add(new Particle(random(0, 1024),random(-40,-50)));
  }

  for (int i = particles.size() - 1; i >= 0; i-- )    {
    Particle p = (Particle) particles.get(i);
    
    p.run();
    p.gravity();
    p.display();
    
    if ((p.x > mouseX - 50 ) && (p.x < mouseX + 50 )  && (p.y > mouseY - 50 ) && (p.y < mouseY + 50 ) && !p.ismulticolor) {
      p.stop();
    }
   
    if (blackhole.contains(p.x,p.y)) { 
      p.stop();
      if (!rain.isPlaying()) {
        rain.play();
      }
    }
    
    if ((p.x > 750 - 10 ) && (p.x < 750 + 60 )  && (p.y > 640- 10 ) && (p.y < 640  ) ) {
      p.stop();
      
    }
    if (p.finished()) {
      particles.remove(i);
    }
  }
}


void mousePressed() {

  for (int i = 100; i >= 0; i-- )    {
    Particle p = new Particle(random(mouseX - 50, mouseX + 50 ),random(mouseY - 10, mouseY + 10 ));
    p.ismulticolor = true;
    p.ballform = true;
    p.xspeed = random(-3,3);
    p.yspeed = random(-4,1);
    particles.add( p );
  }
  
  
  
   dropsound.play();

  
}
