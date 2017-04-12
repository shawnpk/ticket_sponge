require 'rails_helper'

RSpec.feature 'Users can view tickets' do
  before do
    atom = FactoryGirl.create(:project, name: 'Atom.io')
    FactoryGirl.create(:ticket, project: atom, name: 'Make it shiny!', description: 'Gradients! Starbursts! Oh my!')

    ie = FactoryGirl.create(:project, name: 'Internet Explorer')
    FactoryGirl.create(:ticket, project: ie, name: 'Standards compliance', description: 'Isn\'t a joke.')

    visit '/'
  end

  scenario 'for a fivn project' do
    click_link 'Atom.io'

    expect(page).to have_content 'Make it shiny!'
    expect(page).not_to have_content 'Standard compliance'

    click_link 'Make it shiny!'
    within('#ticket h2') do
      expect(page).to have_content 'Make it shiny!'
    end

    expect(page).to have_content 'Gradients! Starbursts! Oh my!'
  end
end
