class Board 
    attr_reader :board
    def initialize 
        @board = initialize_board
    end
    
    def win?
        check_row(@board) || check_column(@board) || check_diagonal(@board)
    end

    def full_board?
        @board.each{|row| return false if row.include?('-')}
        return true
    end

    def place_piece?(column, piece)
        n =0
        loop do
            break if n == @board.length or @board[n][column].include?("-") 
            n+=1
        end 
        return false if n == @board.length 
        @board[n][column] = piece
        return true
    end

    def display_board
        @board.reverse.each{|row| puts row.join(" | ")}
        @board.each_with_index{|row, n| print " #{n}  "}
    end

    private 

    def initialize_board
        Array.new(8) { Array.new(8, '-') }
    end


    def check_row board
        board.each do |row|
            a = Array.new
            row.each_cons(4){ |set| a << set if !set.include?('-')}
            a.each{|subset| return true if subset.all?{|element| element == subset.first}}
        end
        return false
    end

    def check_column board
        return check_row board.transpose
    end
    
    def check_diagonal board
        left_diag = Array.new
        right_diag = Array.new       
        
        board.each_with_index do |row, n| 
            left_diag << row.rotate(n)
            right_diag << row.rotate(-n)
        end

        return check_column(left_diag) || check_column(right_diag)
    end
end