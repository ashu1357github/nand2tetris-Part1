

    @R0
    D=M     // D = RAM[0]

    @ZERO
    D;JEQ   // if RAM[0] = 0 then goto ZERO

    @R1
    D=M     // D = RAM[1]

    @ZERO
    D;JEQ   // if RAM[1] = 0 then goto ZERO

    // Set up the loop index variable
    @i
    M=1     // i = 1

    @n
    M=D     // n = RAM[1]

    // Set up the product variable
    @product
    M=0     // product = 0

(LOOP)
    @i
    D=M
    @n
    D=D-M   // calculate i - n
    @PRODUCT
    D;JGT   // if i>n goto PRODUCT

    // We will add RAM[0] to 0, RAM[1] many times
    @R0
    D=M     // D = RAM[0]
    @product
    M=D+M   // product has been increased by RAM[0]

    @i
    M=M+1   // i = i + 1
    @LOOP
    0;JMP   // goto LOOP

(PRODUCT)
    @product
    D=M     // D = product
    @R2
    M=D     // store product in RAM[2]
    @END
    0;JMP   // goto END

(ZERO)
    @R2
    M=0     // store 0 in RAM[2]
    @END
    D;JEQ   // jump to END

(END)
    @END
    0;JMP