# This file should contain all the record creation needed to seed the database with its default values.

# 1. Clean the database 🗑️
puts "Cleaning database..."
Review.destroy_all
Recipe.destroy_all
User.destroy_all

# 2. Create a user
user = User.create!(
  email: "test@example.com",
  password: "password"
)

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

# Création de quelques reviews
user = User.first
recipes = Recipe.all

reviews_data = [
  { rating: 5, comment: "Excellente recette, super facile à suivre !" },
  { rating: 4, comment: "Très bon goût, mais j’ai dû ajuster les quantités." },
  { rating: 3, comment: "C'était correct, un peu fade à mon goût." },
  { rating: 5, comment: "Un vrai régal, je referai sans hésiter !" },
  { rating: 2, comment: "Bof, je m’attendais à mieux." }
]

# Création de reviews
recipes.each_with_index do |recipe, index|
  Review.create!(
    rating: reviews_data[index % reviews_data.length][:rating],
    comment: reviews_data[index % reviews_data.length][:comment],
    user: user,
    recipe: recipe
  )
end

# 4. Display a message 🎉
puts "Finished! Created #{Review.count} reviews."
