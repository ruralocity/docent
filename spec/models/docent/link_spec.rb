require 'spec_helper'

module Docent
  describe Link do
    it "returns a shortcut as controller#action" do
      link = Link.new(controller: 'comments', action: 'edit')
      expect(link.shortcut).to eq 'comments#edit'
    end

    it "returns a link for a specified controller#action combo" do
      link = Link.create(controller: 'comments', action: 'edit', url: 'http://sample.com')
      expect(Link.link_for('comments', 'edit')).to eq 'http://sample.com'
    end
  end
end
