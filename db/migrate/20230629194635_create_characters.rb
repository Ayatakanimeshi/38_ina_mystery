class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name , null: false
      t.string :chara_image

      t.timestamps
    end
  end
end
