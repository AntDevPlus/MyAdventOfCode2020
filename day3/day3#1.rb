#Author: AntDevPlus
#Date: 02/12/2020
#Dependences: ruby
#Goal: resolve the day3 issue of AdventOfCode

def numberOfTree(op1, op2)
    width = 0;
    height = 0;

    File.open("input").each do |line|
        width = (line.to_s.length) - 1
        height += 1
    end

    array_input = Array.new();

    File.open("input").each do |line|
        i = 0
            nline = line.tr("\n","").to_s * (1 + (height/(width/op2).to_i))
            #array_input << line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","")+ line.tr("\n","") + line.tr("\n","")+ line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","") + line.tr("\n","")+ line.tr("\n","") + line.tr("\n","")+ line.tr("\n","") + line.tr("\n","")
            array_input << nline
        #puts nline
    end

    i = 0
    y = 0
    numberOfTree = Array.new
    while (i < height)
        numberOfTree[i] = array_input[i][y]
        p array_input[i][y]
        y+=op2
        i+=op1
    end
    hp=0
    numberOfTree.each do |p|
        if ( p == "#")
            hp +=1
        end
    end
    return hp
end
#op1 = left et op2= right
puts numberOfTree(1,3)
#puts (1/7).to_d