module Docent
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def mount_engine_in_routes_file
      route 'mount Docent::Engine => "/docent"'
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