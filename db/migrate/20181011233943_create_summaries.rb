class CreateSummaries < ActiveRecord::Migration[5.2]
  def change
    create_table :summaries do |t|
      t.references :survey, foreign_key: true, index: true, null: false
      t.json :answers, null: false

      t.timestamps
    end
  end
end
