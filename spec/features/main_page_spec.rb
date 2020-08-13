require 'spec_helper'

feature 'Visit main page' do

  describe 'Open main page', js: true do
    before do
      visit root_path
    end

    scenario 'user visit main page' do
      expect(page).to have_text('Welcome')
      expect(page).to have_link('Users')
      expect(page).to have_link('Messages')
    end

    context 'user aka moderator' do

      scenario 'want create new user' do
        click_link 'Users'
        click_link 'New User'
        fill_in 'Name', with: 'User_test_1'
        fill_in 'Email', with: 'User_test_1@test.ru'
        click_on 'Create User'

        expect(page).to have_text('User was successfully created.')
      end
    end
  end
end
