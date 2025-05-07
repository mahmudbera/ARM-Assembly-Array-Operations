	AREA proje, CODE, READONLY
        ENTRY                   
        EXPORT main             

main PROC

        LDR     R1, =A          
        LDR     R2, =2          

        CMP     R2, #1          
        BEQ     do_search       

        CMP     R2, #2          
        BEQ     do_sort         

        B       end             

do_search
        LDR     R0, =3          
        BL      find             
        B       end             

do_sort
        LDR     R0, [R1]        
        ADD     R1, #4      	
        BL      sort          
        B       end             

end
        B       end             

find
        PUSH    {R2-R4, LR}     

        MOV     R2, R0          
        LDR     R3, [R1]        
        ADD     R1, #4      	
        MOV     R4, #0          

loop_bul
        CMP     R4, R3          
        BEQ     not_found       

        LDR     R0, [R1]        
        CMP     R0, R2          
        BEQ     found           

        ADD     R1, #4      	
        ADD     R4, #1      	
        B       loop_bul        

not_found
        MOV     R0, #0          
        POP     {R2-R4, LR}     
        BX      LR              

found
        MOV     R0, #1          
        POP     {R2-R4, LR}
        BX      LR              

sort
        PUSH    {R2-R8, LR}     

        MOV     R2, R0          
        MOV     R3, R1          
        MOV     R4, #0          

        LDR     R5, [R3]        
        MOV     R6, #1          

max_loop
        CMP     R6, R2          
        BEQ     count_init      

        LDR     R7, [R3, R6, LSL #2] 
        CMP     R7, R5          
        MOVGT   R5, R7          
        ADD     R6, #1      	
        B       max_loop        

count_init
        ADD     R5, #1      	
        MOV     R6, #0          

        LDR     R7, =counts     

zero_loop
        CMP     R6, R5          
        BEQ     count_fill      
		MOV 	R0, #0
        STR     R0, [R7, R6, LSL #2] 
        ADD     R6, #1
        B       zero_loop

count_fill
        MOV     R6, #0          

fill_loop
        CMP     R6, R2          
        BEQ     rebuild_array   

        LDR     R8, [R3, R6, LSL #2] 
        LDR     R7, =counts
        LDR     R0, [R7, R8, LSL #2] 
        ADD     R0, #1      	
        STR     R0, [R7, R8, LSL #2]
        ADD     R6, R6, #1
        B       fill_loop

rebuild_array
        MOV     R6, #0          
        MOV     R8, #0          

rebuild_loop
        LDR     R7, =counts
        CMP     R6, R5          
        BEQ     done            

        LDR     R0, [R7, R6, LSL #2] 
check_zero
        CMP     R0, #0          
        BEQ     next_val        
        STR     R6, [R3, R8, LSL #2] 
        ADD     R8, #1
        SUB     R0, #1
        B       check_zero

next_val
        ADD     R6, #1
        B       rebuild_loop

done
        MOV     R0, R3          
        POP     {R2-R8, LR}
        BX      LR              

	AREA myData, DATA, READWRITE

A       DCD     12, 2, 0, 2, 3, 3, 0, 1, 0, 0, 4, 2, 1

counts  SPACE   100

	END
