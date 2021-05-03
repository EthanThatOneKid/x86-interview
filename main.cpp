/**
 * Name: "main.cpp"
 *
 * Description: This C++ module gets the user's name and expected
 *              salary and passes that information into the
 *              interview.asm x86 Assembly module.
 * 
 * Author: Ethan Davidson
 *         EthanDavidson@csu.fullerton.edu
 *         https://github.com/EthanThatOneKid
 * 
 *                     GNU GENERAL PUBLIC LICENSE
 *                       Version 3, 29 June 2007
 * 
 * Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 * Everyone is permitted to copy and distribute verbatim copies
 * of this license document, but changing it is not allowed.
 */

#include <iostream>
#include <iomanip>

#define MAGNUM_OPUS_SALARY 200000 // $200,000
#define PROFESSIONAL_SALARY 50000 // $50,000

extern "C" double interview(char[], double);

int main()
{

  char name[100];
  double salary;

  std::cout << "Welcome to Software Analysis by Paramount Programmers, Inc." << std::endl;
  std::cout << "Please enter your first and last name followed by the enter key: ";
  // Use `getline` below to account for the whitespace entered between first and last name.
  std::cin.getline(name, sizeof(name));
  std::cout << "Thank you, " << name << ". ";
  std::cout << "Our records show that you applied for employment here with our agency a week ago." << std::endl;
  std::cout << "Please enter your expected annual salary when employed at Paramount: ";
  std::cin >> salary;
  std::cout << "Your interview with Personnel Manager Ms. Linda Fenster will begin shortly." << std::endl;

  double offer = interview(name, salary);

  if (offer >= MAGNUM_OPUS_SALARY)
  {
    std::cout << "Hello, Mr. Sawyer. I am the receptionist. ";
    std::cout << "This envelope has your job offer starting at 1 million dollars annually." << std::endl;
    std::cout << "Please start any time you like. In the meantime, our CTO wishes to have dinner with you. ";
    std::cout << "Have a very nice evening, Mr. Sawyer." << std::endl;
  }
  else if (offer >= PROFESSIONAL_SALARY)
  {
    std::cout << "Hello, " << name << ". I am the receptionist." << std::endl;
    std::cout << "This envelope contains your job offer with a starting salary of $";
    std::cout << std::fixed << std::setprecision(2) << offer << ". "; // Set the offer value's precision.
    std::cout << "Please check back with us on Monday morning at 8:00 AM." << std::endl;
  }
  else
  {
    std::cout << "Hello, " << name << ". I am the receptionist." << std::endl;
    std::cout << "We have an opening for you in the cafeteria for $" << offer << " annually." << std::endl;
    std::cout << "Take your time in letting us know your decision." << std::endl;
  }
  std::cout << "Bye." << std::endl;

  return 0;
}

// Copyright © 2021 Ethan Davidson