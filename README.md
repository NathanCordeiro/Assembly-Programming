# *Assembly-Programming*

This Folder consists of Programs on Assembly Language(80386), using nasm assembler for the course MICROPROCESSORS AND MICROCONTROLLERS.

## **Compiling and Linking an Assembly Program in NASM**

These are the following steps for compiling and linking a program −
Type a code using a text editor and save it with a filename with the extension .asm.
Make sure that you are in the same directory as where you saved hello.asm.

> 1. To assemble the program, type ```nasm -f elf filename.asm```

*If there is any error, you will be prompted about that at this stage. Otherwise, an object file of your program named ```filename.o``` will be created.*

> 2. To link the object file and create an executable file named hello, type ```ld -m elf_i386 -s -o filename filename.o```

> 3. Execute the program by typing ```./filename```

*If you have done everything correctly, it will display 'Hello, world!' on the screen.*

#
## Contents of the Tutorial : 
---
### -> Experiment01 :
    1. Program to display two strings.
    2. Program to display 9 stars using one variable.

### -> Experiment02 :
    1. Program to accept a number and display it.
    2. Program to accept 2 numbers, add and display the result.
    3. Program to implement simple mathematical operations -i.e- (+ - / *).

### -> Experiment03 :
    1. Program to generate numbers from 1-9.
    2. Program to check whether entered number is Even or Odd.
    3. Program to check whether entered number is Positive or Negative.
    4. Program to find the greatest of three numbers.

### -> Experiment04 : 
    1. Program to convert a hexadecimal number to ASCII
    2. Program to count the number of positive and negative numbers from the array using procedures
    3. Program to count the number of odd and even numbers from the array using procedures
    4. Program to convert loowercase character to uppercase using procedures
    5. Program to convert uppercase character to lowercase using procedures
    
### -> Experiment05 : 
    1. Program to display string using macros.
    2. Program which contains the following macros :
        a. For calculating the fibonacii series for N
        b. For entering the value of N
        c. For displaying Numbers

    3. Program to compute and display the factorial of a number.

### -> Experiment06 : 
    1. Program to read and display array elements.
    2. Program to transfer a block of data from one location to another.
    3. Program to implement a bubble sort algorithm.

### -> Experiment07
    1. Program to implement a Linear Search algorithm.

### -> Experiment08
    1. Program to print Hello World vertically downwards.
#
---
