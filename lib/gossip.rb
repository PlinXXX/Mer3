class Gossip
	
	attr_reader :author, :content

	def initialize(author, content)
		@author = author
		@content = content
	end


	def save
		h = {@author => @content}
    CSV.open("db/gossip.csv", "a+") { |csv| h.to_a.each { |name| csv << name } }
	end


	def destroy
		h = {@author => @content}
    CSV.open("db/gossip.csv", "w+") { |csv| h.to_a.each { |name| csv << name } }
	end


	def self.all
		all_gossips = [] # création d'une array vide qui s'appelle all_gossips
		potins_csv = CSV.open("db/gossip.csv", "r") 
		potins_csv.each do |line| # chaque ligne de ton CSV.each do |ligne|
			line.each do |k| 
				@author = line[0]
				@content = line[1]
			end
			gossip_provisoire = Gossip.new(@author , @content) # permet de créer un objet gossip
			all_gossips << gossip_provisoire # permet de rajouter cet objet au array
		end
		return all_gossips # on renvoie le résultat
	end

end
