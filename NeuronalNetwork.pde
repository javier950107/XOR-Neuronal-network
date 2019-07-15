class NeuronalNetwork{
  //variables
  int inputs,hidden,outputs;
  float learningRate;
  
  //Init matrix
  Matrix wih, who, biasH, biasO;
  
  //Constructor
  NeuronalNetwork(int inputs, int hidden, int outputs){
    
    this.inputs = inputs;
    this.hidden = hidden;
    this.outputs = outputs;
    //Make matrix or connections, init the weights
    wih = new Matrix(hidden,inputs);
    who = new Matrix(outputs,hidden);
    
    //init values in random
    wih.randomize();
    who.randomize();
    
    biasH = new Matrix(hidden, 1);
    biasH.randomize(); //get random values
    biasO = new Matrix(outputs, 1);
    biasO.randomize(); //get random values
    learningRate = 0.1;
    
  }
  
  //For test train
  float[] feedForward(float[] inputs){
    //convert input to matrix
    Matrix input = wih.matrixFromArray(inputs);
    
    //multiply weights, first step
    Matrix resultInputHidden = wih.multiply(input);
    resultInputHidden.add(biasH);
    resultInputHidden.addSigmoid();
    
    //second step
    Matrix resultHiddenOutputs = who.multiply(resultInputHidden);
    resultHiddenOutputs.add(biasO);
    resultHiddenOutputs.addSigmoid();
    
    //return value
    return resultHiddenOutputs.toArray(); 
  }
}
