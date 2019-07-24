require 'pry'


class Player
	attr_accessor :nom, :life_points

		def initialize(nom)
			@nom = nom
			@life_points = 10
		end

		def show_state
			puts "#{@nom} a #{@life_points} de vie "
		end
		
		def gets_damage(damage)
			@life_points = @life_points - damage

	      if @life_points <= 0
	      	puts "le jouer #{@nom} a été tué"
	      end
		end
		
		def attacks(player2)
	 		puts "le jouer #{nom} attaque le jouer #{player2.nom}"
			t = compte_damage
			puts "il lui inflige #{t} points de dommages"
	        player2.gets_damage (t)
		end
		
		def compte_damage
			return rand(1..6)
		end
end
class HumanPlayer < Player
	attr_accessor :weapon_level
	def initialize (nom)
		 @nom = nom
	     @life_points = 100
	     @weapon_level = 1
	end
    
    def show_state
			puts "#{@nom} a #{@life_points} de vie et une arme de niveau #{@weapon_level}"
		end
	def compute_damage
		rand(1..6)* @weapon_level
	end
	
	def search_weapon
		nouvelle_arme = rand(1..6)
		puts "Tu as trouvé une armé de niveau #{nouvelle_arme}"
      if nouvelle_arme > @weapon_level
      	@weapon_level = nouvelle_arme
      	puts "Youhou! ellle est meuilleur que ton arme actuelle : tu la prends."
      else
      	puts "Mà*#...elle n'est pas mieux que ton arme actuelle"
      end

	end

	def search_health_pack
      t = rand(1..6)
  		if t == 1
  			return "Tu n'as rien trouvé..."
  		elsif t >= 2 && t <= 5
  			@life_points += 50
  			return "Bravo, tu as trouvé un pack de +50 points de vie !"
  		else 
  			@life_points += 80
  			return "Waow, tu sa trouvé un pack de +80 points de vie !"
  		end
		if @life_points > 100
            @life_points = 100
        end

	end









end












 