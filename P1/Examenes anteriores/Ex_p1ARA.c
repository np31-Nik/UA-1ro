#include <iostream>
using namespace std;

bool validateHour(int hour,int minutes){
	bool valid=true;

	if(hour<0 || hour>23){
		cout<<"Hour invalid, try again"<<endl;
	valid=false;
	}	
	if(minutes<0 || minutes>59){
		cout<<"Minutes invalid, try again"<<endl;
	valid=false;
	}
	
	return valid;
}

void intervalToHour(int &hour,int &minutes,int interval){
	int min_Total=minutes+interval;

	min_Total+=60*hour;
	
	minutes=min_Total%60;
	hour=min_Total/60;
	

}


void printTime(int hour, int minutes){

	cout<<hour<<":";
	if(minutes<10)
		cout<<"0"<<minutes<<endl;
	else
	cout<<minutes<<endl;



}


int main(){

	int hour, minutes,interval,showings;
	char again;

	do{

		do{
			cout<<"Enter the time of the first showing"<<endl;
			cout<<"Hour (0-23): ";
			cin>>hour;
			cout<<"Minutes (0-59): ";
			cin>>minutes;

		}while(!validateHour(hour,minutes));

		cout<<"Enter interval between showings(minutes): ";
		cin>>interval;
	
		cout<<"Enter the number of showings: ";
		cin>>showings;

		for(int i=1;i<=showings;i++){
			cout<<"Showing "<<i<<": ";
			printTime(hour,minutes);	
			intervalToHour(hour,minutes,interval);

		}

		do{
			cout<<"Do you want to do it again? (y/n) ";
			cin>>again;
		}while(again!='y' && again!='n');

	}while(again!='n');





return 0;
}
