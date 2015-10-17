import sys

fileName = sys.argv[1]

with open(fileName) as fid: 
    text = fid.readlines()

code = []

for n in xrange(len(text)):
    code.append((text[n][7:55]))

#for n in xrange(len(text)):
#    code.append(text[n])

codeText = ""

for line in code:
    codeText += line

text = codeText.split()

for n in xrange(len(text)/2):
    print(text[2*n] + text[2*n+1] + "," )
