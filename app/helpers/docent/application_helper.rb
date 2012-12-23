module Docent
  module ApplicationHelper
    def link_to_docent(label="Help", options={})
      link_to label, Docent::Link.link_for(controller.controller_name, controller.action_name), options
    end
  end
end
