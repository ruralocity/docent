module Docent
  class ApplicationController < ActionController::Base
    before_filter :basic_authenticate, if: lambda { Docent.username and Docent.password }

    private

    def basic_authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name == Docent.username and password == Docent.password
      end
    end
  end
end
