# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


car1 = Car.new(brand: "Ferrari", model: "F8", year: 2020)
car2 = Car.new(brand: "Ford", model: "Mustang", year: 1967)
car3 = Car.new(brand: "Toyota", model: "Hilux", year: 1993)

car1.save!
car2.save
car3.save
