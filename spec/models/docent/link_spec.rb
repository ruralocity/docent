require 'spec_helper'

module Docent
  describe Link do
    it "returns a shortcut as controller#action" do
      link = Link.new(controller: 'comments', action: 'edit')
      expect(link.shortcut).to eq 'comments#edit'
    end

    describe '#link_for' do
      before :each do
        Link.create(controller: 'comments', action: 'edit', url: 'http://sample.com/comments+edit')
        Link.create(controller: 'comments', action: '', url: 'http://sample.com/comments')
        Docent.default_link = 'http://sample.com/default'
      end

      it "returns a link for a specified controller#action combo" do
        expect(Link.link_for('comments', 'edit')).to eq 'http://sample.com/comments+edit'
      end

      it "returns a controller-general link" do
        expect(Link.link_for('comments', 'show')).to eq 'http://sample.com/comments'
      end

      it "returns a default link when no controller match found" do
        expect(Link.link_for('posts', 'new')).to eq 'http://sample.com/default'
      end
    end
  end
end
