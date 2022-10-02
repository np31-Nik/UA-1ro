#ifndef _Intent_
#define _Intent_

#include <iostream>

#include "Example.h"

using namespace std;

class Intent
{
    friend ostream& operator<<(ostream &os, const Intent &intent);


    
  public:
    static const unsigned KMAXEXAMPLES=10;
    Intent();
    Intent(string name);
    ~Intent();
    string getName() const;
    string getResponse() const;
    vector<Example> getExamples() const;
    unsigned getNumExamples() const;
    void addExample(const Example &example);
    void deleteExample(int id);
    void addResponse(string response);
    float calculateSimilarity(string text,const char similarity[]) const;
      
  protected:
    string name;
    string response;
    vector<Example> examples;
    
};

#endif
