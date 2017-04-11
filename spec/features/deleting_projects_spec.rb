require 'rails_helper'

RSpec.feature 'Users can delete projects' do
  scenario 'successfully' do
    FactoryGirl.create(:project, name: 'Atom.io')

    visit '/'
    click_link 'Atom.io'
    click_link 'Delete Project'

    expect(page).to have_content 'Project has been deleted.'
    expect(page.current_url).to eq projects_url
    expect(page).not_to have_content 'Atom.io'
  end
end
