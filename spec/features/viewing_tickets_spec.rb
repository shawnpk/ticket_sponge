require 'rails_helper'

RSpec.feature 'Users can view tickets' do
  before do
    user = FactoryGirl.create(:user)

    atom = FactoryGirl.create(:project, name: 'Atom.io')
    assign_role!(user, :viewer, atom)
    FactoryGirl.create(:ticket, project: atom, user: user, name: 'Make it shiny!', description: 'Gradients! Starbursts! Oh my!')

    ie = FactoryGirl.create(:project, name: 'Internet Explorer')
    assign_role!(user, :viewer, ie)
    FactoryGirl.create(:ticket, project: ie, user: user, name: 'Standards compliance', description: 'Isn\'t a joke.')

    login_as(user)
    visit '/'
  end

  scenario 'for a given project' do
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
