class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :nickname

      t.timestamps
    end
  end
end
