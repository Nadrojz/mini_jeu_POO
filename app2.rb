require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"


puts "Quel est ton pseudo ?"
print">"
nickname = gets.chomp
puts "Bienvenue #{nickname} !"
user = HumanPlayer.new(nickname)
ennemies = [player1 = Player.new("Josiane"),player2 = Player.new("José")]

while user.lifepoints > 0 && (player1.lifepoints > 0 || player2.lifepoints > 0)
  puts "====================================================="
  user.show_state
  puts "====================================================="
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts ""
  puts "Ou"
  puts ""
  puts "Attaquer un joueur en vue"
  puts "0 - Josiane a #{player1.lifepoints} points de vie"
  puts "1 - José a #{player2.lifepoints} points de vie"
  print ">"
  user_input = gets.chomp
  case user_input
  when user_input = "a"
    user.search_weapon
  when user_input = "s"
    user.search_health_pack
  when user_input = "0"
    user.attacks(player1)
  when user_input = "1"
    user.attacks(player2)
  end
  ennemies.each { |player|
    if player.lifepoints > 0
      puts "Les autres joueurs t'attaquent !"
      player.attacks(user)
    end
   }
end

puts "Bravo #{nickname} tu as vaincu tous tes ennemies !"
