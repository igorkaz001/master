# This is a game called Lostranaut 
class GameOne
	attr_accessor :roll_value

	def roomloss
	puts "the ship has hit the asteroid and lost structural integrity"
		puts "it blew up with you inside"
		puts "you roose"
	end

	def roomwin
		puts "you have survived this adventure"
		puts "you win the game. the G-Man cometh and taketh you away"
		puts " "
	end

	def rungame #Intro/room1
	puts "Hello, you are an astronaut stuck on unfamiliar vessel in a locked room facing a terminal near the door"
	puts "Please select option 1 to engage the terminal"
	puts ""
	input = gets.chomp
		if input == "1"
			room1
		else
			puts "you really do need to enter 1"
			rungame
		end
	end

	def random_death(r)
		roll = rand (1..10)
		puts "You rolled #{roll}"
		if roll <= r 
			@roll_value = true
		else
			@roll_value = false
		end
		puts @roll_value
	end
	def room1	
		puts "Welcome to Igorilian Flagship Vessel 'Dienpeace'. Please select a command on the display" #display commands: 1 ship general status 2. open door 3. contact security (will display error) 4. gain access to ship core functions (to be added later)
		puts "Select 1 to open the door and go to next room"
		puts "Select 2 to view ship status"
		puts "Select 3 to contact the ship security service"
		puts "Select 4 to gain access to ship core functions" 
		puts ""
		input = gets.chomp
		if input == "1"
			room2
		elsif input == "2"
			puts "ship is on a collision course with an asteroid, there is nobody at the helm"
			room1
		elsif input == "3"
			puts "security officers have been dispatched to your location"
			puts " "
			room1
		elsif input == "4"
			puts "n/a"
			room1
		else 
			puts "please make a valid entry"
			room1
		end
	end

	def room2 #the hallway/junction
		puts "you have entered a hallway and are at a junction"
		puts "you may head toward the bridge to attempt to gain control of the ship"
		puts "^ press 1 "
		puts "or you may head toward escape pods and attempt to get off the ship"
		puts "^ press 2 "
		puts "make your choice wisely because the ship may blow at any moment"
		puts ""
		input = gets.chomp
		
		if input == 1.to_s 
			random_death(7) #rolls for chance of sudden death. if sudden death is avoided then go to room 3
		end

		if roll_value == true
			room3
		else
			roomloss
		end
		
		if input == 2.to_s
			random_death(3)
			room5
		end
	end


	def room3 #the bridge
		puts "you have made it to the bridge."
		puts "tactical systems are down"
		puts "helm is still online"
		puts "press 1 to attempt to pilot the ship and avoid the asteroid"
		puts "press 2 to let the ship blow, and head for the escape pods"
		puts ""
		input = gets.chomp
		if input == 1.to_s
			#random_death(3) #parameter implies the percentage of win or loss
	 		room5   
	 	elsif input == 2.to_s
	 		puts "you have no idea how to fly this thing."
	 		puts ""
	 		roomloss
		else
			puts "please make valid entry"
			puts ""
		end
	end


	def room5 #escape pods
	puts "this room is under construction"
	puts "do you want to live?"
	puts "press 1 for a chance to get off the ship"
	input = gets.chomp
		if input == 1.to_s
			random_death(8)
			if roll_value == false
				roomwin
			else 
				roomloss
			end
		else
			roomloss
		end


	end
end

# name_of_object = GameOne.new
game = GameOne.new
game.rungame



=begin	this was my old roll method
def random_death
roll = rand(1..10)
	if roll <= r
		puts "You rolled #{roll}"
		puts "you lose"
		roomloss
	else
		roomwin
	end
end
=end
