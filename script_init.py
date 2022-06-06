import os

#to current working directory
save_path = "LIBRO"
file_name = "datamem.dat"
completeName = os.path.join(save_path, file_name)


## FILES IN DIRECTORY
def printFiles():
    cwd = os.getcwd()  # Get the current working directory (cwd)
    files = os.listdir(cwd)  # Get all the files in that directory
    print("Files in %r: \n%s" % (cwd, files))

## READ
def read():
    f = open(completeName, "r") #open and read the file after the appending:
    print(f.read())
    f.close()
    
## WRITE
def write():
    f = open(completeName, "w")
    f.write(script())
    f.close()
    
## WRITELINES
def writelines():
    f = open(completeName, "w")
    f.writelines(script())
    f.close()
    
    
## ASCII hex
def ascii(s):
    return format(ord(str(s)), "X")

 
## SCRIPT
def script():
    global s
    # s = s[::-1]
    print(s+'\n')
    
    n = 4
    line = ''
    for k in range(0, len(s)):
        if (k == 0 or k%n != 0):
            # line += s[k]
            line += ascii(s[k])
            
        elif (k%n == 0):
            # line += '\n' + s[k]
            line += '\n' + ascii(s[k])
    print(line)
    return line
    
    
    # line = ""
    
    # for k in range(0, len(s)):

    #     if (k == 0):
    #         tmp = s[k]
    #         # tmp = ascii(s[k])
    
    #     elif (k%4 == 0):
    #         # line += tmp[::-1]
    #         line += tmp
    #         tmp = '\n' + s[k]
    #         # tmp += '\n' + ascii(s[k])  
              
    #     else:
    #         tmp += s[k]
    #         if (k == len(s)-1):
                
    # print(line)
    
## INPUT
def submit():
    global s
    # s = input("Enter phrase: ")
    s = "El cuaderno rosado"
    writelines()
    
submit()