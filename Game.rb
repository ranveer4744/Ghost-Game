require "byebug"
require_relative "Player.rb"
require "set"

class Game

    def initialize(*players)
        @players = players.map {|player| Player.new(player)}
        @fragment = ""
        @words = File.readlines("words.txt").map(&:chomp).to_set # Turns the "words.txt" file into a set for easy lookup.
        @hash = Hash.new(0)
        @players.each {|player| @hash[player] = 0}
    end

    # ----------- Main game method -----------

    def run
        done = false
        while !done
            system("clear")
            score_board
            puts "\nCurrent Word: #{@fragment}"
            @players.each do |player|
                if player.strikes == "GHOST"
                    @players.delete(player) 
                    puts "#{player.name} was eliminated!"
                end
            end
            if @players.length == 1
                puts "#{current_player.name} wins!"
                break
            end
            play_round
        end
    end

    # ----------- Method used to play 1 round -----------
    def play_round
        take_turn
        puts "Current word: #{@fragment}"
        if losses(current_player) == true
            record(current_player)
            score_board
        end
        next_player!
    end

    # ----------- Helper methods for the play_round method -----------

    def current_player
        @players.first
    end

    def previous_player
        @players.last
    end

    def next_player!
        @players.rotate!
    end

    def valid_play?(char)
        return true if char =~ /[a-zA-Z]/ && @words.any? {|word| word.start_with?(@fragment + char)} == true && char.length == 1 # Checks if a char is an alphabet, other words can be made if its added to the fragment and has a length of 1.
        false
    end

    def take_turn
        char = current_player.guess
        while valid_play?(char) == false
            char = current_player.alert_invalid_guess
        end
        @fragment += char
    end

    def score_board
        puts "----- SCOREBOARD -----"
        @players.each {|player| puts "#{player.name}: #{player.strikes}"}
    end

    def losses(player) # Check if a player lost
        if @words.include?(@fragment)
            @fragment = ""
            @hash[player] += 1
            return true
        end
    end

    def record(player)
        str = "GHOST"
        losses = @hash[player]
        if losses > 0
            player.strikes += str[losses - 1]
        else
            return ""
        end
    end
end

if $PROGRAM_NAME == __FILE__
  game = Game.new(
      "Jon", 
      "Maria",
    )
  game.run
end