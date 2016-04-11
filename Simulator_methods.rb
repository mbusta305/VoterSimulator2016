module SimulatorMethods

	def start
		puts "Welcome to the Voter Simulator 2016"
		puts `say -v Zarvox Welcome to the Voter Simulator 2016`
		process = 0
		until process == 1
			puts "Please enter what you would like to do? (C)reate, (L)ist, (U)pdate, or (D)elete"
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
			puts "What would you like to create? (P)olitician or (V)oter."
			puts `say -v Zarvox What would you like to create?.`
			create_answer = gets.chomp

			if create_answer.downcase == 'p'
				puts "Enter a Name for the Politician?"
				puts `say -v Zarvox enter a name for the Politician`
				name = gets.chomp.capitalize
				puts "Party Affiliation? Democrat or Republican."
				puts `say -v Zarvox Democrat or Republican`
				political_party = gets.chomp.capitalize

				mike = Politician.new(name, political_party)

			elsif create_answer.downcase == 'v'
				puts "Enter a Name for the Voter?"
				puts `say -v Zarvox Enter a name for the voter`
				name = gets.chomp.capitalize
				puts "Political views? Liberal, Conservative, Tea Party, Socialist or Neutral"
				puts `say -v Zarvox Enter your Political view`
				political_views = gets.chomp.capitalize

				zach = Voter.new(name, political_views)

			else
				puts "You didn't enter 'Politician' or 'Person.'"
				puts `say -v Zarvox You did not enter 'Politician' or 'Person.`
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
			puts `say -v Zarvox What is your name`
			old_name = gets.chomp.capitalize
			puts "What would you like to update? Enter (N)ame, *Voters Only* (P)olitical Views , or *Politicians Only* Party (A)ffiliation"
			puts `say -v Zarvox What would you like to update?`
			update_info = gets.chomp.capitalize
			if update_info ==  "N"
				puts "What is the new name?"
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
				puts `say -v Zarvox What would you like your new political views to be?`
				new_politics = gets.chomp
				Voter.all.each do |voter|
					if old_name == voter.name
						voter.political_views = new_politics
					end
				end

			elsif update_info == "A"
				puts "What would you like your new party to be?"
				puts `say -v Zarvox What would you like your new party to be?`
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
			puts `say -v Zarvox Would you like to delete a Voter or Politician?`
			delete_option = gets.chomp.capitalize

			if delete_option ==  "V"
				puts "What is the name of the Voter you would like to delete?"
				puts `say -v Zarvox What is the name of the Voter you would like to delete?`
				deleted_voter = gets.chomp.capitalize

				Voter.all.reject do |voter|
					if deleted_voter == voter.name
						voter.name = deleted_voter
					end
				end
				
			elsif delete_option == "p"
				puts "What is the name of the Politician you would like to delete?"
				puts `say -v Zarvox What is the name of the Politician you would like to delete?`
				deleted_poli = gets.chomp.capitalize

				Politician.all.reject do |poli|
					if deleted_poli == poli.name
						poli.name = deleted_poli
					end
				end

			end
		end
	end
