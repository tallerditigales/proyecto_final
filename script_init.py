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
def write(line):
    f = open(completeName, "w")
    f.write(line)
    f.close()
    
    
## WRITELINES
def writelines(lines):
    f = open(completeName, "w")
    f.writelines(lines)
    f.close()
    
    
## ASCII hex
def ascii(s):
    return format(ord(str(s)), "X")


## PROCESS STRING
def processString(s):
    n = 4
    arr = [s[i:i+n][::-1] for i in range(0, len(s), n)]
    print(arr)
    return arr
    
    
## PROCESS ASCII
def processASCII(arr):
    lines = []
    for i in range(0, len(arr)):
        # for k in range(0, len(arr[i])):
        a = list(map(lambda k:ascii(arr[i][k]), range(0, len(arr[i]))))

        if (len(a) == 4):
            a.append('\n')
            if (i == len(arr)-1):
                a.append('FF')
            lines.append(''.join(a))
            
        else:
            a.append('FF')
            lines.append((''.join(a)))
    # print('\n',lines)
    return lines
 
 
## SCRIPT
def script():
    global s
    return processASCII(processString(s))

    
## INPUT
def submit():
    global s
    # s = input("Enter phrase: ")
    s = "El cuaderno rosa con stickers de Leonardo D Carpio Green"
    print('✅ phrase: '+ s +'\n')
    writelines(script())
    
    
submit()