
fileName = "code.txt"

with open(fileName) as fid:
    text = fid.readlines()

for line in text:
    args = line.split()
    if(args[0] == "Vector:"):
        dY = int(args[1][3::])
        dX = int(args[2][3::])
        I = int(args[3][2::])
        val = ((dY & 0x1FFF) << 16) | ((I & 0x7) << 13) | ((dX & 0x1FFF))
        byte1 = (val >> 24) & 0xFF
        byte2 = (val >> 16) & 0xFF
        byte3 = (val >> 8) & 0xFF
        byte4 = val & 0xFF
        print("%02x %02x %02x %02x" %(byte1, byte2, byte3, byte4))
    
    if(args[0] == "Halt"):
        print("20 00")
 
    if(args[0] == "SVEC:"):
        dY = (int(args[1][3::]))
        dX = (int(args[2][3::]))
        I = int(args[3][2::])
        val = (2 << 13) | ((dY & 0x1F) << 8) | ((I & 0x7) << 5) | (dX & 0x1F)
        byte1 = (val >> 8) & 0xFF
        byte2 = (val) & 0xFF

        print("%02x %02x" %(byte1, byte2))
       
    if(args[0] == "Intensity:"):
        I = int(args[1][2::])

        val = (6 << 12) | (I & 0xFF)

        byte1 = (val >> 8) & 0xFF
        byte2 = (val) & 0xFF

        print("%02x %02x" %(byte1, byte2))

    if(args[0] == "Scale:"):
        linScale = int(args[1][9::])
        binScale = int(args[2][9::])

        val = (7 << 12) | (binScale << 8) | (linScale)

        byte1 = (val >> 8) & 0xFF
        byte2 = (val) & 0xFF

        print("%02x %02x" %(byte1, byte2))

    if(args[0] == "Center"):
        print("80 00")


    if(args[0] == "JSR"):
        address = int(args[1][5::], base=16)
        val = (5 << 13) | (address >> 1)
        
        byte1 = (val >> 8) & 0xFF
        byte2 = (val) & 0xFF

        print("%02x %02x" %(byte1, byte2))

    if(args[0] == "RTS"):
        print("C0 00")

    if(args[0] == "JMP"):
        address = int(args[1][5::], base=16)
        val = (7 << 13) | (address >> 1)
        
        byte1 = (val >> 8) & 0xFF
        byte2 = (val) & 0xFF

        print("%02x %02x" %(byte1, byte2))

    
