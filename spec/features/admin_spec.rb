require 'spec_helper'

describe "a manager maintaining Docent links" do
  it "accesses the dashboard" do
    visit "/docent"
    page.should have_content 'Docent'
  end

  it "adds a link" do
    visit "/docent"
    click_link "New Link"

    fill_in 'Controller', with: 'posts'
    fill_in 'Action', with: 'new'
    fill_in 'URL', with: 'http://supportsite.com/documents/3544'
    click_button 'Create Link'

    page.should have_content 'Successfully created link'
    page.should have_content 'posts#new'
    page.should have_content 'http://supportsite.com/documents/3544'
    current_path.should == "/docent/links"
  end

  it "edits a link" do
    resource = FactoryGirl.create(:docent_link,
      controller: 'posts',
      action: 'edit',
      url: 'http://supportsite.com/documents/1')

    visit '/docent'
    click_link 'posts#edit'

    fill_in 'URL', with: 'http://supportsite.com/documents/4444'
    click_button 'Update Link'

    page.should have_content 'Successfully updated link'
    page.should have_content 'http://supportsite.com/documents/4444'
    current_path.should == "/docent/links"
  end

  it "deletes a link" do
    link = FactoryGirl.create(:docent_link,
      controller: 'posts',
      action: 'edit',
      url: 'http://supportsite.com/documents/1d')

    visit '/docent'
    within "#link_#{link.id}" do
      click_link 'Delete'
    end

    page.should have_content 'Successfully deleted link'
    current_path.should == '/docent/links'
  end
end