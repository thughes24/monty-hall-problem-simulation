def run_experiment(params = {swap: false, attempts: 5000})
	win = 0	
	params[:attempts].times do |i|

		doors = [1,0,0].shuffle! # creates an array to simulate the doors, 1 representing the million, 0 representing a goat.
		selection = rand(0..2) # selects a door at random, based on the index of the doors array
		million_dollar_door = doors.index(1) # assigns the million dollar doors index to a variable
		
		# we open a door at random, that can't be the winning door OR our selected door
		
		begin 
			door_shown = rand(0..2)
		end while (door_shown == selection || door_shown == million_dollar_door)

		## if we swap our selection, it can't be the door shown, nor our old selection.

		if params[:swap] == true
			old_selection = selection
			begin 
				selection = rand(0..2)
			end while (selection == door_shown || selection == old_selection)
		end

		# if our selection is the winning door, we increase the win variable by one.

		win += 1 if doors[selection] == 1 # 
	end	

	# returns the winning percentage
	
	return ((win.to_f/params[:attempts])*100).round(2)
end

run_experiment({swap: false, attempts: 10000}) # results in a win % of around 33%

run_experiment({swap: true, attempts: 10000})	# results in a win % of around 66%

