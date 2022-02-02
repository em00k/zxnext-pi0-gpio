;
; https://abyz.me.uk/rpi/pigpio/cif.html
;
; https://github.com/joan2937/pigpio/blob/master/pigpio.h
;

CompilerIf #PB_Compiler_IsMainFile
  EnableExplicit
CompilerEndIf

Macro int
  l
EndMacro

Macro unsigned
  l
EndMacro

Macro uint32_t
  l
EndMacro

#PI_OFF   = 0
#PI_ON    = 1

#PI_CLEAR = 0
#PI_SET   = 1

#PI_LOW   = 0
#PI_HIGH  = 1


#PI_INPUT  = 0
#PI_OUTPUT = 1
#PI_ALT0   = 4
#PI_ALT1   = 5
#PI_ALT2   = 6
#PI_ALT3   = 7
#PI_ALT4   = 3
#PI_ALT5   = 2

#PI_PUD_OFF  = 0
#PI_PUD_DOWN = 1
#PI_PUD_UP   = 2

#PI_TIME_RELATIVE = 0
#PI_TIME_ABSOLUTE = 1

#PI_FILE_READ	= 1
#PI_FILE_WRITE = 2
#PI_FILE_RW = 3

#PI_FILE_APPEND = 4
#PI_FILE_CREATE = 8
#PI_FILE_TRUNC = 16



#PI_INIT_FAILED     =  -1 ; gpioInitialise failed
#PI_BAD_USER_GPIO   =  -2 ; GPIO Not 0-31
#PI_BAD_GPIO        =  -3 ; GPIO Not 0-53
#PI_BAD_MODE        =  -4 ; mode Not 0-7
#PI_BAD_LEVEL       =  -5 ; level Not 0-1
#PI_BAD_PUD         =  -6 ; pud Not 0-2
#PI_BAD_PULSEWIDTH  =  -7 ; pulsewidth Not 0 Or 500-2500
#PI_BAD_DUTYCYCLE   =  -8 ; dutycycle outside set range
#PI_BAD_TIMER       =  -9 ; timer Not 0-9
#PI_BAD_MS          = -10 ; ms Not 10-60000
#PI_BAD_TIMETYPE    = -11 ; timetype Not 0-1
#PI_BAD_SECONDS     = -12 ; seconds < 0
#PI_BAD_MICROS      = -13 ; micros Not 0-999999
#PI_TIMER_FAILED    = -14 ; gpioSetTimerFunc failed
#PI_BAD_WDOG_TIMEOUT= -15 ; timeout Not 0-60000
#PI_NO_ALERT_FUNC   = -16 ; DEPRECATED
#PI_BAD_CLK_PERIPH  = -17 ; clock peripheral Not 0-1
#PI_BAD_CLK_SOURCE  = -18 ; DEPRECATED
#PI_BAD_CLK_MICROS  = -19 ; clock micros Not 1, 2, 4, 5, 8, Or 10
#PI_BAD_BUF_MILLIS  = -20 ; buf millis Not 100-10000
#PI_BAD_DUTYRANGE   = -21 ; dutycycle range Not 25-40000
#PI_BAD_DUTY_RANGE  = -21 ; DEPRECATED (use PI_BAD_DUTYRANGE)
#PI_BAD_SIGNUM      = -22 ; signum Not 0-63
#PI_BAD_PATHNAME    = -23 ; can't open pathname
#PI_NO_HANDLE       = -24 ; no handle available
#PI_BAD_HANDLE      = -25 ; unknown handle
#PI_BAD_IF_FLAGS    = -26 ; ifFlags > 4
#PI_BAD_CHANNEL     = -27 ; DMA channel Not 0-15
#PI_BAD_PRIM_CHANNEL= -27 ; DMA primary channel Not 0-15
#PI_BAD_SOCKET_PORT = -28 ; socket port Not 1024-32000
#PI_BAD_FIFO_COMMAND= -29 ; unrecognized fifo command
#PI_BAD_SECO_CHANNEL= -30 ; DMA secondary channel Not 0-15
#PI_NOT_INITIALISED = -31 ; function called before gpioInitialise
#PI_INITIALISED     = -32 ; function called after gpioInitialise
#PI_BAD_WAVE_MODE   = -33 ; waveform mode Not 0-3
#PI_BAD_CFG_INTERNAL= -34 ; bad parameter in gpioCfgInternals call
#PI_BAD_WAVE_BAUD   = -35 ; baud rate Not 50-250K(RX)/50-1M(TX)
#PI_TOO_MANY_PULSES = -36 ; waveform has too many pulses
#PI_TOO_MANY_CHARS  = -37 ; waveform has too many chars
#PI_NOT_SERIAL_GPIO = -38 ; no bit bang serial Read on GPIO
#PI_BAD_SERIAL_STRUC= -39 ; bad (null) serial Structure parameter
#PI_BAD_SERIAL_BUF  = -40 ; bad (null) serial buf parameter
#PI_NOT_PERMITTED   = -41 ; GPIO operation Not permitted
#PI_SOME_PERMITTED  = -42 ; one Or more GPIO Not permitted
#PI_BAD_WVSC_COMMND = -43 ; bad WVSC subcommand
#PI_BAD_WVSM_COMMND = -44 ; bad WVSM subcommand
#PI_BAD_WVSP_COMMND = -45 ; bad WVSP subcommand
#PI_BAD_PULSELEN    = -46 ; trigger pulse length Not 1-100
#PI_BAD_SCRIPT      = -47 ; invalid script
#PI_BAD_SCRIPT_ID   = -48 ; unknown script id
#PI_BAD_SER_OFFSET  = -49 ; add serial Data offset > 30 minutes
#PI_GPIO_IN_USE     = -50 ; GPIO already in use
#PI_BAD_SERIAL_COUNT= -51 ; must Read at least a byte at a time
#PI_BAD_PARAM_NUM   = -52 ; script parameter id Not 0-9
#PI_DUP_TAG         = -53 ; script has duplicate tag
#PI_TOO_MANY_TAGS   = -54 ; script has too many tags
#PI_BAD_SCRIPT_CMD  = -55 ; illegal script command
#PI_BAD_VAR_NUM     = -56 ; script variable id Not 0-149
#PI_NO_SCRIPT_ROOM  = -57 ; no more room For scripts
#PI_NO_MEMORY       = -58 ; can't allocate temporary memory
#PI_SOCK_READ_FAILED= -59 ; socket Read failed
#PI_SOCK_WRIT_FAILED= -60 ; socket write failed
#PI_TOO_MANY_PARAM  = -61 ; too many script parameters (> 10)
#PI_NOT_HALTED      = -62 ; DEPRECATED
#PI_SCRIPT_NOT_READY= -62 ; script initialising
#PI_BAD_TAG         = -63 ; script has unresolved tag
#PI_BAD_MICS_DELAY  = -64 ; bad MICS Delay (too large)
#PI_BAD_MILS_DELAY  = -65 ; bad MILS Delay (too large)
#PI_BAD_WAVE_ID     = -66 ; non existent wave id
#PI_TOO_MANY_CBS    = -67 ; No more CBs For waveform
#PI_TOO_MANY_OOL    = -68 ; No more OOL For waveform
#PI_EMPTY_WAVEFORM  = -69 ; attempt To create an empty waveform
#PI_NO_WAVEFORM_ID  = -70 ; no more waveforms
#PI_I2C_OPEN_FAILED = -71 ; can't open I2C device
#PI_SER_OPEN_FAILED = -72 ; can't open serial device
#PI_SPI_OPEN_FAILED = -73 ; can't open SPI device
#PI_BAD_I2C_BUS     = -74 ; bad I2C bus
#PI_BAD_I2C_ADDR    = -75 ; bad I2C address
#PI_BAD_SPI_CHANNEL = -76 ; bad SPI channel
#PI_BAD_FLAGS       = -77 ; bad i2c/spi/ser open flags
#PI_BAD_SPI_SPEED   = -78 ; bad SPI speed
#PI_BAD_SER_DEVICE  = -79 ; bad serial device name
#PI_BAD_SER_SPEED   = -80 ; bad serial baud rate
#PI_BAD_PARAM       = -81 ; bad i2c/spi/ser parameter
#PI_I2C_WRITE_FAILED= -82 ; i2c write failed
#PI_I2C_READ_FAILED = -83 ; i2c Read failed
#PI_BAD_SPI_COUNT   = -84 ; bad SPI count
#PI_SER_WRITE_FAILED= -85 ; ser write failed
#PI_SER_READ_FAILED = -86 ; ser Read failed
#PI_SER_READ_NO_DATA= -87 ; ser Read no Data available
#PI_UNKNOWN_COMMAND = -88 ; unknown command
#PI_SPI_XFER_FAILED = -89 ; spi xfer/Read/write failed
#PI_BAD_POINTER     = -90 ; bad (NULL) pointer
#PI_NO_AUX_SPI      = -91 ; no auxiliary SPI on Pi A Or B
#PI_NOT_PWM_GPIO    = -92 ; GPIO is Not in use For PWM
#PI_NOT_SERVO_GPIO  = -93 ; GPIO is Not in use For servo pulses
#PI_NOT_HCLK_GPIO   = -94 ; GPIO has no hardware clock
#PI_NOT_HPWM_GPIO   = -95 ; GPIO has no hardware PWM
#PI_BAD_HPWM_FREQ   = -96 ; invalid hardware PWM frequency
#PI_BAD_HPWM_DUTY   = -97 ; hardware PWM dutycycle Not 0-1M
#PI_BAD_HCLK_FREQ   = -98 ; invalid hardware clock frequency
#PI_BAD_HCLK_PASS   = -99 ; need password To use hardware clock 1
#PI_HPWM_ILLEGAL    = -100 ; illegal, PWM in use For main clock
#PI_BAD_DATABITS    = -101 ; serial Data bits Not 1-32
#PI_BAD_STOPBITS    = -102 ; serial (half) stop bits Not 2-8
#PI_MSG_TOOBIG      = -103 ; socket/pipe message too big
#PI_BAD_MALLOC_MODE = -104 ; bad memory allocation mode
#PI_TOO_MANY_SEGS   = -105 ; too many I2C transaction segments
#PI_BAD_I2C_SEG     = -106 ; an I2C transaction segment failed
#PI_BAD_SMBUS_CMD   = -107 ; SMBus command Not supported by driver
#PI_NOT_I2C_GPIO    = -108 ; no bit bang I2C in progress on GPIO
#PI_BAD_I2C_WLEN    = -109 ; bad I2C write length
#PI_BAD_I2C_RLEN    = -110 ; bad I2C Read length
#PI_BAD_I2C_CMD     = -111 ; bad I2C command
#PI_BAD_I2C_BAUD    = -112 ; bad I2C baud rate, Not 50-500k
#PI_CHAIN_LOOP_CNT  = -113 ; bad chain loop count
#PI_BAD_CHAIN_LOOP  = -114 ; empty chain loop
#PI_CHAIN_COUNTER   = -115 ; too many chain counters
#PI_BAD_CHAIN_CMD   = -116 ; bad chain command
#PI_BAD_CHAIN_DELAY = -117 ; bad chain delay micros
#PI_CHAIN_NESTING   = -118 ; chain counters nested too deeply
#PI_CHAIN_TOO_BIG   = -119 ; chain is too long
#PI_DEPRECATED      = -120 ; deprecated function removed
#PI_BAD_SER_INVERT  = -121 ; bit bang serial invert Not 0 Or 1
#PI_BAD_EDGE        = -122 ; bad ISR edge value, Not 0-2
#PI_BAD_ISR_INIT    = -123 ; bad ISR initialisation
#PI_BAD_FOREVER     = -124 ; loop ForEver must be last command
#PI_BAD_FILTER      = -125 ; bad filter parameter
#PI_BAD_PAD         = -126 ; bad pad number
#PI_BAD_STRENGTH    = -127 ; bad pad drive strength
#PI_FIL_OPEN_FAILED = -128 ; file open failed
#PI_BAD_FILE_MODE   = -129 ; bad file mode
#PI_BAD_FILE_FLAG   = -130 ; bad file flag
#PI_BAD_FILE_READ   = -131 ; bad file Read
#PI_BAD_FILE_WRITE  = -132 ; bad file write
#PI_FILE_NOT_ROPEN  = -133 ; file Not open For Read
#PI_FILE_NOT_WOPEN  = -134 ; file Not open For write
#PI_BAD_FILE_SEEK   = -135 ; bad file seek
#PI_NO_FILE_MATCH   = -136 ; no files match pattern
#PI_NO_FILE_ACCESS  = -137 ; no permission To access file
#PI_FILE_IS_A_DIR   = -138 ; file is a directory
#PI_BAD_SHELL_STATUS= -139 ; bad shell Return status
#PI_BAD_SCRIPT_NAME = -140 ; bad script name
#PI_BAD_SPI_BAUD    = -141 ; bad SPI baud rate, Not 50-500k
#PI_NOT_SPI_GPIO    = -142 ; no bit bang SPI in progress on GPIO
#PI_BAD_EVENT_ID    = -143 ; bad event id
#PI_CMD_INTERRUPTED = -144 ; Used by Python
#PI_NOT_ON_BCM2711  = -145 ; Not available on BCM2711
#PI_ONLY_ON_BCM2711 = -146 ; only available on BCM2711

#PI_PIGIF_ERR_0     = -2000
#PI_PIGIF_ERR_99    = -2099

#PI_CUSTOM_ERR_0    = -3000
#PI_CUSTOM_ERR_999  = -3999




PrototypeC.int Prototype_gpioInitialise()
PrototypeC Prototype_gpioTerminate()

PrototypeC.int Prototype_gpioSetMode(gpio.unsigned, mode.unsigned)
PrototypeC.int Prototype_gpioGetMode(gpio.unsigned)
PrototypeC.int Prototype_gpioSetPullUpDown(gpio.unsigned, pud.unsigned)
PrototypeC.int Prototype_gpioRead(gpio.unsigned)
PrototypeC.int Prototype_gpioWrite(gpio.unsigned, level.unsigned)

PrototypeC.uint32_t Prototype_gpioRead_Bits_0_31()
PrototypeC.uint32_t Prototype_gpioRead_Bits_32_53()
PrototypeC.int Prototype_gpioWrite_Bits_0_31_Clear(bits.uint32_t)
PrototypeC.int Prototype_gpioWrite_Bits_32_53_Clear(bits.uint32_t)
PrototypeC.int Prototype_gpioWrite_Bits_0_31_Set(bits.uint32_t)
PrototypeC.int Prototype_gpioWrite_Bits_32_53_Set(bits.uint32_t)

PrototypeC.int Prototype_gpioTime(timetype.unsigned, *seconds, *micros)
PrototypeC.int Prototype_gpioSleep(timetype.unsigned, seconds.int, micros.int)
PrototypeC.uint32_t Prototype_gpioDelay(micros.uint32_t)
PrototypeC.uint32_t Prototype_gpioTick()
PrototypeC.unsigned Prototype_gpioHardwareRevision()
PrototypeC.unsigned Prototype_gpioVersion()




Global LibPigPio.i

Global gpioInitialise.Prototype_gpioInitialise
Global gpioTerminate.Prototype_gpioTerminate

Global gpioSetMode.Prototype_gpioSetMode
Global gpioGetMode.Prototype_gpioGetMode
Global gpioSetPullUpDown.Prototype_gpioSetPullUpDown
Global gpioRead.Prototype_gpioRead
Global gpioWrite.Prototype_gpioWrite

Global gpioRead_Bits_0_31.Prototype_gpioRead_Bits_0_31
Global gpioRead_Bits_32_53.Prototype_gpioRead_Bits_32_53
Global gpioWrite_Bits_0_31_Clear.Prototype_gpioWrite_Bits_0_31_Clear
Global gpioWrite_Bits_32_53_Clear.Prototype_gpioWrite_Bits_32_53_Clear
Global gpioWrite_Bits_0_31_Set.Prototype_gpioWrite_Bits_0_31_Set
Global gpioWrite_Bits_32_53_Set.Prototype_gpioWrite_Bits_32_53_Set

Global gpioTime.Prototype_gpioTime
Global gpioSleep.Prototype_gpioSleep
Global gpioDelay.Prototype_gpioDelay
Global gpioTick.Prototype_gpioTick
Global gpioHardwareRevision.Prototype_gpioHardwareRevision
Global gpioVersion.Prototype_gpioVersion




Procedure.i OpenPigPio()
  
  LibPigPio = OpenLibrary(#PB_Any, "libpigpio.so")
  If LibPigPio
    gpioInitialise = GetFunction(LibPigPio, "gpioInitialise")
    gpioTerminate = GetFunction(LibPigPio, "gpioTerminate")
    
    gpioSetMode = GetFunction(LibPigPio, "gpioSetMode")
    gpioGetMode = GetFunction(LibPigPio, "gpioGetMode")
    gpioSetPullUpDown = GetFunction(LibPigPio, "gpioSetPullUpDown")
    gpioRead = GetFunction(LibPigPio, "gpioRead")
    gpioWrite = GetFunction(LibPigPio, "gpioWrite")
    
    gpioRead_Bits_0_31 = GetFunction(LibPigPio, "gpioRead_Bits_0_31")
    gpioRead_Bits_32_53 = GetFunction(LibPigPio, "gpioRead_Bits_32_53")
    gpioWrite_Bits_0_31_Clear = GetFunction(LibPigPio, "gpioWrite_Bits_0_31_Clear")
    gpioWrite_Bits_32_53_Clear = GetFunction(LibPigPio, "gpioWrite_Bits_32_53_Clear")
    gpioWrite_Bits_0_31_Set = GetFunction(LibPigPio, "gpioWrite_Bits_0_31_Set")
    gpioWrite_Bits_32_53_Set = GetFunction(LibPigPio, "gpioWrite_Bits_32_53_Set")
    
    gpioTime = GetFunction(LibPigPio, "gpioTime")
    gpioSleep = GetFunction(LibPigPio, "gpioSleep")
    gpioDelay = GetFunction(LibPigPio, "gpioDelay")
    gpioTick = GetFunction(LibPigPio, "gpioTick")
    gpioHardwareRevision = GetFunction(LibPigPio, "gpioHardwareRevision")
    gpioVersion = GetFunction(LibPigPio, "gpioVersion")
  EndIf
  
  ProcedureReturn LibPigPio
  
EndProcedure


Procedure ClosePigPio()
  If IsLibrary(LibPigPio)
    CloseLibrary(LibPigPio)
    LibPigPio = 0
  EndIf
EndProcedure


CompilerIf #PB_Compiler_IsMainFile
  
  Define i.i, s$, pin.i
  
  If OpenConsole()
    
    If OpenPigPio()
      
      PrintN("pigpio version: " + Str(gpioVersion()))
      PrintN("pigpio version: " + Str(gpioHardwareRevision()))
      
      If gpioInitialise() <> #PI_INIT_FAILED
        PrintN("gpio Tick returns "  + Str(gpioTick()))
        
        s$=""
        For pin=0 To 31
          s$ + Str(gpioRead(pin))
        Next
        PrintN("io read for 0-31 = " + s$)
        
        PrintN("io read for 0-31 = " + RSet(Bin(gpioRead_Bits_0_31()), 32, "0"))
        
        gpioTerminate()
      Else
        PrintN("can't init gpio")  
      EndIf
      
      ClosePigPio()
    Else
      PrintN("error loading lib")
    EndIf
    
  EndIf
  
CompilerEndIf
; IDE Options = PureBasic 6.00 Beta 1 - C Backend (Linux - arm32)
; CursorPosition = 273
; FirstLine = 263
; Folding = --
; EnableXP
; Executable = /mnt/sync/pig