require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions,false)

describe("the list path", {:type => :feature}) do
  it("will properly load the index page showing all stylists") do
    visit("/")
    expect(page).to have_content("Our stylists:")
  end
end
