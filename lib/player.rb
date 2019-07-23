class Player
  attr_accessor :name,:lifepoints

  def initialize(new_player_name)
  @name = new_player_name
  @lifepoints = 10
  end

  def show_state
    puts "#{@name} a #{@lifepoints} points de vie"
  end

  def gets_damage(damage_taken)
    @lifepoints = @lifepoints - damage_taken
    if @lifepoints <= 0
      puts "Le joueur #{@name} a été tué"
    end
  end

  def attacks(player)
    puts "#{@name} attaque #{player.name}"
    damage_dealt = compute_damage
    puts "#{@name} inflige #{damage_dealt} points de dégats à #{player.name}"
    player.gets_damage(damage_dealt)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(new_human_name)
  @name = new_human_name
  @lifepoints = 100
  @weapon_level = 1
  end

  def show_state
    puts "Tu as #{@lifepoints} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    search_result = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{search_result}"
    if search_result > @weapon_level
      @weapon_level = search_result
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle... : tu la jettes"
    end
  end

  def search_health_pack
    search_result = rand(1..6)
    if search_result == 1
      puts "Pas de chance, tu n'as rien trouvé"
      puts "Tu restes à #{@lifepoints} points de vie"
    elsif search_result >= 2 && search_result <= 5
      puts "Tu as trouvé un pack de 50 points de vie"
      @lifepoints = @lifepoints + 50
      if @lifepoints > 100
        @lifepoints = 100
      end
      puts "Tu as maintenant #{@lifepoints} points de vie"
    elsif search_result == 6
      puts "Tu as trouvé un pack de 80 points de vie"
      @lifepoints = @lifepoints + 80
      if @lifepoints > 100
        @lifepoints = 100
      end
      puts "Tu as maintenant #{@lifepoints} points de vie"
    end
  end

end
