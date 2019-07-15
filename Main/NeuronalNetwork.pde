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
    
    biasH = new Matrix(hidden, 1); //create matrix bias
    biasH.randomize(); //get random values
    biasO = new Matrix(outputs, 1); //create matrix bias
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
   
  //Train function using backpropagation
  void train(float[] inputs, float[]target){
    //convert array to matrix
    Matrix inputM = wih.matrixFromArray(inputs);
    Matrix targetM = wih.matrixFromArray(target);
    //feedForward and get the output
    
    //multiply weights, first step
    Matrix resultInputHidden = wih.multiply(inputM);
    resultInputHidden.add(biasH); //result + bias
    resultInputHidden.addSigmoid(); //result/1-e^result
    
    //second step
    Matrix output = who.multiply(resultInputHidden);
    output.add(biasO);
    output.addSigmoid();
    
    //Target - Outputs
    Matrix outputError = targetM.substract(output);
    
    //Get gradient ouput to hidden
    Matrix gradientOH = output.derivateFunction();
    gradientOH.getGradient(outputError,learningRate); // gradient * outputError * learning Rate = New value
    
    //Calculate Deltas
    Matrix hiddenTranspose = resultInputHidden.transpose();
    Matrix weightsHODeltas = gradientOH.multiply(hiddenTranspose);
    
    //adjust weights hidden - outputs and bias
    who.add(weightsHODeltas);
    biasO.add(gradientOH);
    
    //calculare Error
    Matrix whoTranspose = who.transpose();
    Matrix hiddenError = whoTranspose.multiply(outputError);
    
    //gradient hidden to input
    Matrix gradientHI = resultInputHidden.derivateFunction();
    gradientHI.getGradient(hiddenError,learningRate); // gradient * outputError * learning Rate = New value
    
    //Calculate deltas
    Matrix inputTranspose = inputM.transpose();
    Matrix weightsIHDeltas = gradientHI.multiply(inputTranspose);
    
    //adjust weights input hidden
    wih.add(weightsIHDeltas);
    biasH.add(gradientHI);
  }
}
