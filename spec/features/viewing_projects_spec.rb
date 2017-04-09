require 'rails_helper'

RSpec.feature 'Users can view projects' do
  scenario 'with the project details' do
    project = FactoryGirl.create(:project, name: 'Vim')

    visit '/'
    click_link 'Vim'

    expect(page.current_url).to eq project_url(project)
  end
end
