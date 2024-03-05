# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Créer 10 utilisateurs
10.times do
  User.create(email: Faker::Internet.email, password: "123456")
end

# Créer 10 articles avec des user_id aléatoires entre 1 et 10
10.times do
  Article.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user_id: rand(1..10)
  )
end
