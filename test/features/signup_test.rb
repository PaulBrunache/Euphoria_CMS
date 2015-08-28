require "test_helper"


feature "Signup" do
  scenario "With valid credentials" do
    visit root_path
    page.must_have_content "Hello World"
    page.wont_have_content "Goobye All!"
  end
end
