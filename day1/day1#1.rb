#Author: AntDevPlus
#Date: 02/12/2020
#Dependences: ruby
#Goal: resolve the day1 issue of AdventOfCode

input = Array.new

File.open("input").each do |line|
    # print "#{line}"
    input << line
end
input2 = input

input.each do |i|
    input2.each do |i2|
        if ( i.to_i + i2.to_i == 2020)
            puts "#{i.to_i*i2.to_i}"
        end
    end
end
