class GrepMatch
	attr_accessor :line_number, :line

	def initialize(line_number, line)
		@line_number = line_number
		@line = line
	end

	def to_s
		"#{line_number}: \"#{line}\""
	end
end

def grep(path, text)
	line_num = 0
	regex = Regexp.new text
	matches = []

	File.open(path, 'r') do |file|
		file.readlines.each do |line|
			line_num = line_num + 1

			if regex.match(line)
				matches.push(GrepMatch.new(line_num,line))
			end
		end
	end

	return matches
end

puts grep('lipsum.txt', 'Lorem ipsum dolor sit amet')
puts
puts grep('lipsum.txt', 'Nullam bibendum')
