XIncludeFile "pigpio.pb"

;Export(24)    ; next ready 
#PinReady = 24
; Export(25)    ; all sent pi 
#PinDone = 25

Procedure SwapNib(byte.b)
  
  a.b = (byte.b & %00001111)<<4
  b.b = (byte.b & %11110000)>>4
  c.c = a ! b
  ProcedureReturn c
  
EndProcedure

Global s = 0 
;
OpenConsole("")

Global Dim screens$(200)
Directory$ = "./screens/"

If ExamineDirectory(0, Directory$, "*.scr")  
  While NextDirectoryEntry(0)
    If DirectoryEntryType(0) = #PB_DirectoryEntry_File
      
      Type$ = "[File] "
      Size$ = " (Size: " + DirectoryEntrySize(0) + ")"
      If DirectoryEntrySize(0) = 7040
        PrintN( Type$ + DirectoryEntryName(0) + Size$)
        screens$(n) = DirectoryEntryName(0)
        n+1
      EndIf
    Else
      Type$ = "[Directory] "
      Size$ = "" ; A directory doesn't have a size
    EndIf
    
    
  Wend
  FinishDirectory(0)
  PrintN(Str(n)+" screens")
EndIf

Procedure GetScreen()
  Shared s, n
  ;s = Random(n-1)
  s = s + 1
  If s > n-1 
    s = 0 
  EndIf 
  PrintN(Str(s))
  PrintN(screens$(s))
  
  If ReadFile(0,"./screens/"+screens$(s))
    Global *buffer = AllocateMemory(6912)
    FileSeek(0,128)
    ReadData(0,*buffer,6912)
    CloseFile(0)
  Else
    PrintN("Error opening file")
    End
  EndIf
EndProcedure

GetScreen()

mem = *buffer 

mlen = 6144+768
offset = 0 

If OpenPigPio()
  
  
  If gpioInitialise() <> #PI_INIT_FAILED
    
    ; we need to init the pins we want to use 
    gpioSetMode(4,#PI_OUTPUT)
    gpioSetMode(5,#PI_OUTPUT)
    gpioSetMode(6,#PI_OUTPUT)
    gpioSetMode(7,#PI_OUTPUT)
    gpioSetMode(8,#PI_OUTPUT)
    gpioSetMode(9,#PI_OUTPUT)
    gpioSetMode(10,#PI_OUTPUT)
    gpioSetMode(11,#PI_OUTPUT)
    gpioSetMode(24,#PI_INPUT)
    
    gpioSetMode(25,#PI_OUTPUT)
    gpioSetMode(26,#PI_OUTPUT)
    gpioWrite(#PinDone,0)    
    gpioWrite_Bits_0_31_Clear(%00000111000000000000111111110000)
    
    time = ElapsedMilliseconds()
    
    Repeat 
      
      If gpioRead(#PinReady) = 1        ; is the next ready to recieve? 
         
        gpioWrite(#PinDone,0)           ; reset done pin
                
        While gpioRead(#PinDone) = 1 Or gpioRead(#PinReady) = 0 
          gpioDelay(5)  
        Wend 
        
        ;If offset = 0 
        ;  PrintN(Str(gpioRead(#PinReady)))
        ;EndIf         

        a.i = SwapNib(((PeekA(*buffer+offset)))) <<4
        
        gpioWrite_Bits_0_31_Clear(%00000010000000000000111111110000)
        gpioWrite_Bits_0_31_Set((a))
        ; delay of 40 here and at the end of the loop for 500ms
        ; 20 = ~200ms
        
        gpioDelay(2)             

        offset + 1 
        
        gpioWrite(#PinDone,1)          ; write done pin
        
        While gpioRead(#PinReady) = 0
           gpioDelay(1)
           ; PrintN("waiting for next OK")
           ; writing to the terminal slows things down by a lot! 
          p+1 
          If p = 1000
            PrintN("Giving up")
            Break 2
          EndIf 
        Wend  
        
        If offset = mlen 
          e.f = (ElapsedMilliseconds()-time) 
          
          PrintN("Time " + Str(e) +" msec" ) 
          FreeMemory(*buffer)
          PrintN("q to quit, Enter new screen")
          If LCase(Input())="q" 
            Break 1
          EndIf 
          GetScreen()
          offset = 0 
          time = ElapsedMilliseconds()
        EndIf 
        
        p =0 
        
      Else 
        PrintN("waiting for next ready pin")
        gpioDelay(1)
        p+1 
        If p = 1000
          PrintN("Giving up")
          Break 1
        EndIf 
      EndIf 
      
      
      ; set this to 25 for 500ms
      ; 4 = ~200 ms 
      ; 10 = 230 ms more stable 
      ; 25 = 500 ms 
      gpioDelay(3)   
    ForEver
    
    gpioTerminate()
    ClosePigPio()
  Else
    PrintN("can't init gpio")  
  EndIf
Else
  PrintN("error loading lib")    
EndIf 
; IDE Options = PureBasic 6.00 Beta 1 - C Backend (Linux - arm32)
; CursorPosition = 160
; FirstLine = 144
; Folding = -
; Optimizer
; EnableXP
; Executable = /mnt/sync/hacks/loader
; Compiler = PureBasic 6.00 Beta 1 - C Backend (Linux - arm32)