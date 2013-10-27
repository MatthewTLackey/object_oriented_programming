class Product
  def initialize(quantity, name, price)
    @name = name
    @quantity = quantity
    @price = (price * 100).to_i
  end

  def cost
    @price
  end

  def num_items
    @quantity
  end

  def product_name
    @name
  end

  def sales_tax
    0.10
  end
  def subtotal 
    @price * @quantity
  end
  def total 
    (subtotal + Utils::round(sales_tax * cost))
  end

end

class Exempt < Product
  def initialize(quantity, name, price)
    @name = name
    @quantity = quantity
    @price = (price * 100).to_i
  end

  def sales_tax
    0
  end

  def subtotal 
    @price * @quantity
  end

end

class Imported < Product
  def initialize(quantity, name, price)
    @name = name
    @quantity = quantity
    @price = (price * 100).to_i
  end

  def sales_tax
    0.15
  end
end

class ExemptImported < Product
  def initialize(quantity, name, price)
    @name = name
    @quantity = quantity
    @price = (price * 100).to_i
  end

  def sales_tax
    0.05
  end
end
