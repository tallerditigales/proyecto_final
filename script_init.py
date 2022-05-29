width = "WIDTH=8;\n"
depth = "DEPTH=256;\n\n"
address = "ADDRESS_RADIX=UNS;\n"
data = "DATA_RADIX=UNS;\n\n"

import os

#to current working directory
save_path = "CPU_UNICICLO"
file_name = "Memory_Data_Initialization.mif"
completeName = os.path.join(save_path, file_name)


## READ
def read():
    #open and read the file after the appending:
    f = open(completeName, "r")
    print(f.read())
    f.close()
    
## WRITE
def write():
    f = open(completeName, "w")
    f.write(script())
    f.close()
    
## SCRIPT
def script():
    global phrase
    code = width+depth+address+data+"CONTENT BEGIN\n"
    i = 0
    while i != (len(phrase)):
        code += "\t{}\t:\t{};\n".format(i, ord(phrase[i]))
        i+=1
    code += "\t[{}..255]\t:\t{};\nEND;\n".format(i, 255)
    return code
    
## INPUT
def submit():
    global phrase
    phrase = input("Enter phrase: ")
    write()
    
submit()