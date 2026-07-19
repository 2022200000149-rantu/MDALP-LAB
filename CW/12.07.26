.model small;
.stack 100h;
.data
.code


main proc
    mov ax, @data ; activate data segment    
    mov ds, ax     
    
    addtion:
    mov al, 0 ; ax = 3
    mov dl, 1 ; dx=2
    add dl, al ; dx = dx + ax = 2 + 8 = 5  
    add dl,'0' ; '0' = 30h = 048           
    mov ah, 2h ; char print
    int 21h ; interrupt
    
    exit:
    mov ah, 4ch
    int 21h
    
    main endp
end main
    
