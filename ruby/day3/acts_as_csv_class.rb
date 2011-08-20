module ActsAsCsv

	class CsvRow
		def self.method_missing name, *args
			puts "CsvRow.method_missing called!"
			if (@row.has_key? name)
				@row[name]
			end
		end

		def initialize(headers = [], row = [])
			@row = {}
			if headers.size == row.size
				for i in 0..headers.size do
					if headers[i].nil? == false
						@row[headers[i]] = row[i]
					end
				end
			end
		end
		
		def self.to_s
			@row.each {|header, value| header + " => " + value}
		end
	end
	
	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods

		def read
			@csv_contents = []
			@csv_rows = []
			
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')

			file.each do |row|
				parsed_row = row.chomp.split(', ')
				@csv_contents << parsed_row
				@csv_rows << CsvRow.new(@headers, parsed_row)
			end

			@csv_rows.each {|row| puts row.to_s}
		end
		
		def each &block
			@csv_rows.each &block 
		end
		
		attr_accessor :headers, :csv_contents

		def initialize
			read
		end

	end

end

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end

csv = RubyCsv.new
puts csv.each {|row| puts row.FirstName}
