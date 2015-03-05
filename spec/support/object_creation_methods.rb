def create_cat(options = {})
  Cat.create!({
    name: Faker::Name.first_name,
  }.merge(options))
end

def create_toy(cat = create_cat, options = {})
  Toy.create!({
    :cat_id => cat.id,
    :name => "Toy number #{rand(100...999)}",
  }.merge(options))
end
