def array_print(a)
	count = 1
	stack = []
	a.each do |item|
		stack.push item
		if (count == 4)
			stack.each{|i| puts i}
			count = 0
			stack = []
			puts
		end
		count = count + 1
	end
end

array_print [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
