'!copy=h:\a-gpio.nex
'!core=3.01.10
'!noemu 
'#!asm

' this is to 100ms version 

#define NEX
#define IM2
#include <nextlib.bas>

asm
    di 
    nextreg TURBO_CONTROL_NR_07,3
end asm 
const pinout = 4            '; 
const pinin = 17            '; 
paper 7 : ink 0 : CLS

' $90 to $93 enable pins 
' $93 = %00000001  sets GPIO 24 from next side to enable   
asm 
    nextreg $93,%00000001
end asm 


do 
    'border 0
            asm 


            setup:
                ld bc,$243b        ;TBBLUE_REGISTER_SELECT_P_243B
                ld hl,$4000        ;ULA screen
                ld de,$9b98        ;GPIO ports
            
                out (c),d          ;select nextreg $9b
                inc b              ;TBBLUE_REGISTER_ACCESS_P_253B
            
            startloop :
                in a,(c)           ;read $9b into A
                and %10            ;has the pi0 sent all bits yet?
                jr z, skippy       ;loop until all GPIOs have been set
            
            readloop:
            
                in a,(c)           ;read $9b into A
                                   ;have all bits been set yet? 
                and %10            ;0 = no, 1 yes
                jr nz,readloop
                out (c),a          ;indicate next is now busy reading (A is ZERO after readloop and B is set to ACCESS already) [nextreg $9b,0]
            
                dec b              ;TBBLUE_REGISTER_SELECT_P_243B
                out (c),e          ;select register $98
                inc b              ;TBBLUE_REGISTER_ACCESS_P_253B
                in a,(c)           ;get first nibble
                dec b              ;TBBLUE_REGISTER_SELECT_P_243B
                and %11110000
                ld ixl,a           ;store nibble in LSB of IX
            
                inc e              ;E=$99
                out (c),e          ;select register $99
                inc b              ;TBBLUE_REGISTER_ACCESS_P_253B
                in a,(c)           ;get second nibble
                dec b              ;TBBLUE_REGISTER_SELECT_P_243B
                dec e              ;E=$98
                and %00001111
                or ixl             ;or with first nibble
                ; swapnib            ;shift into place
            
                ld (hl),a
                and 7
                out ($fe),a
                inc hl
                ld a,h
                cp $5b
                jr c,noreset
                ld h,$40
            noreset:
            
                out (c),d          ;select nextreg $9b
                inc b              ;TBBLUE_REGISTER_ACCESS_P_253B
                xor a              ;reset A because in skippy loop we increment it to get 1
            skippy:
                inc a              ;A is ZERO after readloop or jump to skippy
                out (c),a          ;set next ready pin to 1 [nextreg $9b,1]
                dec a
                out ($fe),a
                jr startloop
            end asm


loop    
