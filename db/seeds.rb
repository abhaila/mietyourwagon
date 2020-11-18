# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
image1 = URI.open('https://res.cloudinary.com/raeesa/image/upload/v1605705292/obpsa1j8fiagowxjeklc9p0l7uxl.jpg')
# car1.photo.attach(io: image1, filename: 'image1.jpg', content_type: 'image/jpg')
image2 = URI.open('https://res.cloudinary.com/raeesa/image/upload/v1605699944/s8p20hsungqaa2i341dt75484btc.jpg')
# car2.photo.attach(io: image2, filename: 'image2.jpg', content_type: 'image/jpg')
image3 = URI.open('https://res.cloudinary.com/raeesa/image/upload/v1605700110/pgsbwdx1507tqsou3dqeqjr3s82v.jpg')
# car3.photo.attach(io: image3, filename: 'image3.jpg', content_type: 'image/jpg')

# @message.image.attach(io: File.open('/path/to/file'), filename: 'file.pdf')

puts "Cleaning database...."
Booking.destroy_all
Car.destroy_all
User.destroy_all

puts "Creating users..."

User.create!(email: "a@lewagon.com" , password: "secret", first_name: "Areeb", last_name: "Bhaila", address: "London")
User.create!(email: "b@lewagon.com" , password: "secret", first_name: "Benni", last_name: "Matzen", address: "Hamburg")
User.create!(email: "c@lewagon.com" , password: "secret", first_name: "Pepe", last_name: "Benitez", address: "London")

puts "Creating cars..."
car1 = Car.create!(user: User.all.sample, brand: "Ferrari", model: "F8", year: 2020, price: 500, description: "Hot and Shiny", address: "London")
car2 = Car.create!(user: User.all.sample, brand: "Ford", model: "Mustang", year: 1967, price: 420, description: "Her name is Eleonor", address: "London")
car3 =Car.create!(user: User.all.sample, brand: "Toyota", model: "Hilux", year: 1993, price: 20, description: "Indestructible", address: "London")

car1.photos.attach(io: image1, filename: 'image1.jpg', content_type: 'image/jpg')
car2.photos.attach(io: image2, filename: 'image2.jpg', content_type: 'image/jpg')
car3.photos.attach(io: image3, filename: 'image3.jpg', content_type: 'image/jpg')

puts "Creating bookings..."
Booking.create!(user: User.all.sample, car: Car.all.sample, start_date: "2020-11-19 12:18:00 UTC", end_date: "2020-11-25 12:18:00 UTC")
Booking.create!(user: User.all.sample, car: Car.all.sample, start_date: "2020-11-19 12:18:00 UTC", end_date: "2020-11-25 12:18:00 UTC")
Booking.create!(user: User.all.sample, car: Car.all.sample, start_date: "2020-11-19 12:18:00 UTC", end_date: "2020-11-25 12:18:00 UTC")

puts "Done! #{User.count} users created."
puts "Done! #{Car.count} cars created."
puts "Done! #{Booking.count} bookings created."


