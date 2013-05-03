class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string      :content
      t.string      :kind
      t.references  :character
      t.references  :scene

      t.timestamps
    end

    add_index :lines, :character_id
  end
end
