require 'rails_helper'

describe 'Signup and create pet', type: :feature do
  it '', js: true do
    visit new_user_registration_path
    expect(page).to have_content 'Sign up'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content '(6 characters minimum)'
    expect(page).to have_content 'Password confirmation'
    expect(page).to have_button 'Sign up'
    expect(page).to have_link 'Log in'

    password = Faker::Internet.password

    fill_in 'user_email', with: Faker::Internet.email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password

    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_content 'Pets'
    expect(page).to have_link 'New Pet'

    click_link 'New Pet'

    expect(page).to have_content 'New Pet'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Pet type'
    expect(page).to have_content 'Age'
    expect(page).to have_button 'Create Pet'
    expect(page).to have_link 'Back'

    pet_name = Faker::Creature::Dog.name

    fill_in 'pet_name', with: pet_name
    fill_in 'pet_age', with: 5

    click_button 'Create Pet'

    expect(page).to have_content 'Pet was successfully created.'
    expect(page).to have_content 'Name:'
    expect(page).to have_content pet_name
    expect(page).to have_content 'Pet type:'
    expect(page).to have_content 'cat'
    expect(page).to have_content 'Age:'
    expect(page).to have_content '5'
    expect(page).to have_content 'User:'
    expect(page).to have_content 'Famous reference:'
    expect(page).to have_content 'Frajola'

    expect(page).to have_link 'Edit'
    expect(page).to have_link 'Back'
  end
end