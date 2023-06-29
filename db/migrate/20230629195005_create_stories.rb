class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.text :content
      t.references :character, null: false, foreign_key: true
      t.string :back_image
      t.string :voice

      t.timestamps
    end
  end
end
