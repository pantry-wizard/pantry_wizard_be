# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@brian = User.create(name: "Brian", email: "bh@gmail.com", google_id: "1234567890a", intolerances: "dairy, gluten", dietary_restrictions: "vegan")
@caleb = User.create(name: "Caleb", email: "ct@gmail.com", google_id: "1234567891d", intolerances: "dairy, gluten", dietary_restrictions: "vegan")
@dawson = User.create(name: "Dawson", email: "dt@gmail.com", google_id: "1234567892f")
