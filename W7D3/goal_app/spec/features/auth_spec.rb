require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit users_url
    expect(page).to have_content "New User"
  end  

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
        visit users_url
        expect(page).to have_content user.email
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end