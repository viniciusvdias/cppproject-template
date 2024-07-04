#include<iostream>
#include<mylib.h>

using namespace std;

int main() {
   int n = myfunc(1, 2);
   printf("====================== ALG 1 %d\n", n);
   string s;
   cin >> s;
   printf("Hello World %s\n", s.c_str());
   return 0;
}
