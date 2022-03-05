class Main

    def firstmethod
pricing_table = {
  'milk' => 3.97,
  'bread' => 2.17,
  'banana' => 0.99,
  'apple' => 0.89,
  'milk2pkts' => 5.00,
  'bread3pkts' => 6.00
}

items = gets.strip.split(',')

items.each_with_index do |item,index|
  items[index] = item.strip
end

cart = {}

items.each { |item| cart[item] = items.count(item) }

total_price = 0
savings = 0
item_price = 0

puts "\nItem\tQuantity\tPrice"
puts '-' * 50

cart.each do |item, quantity|
  item_price = 0
  item_price = case item
               when 'milk'
                 (quantity / 2) * pricing_table['milk2pkts'] + (quantity % 2) * pricing_table[item]

               when 'bread'
                 (quantity / 3) * pricing_table['bread3pkts'] + (quantity % 3) * pricing_table[item]

               else
                 quantity * pricing_table[item]

               end
  item_price = item_price.round(2)
  total_price += item_price
  cart[item] = [quantity, item_price]
  puts "#{item}\t#{cart[item][0]}\t$#{cart[item][1]}"
  savings += quantity * pricing_table[item] - item_price
end
puts "\nTotal Price : #{total_price}"
puts "You saved $#{savings.round(2)} today.\n"

end
end

obj = Main.new

obj.firstmethod