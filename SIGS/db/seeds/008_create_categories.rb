# Categories
puts "Creating Categories"
category = Category.find_or_create_by(name: 'Laboratório Químico')
category_2 = Category.find_or_create_by(name: 'Retroprojetor')