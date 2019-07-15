class Matrix{
  //init values
  int rows,cols;
  float [][] matrix;
  //constructor
  Matrix(int r, int c){
    rows=r;
    cols=c;
    matrix = new float[rows][cols];
  }
  
  //set random values to matrix
  void randomize(){
    for(int i=0 ; i<rows ; i++){
      for(int j=0; j<cols; j++){
        matrix[i][j] = random(-1,1);
      }
    }
  }
  
  /**
  * Matrix substract
  * [2][4] * [1] = [1*2 + 3*4] = 14
  * [5][2] * [3] = [1*5 + 3*2] = 11
  */
  Matrix multiply(Matrix r){
      Matrix result = new Matrix(rows, r.cols);
      if(cols == r.rows){
        for(int i=0; i < rows ; i++){
          for(int j=0; j<r.cols; j++){
            float sum=0;
            for(int k = 0 ; k< cols; k++){
              sum += matrix[i][k] * r.matrix[k][j];
            }
            result.matrix[i][j] = sum;
          }
        }
      }
      return result;
  }
  
  //Print matrix
  void printMatrix(){
    for(int i=0; i< rows; i++){
      for(int j=0; j<cols; j++){
        print( matrix[i][j] + " " );
      }
      println();
    }
    println();
  }
  
  //convert array to matrix
  Matrix matrixFromArray(float[] arr){
    Matrix n = new Matrix(arr.length , 1);
    for(int i=0 ; i<arr.length ; i++){
      n.matrix[i][0] = arr[i];
    }
    return n;
  }
  
  //convert matrix to array
  float[] toArray(){
    float[] arr = new float[rows*cols];
    for(int i=0 ; i< rows ; i++){
       for(int j=0; j<cols; j++){
         arr[j+i*cols] = matrix[i][j];
       }
    }
    return arr;
  }
  
 /**
  * Matrix substract
  * [2] + [2] = [0]
  * [2] + [2] = [0]
  */
  void add(Matrix n){
    for(int i=0 ; i < rows ; i++){
      for(int j=0; j<cols; j++){
          matrix[i][j] += n.matrix[i][j];
      }
    }
  }
  
 /**
  * Matrix substract
  * [2] - [2] = [0]
  * [2] - [2] = [0]
  */
  Matrix substract(Matrix n){
    Matrix result = new Matrix(rows, cols);
    for(int i=0; i<rows; i++){
      for(int j=0; j<cols; j++){
        result.matrix[i][j] = matrix[i][j] - n.matrix[i][j];
      }
    }
    return result;
  }
  
  /**
  * Add sigmoid formule
  */
  void addSigmoid(){
    for(int i=0; i<rows; i++){
      for(int j=0; j<cols; j++){
        matrix[i][j] = sigmoid(matrix[i][j]);
      }
    }
  }
  
  /*
    Matrix transpose ????
  */
  Matrix transpose(){
    Matrix trans = new Matrix(cols, rows);
    for(int i=0 ; i<rows; i++){
      for(int j=0; j<cols; j++){
        trans.matrix[j][i] = matrix[i][j];
      }
    }
    return trans;
  }
  
  //Get gradient using sigmoid derivated
  Matrix derivateFunction(){
    Matrix result = new Matrix(rows, cols);
    for(int i=0; i<rows; i++){
      for(int j=0; j<cols; j++){
        result.matrix[i][j] = dsigmoid(matrix[i][j]);
      }
    }
    return result;
  }
  
  //multiply each value by learning rate
  void multiplyLearningRate(float n){
    for(int i=0; i<rows; i++){
      for(int j=0; j<cols; j++){
        matrix[i][j] *= n;
      }
    }
  }
  
  void getGradient(Matrix output, float learningRate){
    for(int i=0; i<rows; i++){
      for(int j=0; j<cols; j++){
        matrix[i][j] *= output.matrix[i][j] * learningRate;
      }
    }
  }
  
  /* Sigmoid
       1
    -------
    1 + e^x
  */ 
  float sigmoid(float x){
     return 1 / (1 + exp(-x));
  }
  
  /*
  * sigmoid derivate
  */
  float dsigmoid(float y){
    return y*(1-y);
  }

}
