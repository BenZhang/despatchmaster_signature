require "despatchmaster_signature/version"
require "rvg/rvg"
include Magick

module DespatchmasterSignature

	class Drawer
  	attr_reader :length
  	attr_reader :values

		def initialize(data, width = 153, height = 55)
			@width  = width
			@height = height
			if data.is_a? String
				@values = parse(data)
			elsif data.is_a? Array
				@values = data
				@length = data.length
			end
		end

		def draw(path)
			rvg = RVG.new(@width, @height) do |canvas|
				canvas.background_fill = 'white'
				(0...@length).each do |i|
					# if the pen left or is about to left, then stop 
					if (@values[i][0] == -1 or @values[i][1] == -1) or (i + 1 < @length and (@values[i+1][0] == -1 or @values[i+1][1] == -1))
						next
					else
						canvas.line @values[i][0], @values[i][1], @values[i+1][0], @values[i+1][1]
					end
				end
			end
			rvg.draw.write(path)
		end

		private

		def parse(str)
			str =~ /(\d+);{(.*)}/
			@length = $1.to_i
			@values = $2.split(';').collect{|v| v.split(',').collect{|vc| vc.to_i } }
		end
	end
end
