# frozen_string_literal: true

feature 'Viewing Bookmarks' do
  scenario 'the index page shows content' do
    visit('/')
    expect(page).to have_content('Bookmark')
  end
end
