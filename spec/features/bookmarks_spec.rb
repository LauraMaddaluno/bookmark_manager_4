require 'pg'
feature 'bookmarks' do 
  scenario 'viewing bookmarks at the /bookmarks route' do
    
    Bookmarks.create( url: 'http://www.makersacademy.com/', title: 'MAKERS' )
    Bookmarks.create( url: 'http://www.google.com/', title: 'GOOGLE' )
    Bookmarks.create( url: 'http://www.destroyallsoftware.com/', title: 'DESTROY ALL SOFTWARE')
    visit ("/bookmarks")
    expect(page).to have_link( 'MAKERS', href: 'http://www.makersacademy.com/' )
    expect(page).to have_link( 'GOOGLE', href: 'http://www.google.com/' )
    expect(page).to have_link( 'DESTROY ALL SOFTWARE', href: 'http://www.destroyallsoftware.com/' )

  end
end