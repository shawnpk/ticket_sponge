require 'rails_helper'

RSpec.feature 'Users can view projects' do
  scenario 'with the project details' do
    project = FactoryGirl.create(:project, name: 'Atom.io')

    visit '/'
    click_link 'Atom.io'

    expect(page.current_url).to eq project_url(project)
  end
end
