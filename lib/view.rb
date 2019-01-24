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


	def index_gossips
		potin_csv = CSV.open("db/gossip.csv", "r") 
		puts "Voici la liste des potins répertoriés:"
    potin_csv.each do |line| 
    	print line
    	puts
    end
    puts
	end


	def index_gossips(gossips)
		gossips.each { |potin| puts potin }
	end
	
end
