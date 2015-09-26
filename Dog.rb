
class Dog
  attr_accessor :name, :x, :y #accesador y mutador para nombre y cordenadas de la persona

  def initialize(name = nil, posx = nil, posy = nil )  #iniciacion nula en caso de que no alla dato
    @name = name || 'Dog'
    @x = posx || Random.rand(5)
    @y = posy || Random.rand(5)
  end

  def move                       #funcion que permite correr a
    @x += Random.rand(-3..3)
    @y += Random.rand(-3..3)
  end

  def mata (zombies)
  zombies.each do |zombie|
      if zombie.x.between?((@x - 1), (@x + 1)) && zombie.y.between?((@y - 1), (@y + 1))
        puts "El perro a matado a #{zombie.name}!!!!"
        zombies.delete(zombie)
      end
    end
  end
end

class Gun
  attr_accessor :name, :x, :y
  def initialize(name = nil, posx = nil, posy = nil)  #iniciacion nula en caso de que no alla dato
    @name = name  
    @x = posx 
    @y = posy 
  end


end


