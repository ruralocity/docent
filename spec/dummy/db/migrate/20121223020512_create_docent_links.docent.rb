# This migration comes from docent (originally 20121223020016)
class CreateDocentLinks < ActiveRecord::Migration
  def change
    create_table :docent_links do |t|
      t.string :controller
      t.string :action
      t.string :url

      t.timestamps
    end
  end
end
