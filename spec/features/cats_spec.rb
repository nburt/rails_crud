require 'spec_helper'

feature 'crudding cats' do

  scenario 'a user can visit the index' do
    visit '/'
    within 'h1' do
      expect(page).to have_content 'Cats!'
    end
  end

end