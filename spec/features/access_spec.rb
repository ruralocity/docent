require 'spec_helper'

describe "user accessing help" do
  context "a controller#action combo with help" do
    it "redirects to the help link", js: true do
      FactoryGirl.create(:post,
        name: 'Sample Post')
      FactoryGirl.create(:docent_link,
        controller: 'posts',
        action: 'show',
        url: 'http://supportsite.com/docs/343')

      visit posts_path
      click_link 'Show'

      click_link 'Help'

      current_url.should eq 'http://supportsite.com/docs/343'
    end
  end

  context "a controller#action combo with no specific help for the action" do
    it "redirects to the help link for the controller", js: true do
      post = Post.create
      FactoryGirl.create(:docent_link,
        controller: 'posts',
        action: '',
        url: 'http://supportsite.com/docs/552')
      visit "/posts/#{post.id}"

      click_link 'Help'

      current_url.should eq 'http://supportsite.com/docs/552'
    end
  end

  context "a page with no help defined" do
    it "redirects to the main support link for the whole site", js: true do
      Docent.default_link = 'http://defaulttestlink.com/docs'

      visit posts_path

      click_link 'Help'

      current_url.should eq Docent.default_link
    end
  end
end