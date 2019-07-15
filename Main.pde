
NeuronalNetwork brain = new NeuronalNetwork(2,3,2);

void setup() {
  size(640, 360);  // Size must be the first statement
  for(int i=0; i<10000; i++){
    float[] a = {1,0};
    float[] target = {1, 0};
    brain.train(a,target);
  }
  
  float[] r = {1,0};
  brain.feedForward(r);
  
}

void draw() { 

} 
