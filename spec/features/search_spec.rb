require 'rails_helper'

RSpec.describe 'As a user of the search feature', type: :feature do
  visit '/'
  fill_in :q, with: "sweet potatoes"
  click_on "Search"

  expect(current_path).to eq("/foods")
  expect(page).to have_content("Number of results: 10")
end
