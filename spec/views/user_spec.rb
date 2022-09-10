require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  it 'should get splash on root' do
    visit root_path
    expect(page).to have_content('Personal Stash')
    expect(page).to have_content('SIGN UP')
  end

  it 'should get sign up a new user' do
    visit new_user_registration_path
    fill_in 'user[email]', with: 'lembani@gmail.com'
    fill_in 'user[name]', with: 'Lembani'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_button 'Sign Up'
    expect(current_path).to eq(user_categories_path(User.last))
    expect(page).to have_content('Add new category')
  end
end
