
#My Voter Worl
# My Voter World
#comment

class VoterSim
	attr_accessor :id, :name, :political_views, :political_party

	@@person_id = 0
	@@politician_id = 0
	@@voter = []
	@@pols = []

end


class Voter < VoterSim


	def initialize(name, political_views)
		@name = name
		@political_views = political_views
		@@person_id += 1
		@@voter << self
	end

	def self.all
		@@voter
	end

end

class Politician < VoterSim

	def initialize(name, political_party)
		@name = name
		@political_party = political_party
		@@politician_id += 0
		@@pols << self
	end

	def self.all
		@@pols
	end

end
