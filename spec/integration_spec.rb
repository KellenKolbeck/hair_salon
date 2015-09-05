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

describe("the path to stylist list", {:type => :feature}) do
  it("will post a stylist list to the stylist list page") do
    visit("/")
    click_link("Add a new stylist")
    fill_in("name", :with => "Penny")
    click_button("Submit")
    visit("/stylist_list")
    expect(page).to have_content("Penny")
  end
end
