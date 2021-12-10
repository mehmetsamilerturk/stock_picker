stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker(stock_prices)
  low = stock_prices.sort
  high = stock_prices.sort {|x, y| y <=> x}

  combinations = low.product(high)

  sorted = combinations.sort_by do |pair|
    pair[0] - pair[1]
  end

  buy_index = stock_prices.index(sorted[0][0])
  sell_index = stock_prices.index(sorted[0][1])

  until buy_index < sell_index
    sorted.delete_at(0)
    buy_index = stock_prices.index(sorted[0][0])
    sell_index = stock_prices.index(sorted[0][1])
  end

  [buy_index, sell_index]
end

p stock_picker(stock_prices)