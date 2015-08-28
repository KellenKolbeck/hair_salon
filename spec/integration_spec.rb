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

describe("post a stylist list to the index page", {:type => :feature}) do
  it("will add a form that allows a user to post to a list of stylists") do
    stylist = Stylist.new(:name => "Penny Thompson", :id => nil)
    stylist.save()
    visit("/")
    fill_in("name", :with => "Penny Thompson")
    click_button("Add stylist!")
    visit("/new_stylist")
    expect(page).to have_content("Penny Thompson")
  end
end
