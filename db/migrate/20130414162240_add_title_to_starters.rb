class AddTitleToStarters < ActiveRecord::Migration
  def change
    add_column :starters, :title, :string
  end
end
