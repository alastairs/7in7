def array_print(a)
	a.each_slice(4) do |item| 
		puts item
		puts
	end
end

array_print [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
