def stockpicker(stocks)
	if stocks.class == Array
		best_pair = []
		max_profit = 0
		(0..(stocks.length-1)).each do |idx|
			if idx < stocks.length
				((idx+1)..(stocks.length-1)).each do |other_idx|
#          puts "current choices #{idx} and #{other_idx}."
					profit = stocks[other_idx]-stocks[idx]
#          puts profit
					if profit > max_profit
						max_profit = profit
						best_pair = [idx,other_idx]
#            print max_profit,best_pair
					end
				end
			end
		end
  end
	return "Buy on day #{best_pair[0]+1} and sell on #{best_pair[1]+1} for a max profit of $#{max_profit}."
end
