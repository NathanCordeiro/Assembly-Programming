# *Assembly-Programming*

This Folder consists of Programs on Assembly Language(80386), using nasm assembler for the course MICROPROCESSORS AND MICROCONTROLLERS.

## **Compiling and Linking an Assembly Program in NASM**

Make sure you have set the path of nasm and ld binaries in your PATH environment variable. Now, take the following steps for compiling and linking the above program −
Type the above code using a text editor and save it as hello.asm.
Make sure that you are in the same directory as where you saved hello.asm.

> 1. To assemble the program, type ```nasm -f elf hello.asm```

*If there is any error, you will be prompted about that at this stage. Otherwise, an object file of your program named ```hello.o``` will be created.*

> 2. To link the object file and create an executable file named hello, type ```ld -m elf_i386 -s -o hello hello.o```

> 3. Execute the program by typing ```./hello```

*If you have done everything correctly, it will display 'Hello, world!' on the screen.*
