require_relative 'Person.rb'
require_relative 'Dog.rb'
require_relative 'Zombie.rb'


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
armas << Gun.new("manopla",3,8)

puts personas.count
puts zombies.count
puts perros.count
puts armas.count


while personas.count > 0 && zombies.count > 0
 
  zombies.each(&:walk)
  personas.each(&:run!)
  perros.each(&:move)
  personas.each do |p|
    p.addArms armas
    p.danger? zombies
    p.useArms zombies
    if p.zombified? zombies
      muerto = personas.delete(p)
      zombies << Zombie.new("Zombie #{muerto.name}")
    end
    perros.each do |z|
      zombies = z.mata zombies
    end
  end
end

# cn = "p 1".split(' ')
# cn [0] = z 
#cn.join('')

puts "-----------------------------------------------"
puts "la cantidad de sobrevivientes #{personas.count}"
puts "-----------------------------------------------"
puts "los zombies que aun viven son #{zombies.count}"
puts "-----------------------------------------------"
puts "todos los perros se van al cielo #{perros.count}"
puts "-----------------------------------------------"
puts "armas  que quedaron tiradas #{armas.count}"
puts "-----------------------------------------------"
puts "-----------------------------------------------"
