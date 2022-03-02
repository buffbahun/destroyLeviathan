fr = open("input.txt", "r")
val = fr.read()

fw = open("pass5", "w+")

for i in range(0,len(val)//8):
	fw.write("%c" % chr(int(val[i*8:(i+1)*8],2)))

