echo "Install dependencies"
sudo apt install gcc g++ nasm gdb

echo "Compile main.cpp"
gcc -c -Wall -m64 -no-pie -o main.o main.cpp -std=c++17

echo "Compile interview.asm"
nasm -f elf64 -l interview.lis -o interview.o interview.asm

echo "Link each object file"
gcc -m64 -no-pie -o a.out -std=c++17 main.o interview.o -lstdc++