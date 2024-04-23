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
