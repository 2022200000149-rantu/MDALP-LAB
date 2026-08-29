.model small             ; Defines small memory model (1 Data Segment + 1 Code Segment)
.stack 100h              ; Allocates 256 bytes (100h) for stack memory
.data                    ; Marks the beginning of the Data Segment
.code                    ; Marks the beginning of the Code Segment

main proc                ; Main procedure entry point
    mov ax, @data        ; Load data segment address into AX register
    mov ds, ax           ; Initialize DS (Data Segment) register with AX contents
      
      
    exit :               ; Label indicating termination section
    mov ah, 4ch          ; Load function 4Ch (Terminate Process) into AH register
    int 21h              ; Call DOS interrupt to exit to OS
main endp                ; End of the main procedure
end main                 ; Program entry point end marker
