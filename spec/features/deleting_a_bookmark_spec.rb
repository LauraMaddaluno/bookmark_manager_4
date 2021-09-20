# require 'pg'
feature 'Deleting a bookmark' do 

  scenario "the user can delete a bookmark" do 
     Bookmarks.create( url: 'http://www.makersacademy.com', title: "MAKERS")
   
     visit('/bookmarks')
     expect(page).to have_link("MAKERS", href: 'http://www.makersacademy.com')

     first('.bookmark').click_button "Delete"
     expect(current_path).to eq '/bookmarks'
     expect(page).not_to have_link("MAKERS", href: 'http://www.makersacademy.com')
     
  end
end