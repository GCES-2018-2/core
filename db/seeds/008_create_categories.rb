# Categories
puts "\t - Adding actual categories of rooms"

@categories_rooms_data = [ 'Laboratorio Químico', 'Retroprojetor', 'Computadores','Quadro Negro', 'Bancadas', 'Carteiras', 'Ar Condicionado']


for data in @categories_rooms_data do
  Category.find_or_create_by(name: data)
end
