require 'pry'
require_relative './player'

class Game
  attr_accessor :human_player, :player

  def initialize(playername)
     @human_player = HumanPlayer.new("#{playername}")
     @enemies = [player1 = Player.new("Josiane"), player2 = Player.new("José"), player3 = Player.new("Jean"), player4 = Player.new("Julie")]
  end

  def kill_player(enemy)
      @enemies.delete(enemy)
  end

  def is_still_ongoing?
    if @human_player.lifepoints > 0 && @enemies.length > 0
      return true
    else
      false
    end
  end

  def show_state
    @human_player.show_state
    puts "Il reste #{@enemies.length} ennemis"
  end

  def number_of_enemies
    @enemies.length
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""
    puts "Ou"
    puts ""
    puts "Attaquer un joueur en vue"
    @i = 0
    @enemies.each do
      puts "#{@i} - #{@enemies[@i].name} a #{@enemies[@i].lifepoints} points de vie"
      @i +=1
      end
      return @i
    # puts "0 - #{@enemies[0].name} a #{@enemies[0].lifepoints} points de vie"
    # puts "1 - #{@enemies[1].name} a #{@enemies[1].lifepoints} points de vie"
    # puts "2 - #{@enemies[2].name} a #{@enemies[2].lifepoints} points de vie"
    # puts "3 - #{@enemies[3].name} a #{@enemies[3].lifepoints} points de vie"
  end

  def menu_choice
    print ">"
    user_input = gets.chomp
    case user_input
    when user_input = "a"
      @human_player.search_weapon
    when user_input = "s"
      @human_player.search_health_pack
    when user_input = "0"
      @human_player.attacks(@enemies[0])
    when user_input = "1"
      @human_player.attacks(@enemies[1])
    when user_input = "2"
      @human_player.attacks(@enemies[2])
    when user_input = "3"
      @human_player.attacks(@enemies[3])
    end
    @enemies.each do |enemy|
      if enemy.lifepoints <= 0
        kill_player(enemy)
      end
    end
  end

  def enemies_attack
    if is_still_ongoing?
      puts "Les autres joueurs t'attaquent!!!"
      @enemies.each do |enemy|
        if enemy.lifepoints > 0
          enemy.attacks(@human_player)
        end
      end
    end
  end

  def end
    if @human_player.lifepoints > 0
      puts "Le dernier ennemi est mort !"
      puts"●·(¯¨°¹●. ｡^‿^｡ Bravo tu as gagné !! ｡^‿^｡ .●¹°¨¯)·●\n\n"
      puts "ヽ(´▽｀)ノ"
    else
      puts "Loser! Tu as perdu!"
    end
  end

end
