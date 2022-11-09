gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables  -fcf-protection=none console.c
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables  -fcf-protection=none random.c
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables  -fcf-protection=none files.c

gcc -c console.s console.o
gcc -c random.s random.o
gcc -c files.s files.o

gcc console.o -o console
gcc random.o -o random
gcc files.o -o files

echo "The build was successful!"