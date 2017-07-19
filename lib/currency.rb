#!/usr/bin/ruby
require_relative "./rubyAboki.rb"
require 'pry'
require 'thor'

class Currency < Thor
  include RubyAboki
  
  desc "current_rates", "Get current rates for currency exchange"
  def current_rates(currency, trade)
    strip_rates 
    if currencies.include?(currency)
      if currency == 'usd'
        usd_rates = @@rates[0..1].concat(@@rates[6..7]).concat( @@rates[12..13])
        today_rate = (trade.keys.first.to_s == 'buy') ? curr_buy_rates(usd_rates) : curr_sell_rates(usd_rates)
        today_rate[0]
      elsif currency == 'gbp'
        gbp_rates =  @@rates[2..3].concat( @@rates[8..9]).concat( @@rates[14..15])
        today_rate = (trade.keys.first.to_s == 'buy') ? curr_buy_rates(gbp_rates) : curr_sell_rates(gbp_rates)
        today_rate[0]
      else
        eur_rates = @@rates[4..5].concat( @@rates[10..11]).concat( @@rates[16..17])
        today_rate = (trade.keys.first.to_s == 'buy') ? curr_buy_rates(eur_rates) : curr_sell_rates(eur_rates)
        today_rate[0]  
      end
    end 
  end

  desc "current_buy_rates","Buy rates for currency exchange"
  def get_current_rate(currency, buy: "buy")
    latest_rate = current_rates(currency, buy: "buy")
    puts "Generated Buy Rates"
    puts("Exchange Rate #{currency.upcase}")
    puts("================")
    puts latest_rate
    puts("================")
  end 

  desc "current_buy_rates","Sell rates for currency exchange"
  def curr_buy_rates(rates)
    rates.select.each_with_index { |_,i| i.even? }
  end

  desc "current_sell_rates","Sell rates for currency exchange"
  def curr_sell_rates(rates)
    rates.select.each_with_index { |_,i| i.odd? }
  end 
end

Currency.start(ARGV)
