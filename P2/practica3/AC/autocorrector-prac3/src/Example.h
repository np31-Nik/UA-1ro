#ifndef _Example_
#define _Example_

#include <iostream>
#include <vector>
using namespace std;

class Example
{
    friend ostream& operator<<(ostream &os, const Example &example);

  protected:
    int id;
    string text;
    vector<string> tokens;
    static int nextId;
    int numTokens(vector<string> tokens) const;
    int tokensComun(vector<string> vecA,vector<string> vecB) const;
    vector<string> calcularTrigramas(vector<string> tokens) const;
    
  public:
    Example();
    Example(string text);
    ~Example();
    static void resetNextId();
    int getId() const;
    string getText() const;
    vector<string> getTokens() const;
    float jaccardSimilarity(string text) const;
    float ngramSimilarity(string text) const;
    
};

#endif
