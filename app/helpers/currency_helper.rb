module CurrencyHelper
  def formatted_currency(price)
    number_to_currency(price, unit: "$", precision: 2)
  end
end