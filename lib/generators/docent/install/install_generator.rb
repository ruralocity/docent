module Docent
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def mount_engine_in_routes_file
      inject_into_file "config/routes.rb", after: "Rails.application.routes.draw do\n" do <<-'ROUTE'

  mount Docent::Engine => "/docent"

      ROUTE
      end
    end

    def generate_initializer
      copy_file "initializer.rb", "config/initializers/docent.rb"
    end

    def copy_migrations
      rake "docent:install:migrations"
    end

    def wrapup
      puts "All done! Now run rake db:migrate to add Docent's tables to your app and edit config/initializers/docent.rb to finish."
    end
  end
end