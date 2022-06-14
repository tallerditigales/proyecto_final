import os
from pathlib import Path


# create doc to insert phrase
textFile = "phrase.txt"
fle = Path(textFile)
fle.touch(exist_ok=True)
f = open(fle)

#to current working directory
save_path = "ARM_UNICICLO"
file_name = "data_mem_init.dat"
completeName = os.path.join(save_path, file_name)
    
## READ
def read(file):
    f = open(file, "r")
    text = f.read()
    f.close()
    return text

def script(text):
    file = open(completeName, "w") 
    # response = input("Digitar palabra ")
    # texto = input("Ingrese el texto: ")
    for char in text:
        hex = "".join(["{:02x}".format(ord(c)) for c in char])
        hex = "000000"+ str(hex) + "\n"
        file.writelines(hex)
    file.write( "00000000")
    file.close()
    print(f"El texto tiene una longitud de: {len(text)+1}")


script(read(textFile))