require 'spec_helper'

module Docent
  module ApplicationHelper
    describe ApplicationHelper do
      before :each do
        Docent.default_link = 'http://defaulttestlink.com/docs'
      end

      it "sets 'Help' as a default label for a support link" do
        expect(link_to_docent).to eq '<a href="http://defaulttestlink.com/docs">Help</a>'
      end

      it "sets a custom label for a support link" do
        expect(link_to_docent('Support')).to eq '<a href="http://defaulttestlink.com/docs">Support</a>'
      end

      it "accepts a hash of options to pass to link_to" do
        expect(link_to_docent('Support',{target: 'new'})).to eq '<a href="http://defaulttestlink.com/docs" target="new">Support</a>'
      end
    end
  end
end