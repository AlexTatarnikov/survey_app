class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :title, null: false
      t.string :subtitle, null: false

      t.timestamps
    end

    add_index :surveys, :title, unique: true
  end
end
