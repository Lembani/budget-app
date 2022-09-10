require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  before :each do
    @user = User.create!(name: 'Jane', email: 'jane@mail.com', password: '123456',
                         password_confirmation: '123456')
  end
  it 'should add new category' do
    visit user_session_path
    fill_in 'user[email]', with: 'jane@mail.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Sign In'
    expect(page).to have_content('Add new category')
  end
  # it 'should add new category' do
  #   @category = Category.create!(name: 'Test Category', icon: 'home.png', user_id: @user.id)
  #   visit user_session_path
  #   fill_in 'user[email]', with: 'jane@mail.com'
  #   fill_in 'user[password]', with: '123456'
  #   click_button 'Sign In'
  #   expect(page).to have_content('Test Category')
  # end

  scenario 'should add new category' do
    visit user_session_path
    fill_in 'user[email]', with: 'jane@mail.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Sign In'
    click_link 'Add new category'
    fill_in 'Category name', with: 'Test category'
    attach_file('Category icon', 'app/assets/images/default.png')
    find('input[name="commit"]').click
    expect(page).to have_content('TEST CATEGORY')
    expect(page).to have_button('Logout')
  end
end
