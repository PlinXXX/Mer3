class View

	def create_gossip
		puts "Entrez le nom de l'auteur"
		print "> "
		@author = gets.chomp.to_s

		puts "Entrez le contenu"
		print "> "
		@content = gets.chomp.to_s

		return params = { @author => @content }
	end


	def index_gossips(gossips)
		i = 1
		gossips.each { |potin| 
			puts "potin#{i} : #{potin.author}, #{potin.content}" 
			i += 1
		}
	end
	
end
