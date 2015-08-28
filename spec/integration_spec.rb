require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions,false)

describe("the list path", {:type => :feature}) do
  it("will properly load the index page ") do
    visit("/")
    expect(page).to have_content("Bob and Tom")
  end
end

# describe("post a stylist list to the index page", {:type => :feature}) do
