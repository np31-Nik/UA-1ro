enum Error{
  ERR_OPTION,
  ERR_INTENT,
  ERR_EXAMPLE,
  ERR_RESPONSE,
  ERR_FILE,
  ERR_THRESHOLD,
  ERR_SIMILARITY,
  ERR_ARGS
}; 

void error(Error n){
  switch(n){
    case ERR_OPTION:
      cout << "ERROR: wrong menu option" << endl;
      break;
    case ERR_INTENT:
      cout << "ERROR: wrong intent name" << endl;
      break;
    case ERR_EXAMPLE:
      cout << "ERROR: wrong example id" << endl;
      break;
    case ERR_RESPONSE:
      cout << "Lo siento, pero no tengo respuesta para eso" << endl;
      break;
    case ERR_FILE:
      cout << "ERROR: cannot open file" << endl;
      break;
    case ERR_THRESHOLD:
      cout << "ERROR: the threshold value must be between 0 and 1" << endl;
      break;
    case ERR_SIMILARITY:
      cout << "ERROR: valid values are \"jc\" (Jaccard) and \"ng\" (n-grams)" << endl;
      break;
    case ERR_ARGS:
      cout << "ERROR: invalid arguments" << endl;
  }
}
