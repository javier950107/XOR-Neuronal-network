
NeuronalNetwork brain = new NeuronalNetwork(2,3,2);

void setup() {
  size(640, 360);  // Size must be the first statement
  float[] a = {1,0};
  brain.feedForward(a);
}

void draw() { 

} 
