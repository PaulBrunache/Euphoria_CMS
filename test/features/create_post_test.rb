require "test_helper"

feature "CreatePost" do
  scenario "Create Post" do
    visit posts_path
    click_link "New Post"
    fill_in "Title", with: "This is the first new Post"
    fill_in "Content", with: "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
    click_button "Create Post"
    page.must_have_content "Hello World"
    # page.wont_have_content "Goobye All!"
  end
end


