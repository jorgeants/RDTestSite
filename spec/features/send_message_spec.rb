require 'rails_helper'

RSpec.describe 'Send Message', :type => :feature do
  
  it "fill form and send message" do
    visit '/contact'
    within("form#new_message") do
      fill_in 'message[name]', with: 'Say My Name'
      fill_in 'message[email]', with: 'user@example.com'
      fill_in 'message[message]', with: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maiores laboriosam, reiciendis similique. Animi harum vel reprehenderit soluta ad qui asperiores, illo repudiandae repellat fugiat quia voluptate deserunt inventore, quam minus.'
    end
    click_button 'Create Message'
    expect(page).to have_content 'Message was successfully sent.'
  end

end