module SimulatorMethods
	#start
	def start
		puts "Welcome to the Voter Simulator 2016"
		puts `say -v Zarvox Welcome to the Voter Simulator 2016`
		process = 0
		until process == 1
			puts "(C)reate"
			puts "(L)ist"
			puts "(U)pdate"
			puts "(D)elete"
			`say -v Zarvox Please enter what you would like to do?`
				answer = gets.chomp

				case answer.downcase

				when 'c'
					create()
				when 'l'
					list()
				when 'u'
					update()
				when 'd'
					delete()
				else
					puts "You didn't enter a correct option, please try again."
					`say -v Zarvox Please Try again.`
				end
			end
		end


		def create
			puts "What would you like to create?"
			puts "(P)olitician"
			puts "(V)oter."
			`say -v Zarvox What would you like to create?.`
			create_answer = gets.chomp

			if create_answer.downcase == 'p'
				puts "Enter a Name for the Politician?"
				`say -v Zarvox enter a name for the Politician`
				name = gets.chomp.capitalize
				puts "Party Affiliation? Democrat or Republican."
				`say -v Zarvox Democrat or Republican`
				political_party = gets.chomp.capitalize

				mike = Politician.new(name, political_party)

			elsif create_answer.downcase == 'v'
				puts "Enter a Name for the Voter?"
				`say -v Zarvox Enter a name for the voter`
				name = gets.chomp.capitalize
				puts "Political views? Liberal, Conservative, Tea Party, Socialist or Neutral"
				`say -v Zarvox Enter your Political view`
				political_views = gets.chomp.capitalize

				zach = Voter.new(name, political_views)

			else
				puts "You didn't enter 'Politician' or 'Person.'"
				`say -v Zarvox You did not enter 'Politician' or 'Person.`
			end
		end


		def list
			puts "===================================="
			puts "List of Current Politicians & Voters:"
			puts "===================================="
			Voter.all.each do |voter|
				puts "Voter: #{voter.name}, #{voter.political_views}"
			end

			Politician.all.each do |poli|
				puts "Politician: #{poli.name}, #{poli.political_party}"
			end
			puts "===================================="
		end


		def update
			puts "What is your name?"
			`say -v Zarvox What is your name`
			old_name = gets.chomp.capitalize
			puts "What would you like to update?"
			puts "===================================="
			puts "Enter:"
			puts "===================================="
			puts "(N)ame"
			puts "(P)olitical Views *Voters Only*"
			puts "(A)ffiliation-Party *Politicians Only* "
			`say -v Zarvox What would you like to update?`
			update_info = gets.chomp.capitalize
			if update_info ==  "N"
				puts "What is the new name?"
				`say -v Zarvoc What is the new name?`
				new_name = gets.chomp.capitalize

				Voter.all.each do |voter|
					if old_name == voter.name
						voter.name = new_name
					end
				end

				Politician.all.each do |poli|
					if old_name == poli.name
						poli.name = new_name
					end
				end
			elsif update_info == "P"
				puts "What would you like your new political views to be? Enter: Liberal, Conservative, Tea Party, Socialist, Neutral or None"
				`say -v Zarvox What would you like your new political views to be?`
				new_politics = gets.chomp
				Voter.all.each do |voter|
					if old_name == voter.name
						voter.political_views = new_politics
					end
				end

			elsif update_info == "A"
				puts "What would you like your new party to be?"
				`say -v Zarvox What would you like your new party to be?`
				new_party = gets.chomp
				Politician.all.each do |poli|
					if old_name == poli.name
						poli.political_party = new_party
					end
				end
			else
				puts "You didn't enter a (N)ame, (P)olitical views , or (P)arty Affiliation."
			end
		end

		def delete
			puts "Would you like to delete a (V)oter or (P)olitician?"
			`say -v Zarvox Would you like to delete a Voter or Politician?`
			delete_option = gets.chomp.capitalize

			if delete_option ==  "V"
				puts "What is your Voter name?"
				`say -v Zarvox What is your Voter name`
				old_deleted_name = gets.chomp.capitalize
				puts "Are you sure you want to delete #{old_deleted_name}"
				puts "(Y)es or (N)o"
				deleted_name = gets.chomp.capitalize

				if deleted_name ==  "Y"
					puts "you deleted #{old_deleted_name}"
					puts "Please hit enter to return to main menu"
					`say -v Zarvox please hit enter to retrun to main menu`
					new_deleted_name = gets.chomp.capitalize


					Voter.all.delete_if { |voter| voter == voter }
				end



		elsif delete_option ==  "P"
			puts "What is your Politicians name?"
			`say -v Zarvox What is your Politicians name`
			poli_deleted_name = gets.chomp.capitalize
			puts "Are you sure you want to delete #{poli_deleted_name}"
			puts "(Y)es or (N)o"
			tic_deleted_name = gets.chomp.capitalize

			if tic_deleted_name ==  "Y"
				puts "you deleted #{poli_deleted_name}"
				puts "Please hit enter to return to main menu"
				`say -v Zarvox please hit enter to retrun to main menu`
				newly_deleted_name = gets.chomp.capitalize

				Politician.all.delete_if { |poli| poli == poli }

			end
		end
	end
end
