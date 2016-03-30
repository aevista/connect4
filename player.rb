class Player 
    attr_reader :name, :mark
    def initialize player
        @name = player[:name]
        @mark  = player[:mark].encode('utf-8')
    end
end