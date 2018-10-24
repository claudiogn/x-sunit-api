# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
genders = ["female", "other", "male"]
20.times do
	Survivor.create!({
		name: Faker::BreakingBad.unique.character,
		age: Faker::Number.unique.between(1, 100),
		gender: genders[rand(0..2)],
		latitude: Faker::Number.unique.between(1, 999999999),
		longitude: Faker::Number.unique.between(1, 999999999)
	})
end
20.times do
	Survivor.create!({
		name: Faker::RickAndMorty.unique.character,
		age: Faker::Number.unique.between(1, 100),
		gender: genders[rand(0..2)],
		latitude: Faker::Number.unique.between(1, 999999999),
		longitude: Faker::Number.unique.between(1, 999999999)
	})
end
20.times do
	Survivor.create!({
		name: Faker::GameOfThrones.unique.character,
		age: Faker::Number.unique.between(1, 100),
		gender: genders[rand(0..2)],
		latitude: Faker::Number.unique.between(1, 999999999),
		longitude: Faker::Number.unique.between(1, 999999999)
	})
end