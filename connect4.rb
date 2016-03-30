require_relative 'board'
require_relative 'player'

class Connect4
    def initialize players
        @player1 = Player.new({:name =>players.first, :mark =>"\u2689"})
        @player2 = Player.new({:name =>players.last, :mark => "\u2687"})
        @turn = (rand(2).zero? ? @player1 : @player2)
        @board = Board.new
    end

    def play_game
        loop do
            printf "\n\n"
            @board.display_board
            printf "\n\n"
            loop do 
                column = get_column
                break if @board.place_piece?(column, @turn.mark)
                printf "\n--column is full--\n"
            end
            break if @board.win? or @board.full_board?
            @turn = (@turn == @player1 ? @player2 : @player1)
        end

        printf "\n\n"
        @board.display_board
        printf "\n\n"

        puts (@board.win? ? "#{@turn.name} wins" : "no winner")

    end

    private

    def get_column
        input = -1
        loop do
            puts "#{@turn.name}#{@turn.mark} choose column to place piece(0, #{@board.board.first.length - 1})"
            input = gets.chomp
            break if input =~/[0-#{@board.board.first.length-1}]/ and input.length == 1
            puts "invalid entry"
        end
        input.to_i
    end
end