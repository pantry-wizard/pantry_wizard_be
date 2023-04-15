require "rails_helper"

RSpec.describe Recipe do
  before :each do
    recipe1 = {
      "vegetarian": true,
      "vegan": true,
      "glutenFree": true,
      "dairyFree": true,
      "veryHealthy": true,
      "cheap": false,
      "veryPopular": true,
      "sustainable": false,
      "lowFodmap": false,
      "weightWatcherSmartPoints": 1,
      "gaps": "no",
      "preparationMinutes": 10,
      "cookingMinutes": 0,
      "aggregateLikes": 11496,
      "healthScore": 100,
      "creditsText": "Feasting at Home",
      "sourceName": "Feasting at Home",
      "pricePerServing": 146.61,
      "extendedIngredients": [
          {
              "id": 9040,
              "aisle": "Produce",
              "image": "bananas.jpg",
              "consistency": "SOLID",
              "name": "banana",
              "nameClean": "banana",
              "original": "1 banana",
              "originalName": "banana",
              "amount": 1.0,
              "unit": "",
              "meta": [],
              "measures": {
                  "us": {
                      "amount": 1.0,
                      "unitShort": "",
                      "unitLong": ""
                  },
                  "metric": {
                      "amount": 1.0,
                      "unitShort": "",
                      "unitLong": ""
                  }
              }
          },
          {
              "id": 10014412,
              "aisle": "Frozen",
              "image": "ice-cubes.png",
              "consistency": "SOLID",
              "name": "ice cubes",
              "nameClean": "ice",
              "original": "Handful of ice cubes ( or use frozen bananas)",
              "originalName": "ice cubes ( or use frozen bananas)",
              "amount": 1.0,
              "unit": "Handful",
              "meta": [
                  "frozen",
                  "( or use bananas)"
              ],
              "measures": {
                  "us": {
                      "amount": 1.0,
                      "unitShort": "Handful",
                      "unitLong": "Handful"
                  },
                  "metric": {
                      "amount": 1.0,
                      "unitShort": "Handful",
                      "unitLong": "Handful"
                  }
              }
          },
          {
              "id": 11090,
              "aisle": "Produce",
              "image": "broccoli.jpg",
              "consistency": "SOLID",
              "name": "kale",
              "nameClean": "broccoli",
              "original": "1 C kale, chopped broccoli, or spinach or any healthy green veggie",
              "originalName": "kale, chopped broccoli, or spinach or any healthy green veggie",
              "amount": 1.0,
              "unit": "C",
              "meta": [
                  "green",
                  "or any healthy  veggie",
                  "chopped"
              ],
              "measures": {
                  "us": {
                      "amount": 1.0,
                      "unitShort": "cup",
                      "unitLong": "cup"
                  },
                  "metric": {
                      "amount": 1.0,
                      "unitShort": "cup",
                      "unitLong": "cup"
                  }
              }
          },
          {
              "id": 9150,
              "aisle": "Produce",
              "image": "lemon.png",
              "consistency": "SOLID",
              "name": "lemon",
              "nameClean": "lemon",
              "original": "tablespoon of lemon",
              "originalName": "lemon",
              "amount": 1.0,
              "unit": "tablespoon",
              "meta": [],
              "measures": {
                  "us": {
                      "amount": 1.0,
                      "unitShort": "Tbsp",
                      "unitLong": "Tbsp"
                  },
                  "metric": {
                      "amount": 1.0,
                      "unitShort": "Tbsp",
                      "unitLong": "Tbsp"
                  }
              }
          },
          {
              "id": 98932,
              "aisle": "Tea and Coffee",
              "image": "matcha-powder.jpg",
              "consistency": "SOLID",
              "name": "matcha powder",
              "nameClean": "matcha",
              "original": "½ teaspoon matcha powder, plus more to taste",
              "originalName": "matcha powder, plus more to taste",
              "amount": 0.5,
              "unit": "teaspoon",
              "meta": [
                  "plus more to taste"
              ],
              "measures": {
                  "us": {
                      "amount": 0.5,
                      "unitShort": "tsps",
                      "unitLong": "teaspoons"
                  },
                  "metric": {
                      "amount": 0.5,
                      "unitShort": "tsps",
                      "unitLong": "teaspoons"
                  }
              }
          },
          {
              "id": 9266,
              "aisle": "Produce",
              "image": "pineapple.jpg",
              "consistency": "SOLID",
              "name": "pineapple",
              "nameClean": "pineapple",
              "original": "1 C fresh pineapple",
              "originalName": "fresh pineapple",
              "amount": 1.0,
              "unit": "C",
              "meta": [
                  "fresh"
              ],
              "measures": {
                  "us": {
                      "amount": 1.0,
                      "unitShort": "cup",
                      "unitLong": "cup"
                  },
                  "metric": {
                      "amount": 1.0,
                      "unitShort": "cup",
                      "unitLong": "cup"
                  }
              }
          },
          {
              "id": 16223,
              "aisle": "Milk, Eggs, Other Dairy",
              "image": "soy-milk.jpg",
              "consistency": "LIQUID",
              "name": "soy milk",
              "nameClean": "soymilk",
              "original": "½ C nut or soy milk",
              "originalName": "nut or soy milk",
              "amount": 0.5,
              "unit": "C",
              "meta": [],
              "measures": {
                  "us": {
                      "amount": 0.5,
                      "unitShort": "cups",
                      "unitLong": "cups"
                  },
                  "metric": {
                      "amount": 0.5,
                      "unitShort": "cups",
                      "unitLong": "cups"
                  }
              }
          }
      ],
      "id": 801710,
      "title": "Matcha Green Tea and Pineapple Smoothie",
      "readyInMinutes": 10,
      "servings": 1,
      "sourceUrl": "http://www.feastingathome.com/matcha-green-tea-and-pineapple-smoothie/",
      "image": "https://spoonacular.com/recipeImages/801710-312x231.jpg",
      "imageType": "jpg",
      "summary": "Matcha Green Tean and Pineapple Smoothie is a <b>gluten free, dairy free, lacto ovo vegetarian, and vegan</b> breakfast. This recipe makes 1 servings with <b>282 calories</b>, <b>9g of protein</b>, and <b>3g of fat</b> each. For <b>$1.47 per serving</b>, this recipe <b>covers 30%</b> of your daily requirements of vitamins and minerals. Several people made this recipe, and 11496 would say it hit the spot. If you have pineapple, ice cubes, matcha powder, and a few other ingredients on hand, you can make it. It is brought to you by Feasting at Home. From preparation to the plate, this recipe takes approximately <b>10 minutes</b>. Overall, this recipe earns an <b>awesome spoonacular score of 100%</b>. If you like this recipe, you might also like recipes such as <a href=\"https://spoonacular.com/recipes/matcha-green-tea-and-pineapple-smoothie-1267057\">Matcha Green Tean and Pineapple Smoothie</a>, <a href=\"https://spoonacular.com/recipes/matcha-green-tea-and-pineapple-smoothie-1310745\">Matcha Green Tean and Pineapple Smoothie</a>, and <a href=\"https://spoonacular.com/recipes/matcha-green-tea-and-pineapple-smoothie-1280483\">Matcha Green Tean and Pineapple Smoothie</a>.",
      "cuisines": [],
      "dishTypes": [
          "morning meal",
          "brunch",
          "beverage",
          "breakfast",
          "drink"
      ],
      "diets": [
          "gluten free",
          "dairy free",
          "lacto ovo vegetarian",
          "vegan"
      ],
      "occasions": [],
      "analyzedInstructions": [
          {
              "name": "",
              "steps": [
                  {
                      "number": 1,
                      "step": "Blend all in a blender until very smooth. Enjoy!!",
                      "ingredients": [],
                      "equipment": [
                          {
                              "id": 404726,
                              "name": "blender",
                              "localizedName": "blender",
                              "image": "blender.png"
                          }
                      ]
                  }
              ]
          }
      ],
      "usedIngredientCount": 0,
      "missedIngredientCount": 6,
      "missedIngredients": [
          {
              "id": 9040,
              "amount": 1.0,
              "unit": "",
              "unitLong": "",
              "unitShort": "",
              "aisle": "Produce",
              "name": "banana",
              "original": "1 banana",
              "originalName": "banana",
              "meta": [],
              "image": "https://spoonacular.com/cdn/ingredients_100x100/bananas.jpg"
          },
          {
              "id": 11090,
              "amount": 1.0,
              "unit": "C",
              "unitLong": "C",
              "unitShort": "cup",
              "aisle": "Produce",
              "name": "kale",
              "original": "1 C kale, chopped broccoli, or spinach or any healthy green veggie",
              "originalName": "kale, chopped broccoli, or spinach or any healthy green veggie",
              "meta": [
                  "green",
                  "or any healthy  veggie",
                  "chopped"
              ],
              "extendedName": "green kale",
              "image": "https://spoonacular.com/cdn/ingredients_100x100/broccoli.jpg"
          },
          {
              "id": 9150,
              "amount": 1.0,
              "unit": "tablespoon",
              "unitLong": "tablespoon",
              "unitShort": "Tbsp",
              "aisle": "Produce",
              "name": "lemon",
              "original": "tablespoon of lemon",
              "originalName": "lemon",
              "meta": [],
              "image": "https://spoonacular.com/cdn/ingredients_100x100/lemon.png"
          },
          {
              "id": 98932,
              "amount": 0.5,
              "unit": "teaspoon",
              "unitLong": "teaspoons",
              "unitShort": "tsp",
              "aisle": "Tea and Coffee",
              "name": "matcha powder",
              "original": "½ teaspoon matcha powder, plus more to taste",
              "originalName": "matcha powder, plus more to taste",
              "meta": [
                  "plus more to taste"
              ],
              "image": "https://spoonacular.com/cdn/ingredients_100x100/matcha-powder.jpg"
          },
          {
              "id": 9266,
              "amount": 1.0,
              "unit": "C",
              "unitLong": "C",
              "unitShort": "cup",
              "aisle": "Produce",
              "name": "pineapple",
              "original": "1 C fresh pineapple",
              "originalName": "fresh pineapple",
              "meta": [
                  "fresh"
              ],
              "extendedName": "fresh pineapple",
              "image": "https://spoonacular.com/cdn/ingredients_100x100/pineapple.jpg"
          },
          {
              "id": 16223,
              "amount": 0.5,
              "unit": "C",
              "unitLong": "Cs",
              "unitShort": "cup",
              "aisle": "Milk, Eggs, Other Dairy",
              "name": "soy milk",
              "original": "½ C nut or soy milk",
              "originalName": "nut or soy milk",
              "meta": [],
              "image": "https://spoonacular.com/cdn/ingredients_100x100/soy-milk.jpg"
          }
      ],
      "likes": 0,
      "usedIngredients": [],
      "unusedIngredients": []
  }

    @recipe = RecipePoro.new(recipe1)
  end

  it "exists" do
    expect(@recipe).to be_a(RecipePoro)
    expect(@recipe.spoonacular_id).to eq(801710)
    
    expect(@recipe.ingredients).to be_a(Array)
    expect(@recipe.ingredients).to eq([
      {:amount=>1.0, :name=>"banana", :unit=>""},
      {:amount=>1.0, :name=>"ice cubes", :unit=>"Handful"},
      {:amount=>1.0, :name=>"kale", :unit=>"cup"},
      {:amount=>1.0, :name=>"lemon", :unit=>"Tbsp"},
      {:amount=>0.5, :name=>"matcha powder", :unit=>"tsps"},
      {:amount=>1.0, :name=>"pineapple", :unit=>"cup"},
      {:amount=>0.5, :name=>"soy milk", :unit=>"cups"}])
  end
end