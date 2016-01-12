class Player
  class NameNotValid < StandardError
  end
  attr_accessor :name, :life, :score, :answer, :correct

  def initialize(name)
    if name == ""
      raise NameNotValid
    end
    @name = name
    @life = 3
    @score = 0
    @answer = 0
    @correct = false
  end


  def lose_life
    self.life -= 1
  end


  def gain_score
    self.score += 1
  end

  def life_reset
    self.life = 3
  end
end

