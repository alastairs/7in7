play_again_responses = { "y" => true, "Y" => true, "n" => false, "N" => false }
play_again = true

until !play_again
	rand = rand(10) + 1
	puts "Pick a number between 1 and 10"
	guess = gets.to_i

	until guess == rand
		if guess < rand
			puts "You guessed too low!  Try again"
		end
	
		if guess > rand
			puts "You guessed too high!  Try again"
		end
	
		guess = gets.to_i
	end
	puts "You guessed correctly!  Play again (y/n)?"
	play_again = play_again_responses[gets.strip]
end
