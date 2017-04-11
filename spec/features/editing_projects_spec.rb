require 'rails_helper'

RSpec.feature 'Users can edit existing projects' do
  before do
    FactoryGirl.create(:project, name: 'Atom.io')

    visit '/'
    click_link 'Atom.io'
    click_link 'Edit Project'
  end

  scenario 'with valid attribured' do
    fill_in 'Name', with: 'Atom.io'
    click_button 'Update Project'

    expect(page).to have_content 'Project has been updated.'
    expect(page).to have_content 'Atom.io'
  end

  scenario 'when providing invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Project'

    expect(page).to have_content 'Project has not been updated.'
  end
end
