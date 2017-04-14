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
end
