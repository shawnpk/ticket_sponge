require 'rails_helper'

RSpec.describe 'Admin can manage a user\'s roles' do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:user) { FactoryGirl.create(:user) }

  let!(:ie) { FactoryGirl.create(:project, name: 'Chrome') }
  let!(:atom) { FactoryGirl.create(:project, name: 'Atom.io') }

  before do
    login_as(admin)
  end

  scenario 'when assigning roles to an existing user' do
    visit admin_user_path(user)
    click_link 'Edit User'

    select 'viewer', from: 'Chrome'
    select 'manager', from: 'Atom.io'

    click_button 'Update User'
    expect(page).to have_content 'User has been updated'

    click_link user.email
    expect(page).to have_content 'Chrome: Viewer'
    expect(page).to have_content 'Atom.io: Manager'
  end

  scenario 'when assigning foles to a new user' do
    visit new_admin_user_path

    fill_in 'Email', with: 'newuser@ticket_sponge.com'
    fill_in 'Password', with: 'password'

    select 'editor', from: 'Chrome'
    click_button 'Create User'
    click_link 'newuser@ticket_sponge.com'

    expect(page).to have_content 'Chrome: Editor'
    expect(page).not_to have_content 'Atom.io'
  end
end
