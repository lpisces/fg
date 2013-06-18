require "rubygems"
require "sequel"
require "mysql2"

DB = Sequel.connect(:adapter=>'mysql2', :host=>'localhost', :database=>'fg', :user=>'root', :password=>'123456')

path = '/home/dev/fg/public/uploads/item'

puts "mkdir -p #{path}"
puts "mkdir -p #{path}/bimg"
puts "mkdir -p #{path}/simg"
puts "mkdir -p #{path}/flash"

DB.fetch("SELECT * FROM items") do |row|
  puts "mkdir -p #{path}/bimg/#{row[:id]}"
  puts "wget -nc -O '#{path}/bimg/#{row[:id]}/#{File.basename(row[:bimg])}' #{row[:bimg]}"
  DB['UPDATE items set bimg = ? where id = ?', File.basename(row[:bimg]), row[:id]].update

  puts "mkdir -p #{path}/simg/#{row[:id]}"
  puts "wget -nc -O '#{path}/simg/#{row[:id]}/#{File.basename(row[:simg])}' #{row[:simg]}"
  DB['UPDATE items set simg = ? where id = ?', File.basename(row[:simg]), row[:id]].update
end
