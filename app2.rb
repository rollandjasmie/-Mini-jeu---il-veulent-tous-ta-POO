require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "------------------------------------------------
	|Bienvenue sur 'JUMANJI' !      |
	|Le but du jeu est de sauver jumanji!|
	-------------------------------------------------"
 
# Initialisation de joueur
puts "Quelle est votre nom?"
   unom = gets.chomp
   user = HumanPlayer.new("#{unom}")
#Initialisation des ennemis
   player1 = Player.new("Josiane")
   player2 = Player.new("José")
   ennemies = []
   ennemies << player1
   ennemies << player2
# Le combat
while (user.life_points >0 && (player1.life_points > 0 || player2.life_points >0))
		puts "Voici l'état de #{unom}"	 
		puts "#{user.show_state}"
		puts "Quelle action veux-tu effectuer ?"
		puts "a - chercher une meilleur arme"
		puts "s - cherer à se soigner"

	    puts "Attaquer un jouer en vie :"
		puts "0 -#{player1.nom} #{player1.show_state}"
		puts "1 - #{player2.nom} #{player2.show_state}"

	         ut = gets.chomp
        if ut == "a"
	         user.search_weapon
	        elsif ut == "s"
	            user.search_health_pack
	        elsif ut == "0"
	        	user.attacks(player1)
	        elsif ut == "1"
	        	user.attacks(player2)         
	        else
        	puts "Choix invalide"	
        end
	   

	    break if ennemies.all? {|ennemies| ennemies.life_points <= 0}

	           puts "Les autres joueurs attaquent"    
        ennemies.each do |ennemies|
   	     ennemies.attacks(user) if ennemies.life_points > 0 && ennemies.life_points > 0
        end 
end
		puts ""
		puts ""
puts " C'EST LA FIN DE NOTRE PATRIE " 
	   if user.life_points >0
	 		puts "BRAVO! TU AS GAGNE 
	 		TU AS SAUVE JUMANJI DE LA  MALEDICTION!"
	   else user.life_points <= 0
	   		puts "Loser! Tu as perdu!"
	   end