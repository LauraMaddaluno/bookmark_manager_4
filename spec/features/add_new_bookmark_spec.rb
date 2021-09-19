feature 'add new bookmark ' do 
  scenario 'the user can add a new bookmark to Bookmark Manager' do 
    visit('/bookmarks/new')
    fill_in( 'url', with: 'https://www.youtube.com/' )
    fill_in('title', with: 'YOUTUBE')
    click_button("Submit")
    expect(page).to have_link( 'YOUTUBE', href: 'https://www.youtube.com/' )
  end
end