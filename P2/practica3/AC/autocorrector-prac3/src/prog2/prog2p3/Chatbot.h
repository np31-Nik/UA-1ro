#ifndef _Chatbot_
#define _Chatbot_

#include <iostream>
#include "Intent.h"

using namespace std;

class Chatbot
{
    friend ostream& operator<<(ostream &os, const Chatbot &chatbot);

  protected:
     float threshold;
     char similarity[3];
     string bestResponse(string query, bool debug) const;
     int searchIntent(string name) const;
     vector<Intent*> intents;
  public:
      Chatbot();
      Chatbot(float threshold, const char similarity[]);
      ~Chatbot();
      float getThreshold() const;
      string getSimilarity() const;
      bool addIntent(Intent* pIntent);
      bool deleteIntent(string name="",bool askConfirm=true);
      bool addExample(string name="");
      bool deleteExample(int id=0);
      bool addResponse(string name="", string response="");
      void test(bool debug=false) const;
      void configure(float threshold=-1,const char similarity[]="");
    
};

#endif
