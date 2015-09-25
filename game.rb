require_relative 'Person.rb'
require_relative 'Zombie.rb'
require_relative 'Dog.rb'

personas = []
zombies = []
perros = []
armas = []

  10.times do |n|
    personas << Person.new("Persona #{n}")
  end

  5.times do |n|
    zombies << Zombie.new("Mai #{n}")
  end
  
  2.times do  |x|
    perros << Dog.new("Charly #{x}")
  end

armas << Gun.new("pistola",3,4)
armas << Gun.new("navaja",6,6)

puts personas.count
puts zombies.count
puts perros.count
puts armas.count


while personas.count > 0
  zombies.each(&:walk)
  personas.each(&:run!)
  perros.each(&:move)
  personas.each do |p|
    p.danger? zombies
    if p.zombified? zombies
      muerto = personas.delete(p)
      zombies << Zombie.new(" #{muerto.name} 666")
    end
    perros.each do |z|
      zombies = z.mata zombies
    end
  end
end

# cn = "p 1".split(' ')
# cn [0] = z 
#cn.join('')


puts "la cantidad de sobrevivientes #{personas.count}"
puts zombies.count
puts perros.count