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

@dayplan1 = @brian.day_plans.create(date: "2021-01-01")
@recipe1 = Recipe.create!(name: 'oatmeal', ingredients: "oats, water, salt", instructions: "boil water, add oats, add salt, stir, eat", spoonacular_id: "1234567890a", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg")
@dayplan1.day_plan_recipes.create(recipe: @recipe1, meal_type: "breakfast")

