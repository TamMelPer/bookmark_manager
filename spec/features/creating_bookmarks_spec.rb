# frozen_string_literal: true

require 'pg'

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/add')
    fill_in('url', with: 'http://mel.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: 'http://mel.com')
  end

  scenario 'The bookmark must be a valid url' do
    visit('/bookmarks/add')
    fill_in('url', with: 'notarealbookmarkdotcom')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).not_to have_content "notarealbookmarkdotcom"
    expect(page).to have_content "You must submit a valid url"
  end
end
