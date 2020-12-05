#Author: AntDevPlus
#Date: 05/12/2020
#Dependences: ruby
#Goal: resolve the day4 issue of AdventOfCode


file = File.open("input2", "r")
fichier = file
file = file.read.gsub(" ", "\n")
#puts file#.split(";")


MANDATORY_FIELDS = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
fields = 0
valids_passports = 0
passport = Array.new
valid_fields = 0
#puts file

file.split("\n") do |l|
    #puts l
    field = l.split(":")[0]
    passport << l
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
            #puts fields
            
            passport.each do |pass|
                test_field = pass.split(":")[1]
                case pass.split(":")[0]
                when "byr"
                    if ( test_field.length == 4 && test_field.to_i >= 1920 && test_field.to_i <= 2002 )
                        valid_fields +=1
                    end
                when "iyr"
                    if ( test_field.length == 4 && test_field.to_i >= 2010 && test_field.to_i <= 2020 )
                        valid_fields +=1
                    end
                when "eyr"
                    if ( test_field.length == 4 && test_field.to_i >= 2020 && test_field.to_i <= 2030 )
                        valid_fields +=1
                    end
                when "hgt"
                    if (test_field.include? "in")
                        if ( test_field[0..2].gsub("i","").to_i >= 56 && test_field[0..2].gsub("i","").to_i <= 76 )
                            valid_fields +=1
                        end
                    elsif (test_field.include? "cm")
                        if ( test_field[0..2].gsub("i","").to_i >= 150 && test_field[0..2].gsub("i","").to_i <= 193 )
                            valid_fields +=1
                        end
                    end
                when "hcl"
                     if (/^#[0-9a-f]{6}$/.match?(test_field))
                         valid_fields +=1
                    end
                when "ecl" 
                    if (/(amb|blu|brn|gry|grn|hzl|oth)/.match?(test_field))
                        valid_fields +=1
                    end
                when "pid"
                    if (/\d{9}/.match?(test_field))
                        valid_fields +=1
                    end
                end
            end
            passport.clear

            if (valid_fields == 7)
                valids_passports +=1;
            end
            # valids_passports +=1
            fields = 0
            valid_fields = 0
        else
            passport.clear
            fields = 0
        end
    end
end
puts valids_passports
puts valid_fields