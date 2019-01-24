require_relative 'gossip'
require_relative 'view'

require 'csv'

class Controller

	def initialize
		@view = View.new
	end


	def create_gossip
		#gossip = Gossip.new("Jean-Michel Concierge", "Féfé est de Bordeaux") #pour le moment, le contenu du gossip est en dur dans le code. L'utilisateur ne peut pas le changer.
		#gossip.save
		params = @view.create_gossip
		params.each do |k , v| 
			@author = k
			@content = v
		end
		
		gossip = Gossip.new(@author , @content)
		gossip.save
		puts "gossip saved!"
		return gossip
	end


	def index_gossips
		gossips = Gossip.all
		@view.index_gossips(gossips)
	end


	def destroy

		puts "Quel potin veux-tu supprimer ? (1, 2, 3, ...)"
		print "> "
		choice = gets.chomp.to_i

		gossips = Gossip.all

		gossips.delete_at(choice-1)
		#gossips.each { |gossip| puts gossip.inspect } 
		i = 0
		gossips.each { |gossip| 
			gossip.destroy if i == 0
			gossip.save if i != 0 
			i += 1
		}

		puts "potin #{choice} supprimé !"

	end #destroy

end

