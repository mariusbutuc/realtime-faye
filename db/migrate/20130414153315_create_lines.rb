class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string      :content
      t.references  :character

      t.timestamps
    end

    add_index :lines, :character_id
  end
end
