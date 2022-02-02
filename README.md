# zxnext-pi0-gpio
 Simple transfer using GPIOs - Pi0 >> Next

This is built on a later version of pigpiod so you will need
to use a PlusPack with nextpi to get this working

pi0 exe needs to be compiled with PureBasic

the NEX was built with NextBuild but contains an asm loop 

Run the NEX on your Next, then ./loader2 on the pi0, it will transmit
a scr file from the pi0 to the Next's RAM which is pointing to ULA
video RAM $4000

Please dont expect too much from this as it was an experiment.

