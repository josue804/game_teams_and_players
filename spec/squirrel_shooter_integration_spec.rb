require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('site to add and manage a team and its players') do
  it('properly loads index page') do
    visit('/')
    expect(page).to have_content("Seventh Summer Squirrel Shooter")
  end

  it('path to list of teams') do
    visit('/')
    click_on('See all  teams')
    expect(page).to have_content('Teams')
  end
end
