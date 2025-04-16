# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 1. Create a user
user = User.create!(
  email: "test@example.com",
  password: "password"
)

# 2. Clean the database 🗑️
puts "Cleaning database..."
Recipe.destroy_all

# 3. Create the instances 🏗️
puts "Creating recipes..."
Recipe.create!(
  [
    {
      title: "Pancakes",
      description: "Délicieux pancakes moelleux",
      image: "pancakes.jpg",
      user: user
    },
    {
      title: "Butterchicken",
      description: "Poulet mijoté avec ses épices. A servir avec du riz ",
      image: "butterchicken.jpg",
      user: user
    },
    {
      title: "Gratin dauphinois",
      description: "Pommes de terre, crème, ail et muscade. À gratiner lentement au four.",
      image: "gratin.jpg",
      user: user
    },
    {
      title: "Brownie chocolat",
      description: "Brownie rapide et efficace. Fondant à souhait",
      image: "brownie.jpg",
      user: user
    },
    {
      title: "Pancakes healthy",
      description: "Pancakes sains aux pépites de chocolat",
      image: "healthy-pancakes.jpg",
      user: user
    }
  ]
)

# 4. Display a message 🎉
puts "Finished! Created #{Recipe.count} recipes."
