module Utils
   def self.round(price)
     return price if price % 5 == 0
     price + 5 - (price % 5)
   end

  # def self.format_price(price)
  #   sprintf("%.2f", price / 100.00)
  # end
end

class Product
  @@sum = 0
  @@total_tax = 0

  def initialize(quantity, name, price)
    @quantity = quantity
    @a_name = name
    @price = price * 100
  end

  def tax_rate
    if !exempt? && !imported?
      0.10
    elsif exempt? && !imported?
      0.0
    elsif !exempt? && imported?
      0.15
    elsif exempt? && imported?
      0.05
    else 
      puts "you've messed up."
    end
  end

  def sales_tax
    Utils::round(tax_rate * sub_total)
  end

  def total_price
    sub_total + sales_tax
  end

  def sub_total
    @quantity * @price
  end

  # find out if the product is tax exempt
  def exempt?
    if @a_name.include?("book") || @a_name.include?("chocolate") || @a_name.include?("headache")
      true
    else 
      false
    end
  end

  #find out if the product qualifies for import duties
  def imported?
    if @a_name.include?("imported")
      true
    else
      false
    end
  end

  def print_items
    print "#{@quantity} #{@a_name}: #{total_price.to_f / 100}"
  end

  # def total_tax
  #   "Sales taxes: #{@@total_tax}"
  # end
  # def final_price 
  #   print "Total: #{@@sum}"
  # end
end

class Cart
  def initialize(*products)
    @products = products
    @total_taxes = 0
    @total_price = 0
  end

  def calclulate_totals
    @products.each do |product|
      @total_taxes += product.sales_tax
      @total_price += product.total_price
    end
  end

  def print_total
    calclulate_totals
    puts "Sales taxes: #{@total_taxes.to_f/100}"
    puts "Total: #{@total_price.to_f/100}"
  end

end





# Output 1:
# 1 book : 12.49
# 1 music CD: 16.49
# 1 chocolate bar: 0.85
# Sales Taxes: 1.50
# Total: 29.83


#Firt input
input1_a = Product.new(1, "book", 12.49) 
input1_b = Product.new(1, "music CD", 14.99)
input1_c = Product.new(1, "chocolate bar", 0.85)

puts input1_a.print_items
puts input1_b.print_items
puts input1_c.print_items

cart1 = Cart.new(input1_a, input1_b, input1_c)
cart1.print_total

puts "--------"




#Second input
input2_a = Product.new(1, "imported box of chocolates", 10.00) 
input2_b = Product.new(1, "imported bottle of perfume", 47.50)


puts input2_a.print_items
puts input2_b.print_items

cart2 = Cart.new(input2_a, input2_b)
cart2.print_total

puts "---------"

#Third input
input3_a = Product.new(1, "imported bottle of perfume", 27.99) 
input3_b = Product.new(1, "bottle of perfume", 18.99)
input3_c = Product.new(1, "packet of headache pills", 9.75)
input3_d = Product.new(1, "box of imported chocolates", 11.25)

puts input3_a.print_items
puts input3_b.print_items
puts input3_c.print_items
puts input3_d.print_items

cart3 = Cart.new(input3_a, input3_b, input3_c, input3_d)
cart3.print_total

puts "--------"




 
# Input 2:
# 1 imported box of chocolates at 10.00
# 1 imported bottle of perfume at 47.50
 
# Input 3:
# 1 imported bottle of perfume at 27.99
# 1 bottle of perfume at 18.99
# 1 packet of headache pills at 9.75
# 1 box of imported chocolates at 11.25
























# class Purchase
#   #the point of this class is to serve as a register--the purchaser
#   #approaches the counter with a basket of goods. The characteristics
#   #of these goods are known i.e. part if their identity.
#   attr_accessor :purchase_array

#   def initialize(an_array)
#     @quantity = an_array[0][0]
#     @product = an_array[0][1]
#     @category = an_array[0][2]
#     @origin = an_array[0][3]
#     @price = an_array[0][4]
#   end

#   def test_vars
#     puts "Quantity is #{@quantity}"
#     puts "Product is #{@product}"
#     puts "Category is #{@category}"
#     puts "Oirigin is #{@origin}"
#     puts "Price is #{@price}"
#   end

#  

#   #calculate the sales tax
#   def basic_tax
#     tax_amt = @price * 0.1
#     puts "tax is #{tax_amt}"
    

#     tax_amt
#   end
# #calculate the import duties
#   def import_duty
#     duty_amt = @price * 0.05
#     puts "duty is #{duty_amt}"
#     duty_amt
#   end
# #add the the taxes, the prices, and the final total
#   def calc_tax
#     @taxes = (basic_tax unless exempt?) + (import_duty if imported?)
#     puts @taxes
#     @total = @taxes + @price
#     puts @total
#     @subtotal = @price + @taxes
#   end

#   #print it all out.
#   def print_receipt
#     counter = 0
#     #@purchase_array.length.times do 
#     puts "#{@quantity} #{@product}: #{@subtotal}"
#     #counter += 1
    
#     puts "Sales Taxes: #{@taxes}"
#     puts "Total: #{@total}"
    
#   end



# end

# input1 = [
#   [1, "book", "rockets", "Spain", 12.49],
#   [1, "music CD", "nonexempt", "dom", 14.99],
#   [1, "chocolate bar", "food", "dom", 0.85]
# ]

# first_purchase = Purchase.new(input1)

# first_purchase.calc_tax
# first_purchase.print_receipt








