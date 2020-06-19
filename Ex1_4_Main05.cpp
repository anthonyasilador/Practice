#include "BinModel01.h"
#include "Options01.h"
#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    double S0,U,D,R;
    
    if (GetInputData(S0,U,D,R)==1) return 1;
    
    double K;   //strike price
    int N;      //steps to expiry
    
    cout << "Enter call option data:" << endl;
    if (GetInputData(N,K)==1) return 1;
    cout << "European call optin price = "
        << PriceByCRR(S0,U,D,R,N,K)
        << endl << endl;
    
    return 0;
}
