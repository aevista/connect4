require 'spec_helper'

describe Board do

    before(:each){@board = Board.new}

    context "#initialize" do
        
        it "fills 8 x 8 board with '-' characters" do
            expect(@board.board).to eq Array.new(8) {Array.new(8, '-')}
        end
    end

    context "#place_piece" do
          it "places a piece in the first column!" do
            @board.place_piece?(0, 'x')

            test_board = Array.new(8) { Array.new(8, '-')}
            test_board[0][0] = 'x'
            
            expect(@board.board).to eq test_board           
        end
        it "places a piece and they stack on top" do
            @board.place_piece?(0, 'x')
            @board.place_piece?(0, 'o')

            test_board = Array.new(8) { Array.new(8, '-')}
            test_board[0][0] = 'x'
            test_board[1][0] = 'o'
            expect(@board.board).to eq test_board
        end
    end

    context "#win?" do

         it "should win when 4 pieces are connected in a row" do

            for n in 0..3
                @board.place_piece?(n, 'o')
            end

            expect(@board.win?).to eq true
        end

        it "should win when 4 pieces are connected in a column" do
            for n in 0..3
                @board.place_piece?(0, 'x')
            end

          
            expect(@board.win?).to eq true

        end

        it "should not win with no consecutive pieces" do
            @board.place_piece?(0, 'o')
            @board.place_piece?(1, 'o')
            @board.place_piece?(2, 'o')
                 
            expect(@board.win?).to eq false
        end

        it "should win when 4 pieces are consecutively diagonal" do
            @board.place_piece?(0, 'o')
            @board.place_piece?(1, 'x')
            @board.place_piece?(2, 'x')
            @board.place_piece?(1, 'o')

            @board.place_piece?(2, 'x')
            @board.place_piece?(2, 'o')

            @board.place_piece?(3, 'x')
            @board.place_piece?(3, 'x')
            @board.place_piece?(3, 'x')
            @board.place_piece?(3, 'o')

            expect(@board.win?).to eq true
        end
    end

    context "#full_board?" do
        it "should return false when '-' character in matrix" do
            for n in 0...7
                @board.place_piece?(n, 'x')
            end
            expect(@board.full_board?).to eq false
        end

        it "should return true when no '-' character  in matrix" do
            board = Array.new(8) {Array.new(8, 'o')}
            expect(@board.full_board?).to eq true 
        end
    end
end