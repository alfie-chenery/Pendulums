float g = 2;
int N = 10;
int period = 60; //i dont know how this affects the formula. Not sure what it does
int oscillations = 5; //number of oscilations of largest pendulum for pattern to repeat
int mass = 20;
float thetaStart = PI/4;
boolean drawString = true;
ArrayList<Pendulum> pendulums;

void setup(){
  colorMode(HSB,255);
  size(1600,900);
  pendulums = new ArrayList<Pendulum>();
  float[] rs = new float[N];
  
  //calculate ratios of pendulum lengths
  for(int i=0; i<N; i++){
    rs[i] = g * sq(period/(2*PI*(oscillations+i)));
  } 
  
  //calculate multiplier to scale lengths to fill screen and instantiate objects
  float scalor = (height-100) / rs[0];
  for(int i=0; i<N; i++){
    rs[i] *= scalor;
      
    color col = color((N-1-i)*255/N,255,255);
    Pendulum p = new Pendulum(mass,rs[i],thetaStart,new PVector(width/2,50), col);
    pendulums.add(p);
  }
    
}

void draw(){
  background(0);
  for(Pendulum p : pendulums){
    p.update();
    p.show();
  }
}
