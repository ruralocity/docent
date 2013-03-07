module Docent
  class Link < ActiveRecord::Base
    attr_accessible :action, :controller, :url

    def shortcut
      "#{controller}##{action}"
    end

    def self.link_for(controller=nil, action=nil)
      if (links = self.where(controller: controller).
                  where(self.arel_table[:action].eq(action)).
                  where(self.arel_table[:action].not_eq(''))).length > 0
        links.first.url
      elsif (links = self.where(controller: controller).
                     where(self.arel_table[:action].eq(''))).length > 0
        links.first.url
      else
        Docent.default_link
      end
    end
  end
end
