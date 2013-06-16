require 'open-uri'
require 'nokogiri'

class G3366CategoryWorker
  include Sidekiq::Worker
  def perform(url)

    #doc = Nokogiri::HTML(open(url))
    #cnt = doc.xpath('//*[@id="PageNavId"]/a[11]').first.content
    #cnt = cnt.to_i
    cnt = 200

    urls = [].push url
    (2..cnt).each  do |i|
      urls.push url.gsub(/\.shtml$/, "_#{i}.shtml") 
    end

    urls.each do |u|
      G3366CategoryPageWorker.perform_async(u)
    end

  end
end
