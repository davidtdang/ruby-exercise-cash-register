class CashRegister
  def initialize
    @total = 0
  end

  def total
    @total
  end

  def purchase(item_price)
    @total += item_price
  end

  def pay(payment_amt)
    change = payment_amt - @total

    if payment_amt > total
      @total = 0
    else
      @total -= payment_amt
    end

    change
  end
end
