# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Librarian creation"

User.create!(   
        name: "admin",
        email: "admin@gmail.com",
        password: "admin",
        is_librarian: true,
        fine: 0,
        )


puts "Users creation"
15.times do
    User.create!(   
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "12321",
        is_librarian: false,
        fine: Faker::Number.between(0, 15)
        )
end

puts "Books creation"
10.times do  
    title =Faker::Superhero.power;
    authur =Faker::Name.name;
    description= Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4);
    batch = Faker::Number.between(from: 1, to: 10)
    5.times do Book.create!(
        title: title,
        authur:authur,
        description:description,
        batch_number:batch,
    )
    end
end


