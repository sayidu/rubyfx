#!/usr/bin/ruby
require_relative "./rubyAboki.rb"
require 'pry'

class Currency 
  include RubyAboki
  
  def current_rates(currencies, currency, rates)
    if currencies.include?(currency)
      if currency == 'usd'
        usd_rates = rates[0..1].concat(rates[6..7]).concat(rates[12..13])
        curr_buy_rates(currencies, usd_rates)
        curr_sell_rates(currencies, usd_rates)
      elsif currency == 'gbp'
        gbp_rates = rates[2..3].concat(rates[8..9]).concat(rates[14..15])
        curr_buy_rates(currencies, gbp_rates)
        curr_sell_rates(currencies, gbp_rates)
      else
        eur_rates = rates[4..5].concat(rates[10..11]).concat(rates[16..17])
        curr_buy_rates(currencies, eur_rates)
        curr_sell_rates(currencies, eur_rates)    
      end
    end 
  end

  def curr_buy_rates(currency, rates)
    rates.select.each_with_index { |_,i| i.even? }
  end 

  def curr_sell_rates(currency, rates)
    rates.select.each_with_index { |_,i| i.odd? }
  end 
end

c = Currency.new
c.current_rates(c.currencies,'eshhur', c.strip_rates)