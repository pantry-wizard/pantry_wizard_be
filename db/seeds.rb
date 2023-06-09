@brian = User.create(name: "Brian", email: "bh@gmail.com", google_id: "1234567890a", intolerances: "dairy, gluten", dietary_restrictions: "vegan")
@caleb = User.create(name: "Caleb", email: "ct@gmail.com", google_id: "1234567891d", intolerances: "dairy, gluten", dietary_restrictions: "vegan")
@dawson = User.create(name: "Dawson", email: "dt@gmail.com", google_id: "1234567892f")
@conner = User.create(name: "Conner", email: "cdvanloan@gmail.com", google_id: "106048413854356122337")
@dayplan1 = @brian.day_plans.create(date: "2021-01-01")
@recipe1 = Recipe.create!(name: 'oatmeal', ingredients: "oats, water, salt", instructions: "boil water, add oats, add salt, stir, eat", spoonacular_id: "1234567890a", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg")
# @recipe2 = Recipe.create!(name: 'cheese n grits', ingredients: "cheese, grits", instructions: "boil water, add oats, add salt, stir, eat", spoonacular_id: "19823674598157", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg")
DayPlanRecipe.create!(day_plan_id: @dayplan1.id, recipe_id: @recipe1.id)

@dayplan2 = @brian.day_plans.create(date: "2021-01-02")
@dayplan2.recipes.create!(name: 'cheese n grits', ingredients: "cheese, grits", instructions: "boil water, add oats, add salt, stir, eat", spoonacular_id: "19823674598157", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg")