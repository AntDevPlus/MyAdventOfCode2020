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

    # puts pwd[op1.to_i - 1]
    # puts pwd
    # puts (op1.to_i-1)
    if ( (pwd[op1.to_i - 1] == lettre && pwd[op2.to_i - 1] != lettre ) || ( pwd[op1.to_i - 1] != lettre && pwd[op2.to_i - 1] == lettre ))
        count = count + 1
    end
end

puts count
