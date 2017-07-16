#!/usr/bin/ruby
require_relative "./rubyAboki.rb"

class Currency 
  include RubyAboki
    
  def current_rates
    puts "here"
    #puts @@rates
  end
end

c = Currency.new
puts c.current_rates
puts c.strip_rates