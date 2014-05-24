require 'spec_helper'

feature 'crudding cats' do

  before do
    visit '/'
    click_on 'Cats!'
    click_on 'Add Cat'
    fill_in 'cat[name]', with: 'Spot'
    fill_in 'cat[color]', with: 'brown'
    click_on 'Create Cat'
  end

  scenario 'a user can visit the index' do
    visit '/'
    expect(page).to have_content 'Cats!'
  end

  scenario 'a user can create a cat' do
    expect(page).to have_content 'Spot'
    expect(page).to have_content 'brown'
  end

  scenario 'a user can edit a cat' do
    visit '/cats'
    click_on 'Spot'
    expect(page).to have_content 'Spot'
    expect(page).to have_content 'brown'
    click_on 'Update Cat'
    fill_in 'cat[name]', with: 'Spotty'
    fill_in 'cat[color]', with: 'black'
    click_on 'Update Cat'
    expect(page).to have_content 'Spotty'
    expect(page).to have_content 'black'
  end

end