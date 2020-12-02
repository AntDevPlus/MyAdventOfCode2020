#Author: AntDevPlus
#Date: 02/12/2020
#Dependences: ruby
#Goal: resolve the day2 issue of AdventOfCode

count = 0
File.open("input").each do |line|
    op1 = /.*-/.match(line)
    op1 = op1.to_s.tr("-","")

    op2 = /-.*/.match(line)
    op2 = op2.to_s[1..2]

    lettre = /.:/.match(line).to_s
    lettre = lettre.tr(":","")

    pwd = /:.*/.match(line).to_s
    pwd = pwd.tr(": ", "")
    #puts pwd

    nbocc = pwd.scan(/#{lettre}/).count.to_i

    if ( nbocc >= op1.to_i && nbocc <= op2.to_i )
        count = count + 1
    end
end

puts count
