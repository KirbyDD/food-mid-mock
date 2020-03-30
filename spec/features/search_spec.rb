require 'rails_helper'

RSpec.describe 'As a user of the search feature', type: :feature do
  it 'should search for videos' do
    visit '/'
    fill_in :q, with: "sweet potatoes"
    click_on "Search"

    expect(current_path).to eq("/foods")
    expect(page).to have_content("Number of results: 50")

    expect(page).to have_content("GTIN/UPC code: 492111402857")
    expect(page).to have_content("Description: SWEET POTATOES")
    expect(page).to have_content("Brand Owner: ARCHER FARMS")
    expect(page).to have_content("Ingredients: SWEET POTATOES")

  end
end
