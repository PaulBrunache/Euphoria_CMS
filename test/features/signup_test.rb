require "test_helper"


feature "Signup" do
  scenario "With valid credentials" do
    visit  '/signup'
    fill_in 'Display Name', with: 'megaman'
    fill_in 'E-mail address', with: 'test@example.com'
    fill_in 'password', with: '1234'
    fill_in 'confirm password', with: '1234'
    click_button 'Sign up'
  end
end
