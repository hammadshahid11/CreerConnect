# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Create the first admin account
admin = Admin.create(
  email: 'admin@example.com',
  password: '123456',
  password_confirmation: '123456'
)

puts 'Admin account created!' if admin.persisted?
