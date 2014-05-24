require 'spec_helper'

feature 'crudding cats' do

  scenario 'a user can visit the index' do
    visit '/'
    expect(page).to have_content 'Cats!'
  end

  scenario 'a user can create a cat' do
    visit '/'
    click_on 'Cats!'
    click_on 'Add Cat'
    fill_in 'cat[name]', with: 'Spot'
    fill_in 'cat[color]', with: 'brown'
    click_on 'Create Cat'
    expect(page).to have_content 'Spot'
    expect(page).to have_content 'brown'
  end

end