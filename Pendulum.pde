class Pendulum{
  float mass;
  float r;
  float theta;
  float theta_v;
  float theta_a;
  PVector centre;
  color col;
  
  Pendulum(float mass, float r, float theta, PVector centre, color col){
    this.mass = mass;
    this.r = r;
    this.theta = theta;
    this.theta_v = 0;
    this.theta_a = 0;
    this.centre = centre;
    this.col = col;
  }
  
  void update(){
    theta_a = -(g / r) * sin(theta);
    theta_v += theta_a;
    theta += theta_v;
  }
  
  void show(){
    float x = centre.x + r*cos(theta+PI/2);
    float y = centre.y + r*sin(theta+PI/2);
    
    if(drawString){
      stroke(255);
      strokeWeight(2);
      line(centre.x,centre.y,x,y);
    }
    
    stroke(col);
    fill(col);
    ellipse(x,y,mass,mass);
  }
}
  
