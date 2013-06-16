require 'open-uri'
require 'nokogiri'

namespace :g3366 do
  desc "TODO"
  task :category => :environment do

    doc = Nokogiri::HTML(open('http://www.3366.com/'))
    
    doc.css('#navbar > ul > li > a').each do |link|
      
      if /\/games\// =~ link[:href] && /new/ =~ link[:href]
        c = Category.where(:name => link.content).first_or_create 
        puts c.name unless c.nil?
        G3366CategoryWorker.perform_async(link[:href])
      end

    end

  end


  desc "TODO"
  task :page => :environment do
    url = 'http://www.3366.com/games/128_new_pic.shtml' 
    doc = Nokogiri::HTML(open('http://www.3366.com/'))
    doc.css('#type_generate_result_id li a').each do |link|
      puts link[:title]
    end
    
  end

end
