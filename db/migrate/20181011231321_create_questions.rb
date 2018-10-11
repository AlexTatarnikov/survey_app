class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :survey, foreign_key: true, index: true, null: false
      t.integer :kind, null: false, default: 0
      t.boolean :required, default: false
      t.string :title, null: false
      t.string :placeholder
      t.string :choices, array: true

      t.timestamps
    end
  end
end
