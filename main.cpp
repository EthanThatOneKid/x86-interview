#include <iostream>
using namespace std;

extern "C" double interview(char[], double);

struct UserInfo {
  char name[16];
  double salary;
}

UserInfo askForNameAndSalary() {
  UserInfo result;
  cout << "Welcome to Software Analysis by Paramount Programmers, Inc." << endl << "Please enter your first and last names and press enter: ";
  cin >> result.name;
  cout << endl;
  cout << "Thank you, " << result.name << ". Our records show that you applied for employment her with our agency a week ago." << endl << "Please enter your expected annual salary when employed at Paramount: ";
  cin >> result.salary;
  cout << endl << "Your interview with Ms Linda Fenster, Personnel Manager, will begin shortly." << endl;
  return result;
}

int main() {
  UserInfo info = askForNameAndSalary();
  double number = interview(info.name, info.salary);
  cout << number << endl;
  return 0;
}