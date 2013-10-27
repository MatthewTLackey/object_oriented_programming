require_relative "products"

module Utils
  def self.round(price)
    return price if (price % 5) == 0
    price + 5 - (price % 5)
  end
end


class Purchase
   
  def initialize(*products)
    @product_array = products
    @@total = 0
    @@total_tax = 0
  end

  def calculate_tax
    @product_array.each do |item|
      tax_val = (item.subtotal * item.sales_tax)
      @@total_tax += tax_val

    end
    #Utils::round(@@total_tax)
  end

  def calculate_total
    @product_array.each do |item|
      @@total += item.cost
    end
  end

  def print_receipt
    @product_array.each do |x|
      puts "#{x.num_items} #{x.product_name}: #{x.total.to_f/100 }"
    end
    calculate_total
    calculate_tax
    puts "Sales taxes: #{Utils::round(@@total_tax).to_f / 100}"
    puts "Total: #{Utils::round(@@total + @@total_tax).to_f / 100}"
  end
end


# Input 1:
# 1 book at 12.49
# 1 music CD at 14.99
# 1 chocolate bar at 0.85

# Output 1:
# 1 book : 12.49
# 1 music CD: 16.49
# 1 chocolate bar: 0.85
# Sales Taxes: 1.50
# Total: 29.83

puts "-------------"

item1_1 = Exempt.new(1, "book", 12.49)
item1_2 = Product.new(1, "music CD", 14.99)
item1_3 = Exempt.new(1, "chocolate bar", 0.85)


basket1 = Purchase.new(item1_1, item1_2, item1_3)
basket1.print_receipt

puts "--------------"

item2_1 = ExemptImported.new(1, "box of chocolates", 10.00)
item2_2 = Imported.new(1, "bottle of perfume", 47.50)

basket2 = Purchase.new(item2_1, item2_2)
basket2.print_receipt


puts "--------------"

item3_1 = Imported.new(1, "imported bottle of perfume", 27.99) 
item3_2 = Product.new(1, "bottle of perfume", 18.99)
item3_3 = Exempt.new(1, "packet of headache pills", 9.75)
item3_4 = ExemptImported.new(1, "box of imported chocolates", 11.25)

basket3 = Purchase.new(item3_1, item3_2, item3_3, item3_4)
basket3.print_receipt