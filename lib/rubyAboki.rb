#require 'rubyAboki/version'
require 'open-uri'
require 'nokogiri'

module RubyAboki
  API_URI = 'https://www.abokifx.com'
  page = Nokogiri::HTML.parse(open(API_URI))
  @@scraped_data = page.css('.lagos-market-rates .table-grid .grid-table .table-col')
  @@rates = []

  def currencies
     ['usd', 'gbp', 'eur']
  end 

  def strip_rates
    @@scraped_data.each do |data|
      data_text = data.text
        if data_text =~ /\d{3}[[:space:]]/
          curr_rate = data.text.split('/')
          @@rates.push(data_text)  
      end
    end
    @@rates
  end

  def curr_rates

  end

end
