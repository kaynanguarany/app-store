require "rails_helper"

RSpec.feature "Editing an Article" do
  before do
     @article = Article.create(title: "First article", body: "Lorem ipsum")
  end
  
  scenario "A User updates an article" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: "Updated article"
    fill_in "Body", with: "Updated body"
    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article)) 
  end

  scenario "A user fails to update an article" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: "Updated body"
    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
    # expect(current_path).to eq(article_path(@article)) 
  end
end