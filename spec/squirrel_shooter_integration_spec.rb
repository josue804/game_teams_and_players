require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('site to add and manage a team and its players', :type => :feature) do
  it('properly loads index page') do
    visit('/')
    expect(page).to have_content("Seventh Summer Squirrel Shooter")
  end

  it('path to list of teams') do
    visit('/')
    click_on('See all teams')
    expect(page).to have_content('Teams')
  end

  it('displays a newly added team') do
    visit('/teams')
    fill_in('name', :with => 'Hungry Hunters')
    fill_in('size', :with => 4)
    click_button('Submit')
    expect(page).to have_content("Hungry Hunters")
  end
end
