require 'rails_helper'

feature 'Toys' do

  scenario 'Toy index page should list the cat that owns each of the toys listed.' do
    cat = create_cat(:name => 'Awesomesauce')
    toy = create_toy(cat)
    visit toys_path
    p cat.name
    expect(page).to have_content(cat.name)
  end

  scenario 'Toy show page should list the cat that owns that toy (toys are not shared).' do
    cat = create_cat
    toy = create_toy(cat)
    visit toy_path(toy)
    expect(page).to have_content(cat.name)
  end

  scenario 'Toy new page should have a collection select for all Cats.' do
    cat1 = create_cat
    cat2 = create_cat
    cat3 = create_cat
    cat4 = create_cat
    visit new_toy_path
    expect(page).to have_content(cat1.name)
    expect(page).to have_content(cat2.name)
    expect(page).to have_content(cat3.name)
    expect(page).to have_content(cat4.name)
  end

  scenario 'Toy new page should create a new toy and cat ownership and list it on the index.' do
    cat = create_cat
    visit new_toy_path
    fill_in 'Name', with: 'fluffy bits'
    select cat.name, from: :toy_cat_id
    click_on 'Create Toy'
    expect(page).to have_content(cat.name)
  end

end
