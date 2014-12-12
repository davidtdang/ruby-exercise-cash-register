require_relative "../lib/cash_register"

describe "Cash Register" do
  describe "#total" do
    it "intial total" do
      my_register = CashRegister.new

      expect(my_register.total).to eq 0
    end
  end

  describe "#purchase" do
    it "add to total" do
      my_register = CashRegister.new
      my_register.purchase(3.14)
      
      expect(my_register.total).to eq(3.14)
    end

    it "multiple items" do
      my_register = CashRegister.new
      my_register.purchase(3.14)
      my_register.purchase(2.00)
      my_register.purchase(8.27)
      my_register.purchase(5.29)

      expect(my_register.total).to eq(18.70)
    end
  end

  describe "#pay" do
    it "takes a float (payment) and returns float (change)" do
      my_register = CashRegister.new
      my_register.purchase(11.51)

      expect(my_register.pay(15.00)).to eq(3.49)
    end

    it "total should be 0" do
      my_register = CashRegister.new
      my_register.purchase(11.51)
      my_register.pay(15.00)

      expect(my_register.total).to eq(0)
    end

    it "requires more payment if payment_amt is less than total" do
      my_register = CashRegister.new
      my_register.purchase(11.51)
      my_register.pay(5.00)

      expect(my_register.total).to eq(6.51)
    end
  end
end
