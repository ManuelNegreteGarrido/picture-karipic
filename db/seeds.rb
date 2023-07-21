# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# seeds.rb

# Crea el usuario
# seeds.rb

# Crea el usuario
require 'open-uri'
user = User.new(email: "admin@correo.cl", name: "Admin", role: 2, password: "123456", password_confirmation: "123456")
image_file = URI.open('https://ror-tinder-mascota.s3.us-east-2.amazonaws.com/foto2.jpeg')
user.image.attach(io: image_file, filename: 'fotop2.jpg')
user.save

# begin
#   user2 = User.create(email: "correo@correo.cl", name: "correo1", role: 0, password: "123456", password_confirmation: "123456")
#   image2 = URI.open('https://karipic3.s3.amazonaws.com/fotop1.jpg')
#   user2.image.attach(io: image2, filename: 'imagen2.jpg')
# rescue OpenURI::HTTPError => e
#   puts "Error al obtener la imagen para user2: #{e.message}"
# end

