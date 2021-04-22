#!/bin/bash
#
# Name: "run.sh"
#
# Description: This file compiles, links, and runs the program.
#
# Author: Ethan Davidson
#         EthanDavidson@csu.fullerton.edu
#         https://github.com/EthanThatOneKid
#
#                     GNU GENERAL PUBLIC LICENSE
#                        Version 3, 29 June 2007
#
#  Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
#  Everyone is permitted to copy and distribute verbatim copies
#  of this license document, but changing it is not allowed.

echo "Compile main.cpp"
gcc -c -Wall -m64 -no-pie -o main.o main.cpp -std=c++17

echo "Compile interview.asm"
nasm -f elf64 -l interview.lis -o interview.o interview.asm

echo "Link each object file"
gcc -m64 -no-pie -o a.out -std=c++17 main.o interview.o -lstdc++

echo "--- PROGRAM START ---"
./a.out
echo "---- PROGRAM END ----"

echo "Delete temporary files"
rm *.o
rm *.lis
rm *.out

echo "Terminate script file"

# Copyright © 2021 Ethan Davidson