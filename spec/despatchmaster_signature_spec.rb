require 'spec_helper'

describe DespatchmasterSignature do
	before do
		
	end

	describe '.new' do
		it 'should be able to parse String' do
			des = DespatchmasterSignature::Drawer.new "7;{16,20;15,23;11,31;10,33;10,24;11,29;13,31;-1,-1}"
			des.length.should == 7
			des.values.should == [[16, 20], [15, 23], [11, 31], [10, 33], [10, 24], [11, 29], [13, 31], [-1, -1]]
		end
		
		it 'should be able to read array' do
			des = DespatchmasterSignature::Drawer.new [[1,1], [2,2], [3,3]]
			des.length.should == 3
		end
	end

	describe '#draw' do
		des = DespatchmasterSignature::Drawer.new "11;{16,20;15,23;13,25;11,31;10,33;10,24;11,29;13,31;-1,-1;80,9;81,7;82,6;80,10;76,19;71,26;67,34;63,38;60,42;60,42;-1,-1}"
		des.draw('duck.png')
	end

end