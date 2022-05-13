def readFile():
    count = 0
    lines = []
    
    with open("build/output_LSB_One_AproximateORAdder.txt") as fp:
        for line in fp:
            count += 1
            lines.append(line.strip())
    #print(lines)

def main():
    readFile()

if __name__ == "__main__":
    main()
