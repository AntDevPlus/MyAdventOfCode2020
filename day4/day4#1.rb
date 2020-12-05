#Author: AntDevPlus
#Date: 05/12/2020
#Dependences: ruby
#Goal: resolve the day4 issue of AdventOfCode


file = File.open("input", "r")
fichier = file
file = file.read.gsub(" ", "\n")
#puts file#.split(";")


MANDATORY_FIELDS = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
fields = 0
valids_passports = 0
#puts file
file.split("\n") do |l|
    puts l
    field = l.split(":")[0]
    if ( l != '')
        #puts 'pasvide'
        #puts field
        MANDATORY_FIELDS.each do |f|
            #puts f
            if (field == f)
                fields += 1
            end
        end
    else 
        if (fields == MANDATORY_FIELDS.length)
            puts fields
            valids_passports +=1;
            fields = 0
        else
            fields = 0
        end
    end
end
puts valids_passports