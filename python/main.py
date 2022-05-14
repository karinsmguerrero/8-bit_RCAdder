from collections import Counter

def readFile(file):
    lines = []
    with open("/home/karina/Verilog/Full_adder/python/" + file) as fp:
        for line in fp:
            lines.append(line.strip())
    return lines

def readFileAsList(file):
    with open("/home/karina/Verilog/Full_adder/python/" + file) as fp:
        content = fp.read()
        content_list = content.split(",")
        lenght = len(content_list)
        lines = content_list[1:lenght -1]
        res = []
        for line in lines:
            res.append(line.strip())

        #print(content_list[1:lenght -1])
    return  res

def generatePMF(name):
    exactLines = readFile('/files/output_RippleCarryAdder.txt')
    aproximateLines = readFile('/files/output_' + name + '.txt')
    errorDistance = [] #error distance
    for index, line in enumerate(exactLines):
        errorDistance.append(abs(int(line) - int(aproximateLines[index])))
    # writing to file
    with open('/home/karina/Verilog/Full_adder/python/results/PMF_' + name + '.txt', 'w') as fp:
        fp.writelines(str(errorDistance))

def getErrorDistances(name):
    results = readFileAsList('/results/PMF_' + name + '.txt')
    uniques = set(results)
    print(uniques)
    for index, item in enumerate(uniques):
        counts = Counter(results)
        print(str(item) + '=' + str(counts[item]))
    
    #print(len(results))
    #return set(results)

def main():
    """
    generatePMF('RippleCarryAdder')
    generatePMF('LSB_One_AproximateRCAdder')
    generatePMF('LSB_Two_AproximateRCAdder')
    generatePMF('LSB_Three_AproximateRCAdder')
    generatePMF('LSB_Four_AproximateRCAdder')
    generatePMF('LSB_One_AproximateORAdder')
    generatePMF('LSB_Two_AproximateORAdder')
    generatePMF('LSB_Three_AproximateORAdder')
    generatePMF('LSB_Four_AproximateORAdder')
    """


    getErrorDistances('LSB_Three_AproximateRCAdder')

    """
    getErrorDistances('RippleCarryAdder')
    getErrorDistances('LSB_One_AproximateRCAdder')
    getErrorDistances('LSB_Two_AproximateRCAdder')
    getErrorDistances('LSB_Three_AproximateRCAdder')
    getErrorDistances('LSB_Four_AproximateRCAdder')
    getErrorDistances('LSB_One_AproximateORAdder')
    getErrorDistances('LSB_Two_AproximateORAdder')
    getErrorDistances('LSB_Three_AproximateORAdder')
    getErrorDistances('LSB_Four_AproximateORAdder')
    """


if __name__ == "__main__":
    main()
