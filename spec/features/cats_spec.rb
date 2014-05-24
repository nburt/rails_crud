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

  scenario 'a user can delete a cat' do
    visit '/cats'
    click_on 'Spot'
    click_on 'Delete Cat'
    expect(page).to have_no_content 'Spot'
    expect(page).to have_no_content 'brown'
  end

  scenario 'user cannot enter blank name and color when creating a cat' do
    visit '/cats'
    click_on 'Add Cat'
    click_on 'Create Cat'
    expect(page).to have_content 'Name can\'t be blank'
    expect(page).to have_content 'Color can\'t be blank'
  end

end