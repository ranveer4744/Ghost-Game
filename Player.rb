class Player
    attr_reader :name
    attr_accessor :strikes
    def initialize(name)
        @name = name
        @strikes = ""
    end

    def guess
        puts "\n#{@name}, enter a character: "
        char = gets.chomp
    end

    def alert_invalid_guess
        puts "#{@name}, please enter a legal character that can be used to make other words!"
        char = gets.chomp
    end
end