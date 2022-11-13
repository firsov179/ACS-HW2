gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables  -fcf-protection=none console.c
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables  -fcf-protection=none random.c
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables  -fcf-protection=none files.c

gcc -c console.s console.o
gcc -c gas_console.s gas_console.o
gcc -c random.s random.o
gcc -c gas_random.s gas_random.o
gcc -c files.s files.o
gcc -c gas_files.s gas_files.o

gcc console.o -o console
gcc random.o -o random
gcc files.o -o files
gcc gas_console.o -o gas_console
gcc gas_random.o -o gas_random
gcc gas_files.o -o gas_files
echo "The build was successful!"