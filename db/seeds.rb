# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 0,
  price: 2_483.75
})

## USERS

puts "Creating Users ..."

user1 = User.create({
  first_name: 'Bob',
  last_name: 'Smith',
  email: 'bob@gmail.com',
  password_digest: BCrypt::Password.create('easy')
  })

user2 = User.create({
  first_name: 'Mary',
  last_name: 'Smith',
  email: 'mary@gmail.com',
  password_digest: BCrypt::Password.create('easy')
  })

user3 = User.create({
  first_name: 'Sally',
  last_name: 'Smith',
  email: 'sally@gmail.com',
  password_digest: BCrypt::Password.create('easy')
  })

## REVIEWS

puts "Creating Reviews ..."

pf1 = Product.find(1)
pf2 = Product.find(2)
pf3 = Product.find(3)
pf4 = Product.find(4)
pf5 = Product.find(5)
pf6 = Product.find(6)
pf7 = Product.find(7)

pf1.reviews.create({
  product_id: pf1,
  user_id: user1.id,
  description: 'Classy!',
  rating: 4

  })

pf2.reviews.create({
  product_id: pf2,
  user_id: user2.id,
  description: 'A little long.',
  rating: 3

  })

pf3.reviews.create({
  product_id: pf3,
  user_id: user1.id,
  description: 'Fits great.',
  rating: 4

  })

pf4.reviews.create({
  product_id: pf4,
  user_id: user2.id,
  description: 'Comfy.',
  rating: 5

  })

pf5.reviews.create({
  product_id: pf5,
  user_id: user1.id,
  description: "don't tell anyone I'm a spy." ,
  rating: 4

  })

pf6.reviews.create({
  product_id: pf6,
  user_id: user3.id,
  description: 'weird ...',
  rating: 2

  })

pf7.reviews.create({
  product_id: pf7,
  user_id: user1.id,
  description: 'Soooooo FUN!',
  rating: 5

  })

pf3.reviews.create({
  product_id: pf3,
  user_id: user2.id,
  description: 'Too Big.',
  rating: 1

  })

pf7.reviews.create({
  product_id: pf7,
  user_id: user3.id,
  description: 'Broke my leg :(. ',
  rating: 2

  })







puts "DONE!"
