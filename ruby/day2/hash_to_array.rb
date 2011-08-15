def hash_to_array(hash = {})
	hash.select {|k,v| [k,v]}
end

array = hash_to_array({ 1 => 'one', 2 => 'two', 3 => 'three' })
puts array[0]

puts

array = hash_to_array({ 'a' => 'aardvark', 'b' => 'brick', 'c' => 'clot', 'd' => 'dirigible' })
puts array[3]
