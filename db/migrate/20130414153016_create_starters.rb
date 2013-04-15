class CreateStarters < ActiveRecord::Migration
  def change
    create_table :starters do |t|
      t.text    :content
      t.string  :title

      t.timestamps
    end
  end
end
