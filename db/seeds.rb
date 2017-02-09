Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

Faker::UniqueGenerator.clear

30.times do
  Ingredient.create!(name: Faker::Food.unique.ingredient)
end

10.times do
  cocktail = Cocktail.new(name: Faker::Space.unique.galaxy)
  3.times do
    ingredient = Ingredient.all.sample.name
    until cocktail.ingredients.find_by(name: ingredient).nil?
      ingredient = Ingredient.all.sample.name
    end
    dose = Dose.new(
      description: Faker::Food.measurement,
      ingredient: Ingredient.find_by(name: ingredient),
      cocktail: cocktail
    )
    dose.save!
  end
  cocktail.save!
end
