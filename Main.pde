
NeuronalNetwork brain = new NeuronalNetwork(2,3,1);

void setup() {
  size(640, 360);  // Size must be the first statement
  for(int i=0; i<10000; i++){
    float[] a = {1,0};
    float[] target = {1};
    brain.train(a,target);
    
    float[] b = {0,1};
    float[] c = {1};
    brain.train(b,c);
    
    float[] a1 = {1,1};
    float[] target1 = {0};
    brain.train(a1,target1);
    
    float[] b1 = {0,0};
    float[] c1 = {0};
    brain.train(b1,c1);
    
  }
  
  float[] r = {0,0};
  float[] result = brain.feedForward(r);
  
  for(int i=0; i<result.length; i++){
    print(result[i]);
  }
  
  println();
  
  float[] r1 = {1,1};
  float[] result1 = brain.feedForward(r1);
  
  for(int i=0; i<result1.length; i++){
    print(result1[i]);
  }
  
    println();
  
  float[] r11 = {0,1};
  float[] result11 = brain.feedForward(r11);
  
  for(int i=0; i<result11.length; i++){
    print(result11[i]);
  }
  
      println();
  
  float[] r111 = {1,0};
  float[] result111 = brain.feedForward(r111);
  
  for(int i=0; i<result111.length; i++){
    print(result111[i]);
  }
  //prueba 333
}

void draw() { 

} 
