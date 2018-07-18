#!/usr/bin/env ruby

file = "/var/log/system.log"

user_name = Regexp.new("anatofuzMBP|anatofuz-15")
count = Hash.new(0)

File.open(file,'r') do |f|
    f.each_line do |line|
        if line =~ /\w+ \d{0,2} (?:\d{2}:?){3} #{user_name} ([\w.]+)\[\d+\]/
            count[$1] += 1
        end
    end
end


sum = 0

for key in count.keys
    sum += count[key]
end

p sum
