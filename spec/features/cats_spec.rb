require 'rails_helper'

feature 'Cats' do
  scenario 'Each Cat show page should list the toys that cat owns' do
    cat = create_cat
    toy = create_toy(cat)
    visit cat_path(cat)
    expect(page).to have_content(toy.name)
  end
end

def create_cat
  Cat.create!(:name => 'Fluffy Boots')
end

def create_toy (cat)
  Toy.create!(name: 'Lazer Pointer', cat_id: cat.id)
end