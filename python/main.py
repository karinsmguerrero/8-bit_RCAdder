def readFile(fileToCompare):
    aproximateLines = []
    with open("/home/karina/Verilog/Full_adder/python/files/" + fileToCompare) as fp:
        for line in fp:
            aproximateLines.append(line.strip())
    return aproximateLines
    #print(lines)

def main():
    exactLines = []
    with open("/home/karina/Verilog/Full_adder/python/files/output_RippleCarryAdder.txt") as fp:
        for line in fp:
            exactLines.append(line.strip())

    aproximateLines = readFile("output_LSB_One_AproximateRCAdder.txt")

    probability = []
    for index, line in enumerate(exactLines):
        probability.append(int(line) - int(aproximateLines[index]))
    # writing to file
    file1 = open('/home/karina/Verilog/Full_adder/python/results/result_LSB_One_AproximateRCAdder.txt', 'w')
    file1.writelines(str(probability))
    file1.close()

if __name__ == "__main__":
    main()
