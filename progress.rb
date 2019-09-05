require 'rubygems'
require 'time'
require 'active_support/all'
first_day = '2019-01-01'.to_date
today = Date.today

total_days = 365*4+1
current_days = (today - first_day).to_f
percent = ((current_days/total_days).round(2)*100).to_i

if !File.exist?'percent.txt'
  File.new('percent.txt', 'w').write(percent.to_s)
else
  f_percent = File.new('percent.txt', 'r').read
  if f_percent == percent.to_s
    puts "Same percent: #{percent}"
    exit
  end
end

puts "Percent: #{percent}"

reduce = 5
fill = '▓'*(percent/reduce)
empty = '░'*((100-percent)/reduce)
puts "#{fill}#{empty} #{percent}%"

File.new('percent.txt', 'w').write(percent.to_s)
puts "Novo percentual: #{percent}"