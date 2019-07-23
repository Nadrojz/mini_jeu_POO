require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts ""
puts ""
puts "   .。o○o。.★.。o○o。.☆.。o○o。.★.。o○o。.☆   "
puts "¤¸¸.•´¯`•¸¸.•..>> Début du jeu <<..•.¸¸•´¯`•.¸¸¤"
puts "   .。o○o。.★.。o○o。.☆.。o○o。.★.。o○o。.☆   \n"
puts""
puts""
puts "Quel est ton pseudo ?"
print">"
nickname = gets.chomp
puts "Bienvenue #{nickname} !"
my_game = Game.new(nickname)
i = 0
while my_game.is_still_ongoing? == true
  puts "====================================================="
  my_game.show_state
  puts "====================================================="
  puts "★━━━━━━━━━━━━━━━━━━━━★"
  puts "Début du tour #{i}"
  puts "★━━━━━━━━━━━━━━━━━━━━★"
  my_game.menu
  my_game.menu_choice
  my_game.enemies_attack
  i +=1
end

my_game.end
puts ""
puts ""
puts "   .。o○o。.★.。o○o。.☆.。o○o。.★.。o○o。.☆   "
puts "¤¸¸.•´¯`•¸¸.•..>> Fin du jeu <<..•.¸¸•´¯`•.¸¸¤"
puts "   .。o○o。.★.。o○o。.☆.。o○o。.★.。o○o。.☆   \n"
