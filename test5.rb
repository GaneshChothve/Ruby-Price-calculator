require './test5b'
require './test5c'

class Calculator < Pricing_table
  include Calculate_bill

  def initialize(items)
    @items = items.strip.split(',')
    @items.each_with_index do |item, index|
      @items[index] = item.strip
    end
  end

  def solve
    bill(@@pricing_table)
  end
end

class Get_inputs
  puts "Enter items ',' separated"
  @@input = gets
  obj = Calculator.new(@@input)
  obj.solve
end

Get_inputs.new
