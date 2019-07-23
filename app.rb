require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  puts "   .。o○o。.★.。o○o。.☆.。o○o。.★.。o○o。.☆   "
  puts "¤¸¸.•´¯`•¸¸.•..>> Début du jeu <<..•.¸¸•´¯`•.¸¸¤"
  puts "   .。o○o。.★.。o○o。.☆.。o○o。.★.。o○o。.☆   \n"
  puts "★━━━━━━━━━━━━━━━━━━━━★"
  player1.show_state
  puts "★━━━━━━━━━━━━━━━━━━━━★\n"
  player2.show_state
  puts "★━━━━━━━━━━━━━━━━━━━━★"
  puts "Le combat commence !"

  i = 1

  while player1.lifepoints >0 && player2.lifepoints >0
    puts "★━━━━━━━━━━━━━━━━━━━━★"
    puts "Début du tour #{i}"
    puts "★━━━━━━━━━━━━━━━━━━━━★"
    if player1.lifepoints <= 0
      break
    else
      player1.attacks(player2)
    end
    if player2.lifepoints <=0
      break
    else
    player2.attacks(player1)
    end
  i +=1
  end

  puts "   .。o○o。.★.。o○o。.☆.。o○o。.★.。o○o。.☆   "
  puts "¤¸¸.•´¯`•¸¸.•..>> Fin du jeu <<..•.¸¸•´¯`•.¸¸¤"
  puts "   .。o○o。.★.。o○o。.☆.。o○o。.★.。o○o。.☆   "
