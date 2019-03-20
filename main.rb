require './questions'
$questions = @questions 
class Player 
	attr_accessor :wins, :name
	def initialize  (name)  
       @name = name
	   @wins = 0
	end 
end

class Game 
    def initialize  (p1, p2)  
        @player1 = p1
	    @player2 = p2
    end 

	def turn 
		counter = 0
		while @player1.wins != 3 || @player2.wins != 3
			player = ''                     
		    if counter % 2 == 0
			    player = @player1
		    else 
			    player = @player2
            end
        
		    random = rand(9)                               #calling a random integer
		    p "It is  #{player.name}'s turn!"
		    puts $questions[random][:question]
		    input = gets.chomp
	
		    if input != $questions[random][:answer].to_s  #converting integer to string to be compared to user input
			    puts 'goodjob you suck'
			    counter += 1
		    else 
		        player.wins += 1
                counter += 1
                puts "#{player.name} is a genius!"	
		    end
        
            if @player1.wins == 3 || @player2.wins == 3 
			    puts " #{player.name} is the champion!"
			break  
            end
		end
    end
end

player1 = Player.new 'player 1'
player2 = Player.new 'player 2'
 game = Game.new player1, player2
game.turn

