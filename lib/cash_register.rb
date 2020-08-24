class CashRegister
 
    attr_accessor :total, :discount
   


    def initialize(discount=0)
      @total = 0
      @discount = discount
      @list = {}
      @prices = {}
    end 

    def add_item(item, price, quantity=1)
      adjusted = price * quantity
      @list[item] = quantity
      @prices[item] = adjusted
      @total += adjusted
    end

    def apply_discount
      @total = @total - (@discount * @total / 100)
      if @discount == 0
        "There is no discount to apply."
      else
        "After the discount, the total comes to $#{@total}."
      end
    end

    def items
      array = []
      @list.each do |key, value|
        i = 0
        while i < value
          array << key
          i += 1
        end
      end
      array
    end

    def void_last_transaction
      last_item = @list.to_a.last
      last_price = @prices[last_item[0]]
      @total = @total - last_price
    end


end