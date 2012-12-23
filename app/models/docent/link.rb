module Docent
  class Link < ActiveRecord::Base
    attr_accessible :action, :controller, :url

    def shortcut
      "#{controller}##{action}"
    end

    def self.link_for(controller=nil, action=nil)
      if link = self.where(controller: controller).
                where(action: action).
                first
        link.url
      elsif link = self.where(controller: controller).first
        link.url
      else
        Docent::DEFAULT_LINK
      end
    end
  end
end
